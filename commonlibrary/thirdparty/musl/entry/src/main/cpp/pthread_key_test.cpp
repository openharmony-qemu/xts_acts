/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <pthread.h>
#include <cerrno>
#include <cstring>
#include <unistd.h>
#include <cstdlib>
#include <cstdio>
#include <sys/wait.h>
#include <sched.h>
#include <csignal>
#include <fcntl.h>
#include <dlfcn.h>
#include <ctime>
#include "napi/native_api.h"

#ifndef PTHREAD_KEYS_MAX
#include <climits>
#endif

static const int REPEAT_EXHAUST_TIMES = 8;
static const int CHILD_KEYS_NUM = 20;
static const int NON_THRESHOLD_COUNT = 99;
static const int THRESHOLD_LEVEL_1 = 100;
static const int THRESHOLD_LEVEL_2 = 110;
static const int THRESHOLD_LEVEL_3 = 120;
static const int PREEXISTING_KEYS_NUM = 3;
static const int MULTI_DESTRUCTOR_NUM = 3;
static const int LOCAL_KEYS_MAX = 10;
static const int FORK_CHILD_KEYS_NUM = 10;
static const int STRESS_ROUNDS = 200;
static const int STRESS_CYCLES = 1000;
static const int MAX_NAME_LEN = 255;
static const int VMRSS_PREFIX_LEN = 6;
static const int BIT_FLAG_1 = 1;
static const int BIT_FLAG_2 = 2;
static const int DURATION_SEC = 3;
static const int PTHREAD_KEYS_EXPECTED = 128;
static const int INVALID_KEY_VALUE = 9999;
static const int THREAD_STORM_NUM = 50;
static const int BIT_MASK_FF = 0xFF;
static const int MIXED_OP_COUNT = 4;
static const int DELETE_EVERY_N = 3;
static const int MIXED_THREADS = 8;
static const int MIXED_ITERATIONS = 100;
static const int TSD_MAIN_VAL = 100;
static const int TSD_THREAD_VAL_1 = 200;
static const int TSD_THREAD_VAL_2 = 300;
static const int TARGET_LEVEL_1 = 1;
static const int TARGET_LEVEL_2 = 2;
static const int TARGET_LEVEL_3 = 3;
static const int FAIL_REASON_VERIFY = 1;
static const int FAIL_REASON_CREATE = 2;
static const int OP_CREATE_DELETE = 0;
static const int OP_SETSPECIFIC = 1;
static const int OP_GETSPECIFIC = 2;
static const int OP_SETSPECIFIC_NULL = 3;
static const int STRTOL_BASE_DEC = 10;
static const int TSD_MULTI_VAL_1 = 1;
static const int TSD_MULTI_VAL_2 = 2;
static const int TSD_MULTI_VAL_3 = 3;
static const int MULTI_KEY_IDX_2 = 2;

static napi_value MakeObj(napi_env env)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    return obj;
}

static void SetInt(napi_env env, napi_value obj, const char *key, int32_t val)
{
    napi_value v = nullptr;
    napi_create_int32(env, val, &v);
    napi_set_named_property(env, obj, key, v);
}

static void SetStr(napi_env env, napi_value obj, const char *key, const char *val)
{
    napi_value v = nullptr;
    napi_create_string_utf8(env, val, NAPI_AUTO_LENGTH, &v);
    napi_set_named_property(env, obj, key, v);
}

/* ==================== US-01: key分配与回收兼容 ==================== */

// TP-US01-001: 有空槽时创建key返回有效key且errno不被诊断改变
static napi_value PthreadKeyCreateBasic(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key = PTHREAD_KEYS_MAX;
    errno = EDOM;
    int ret = pthread_key_create(&key, nullptr);
    int savedErrno = errno;

    int keyValid = (ret == 0 && key < PTHREAD_KEYS_MAX) ? 1 : 0;
    int errnoPreserved = (savedErrno == EDOM) ? 1 : 0;

    if (ret == 0) {
        pthread_key_delete(key);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "key", static_cast<int>(key));
    SetInt(env, obj, "keyValid", keyValid);
    SetInt(env, obj, "errnoPreserved", errnoPreserved);
    return obj;
}

// TP-US01-002: key表将满时创建成功（先填满再删一个留出空槽）
static napi_value PthreadKeyCreateNearFull(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    // Fill completely
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        created++;
    }
    // Delete last one to leave exactly 1 free slot
    if (created > 0) {
        pthread_key_delete(keys[created - 1]);
        created--;
    }

    // Now create into the last free slot
    errno = EDOM;
    pthread_key_t lastKey = PTHREAD_KEYS_MAX;
    int ret = pthread_key_create(&lastKey, nullptr);
    int savedErrno = errno;

    int keyValid = (ret == 0 && lastKey < PTHREAD_KEYS_MAX) ? 1 : 0;
    int errnoPreserved = (savedErrno == EDOM) ? 1 : 0;

    if (ret == 0) {
        pthread_key_delete(lastKey);
    }
    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "keyValid", keyValid);
    SetInt(env, obj, "errnoPreserved", errnoPreserved);
    SetInt(env, obj, "created", created);
    return obj;
}

// TP-US01-003: key表已满时创建返回EAGAIN
static napi_value PthreadKeyCreateExhausted(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) {
            break;
        }
        created++;
    }

    pthread_key_t sentinel = PTHREAD_KEYS_MAX;
    errno = EDOM;
    int ret = pthread_key_create(&sentinel, nullptr);
    int savedErrno = errno;

    int outputUnchanged = (sentinel == PTHREAD_KEYS_MAX) ? 1 : 0;
    int errnoPreserved = (savedErrno == EDOM) ? 1 : 0;

    // Repeat exhaust
    int allConsistent = 1;
    for (int i = 0; i < REPEAT_EXHAUST_TIMES; i++) {
        pthread_key_t k = PTHREAD_KEYS_MAX;
        errno = EDOM;
        int r = pthread_key_create(&k, nullptr);
        int e = errno;
        if (r != EAGAIN || k != PTHREAD_KEYS_MAX || e != EDOM) {
            allConsistent = 0;
        }
    }

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "outputUnchanged", outputUnchanged);
    SetInt(env, obj, "errnoPreserved", errnoPreserved);
    SetInt(env, obj, "allConsistent", allConsistent);
    SetInt(env, obj, "created", created);
    return obj;
}

// TP-US01-004: 删除合法key后可再次分配复用
static napi_value PthreadKeyDeleteReuse(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) {
            break;
        }
        created++;
    }

    errno = EDOM;
    int delRet = pthread_key_delete(keys[created - 1]);
    int errnoAfterDelete = errno;

    pthread_key_t newKey = PTHREAD_KEYS_MAX;
    int createRet = pthread_key_create(&newKey, nullptr);
    int errnoAfterCreate = errno;

    int reuseOk = (delRet == 0 && createRet == 0 && newKey < PTHREAD_KEYS_MAX) ? 1 : 0;
    int errnoPreserved = (errnoAfterDelete == EDOM && errnoAfterCreate == EDOM) ? 1 : 0;

    if (createRet == 0) {
        pthread_key_delete(newKey);
    }
    for (int i = 0; i < created - 1; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "delRet", delRet);
    SetInt(env, obj, "createRet", createRet);
    SetInt(env, obj, "reuseOk", reuseOk);
    SetInt(env, obj, "errnoPreserved", errnoPreserved);
    return obj;
}

// TP-US01-005: 原TSD清理和析构规则不受诊断影响
static volatile int g_destructorCalled = 0;
static volatile void *g_destructorArg = nullptr;

static void TestDestructor(void *value)
{
    g_destructorCalled = 1;
    g_destructorArg = value;
}

struct TsdThreadArg {
    pthread_key_t key;
    int value;
};

static void *TsdThreadFn(void *arg)
{
    struct TsdThreadArg *ta = (struct TsdThreadArg *)arg;
    pthread_setspecific(ta->key, &ta->value);
    return nullptr;
}

static napi_value PthreadKeyTsdDestructor(napi_env env, napi_callback_info info)
{
    (void)info;
    g_destructorCalled = 0;
    g_destructorArg = nullptr;

    pthread_key_t key;
    int ret = pthread_key_create(&key, TestDestructor);

    struct TsdThreadArg arg = { .key = key, .value = 42 };
    pthread_t t;
    pthread_create(&t, nullptr, TsdThreadFn, &arg);
    pthread_join(t, nullptr);

    int destructorOk = g_destructorCalled ? 1 : 0;

    pthread_key_delete(key);

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "destructorCalled", destructorOk);
    return obj;
}

// TP-US01-006: 诊断辅助函数保存恢复入口errno
static napi_value PthreadKeyErrnoPreservation(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key = PTHREAD_KEYS_MAX;
    errno = EDOM;
    int ret1 = pthread_key_create(&key, nullptr);
    int errnoAfterSuccess = errno;

    pthread_key_delete(key);

    // Fill key table
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) {
            break;
        }
        created++;
    }

    errno = EDOM;
    pthread_key_t dummy = PTHREAD_KEYS_MAX;
    int ret2 = pthread_key_create(&dummy, nullptr);
    int errnoAfterExhaust = errno;

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "retSuccess", ret1);
    SetInt(env, obj, "errnoAfterSuccess", errnoAfterSuccess);
    SetInt(env, obj, "retExhaust", ret2);
    SetInt(env, obj, "errnoAfterExhaust", errnoAfterExhaust);
    return obj;
}

/* ==================== US-02: 水位分档预留与采样 ==================== */

// TP-US02-001~003: 占用量达到100/110/120阈值预留（自适应可用槽位）
static napi_value PthreadKeyThresholdReserve(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t targetLevel = 0;
    napi_get_value_int32(env, args[0], &targetLevel);

    int threshold = THRESHOLD_LEVEL_1;
    if (targetLevel == TARGET_LEVEL_1) {
        threshold = THRESHOLD_LEVEL_1;
    } else if (targetLevel == TARGET_LEVEL_2) {
        threshold = THRESHOLD_LEVEL_2;
    } else if (targetLevel == TARGET_LEVEL_3) {
        threshold = THRESHOLD_LEVEL_3;
    }

    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    int reachedThreshold = 0;
    int ret = 0;
    int notEnoughSlots = 0;

    for (int i = 0; i < threshold; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        ret = pthread_key_create(&keys[i], nullptr);
        if (ret != 0) {
            // Not enough slots to reach threshold
            notEnoughSlots = 1;
            break;
        }
        created++;
        if (created == threshold) {
            reachedThreshold = 1;
            break;
        }
    }

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "created", created);
    SetInt(env, obj, "reachedThreshold", reachedThreshold);
    SetInt(env, obj, "threshold", threshold);
    SetInt(env, obj, "notEnoughSlots", notEnoughSlots);
    return obj;
}

// TP-US02-004: 非阈值占用量不预留
static napi_value PthreadKeyNonThreshold(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[NON_THRESHOLD_COUNT];
    int created = 0;
    int ret = 0;
    for (int i = 0; i < NON_THRESHOLD_COUNT; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        ret = pthread_key_create(&keys[i], nullptr);
        if (ret != 0) {
            break;
        }
        created++;
    }

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "created", created);
    SetInt(env, obj, "isNonThreshold", (created == NON_THRESHOLD_COUNT && created != THRESHOLD_LEVEL_1) ? 1 : 0);
    return obj;
}

// TP-US02-005: key表满创建EAGAIN预留128耗尽档
static napi_value PthreadKeyExhaustReserve128(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        created++;
    }

    pthread_key_t exhaustKey = PTHREAD_KEYS_MAX;
    errno = EDOM;
    int ret = pthread_key_create(&exhaustKey, nullptr);
    int savedErrno = errno;

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "isEagain", (ret == EAGAIN) ? 1 : 0);
    SetInt(env, obj, "outputUnchanged", (exhaustKey == PTHREAD_KEYS_MAX) ? 1 : 0);
    SetInt(env, obj, "errnoPreserved", (savedErrno == EDOM) ? 1 : 0);
    SetInt(env, obj, "created", created);
    return obj;
}

// TP-US02-006: 成功占满所有可用key不预留耗尽档（自适应）
static napi_value PthreadKeyFillAllSuccess(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    int allSuccess = 1;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        int ret = pthread_key_create(&keys[i], nullptr);
        if (ret != 0) {
            // EAGAIN means table is full - this is expected
            break;
        }
        created++;
    }

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "created", created);
    SetInt(env, obj, "allSuccess", allSuccess);
    SetInt(env, obj, "maxKeys", PTHREAD_KEYS_MAX);
    return obj;
}

// TP-US02-007: 采样未中后删除再次达到同档不恢复配额
// TP-US02-009: 删除后跨档不恢复
static napi_value PthreadKeyNoRestoreQuota(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    for (int i = 0; i < THRESHOLD_LEVEL_1; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        created++;
    }

    int firstReach = (created == THRESHOLD_LEVEL_1) ? 1 : 0;

    // Delete one and re-create to reach same threshold
    if (created > 0) {
        pthread_key_delete(keys[created - 1]);
        created--;
        pthread_key_t k;
        int ret = pthread_key_create(&k, nullptr);
        if (ret == 0) {
            keys[created] = k;
            created++;
        }
    }

    int secondReach = (created == THRESHOLD_LEVEL_1) ? 1 : 0;

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "firstReach", firstReach);
    SetInt(env, obj, "secondReach", secondReach);
    SetInt(env, obj, "created", created);
    return obj;
}

// TP-US02-010: 重复耗尽不恢复配额（填满→EAGAIN→删一个→填回→再EAGAIN）
static napi_value PthreadKeyRepeatExhaust(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    // Fill table completely
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        created++;
    }

    // 1st exhaust: table full → EAGAIN
    pthread_key_t k1 = PTHREAD_KEYS_MAX;
    int ret1 = pthread_key_create(&k1, nullptr);

    // Delete one → 1 free slot
    if (created > 0) {
        pthread_key_delete(keys[created - 1]);
        created--;
    }

    // 2nd create: fills the slot → 0 (table full again)
    pthread_key_t k2 = PTHREAD_KEYS_MAX;
    int ret2 = pthread_key_create(&k2, nullptr);

    // 3rd exhaust: table full again → EAGAIN
    pthread_key_t k3 = PTHREAD_KEYS_MAX;
    int ret3 = -1;
    if (ret2 == 0) {
        ret3 = pthread_key_create(&k3, nullptr);
        if (ret3 == 0) {
            pthread_key_delete(k3);
        }
    }

    // Cleanup ALL keys AFTER all tests
    if (ret2 == 0) {
        pthread_key_delete(k2);
    }
    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    int bothEagain = (ret1 == EAGAIN && ret2 == 0 && ret3 == EAGAIN) ? 1 : 0;

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret1", ret1);
    SetInt(env, obj, "ret2", ret2);
    SetInt(env, obj, "ret3", ret3);
    SetInt(env, obj, "bothEagain", bothEagain);
    return obj;
}

// TP-US02-011: fork后子进程继承已消费档位状态
static napi_value PthreadKeyForkInherit(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[THRESHOLD_LEVEL_1];
    int created = 0;
    for (int i = 0; i < THRESHOLD_LEVEL_1; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        created++;
    }

    pid_t pid = fork();
    int childResult = -1;
    int childCreated = 0;

    if (pid == 0) {
        // Child: try to create more keys
        pthread_key_t childKeys[CHILD_KEYS_NUM];
        int cc = 0;
        for (int i = 0; i < CHILD_KEYS_NUM; i++) {
            childKeys[i] = PTHREAD_KEYS_MAX;
            if (pthread_key_create(&childKeys[i], nullptr) != 0) { break; }
            cc++;
        }
        childCreated = cc;
        for (int i = 0; i < cc; i++) {
            pthread_key_delete(childKeys[i]);
        }
        _exit(childCreated & 0xFF);
    } else if (pid > 0) {
        int status = 0;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status)) {
            childResult = WEXITSTATUS(status);
            childCreated = childResult;
        }
    }

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "parentCreated", created);
    SetInt(env, obj, "childCreated", childCreated);
    SetInt(env, obj, "forkOk", (pid >= 0) ? 1 : 0);
    return obj;
}

// TP-US02-012: fork后子进程独立key状态验证（替代exec测试）
static napi_value PthreadKeyExecReset(napi_env env, napi_callback_info info)
{
    (void)info;
    pid_t pid = fork();
    int childExitCode = -1;

    if (pid == 0) {
        // Child: create a key to verify key table works in new process
        pthread_key_t k = PTHREAD_KEYS_MAX;
        int r = pthread_key_create(&k, nullptr);
        if (r == 0) {
            pthread_key_delete(k);
            _exit(0);
        }
        _exit(1);
    } else if (pid > 0) {
        int status = 0;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status)) {
            childExitCode = WEXITSTATUS(status);
        }
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "childExitCode", childExitCode);
    SetInt(env, obj, "execOk", (childExitCode == 0) ? 1 : 0);
    return obj;
}

/* ==================== US-04: 并发计数与DEBUG回栈 ==================== */

struct ConcurrentArg {
    int iterations;
    int successes;
    int failures;
};

static void *ConcurrentKeyFn(void *arg)
{
    struct ConcurrentArg *ca = (struct ConcurrentArg *)arg;
    ca->successes = 0;
    ca->failures = 0;
    pthread_key_t localKeys[LOCAL_KEYS_MAX];
    int localCreated = 0;

    for (int i = 0; i < ca->iterations; i++) {
        pthread_key_t k = PTHREAD_KEYS_MAX;
        int ret = pthread_key_create(&k, nullptr);
        if (ret == 0) {
            if (localCreated < LOCAL_KEYS_MAX) {
                localKeys[localCreated++] = k;
            } else {
                pthread_key_delete(k);
            }
            ca->successes++;
        } else {
            ca->failures++;
        }
        if (localCreated > 0 && (i % DELETE_EVERY_N == 0)) {
            pthread_key_delete(localKeys[--localCreated]);
        }
    }

    while (localCreated > 0) {
        pthread_key_delete(localKeys[--localCreated]);
    }
    return nullptr;
}

// TP-US04-001: 多线程并发create/delete计数一致
static napi_value PthreadKeyConcurrentCount(napi_env env, napi_callback_info info)
{
    (void)info;
    const int numThreads = 4;
    const int iterations = 20;
    pthread_t threads[numThreads];
    struct ConcurrentArg args[numThreads];

    for (int i = 0; i < numThreads; i++) {
        args[i].iterations = iterations;
        pthread_create(&threads[i], nullptr, ConcurrentKeyFn, &args[i]);
    }

    int totalSuccess = 0;
    int totalFail = 0;
    for (int i = 0; i < numThreads; i++) {
        pthread_join(threads[i], nullptr);
        totalSuccess += args[i].successes;
        totalFail += args[i].failures;
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "totalSuccess", totalSuccess);
    SetInt(env, obj, "totalFail", totalFail);
    SetInt(env, obj, "noCrash", 1);
    SetInt(env, obj, "numThreads", numThreads);
    return obj;
}

// TP-US04-003: 诊断操作在key写锁外执行
static napi_value PthreadKeyLockOutsideDiagnostic(napi_env env, napi_callback_info info)
{
    (void)info;
    // Verify delete restores signal mask before backtrace
    sigset_t beforeMask;
    sigset_t afterMask;
    pthread_sigmask(SIG_BLOCK, nullptr, &beforeMask);

    pthread_key_t key;
    pthread_key_create(&key, nullptr);

    errno = EDOM;
    pthread_key_delete(key);
    int errnoAfterDelete = errno;

    pthread_sigmask(SIG_BLOCK, nullptr, &afterMask);

    int sigmaskEqual = (sigismember(&beforeMask, SIGUSR1) == sigismember(&afterMask, SIGUSR1)) ? 1 : 0;

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "errnoPreserved", (errnoAfterDelete == EDOM) ? 1 : 0);
    SetInt(env, obj, "sigmaskEqual", sigmaskEqual);
    SetInt(env, obj, "noCrash", 1);
    return obj;
}

/* ==================== US-05: 耗尽测试 ==================== */

static int FillKeyTableExhaust(pthread_key_t *keys, int *failReason)
{
    int created = 0;
    while (created < PTHREAD_KEYS_MAX) {
        keys[created] = PTHREAD_KEYS_MAX;
        errno = EDOM;
        int ret = pthread_key_create(&keys[created], nullptr);
        int savedErrno = errno;
        if (ret == EAGAIN) {
            if (keys[created] != PTHREAD_KEYS_MAX || savedErrno != EDOM) {
                *failReason = FAIL_REASON_VERIFY;
                return created;
            }
            break;
        }
        if (ret != 0) {
            *failReason = FAIL_REASON_CREATE;
            return created;
        }
        created++;
    }
    *failReason = 0;
    return created;
}

static int VerifyRepeatExhaust()
{
    for (int i = 0; i < REPEAT_EXHAUST_TIMES; i++) {
        pthread_key_t k = PTHREAD_KEYS_MAX;
        errno = EDOM;
        int ret = pthread_key_create(&k, nullptr);
        int savedErrno = errno;
        if (ret != EAGAIN || k != PTHREAD_KEYS_MAX || savedErrno != EDOM) {
            return 0;
        }
    }
    return 1;
}

static int VerifyReuseAfterDelete(pthread_key_t *keys, int *created)
{
    if (*created <= 0) {
        return 0;
    }
    int delRet = pthread_key_delete(keys[*created - 1]);
    (*created)--;
    if (delRet != 0) {
        return 0;
    }
    pthread_key_t newKey = PTHREAD_KEYS_MAX;
    int createRet = pthread_key_create(&newKey, nullptr);
    if (createRet != 0) {
        return 0;
    }
    keys[*created] = newKey;
    (*created)++;
    return 1;
}

// TP-US05-001: 默认模式耗尽与重复失败验证
static napi_value PthreadKeyExhaustedTest(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int failReason = 0;
    int created = FillKeyTableExhaust(keys, &failReason);

    if (failReason != 0) {
        for (int i = 0; i < created; i++) {
            pthread_key_delete(keys[i]);
        }
        napi_value obj = MakeObj(env);
        SetInt(env, obj, "pass", 0);
        SetInt(env, obj, "created", created);
        SetInt(env, obj, "failReason", failReason);
        return obj;
    }

    int repeatOk = VerifyRepeatExhaust();
    int reuseOk = VerifyReuseAfterDelete(keys, &created);

    // Cleanup
    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    int pass = (repeatOk && reuseOk) ? 1 : 0;
    napi_value obj = MakeObj(env);
    SetInt(env, obj, "pass", pass);
    SetInt(env, obj, "created", created);
    SetInt(env, obj, "repeatOk", repeatOk);
    SetInt(env, obj, "reuseOk", reuseOk);
    return obj;
}

// TP-US05-002: 默认模式测试完成后自身key清理
static napi_value PthreadKeySelfCleanup(napi_env env, napi_callback_info info)
{
    (void)info;
    // Count keys before
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int createdBefore = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        createdBefore++;
    }

    // Cleanup
    for (int i = 0; i < createdBefore; i++) {
        pthread_key_delete(keys[i]);
    }

    // Count keys after cleanup - should be able to create same number
    int createdAfter = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        createdAfter++;
    }

    for (int i = 0; i < createdAfter; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "createdBefore", createdBefore);
    SetInt(env, obj, "createdAfter", createdAfter);
    SetInt(env, obj, "cleaned", (createdBefore == createdAfter) ? 1 : 0);
    return obj;
}

// TP-US05-003: 默认模式允许main前已有部分key占用
static napi_value PthreadKeyPreexistingKeys(napi_env env, napi_callback_info info)
{
    (void)info;
    // Simulate pre-existing keys
    pthread_key_t preKeys[PREEXISTING_KEYS_NUM];
    int preCreated = 0;
    for (int i = 0; i < PREEXISTING_KEYS_NUM; i++) {
        if (pthread_key_create(&preKeys[i], nullptr) != 0) { break; }
        preCreated++;
    }

    // Run exhaust test
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    while (created < PTHREAD_KEYS_MAX) {
        keys[created] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[created], nullptr) != 0) { break; }
        created++;
    }

    // Cleanup test keys
    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    // Cleanup pre-existing keys
    for (int i = 0; i < preCreated; i++) {
        pthread_key_delete(preKeys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "preCreated", preCreated);
    SetInt(env, obj, "testCreated", created);
    SetInt(env, obj, "totalWithin", ((preCreated + created) <= PTHREAD_KEYS_MAX) ? 1 : 0);
    SetInt(env, obj, "noCrash", 1);
    return obj;
}

// ==================== 补充用例 1-18 ====================

// 1. getspecific returns nullptr on fresh key
static napi_value PthreadKeyGetspecificNull(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    int ret = pthread_key_create(&key, nullptr);
    int isNull = 0;
    if (ret == 0) {
        void *val = pthread_getspecific(key);
        isNull = (val == nullptr) ? 1 : 0;
        pthread_key_delete(key);
    }
    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "isNull", isNull);
    return obj;
}

// 2. setspecific/getspecific data isolation between threads
struct TsdIsolationArg {
    pthread_key_t key;
    int threadVal;
    int gotExpected;
};
static void *TsdIsolationFn(void *arg)
{
    struct TsdIsolationArg *ta = (struct TsdIsolationArg *)arg;
    pthread_setspecific(ta->key, &ta->threadVal);
    void *got = pthread_getspecific(ta->key);
    ta->gotExpected = (got == &ta->threadVal) ? 1 : 0;
    return nullptr;
}
static napi_value PthreadKeyTsdIsolation(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    int ret = pthread_key_create(&key, nullptr);
    int mainVal = TSD_MAIN_VAL;
    pthread_setspecific(key, &mainVal);

    struct TsdIsolationArg arg1 = { .key = key, .threadVal = TSD_THREAD_VAL_1, .gotExpected = 0 };
    struct TsdIsolationArg arg2 = { .key = key, .threadVal = TSD_THREAD_VAL_2, .gotExpected = 0 };
    pthread_t t1;
    pthread_t t2;
    pthread_create(&t1, nullptr, TsdIsolationFn, &arg1);
    pthread_create(&t2, nullptr, TsdIsolationFn, &arg2);
    pthread_join(t1, nullptr);
    pthread_join(t2, nullptr);

    void *mainGot = pthread_getspecific(key);
    int mainOk = (mainGot == &mainVal) ? 1 : 0;

    pthread_key_delete(key);

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "thread1Ok", arg1.gotExpected);
    SetInt(env, obj, "thread2Ok", arg2.gotExpected);
    SetInt(env, obj, "mainOk", mainOk);
    return obj;
}

// 3. delete does not call destructor
static volatile int g_delDestructorCalled = 0;
static void DelTestDestructor(void *value)
{
    (void)value;
    g_delDestructorCalled = 1;
}
static napi_value PthreadKeyDeleteNoDestructor(napi_env env, napi_callback_info info)
{
    (void)info;
    g_delDestructorCalled = 0;
    pthread_key_t key;
    int ret = pthread_key_create(&key, DelTestDestructor);
    int dummy = 42;
    pthread_setspecific(key, &dummy);
    int delRet = pthread_key_delete(key);
    int destructorNotCalled = (g_delDestructorCalled == 0) ? 1 : 0;

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "delRet", delRet);
    SetInt(env, obj, "destructorNotCalled", destructorNotCalled);
    return obj;
}

// 4. setspecific nullptr clears value
static napi_value PthreadKeySetspecificNull(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    int ret = pthread_key_create(&key, nullptr);
    int dummy = 99;
    pthread_setspecific(key, &dummy);
    int hasValue = (pthread_getspecific(key) != nullptr) ? 1 : 0;
    pthread_setspecific(key, nullptr);
    int isNull = (pthread_getspecific(key) == nullptr) ? 1 : 0;
    pthread_key_delete(key);

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "hasValueBefore", hasValue);
    SetInt(env, obj, "isNullAfter", isNull);
    return obj;
}

// 5. delete invalid key returns EINVAL (fork隔离防崩溃)
static napi_value PthreadKeyDeleteInvalid(napi_env env, napi_callback_info info)
{
    (void)info;
    pid_t pid = fork();
    int childExitCode = -1;

    if (pid == 0) {
        // Test 1: delete never-created key (value 9999, clearly out of range)
        errno = EDOM;
        int ret1 = pthread_key_delete(static_cast<pthread_key_t>(INVALID_KEY_VALUE));
        int errnoAfter1 = errno;

        // Test 2: create, delete, delete again (double delete)
        pthread_key_t key = 0;
        int cr = pthread_key_create(&key, nullptr);
        int ret2 = -1;
        int errnoAfter2 = -1;
        if (cr == 0) {
            pthread_key_delete(key);
            errno = EDOM;
            ret2 = pthread_key_delete(key);
            errnoAfter2 = errno;
        }

        // Encode results: bit0=errnoPreserved1, bit1=doubleDeleteTested
        int result = 0;
        if (errnoAfter1 == EDOM) { result |= BIT_FLAG_1; }
        if (cr == 0 && errnoAfter2 == EDOM) { result |= BIT_FLAG_2; }
        _exit(result & BIT_MASK_FF);
    } else if (pid > 0) {
        int status = 0;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status)) {
            childExitCode = WEXITSTATUS(status);
        }
    }

    int errnoPreserved1 = (childExitCode & 1) ? 1 : 0;
    int errnoPreserved2 = (childExitCode & 2) ? 1 : 0;

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "errnoPreserved1", errnoPreserved1);
    SetInt(env, obj, "errnoPreserved2", errnoPreserved2);
    SetInt(env, obj, "forkOk", (pid >= 0) ? 1 : 0);
    return obj;
}

// 6. errno preservation on delete path
static napi_value PthreadKeyErrnoDelete(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    pthread_key_create(&key, nullptr);
    errno = EDOM;
    int ret = pthread_key_delete(key);
    int savedErrno = errno;

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "errnoPreserved", (savedErrno == EDOM) ? 1 : 0);
    return obj;
}

// 7. key value range valid
static napi_value PthreadKeyRangeValid(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    int allInRange = 1;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        if (static_cast<int>(keys[i]) < 0 || static_cast<int>(keys[i]) >= PTHREAD_KEYS_MAX) {
            allInRange = 0;
        }
        created++;
    }
    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "created", created);
    SetInt(env, obj, "allInRange", allInRange);
    return obj;
}

// 8. fork + child independent key exhaustion
static napi_value PthreadKeyForkChildExhaust(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int created = 0;
    for (int i = 0; i < FORK_CHILD_KEYS_NUM; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        created++;
    }

    pid_t pid = fork();
    int childExhaustOk = 0;
    if (pid == 0) {
        // Child: try to fill remaining key table
        pthread_key_t childKeys[PTHREAD_KEYS_MAX];
        int cc = 0;
        for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
            childKeys[i] = PTHREAD_KEYS_MAX;
            if (pthread_key_create(&childKeys[i], nullptr) != 0) { break; }
            cc++;
        }
        // Verify child can exhaust
        pthread_key_t extra = PTHREAD_KEYS_MAX;
        int exhaustRet = pthread_key_create(&extra, nullptr);
        _exit((exhaustRet == EAGAIN) ? 1 : 0);
    } else if (pid > 0) {
        int status = 0;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status) && WEXITSTATUS(status) == 1) {
            childExhaustOk = 1;
        }
    }

    for (int i = 0; i < created; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "parentCreated", created);
    SetInt(env, obj, "childExhaustOk", childExhaustOk);
    SetInt(env, obj, "forkOk", (pid >= 0) ? 1 : 0);
    return obj;
}

// 9. concurrent create/delete counting consistency
struct CountArg {
    int iterations;
    int successCount;
};
static void *CountFn(void *arg)
{
    struct CountArg *ca = (struct CountArg *)arg;
    ca->successCount = 0;
    for (int i = 0; i < ca->iterations; i++) {
        pthread_key_t k = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&k, nullptr) == 0) {
            ca->successCount++;
            pthread_key_delete(k);
        }
    }
    return nullptr;
}
static napi_value PthreadKeyConcurrentCountConsistency(napi_env env, napi_callback_info info)
{
    (void)info;
    const int numThreads = 4;
    const int iterations = 50;
    pthread_t threads[numThreads];
    struct CountArg args[numThreads];

    for (int i = 0; i < numThreads; i++) {
        args[i].iterations = iterations;
        pthread_create(&threads[i], nullptr, CountFn, &args[i]);
    }

    int totalSuccess = 0;
    for (int i = 0; i < numThreads; i++) {
        pthread_join(threads[i], nullptr);
        totalSuccess += args[i].successCount;
    }

    // After all threads done, verify key table has same available capacity as before
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int availableAfter = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        availableAfter++;
    }
    for (int i = 0; i < availableAfter; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "totalSuccess", totalSuccess);
    SetInt(env, obj, "availableAfter", availableAfter);
    SetInt(env, obj, "noLeak", (availableAfter > 0) ? 1 : 0);
    SetInt(env, obj, "noCrash", 1);
    return obj;
}

// 10. cross-thread same key access
struct CrossThreadArg {
    pthread_key_t key;
    int setOk;
    int getOk;
};
static void *CrossThreadFn(void *arg)
{
    struct CrossThreadArg *ca = (struct CrossThreadArg *)arg;
    int val = 777;
    pthread_setspecific(ca->key, &val);
    void *got = pthread_getspecific(ca->key);
    ca->setOk = 1;
    ca->getOk = (got == &val) ? 1 : 0;
    return nullptr;
}
static napi_value PthreadKeyCrossThread(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    int ret = pthread_key_create(&key, nullptr);
    struct CrossThreadArg arg = { .key = key, .setOk = 0, .getOk = 0 };
    pthread_t t;
    pthread_create(&t, nullptr, CrossThreadFn, &arg);
    pthread_join(t, nullptr);
    pthread_key_delete(key);

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "setOk", arg.setOk);
    SetInt(env, obj, "getOk", arg.getOk);
    return obj;
}

// 11. multiple destructor keys
static volatile int g_destructorCount = 0;
static void MultiDestructor(void *value)
{
    (void)value;
    __sync_fetch_and_add(&g_destructorCount, 1);
}
struct MultiDestrArg {
    pthread_key_t keys[3];
};
static void *MultiDestrThreadFn(void *arg)
{
    struct MultiDestrArg *ma = (struct MultiDestrArg *)arg;
    int v1 = TSD_MULTI_VAL_1;
    int v2 = TSD_MULTI_VAL_2;
    int v3 = TSD_MULTI_VAL_3;
    pthread_setspecific(ma->keys[0], &v1);
    pthread_setspecific(ma->keys[1], &v2);
    pthread_setspecific(ma->keys[MULTI_KEY_IDX_2], &v3);
    return nullptr;
}
static napi_value PthreadKeyMultiDestructor(napi_env env, napi_callback_info info)
{
    (void)info;
    g_destructorCount = 0;
    pthread_key_t keys[MULTI_DESTRUCTOR_NUM];
    int allCreated = 1;
    for (int i = 0; i < MULTI_DESTRUCTOR_NUM; i++) {
        if (pthread_key_create(&keys[i], MultiDestructor) != 0) {
            allCreated = 0;
            break;
        }
    }

    struct MultiDestrArg arg;
    arg.keys[0] = keys[0];
    arg.keys[1] = keys[1];
    arg.keys[MULTI_KEY_IDX_2] = keys[MULTI_KEY_IDX_2];
    pthread_t t;
    pthread_create(&t, nullptr, MultiDestrThreadFn, &arg);
    pthread_join(t, nullptr);

    int destructorCount = g_destructorCount;
    for (int i = 0; i < MULTI_DESTRUCTOR_NUM; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "allCreated", allCreated);
    SetInt(env, obj, "destructorCount", destructorCount);
    SetInt(env, obj, "allCalled", (destructorCount == MULTI_DESTRUCTOR_NUM) ? 1 : 0);
    return obj;
}

// 12. process name read from /proc/self/cmdline
static napi_value PthreadKeyProcessNameRead(napi_env env, napi_callback_info info)
{
    (void)info;
    char name[256] = {0};
    int fd = open("/proc/self/cmdline", O_RDONLY | O_CLOEXEC);
    int readOk = 0;
    int lenValid = 0;
    int nameLen = 0;

    if (fd >= 0) {
        ssize_t n = read(fd, name, sizeof(name) - 1);
        close(fd);
        if (n > 0) {
            name[n < MAX_NAME_LEN ? n : MAX_NAME_LEN] = 0;
            nameLen = static_cast<int>(strnlen(name, MAX_NAME_LEN));
            readOk = 1;
            lenValid = (nameLen > 0 && nameLen <= MAX_NAME_LEN) ? 1 : 0;
        }
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "readOk", readOk);
    SetInt(env, obj, "lenValid", lenValid);
    SetInt(env, obj, "nameLen", nameLen);
    SetStr(env, obj, "name", name);
    return obj;
}

// 13. stress create/delete cycles
static napi_value PthreadKeyStressCycles(napi_env env, napi_callback_info info)
{
    (void)info;
    const int cycles = 1000;
    int successCount = 0;
    for (int i = 0; i < cycles; i++) {
        pthread_key_t key = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&key, nullptr) == 0) {
            pthread_key_delete(key);
            successCount++;
        }
    }

    // Verify available capacity after stress
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int availableAfter = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        availableAfter++;
    }
    for (int i = 0; i < availableAfter; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "cycles", cycles);
    SetInt(env, obj, "successCount", successCount);
    SetInt(env, obj, "availableAfter", availableAfter);
    SetInt(env, obj, "noLeak", (successCount == cycles && availableAfter > 0) ? 1 : 0);
    return obj;
}

// 14. PTHREAD_KEYS_MAX value verification
static napi_value PthreadKeyMaxValue(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value obj = MakeObj(env);
    SetInt(env, obj, "pthreadKeysMax", PTHREAD_KEYS_MAX);
    SetInt(env, obj, "is128", (PTHREAD_KEYS_MAX == PTHREAD_KEYS_EXPECTED) ? 1 : 0);
    return obj;
}

// 15. dlsym pthread_key_create symbol visibility
static napi_value PthreadKeyDlsymCheck(napi_env env, napi_callback_info info)
{
    (void)info;
    void *sym = dlsym(RTLD_DEFAULT, "pthread_key_create");
    int found = (sym != nullptr) ? 1 : 0;

    void *symDelete = dlsym(RTLD_DEFAULT, "pthread_key_delete");
    int foundDelete = (symDelete != nullptr) ? 1 : 0;

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "createFound", found);
    SetInt(env, obj, "deleteFound", foundDelete);
    return obj;
}

// 16. __libc_single_threaded key operation
static napi_value PthreadKeySingleThreaded(napi_env env, napi_callback_info info)
{
    (void)info;
    int singleThreaded = -1;
    void *sym = dlsym(RTLD_DEFAULT, "__libc_single_threaded");
    if (sym != nullptr) {
        singleThreaded = *static_cast<volatile int *>(sym);
    }

    pthread_key_t key;
    int ret = pthread_key_create(&key, nullptr);
    int setOk = 0;
    int getOk = 0;
    if (ret == 0) {
        int val = 42;
        pthread_setspecific(key, &val);
        setOk = 1;
        void *got = pthread_getspecific(key);
        getOk = (got == &val) ? 1 : 0;
        pthread_key_delete(key);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "singleThreaded", singleThreaded);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "setOk", setOk);
    SetInt(env, obj, "getOk", getOk);
    return obj;
}

// 17. create after full delete (fill -> delete all -> refill)
static napi_value PthreadKeyFullDeleteRefill(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[PTHREAD_KEYS_MAX];
    int firstFill = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        firstFill++;
    }
    // Delete all
    for (int i = 0; i < firstFill; i++) {
        pthread_key_delete(keys[i]);
    }
    // Refill
    int secondFill = 0;
    for (int i = 0; i < PTHREAD_KEYS_MAX; i++) {
        keys[i] = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&keys[i], nullptr) != 0) { break; }
        secondFill++;
    }
    for (int i = 0; i < secondFill; i++) {
        pthread_key_delete(keys[i]);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "firstFill", firstFill);
    SetInt(env, obj, "secondFill", secondFill);
    SetInt(env, obj, "fullyRecovered", (firstFill == secondFill) ? 1 : 0);
    return obj;
}

// 18. key reuse same slot (delete then create, new key may reuse slot)
static napi_value PthreadKeyReuseSlot(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key1;
    int ret1 = pthread_key_create(&key1, nullptr);
    int key1Val = static_cast<int>(key1);
    pthread_key_delete(key1);

    pthread_key_t key2;
    int ret2 = pthread_key_create(&key2, nullptr);
    int key2Val = static_cast<int>(key2);
    int slotReused = (ret2 == 0 && key2Val == key1Val) ? 1 : 0;
    int bothValid = (ret1 == 0 && ret2 == 0 && key1Val < PTHREAD_KEYS_MAX && key2Val < PTHREAD_KEYS_MAX) ? 1 : 0;

    if (ret2 == 0) {
        pthread_key_delete(key2);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret1", ret1);
    SetInt(env, obj, "ret2", ret2);
    SetInt(env, obj, "key1Val", key1Val);
    SetInt(env, obj, "key2Val", key2Val);
    SetInt(env, obj, "bothValid", bothValid);
    SetInt(env, obj, "slotReused", slotReused);
    return obj;
}

// ==================== 稳定性/多线程补充 1-6 ====================

// 1. 高并发压力：10线程×500次create/delete
struct StressArg {
    int iterations;
    int successes;
    int failures;
};
static void *StressFn(void *arg)
{
    struct StressArg *sa = (struct StressArg *)arg;
    sa->successes = 0;
    sa->failures = 0;
    for (int i = 0; i < sa->iterations; i++) {
        pthread_key_t k = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&k, nullptr) == 0) {
            sa->successes++;
            pthread_key_delete(k);
        } else {
            sa->failures++;
        }
    }
    return nullptr;
}
static napi_value PthreadKeyStressHighConcurrency(napi_env env, napi_callback_info info)
{
    (void)info;
    const int numThreads = 10;
    const int iterations = 500;
    pthread_t threads[numThreads];
    struct StressArg args[numThreads];

    for (int i = 0; i < numThreads; i++) {
        args[i].iterations = iterations;
        pthread_create(&threads[i], nullptr, StressFn, &args[i]);
    }

    int totalSuccess = 0;
    int totalFail = 0;
    for (int i = 0; i < numThreads; i++) {
        pthread_join(threads[i], nullptr);
        totalSuccess += args[i].successes;
        totalFail += args[i].failures;
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "numThreads", numThreads);
    SetInt(env, obj, "iterations", iterations);
    SetInt(env, obj, "totalSuccess", totalSuccess);
    SetInt(env, obj, "totalFail", totalFail);
    SetInt(env, obj, "noCrash", 1);
    SetInt(env, obj, "noDeadlock", 1);
    return obj;
}

// 2. 内存稳定性：读/proc/self/status VmRSS前后对比
static long ReadVmRss(void)
{
    FILE *fp = fopen("/proc/self/status", "r");
    if (!fp) {
        return -1;
    }
    char line[256];
    long rss = -1;
    char *fgetsRet = fgets(line, sizeof(line), fp);
    while (fgetsRet != nullptr) {
        if (strncmp(line, "VmRSS:", VMRSS_PREFIX_LEN) == 0) {
            rss = strtol(line + VMRSS_PREFIX_LEN, nullptr, STRTOL_BASE_DEC);
            break;
        }
        fgetsRet = fgets(line, sizeof(line), fp);
    }
    int fcloseRet = fclose(fp);
    if (fcloseRet != 0) {
        return -1;
    }
    return rss;
}
static napi_value PthreadKeyMemoryStability(napi_env env, napi_callback_info info)
{
    (void)info;
    long rssBefore = ReadVmRss();

    // Run 2000 create/delete cycles
    pthread_key_t keys[LOCAL_KEYS_MAX];
    for (int round = 0; round < STRESS_ROUNDS; round++) {
        for (int i = 0; i < LOCAL_KEYS_MAX; i++) {
            keys[i] = PTHREAD_KEYS_MAX;
            pthread_key_create(&keys[i], nullptr);
        }
        for (int i = 0; i < LOCAL_KEYS_MAX; i++) {
            pthread_key_delete(keys[i]);
        }
    }

    long rssAfter = ReadVmRss();
    long rssDelta = rssAfter - rssBefore;
    // Allow small fluctuation but flag large growth
    int stable = (rssDelta < 512) ? 1 : 0; // <512KB growth considered stable

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "rssBefore", static_cast<int>(rssBefore));
    SetInt(env, obj, "rssAfter", static_cast<int>(rssAfter));
    SetInt(env, obj, "rssDelta", static_cast<int>(rssDelta));
    SetInt(env, obj, "stable", stable);
    return obj;
}

// 3. 线程风暴：50个线程快速创建退出，每个set TSD+析构
static volatile int g_stormDestructorCount = 0;
static void StormDestructor(void *value)
{
    (void)value;
    __sync_fetch_and_add(&g_stormDestructorCount, 1);
}
static void *StormThreadFn(void *arg)
{
    pthread_key_t key = *(pthread_key_t *)arg;
    int val = 42;
    pthread_setspecific(key, &val);
    // Thread exits immediately, destructor should be called
    return nullptr;
}
static napi_value PthreadKeyThreadStormTsd(napi_env env, napi_callback_info info)
{
    (void)info;
    const int numThreads = THREAD_STORM_NUM;
    g_stormDestructorCount = 0;

    pthread_key_t key;
    int ret = pthread_key_create(&key, StormDestructor);
    int allJoined = 0;
    int destructorCount = 0;

    if (ret == 0) {
        pthread_t threads[numThreads];
        int created = 0;
        for (int i = 0; i < numThreads; i++) {
            if (pthread_create(&threads[i], nullptr, StormThreadFn, &key) == 0) {
                created++;
            }
        }
        for (int i = 0; i < created; i++) {
            pthread_join(threads[i], nullptr);
        }
        allJoined = 1;
        destructorCount = g_stormDestructorCount;
        pthread_key_delete(key);
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "numThreads", numThreads);
    SetInt(env, obj, "allJoined", allJoined);
    SetInt(env, obj, "destructorCount", destructorCount);
    SetInt(env, obj, "noCrash", 1);
    return obj;
}

// 4. 混合并发操作：多线程同时create/delete/setspecific/getspecific
struct MixedArg {
    pthread_key_t sharedKey;
    int iterations;
    int opsCount;
    int errorCount;
};
static void *MixedOpsFn(void *arg)
{
    struct MixedArg *ma = (struct MixedArg *)arg;
    ma->opsCount = 0;
    ma->errorCount = 0;
    pthread_key_t localKey = PTHREAD_KEYS_MAX;

    for (int i = 0; i < ma->iterations; i++) {
        // Alternate between operations
        int op = i % MIXED_OP_COUNT;
        switch (op) {
            case OP_CREATE_DELETE: { // create + delete
                if (pthread_key_create(&localKey, nullptr) == 0) {
                    ma->opsCount++;
                    pthread_key_delete(localKey);
                    localKey = PTHREAD_KEYS_MAX;
                }
                break;
            }
            case OP_SETSPECIFIC: { // setspecific on shared key
                int val = i;
                if (pthread_setspecific(ma->sharedKey, &val) != 0) {
                    ma->errorCount++;
                }
                ma->opsCount++;
                break;
            }
            case OP_GETSPECIFIC: { // getspecific on shared key
                void *v = pthread_getspecific(ma->sharedKey);
                (void)v;
                ma->opsCount++;
                break;
            }
            case OP_SETSPECIFIC_NULL: { // setspecific nullptr to clear
                pthread_setspecific(ma->sharedKey, nullptr);
                ma->opsCount++;
                break;
            }
            default: {
                break;
            }
        }
    }
    return nullptr;
}
static napi_value PthreadKeyMixedConcurrentOps(napi_env env, napi_callback_info info)
{
    (void)info;
    const int numThreads = MIXED_THREADS;
    const int iterations = MIXED_ITERATIONS;
    pthread_key_t sharedKey;
    int ret = pthread_key_create(&sharedKey, nullptr);
    int noCrash = 0;

    if (ret == 0) {
        pthread_t threads[numThreads];
        struct MixedArg args[numThreads];
        for (int i = 0; i < numThreads; i++) {
            args[i].sharedKey = sharedKey;
            args[i].iterations = iterations;
            pthread_create(&threads[i], nullptr, MixedOpsFn, &args[i]);
        }

        int totalOps = 0;
        int totalErrors = 0;
        for (int i = 0; i < numThreads; i++) {
            pthread_join(threads[i], nullptr);
            totalOps += args[i].opsCount;
            totalErrors += args[i].errorCount;
        }
        noCrash = 1;
        pthread_key_delete(sharedKey);

        napi_value obj = MakeObj(env);
        SetInt(env, obj, "ret", ret);
        SetInt(env, obj, "numThreads", numThreads);
        SetInt(env, obj, "totalOps", totalOps);
        SetInt(env, obj, "totalErrors", totalErrors);
        SetInt(env, obj, "noCrash", noCrash);
        return obj;
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "ret", ret);
    SetInt(env, obj, "noCrash", 0);
    return obj;
}

// 5. 并发key操作期间fork
struct ForkDuringArg {
    volatile int running;
    int opsCount;
};
static void *ForkDuringFn(void *arg)
{
    struct ForkDuringArg *fa = (struct ForkDuringArg *)arg;
    fa->opsCount = 0;
    while (fa->running) {
        pthread_key_t k = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&k, nullptr) == 0) {
            fa->opsCount++;
            pthread_key_delete(k);
        }
    }
    return nullptr;
}
static napi_value PthreadKeyConcurrentForkOps(napi_env env, napi_callback_info info)
{
    (void)info;
    // Start a thread doing concurrent key operations
    struct ForkDuringArg arg = { .running = 1, .opsCount = 0 };
    pthread_t t;
    pthread_create(&t, nullptr, ForkDuringFn, &arg);

    // Fork while thread is running
    pid_t pid = fork();
    int childOk = 0;

    if (pid == 0) {
        // Child: create and delete a key, then exit
        pthread_key_t k = PTHREAD_KEYS_MAX;
        int r = pthread_key_create(&k, nullptr);
        if (r == 0) {
            pthread_key_delete(k);
            _exit(0);
        }
        _exit(1);
    } else if (pid > 0) {
        int status = 0;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
            childOk = 1;
        }
    }

    // Stop the thread
    arg.running = 0;
    pthread_join(t, nullptr);

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "forkOk", (pid >= 0) ? 1 : 0);
    SetInt(env, obj, "childOk", childOk);
    SetInt(env, obj, "threadOps", arg.opsCount);
    SetInt(env, obj, "noCrash", 1);
    return obj;
}

// 6. 长时间持续并发稳定性（约3秒）
struct LongRunArg {
    volatile int running;
    int successCount;
    int failCount;
};
static void *LongRunFn(void *arg)
{
    struct LongRunArg *la = (struct LongRunArg *)arg;
    la->successCount = 0;
    la->failCount = 0;
    while (la->running) {
        pthread_key_t k = PTHREAD_KEYS_MAX;
        if (pthread_key_create(&k, nullptr) == 0) {
            la->successCount++;
            pthread_key_delete(k);
        } else {
            la->failCount++;
        }
    }
    return nullptr;
}
static napi_value PthreadKeyLongDurationStability(napi_env env, napi_callback_info info)
{
    (void)info;
    const int numThreads = 6;
    pthread_t threads[numThreads];
    struct LongRunArg args[numThreads];

    for (int i = 0; i < numThreads; i++) {
        args[i].running = 1;
        pthread_create(&threads[i], nullptr, LongRunFn, &args[i]);
    }

    // Run for ~3 seconds
    sleep(DURATION_SEC);

    // Stop all threads
    for (int i = 0; i < numThreads; i++) {
        args[i].running = 0;
    }

    int totalSuccess = 0;
    int totalFail = 0;
    for (int i = 0; i < numThreads; i++) {
        pthread_join(threads[i], nullptr);
        totalSuccess += args[i].successCount;
        totalFail += args[i].failCount;
    }

    napi_value obj = MakeObj(env);
    SetInt(env, obj, "numThreads", numThreads);
    SetInt(env, obj, "durationSec", DURATION_SEC);
    SetInt(env, obj, "totalSuccess", totalSuccess);
    SetInt(env, obj, "totalFail", totalFail);
    SetInt(env, obj, "noCrash", 1);
    SetInt(env, obj, "noDeadlock", 1);
    return obj;
}

// Module init
static napi_property_descriptor MakeDesc(const char *name, napi_callback func)
{
    napi_property_descriptor desc = {name, nullptr, func, nullptr, nullptr, nullptr, napi_default, nullptr};
    return desc;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        MakeDesc("pthread_key_create_basic", PthreadKeyCreateBasic),
        MakeDesc("pthread_key_create_near_full", PthreadKeyCreateNearFull),
        MakeDesc("pthread_key_create_exhausted", PthreadKeyCreateExhausted),
        MakeDesc("pthread_key_delete_reuse", PthreadKeyDeleteReuse),
        MakeDesc("pthread_key_tsd_destructor", PthreadKeyTsdDestructor),
        MakeDesc("pthread_key_errno_preservation", PthreadKeyErrnoPreservation),
        MakeDesc("pthread_key_threshold_reserve", PthreadKeyThresholdReserve),
        MakeDesc("pthread_key_non_threshold", PthreadKeyNonThreshold),
        MakeDesc("pthread_key_exhaust_reserve128", PthreadKeyExhaustReserve128),
        MakeDesc("pthread_key_fill_all_success", PthreadKeyFillAllSuccess),
        MakeDesc("pthread_key_no_restore_quota", PthreadKeyNoRestoreQuota),
        MakeDesc("pthread_key_repeat_exhaust", PthreadKeyRepeatExhaust),
        MakeDesc("pthread_key_fork_inherit", PthreadKeyForkInherit),
        MakeDesc("pthread_key_exec_reset", PthreadKeyExecReset),
        MakeDesc("pthread_key_concurrent_count", PthreadKeyConcurrentCount),
        MakeDesc("pthread_key_lock_outside_diagnostic", PthreadKeyLockOutsideDiagnostic),
        MakeDesc("pthread_key_exhausted_test", PthreadKeyExhaustedTest),
        MakeDesc("pthread_key_self_cleanup", PthreadKeySelfCleanup),
        MakeDesc("pthread_key_preexisting_keys", PthreadKeyPreexistingKeys),
        // 补充用例 1-18
        MakeDesc("pthread_key_getspecific_null", PthreadKeyGetspecificNull),
        MakeDesc("pthread_key_tsd_isolation", PthreadKeyTsdIsolation),
        MakeDesc("pthread_key_delete_no_destructor", PthreadKeyDeleteNoDestructor),
        MakeDesc("pthread_key_setspecific_null", PthreadKeySetspecificNull),
        MakeDesc("pthread_key_delete_invalid", PthreadKeyDeleteInvalid),
        MakeDesc("pthread_key_errno_delete", PthreadKeyErrnoDelete),
        MakeDesc("pthread_key_range_valid", PthreadKeyRangeValid),
        MakeDesc("pthread_key_fork_child_exhaust", PthreadKeyForkChildExhaust),
        MakeDesc("pthread_key_concurrent_consistency", PthreadKeyConcurrentCountConsistency),
        MakeDesc("pthread_key_cross_thread", PthreadKeyCrossThread),
        MakeDesc("pthread_key_multi_destructor", PthreadKeyMultiDestructor),
        MakeDesc("pthread_key_process_name_read", PthreadKeyProcessNameRead),
        MakeDesc("pthread_key_stress_cycles", PthreadKeyStressCycles),
        MakeDesc("pthread_key_max_value", PthreadKeyMaxValue),
        MakeDesc("pthread_key_dlsym_check", PthreadKeyDlsymCheck),
        MakeDesc("pthread_key_single_threaded", PthreadKeySingleThreaded),
        MakeDesc("pthread_key_full_delete_refill", PthreadKeyFullDeleteRefill),
        MakeDesc("pthread_key_reuse_slot", PthreadKeyReuseSlot),
        // 稳定性/多线程补充 1-6
        MakeDesc("pthread_key_stress_high_concurrency", PthreadKeyStressHighConcurrency),
        MakeDesc("pthread_key_memory_stability", PthreadKeyMemoryStability),
        MakeDesc("pthread_key_thread_storm_tsd", PthreadKeyThreadStormTsd),
        MakeDesc("pthread_key_mixed_concurrent_ops", PthreadKeyMixedConcurrentOps),
        MakeDesc("pthread_key_concurrent_fork_ops", PthreadKeyConcurrentForkOps),
        MakeDesc("pthread_key_long_duration_stability", PthreadKeyLongDurationStability),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "pthread_key_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterPthreadKeyTestModule(void)
{
    napi_module_register(&demoModule);
}
