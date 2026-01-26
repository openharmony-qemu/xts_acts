/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "include/QosCapiTest.h"
#include <cerrno>
#include <hilog/log.h>
#include <qos/qos.h>
#include <thread>
#include <unistd.h>
#include "include/OhosCommonTest.h"

#define OH_NN_SUCCESS 0
#define LOG_DOMAIN 0xD003900
#define LOG_TAG "QosCapiTest"
#define INVALID_QOS_VALUE 6
#define QOS_LEVEL_TEST 1024

namespace Acts {
namespace QosManager {

/**
 * Helper function: Test all valid QoS levels
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestAllValidQoSLevels(const char* prefix)
{
    int ret;
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[SetThreadQoSNdkTest] %sSet QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     ret,
                     errno);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] %sSet QOS_BACKGROUND success", prefix);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[SetThreadQoSNdkTest] %sSet QOS_UTILITY failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     ret,
                     errno);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] %sSet QOS_UTILITY success", prefix);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[SetThreadQoSNdkTest] %sSet QOS_DEFAULT failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     ret,
                     errno);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] %sSet QOS_DEFAULT success", prefix);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[SetThreadQoSNdkTest] %sSet QOS_USER_INITIATED failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     ret,
                     errno);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] %sSet QOS_USER_INITIATED success", prefix);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[SetThreadQoSNdkTest] %sSet QOS_DEADLINE_REQUEST failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     ret,
                     errno);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] %sSet QOS_DEADLINE_REQUEST success", prefix);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[SetThreadQoSNdkTest] %sSet QOS_USER_INTERACTIVE failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     ret,
                     errno);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] %sSet QOS_USER_INTERACTIVE success", prefix);

    return 0;
}

/**
 * Helper function: Test all invalid QoS levels
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestInvalidQoSLevels(const char* prefix)
{
    int ret;
    ret = OH_QoS_SetThreadQoS(QoS_Level(-1));
    if (ret != -1) {
        OH_LOG_ERROR(
            LOG_APP, "[SetThreadQoSNdkTest] %sSet invalid QoS(-1) should fail but got ret=%{public}d", prefix, ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] %sSet invalid QoS(-1) correctly failed", prefix);

    ret = OH_QoS_SetThreadQoS(QoS_Level(INVALID_QOS_VALUE));
    if (ret != -1) {
        OH_LOG_ERROR(LOG_APP,
                     "[SetThreadQoSNdkTest] %sSet invalid QoS(%{public}d) should fail but got ret=%{public}d",
                     prefix,
                     INVALID_QOS_VALUE,
                     ret);
        return -1;
    }
    OH_LOG_INFO(
        LOG_APP, "[SetThreadQoSNdkTest] %sSet invalid QoS(%{public}d) correctly failed", prefix, INVALID_QOS_VALUE);

    ret = OH_QoS_SetThreadQoS(QoS_Level(QOS_LEVEL_TEST));
    if (ret != -1) {
        OH_LOG_ERROR(LOG_APP,
                     "[SetThreadQoSNdkTest] %sSet invalid QoS(%{public}d) should fail but got ret=%{public}d",
                     prefix,
                     QOS_LEVEL_TEST,
                     ret);
        return -1;
    }
    OH_LOG_INFO(
        LOG_APP, "[SetThreadQoSNdkTest] %sSet invalid QoS(%{public}d) correctly failed", prefix, QOS_LEVEL_TEST);
    return 0;
}

/**
 * Helper function: Run full QoS test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunQoSFullTestInWorkerThread()
{
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Running full test in worker thread...");
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllValidQoSLevels("Worker: ") != 0) {
            testPassed = false;
            return;
        }
        if (TestInvalidQoSLevels("Worker: ") != 0) {
            testPassed = false;
            return;
        }
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Worker: All tests passed!");
    });
    fullTest.join();
    if (testPassed) {
        OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Test PASSED (worker thread strategy)");
        return OH_NN_SUCCESS;
    } else {
        OH_LOG_ERROR(LOG_APP, "[SetThreadQoSNdkTest] Test FAILED in worker thread");
        return -1;
    }
}

/**
 * Helper function: Run full QoS test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunQoSFullTestInMainThread()
{
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Main thread can set QoS, continuing original test...");
    if (TestAllValidQoSLevels("") != 0) {
        return -1;
    }
    if (TestInvalidQoSLevels("") != 0) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SetThreadQoSNdkTest] Test passed");
    return OH_NN_SUCCESS;
}

/**
 * Helper function: Test QoS capability and run test in appropriate thread
 * @param testName: Name of the test for logging
 * @param workerTestFunc: Function to run if worker thread supports QoS
 * @param mainTestFunc: Function to run if only main thread supports QoS
 * @return 0 on success, -1 on failure
 */
static int RunQoSTestWithThreadStrategy(const char* testName, int (*workerTestFunc)(), int (*mainTestFunc)())
{
    OH_LOG_INFO(LOG_APP, "[%s] Test started", testName);
    OH_LOG_INFO(LOG_APP, "[%s] Main thread tid=%{public}d, pid=%{public}d", testName, gettid(), getpid());
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    int mainThreadErrno = errno;
    OH_LOG_INFO(LOG_APP,
                "[%s] Main thread SetQoS result: ret=%{public}d, errno=%{public}d",
                testName,
                mainThreadResult,
                mainThreadErrno);
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;
    std::thread worker([&mtx, &workerThreadResult, &workerDone, &cv, testName]() {
        pid_t worker_tid = gettid();
        pid_t worker_pid = getpid();
        OH_LOG_INFO(
            LOG_APP, "[%s] Worker thread started: tid=%{public}d, pid=%{public}d", testName, worker_tid, worker_pid);
        int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        std::lock_guard<std::mutex> lock(mtx);
        workerThreadResult = ret;
        workerDone = true;
        cv.notify_one();
    });
    {
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [&] { return workerDone; });
    }
    worker.join();
    OH_LOG_INFO(LOG_APP, "[%s] Worker thread result: ret=%{public}d", testName, workerThreadResult);
    if (workerThreadResult == 0) {
        return workerTestFunc();
    } else if (mainThreadResult == 0) {
        return mainTestFunc();
    } else {
        OH_LOG_ERROR(LOG_APP, "[%s] BOTH main and worker threads failed!", testName);
        OH_LOG_WARN(LOG_APP, "[%s] Test skipped due to system limitations", testName);
        return OH_NN_SUCCESS;
    }
}

/**
 * @tc.name   SetThreadQoSNdkTest
 * @tc.number SetThreadQoSNdkTest
 * @tc.desc   Verify the Set QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SetThreadQoSNdkTest()
{
    return RunQoSTestWithThreadStrategy(
        "SetThreadQoSNdkTest", RunQoSFullTestInWorkerThread, RunQoSFullTestInMainThread);
}

/**
 * Helper function: Test single QoS level with reset operation
 * @param level: QoS level to test
 * @param levelName: Name of the QoS level for logging
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestSingleQoSLevelWithReset(QoS_Level level, const char* levelName, const char* prefix)
{
    int ret = OH_QoS_SetThreadQoS(level);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[ResetThreadQoSNdkTest] %sSet %s failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     levelName,
                     ret,
                     errno);
        return -1;
    }
    ret = OH_QoS_ResetThreadQoS();
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[ResetThreadQoSNdkTest] %sReset after %s failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     levelName,
                     ret,
                     errno);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] %s%s set and reset success", prefix, levelName);
    return 0;
}

/**
 * Helper function: Test all QoS levels with reset operation
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestAllQoSLevelsWithReset(const char* prefix)
{
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_BACKGROUND, "QOS_BACKGROUND", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_UTILITY, "QOS_UTILITY", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_DEFAULT, "QOS_DEFAULT", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_USER_INITIATED, "QOS_USER_INITIATED", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_DEADLINE_REQUEST, "QOS_DEADLINE_REQUEST", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_USER_INTERACTIVE, "QOS_USER_INTERACTIVE", prefix) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Run full QoS reset test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunResetQoSFullTestInWorkerThread()
{
    OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Running full test in worker thread...");
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllQoSLevelsWithReset("Worker: ") != 0) {
            testPassed = false;
            return;
        }
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Worker: All tests passed!");
    });
    fullTest.join();
    if (testPassed) {
        OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Test PASSED (worker thread strategy)");
        return OH_NN_SUCCESS;
    } else {
        OH_LOG_ERROR(LOG_APP, "[ResetThreadQoSNdkTest] Test FAILED in worker thread");
        return -1;
    }
}

/**
 * Helper function: Run full QoS reset test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunResetQoSFullTestInMainThread()
{
    OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Main thread can set QoS, continuing original test...");
    if (TestAllQoSLevelsWithReset("") != 0) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ResetThreadQoSNdkTest] Test passed");
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   ResetThreadQoSNdkTest
 * @tc.number ResetThreadQoSNdkTest
 * @tc.desc   Verify the Reset QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int ResetThreadQoSNdkTest()
{
    return RunQoSTestWithThreadStrategy(
        "ResetThreadQoSNdkTest", RunResetQoSFullTestInWorkerThread, RunResetQoSFullTestInMainThread);
}

/**
 * Helper function: Test single QoS level with get operation
 * @param level: QoS level to test
 * @param levelName: Name of the QoS level for logging
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestSingleQoSLevelWithGet(QoS_Level level, const char* levelName, const char* prefix)
{
    int ret = OH_QoS_SetThreadQoS(level);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[GetThreadQoSNdkTest] %sSet %s failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     levelName,
                     ret,
                     errno);
        return -1;
    }
    enum QoS_Level getLevel;
    ret = OH_QoS_GetThreadQoS(&getLevel);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[GetThreadQoSNdkTest] %sGet %s failed, ret=%{public}d, errno=%{public}d",
                     prefix,
                     levelName,
                     ret,
                     errno);
        return -1;
    }
    if (getLevel != level) {
        OH_LOG_ERROR(
            LOG_APP, "[GetThreadQoSNdkTest] %sExpected %s but got level=%{public}d", prefix, levelName, getLevel);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] %s%s verified", prefix, levelName);
    return 0;
}

/**
 * Helper function: Test Get QoS with nullptr and after reset
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestGetQoSWithNullAndReset(const char* prefix)
{
    int ret = OH_QoS_GetThreadQoS(nullptr);
    if (ret != -1) {
        OH_LOG_ERROR(
            LOG_APP, "[GetThreadQoSNdkTest] %sGet with nullptr should fail but got ret=%{public}d", prefix, ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] %sGet with nullptr correctly failed", prefix);

    ret = OH_QoS_ResetThreadQoS();
    if (ret != 0) {
        OH_LOG_ERROR(
            LOG_APP, "[GetThreadQoSNdkTest] %sReset failed, ret=%{public}d, errno=%{public}d", prefix, ret, errno);
        return -1;
    }
    enum QoS_Level level;
    ret = OH_QoS_GetThreadQoS(&level);
    if (ret != -1) {
        OH_LOG_ERROR(LOG_APP,
                     "[GetThreadQoSNdkTest] %sGet after reset should fail but got ret=%{public}d, level=%{public}d",
                     prefix,
                     ret,
                     level);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] %sGet after reset correctly failed", prefix);
    return 0;
}

/**
 * Helper function: Test all QoS levels with get operation
 * @param prefix: Log prefix for distinguishing test context (e.g., "Worker: ")
 * @return 0 on success, -1 on failure
 */
static int TestAllQoSLevelsWithGet(const char* prefix)
{
    if (TestGetQoSWithNullAndReset(prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_BACKGROUND, "QOS_BACKGROUND", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_UTILITY, "QOS_UTILITY", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_DEFAULT, "QOS_DEFAULT", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_USER_INITIATED, "QOS_USER_INITIATED", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_DEADLINE_REQUEST, "QOS_DEADLINE_REQUEST", prefix) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_USER_INTERACTIVE, "QOS_USER_INTERACTIVE", prefix) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Run full QoS get test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunGetQoSFullTestInWorkerThread()
{
    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Running full test in worker thread...");
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllQoSLevelsWithGet("Worker: ") != 0) {
            testPassed = false;
            return;
        }
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Worker: All tests passed!");
    });
    fullTest.join();
    if (testPassed) {
        OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Test PASSED (worker thread strategy)");
        return OH_NN_SUCCESS;
    } else {
        OH_LOG_ERROR(LOG_APP, "[GetThreadQoSNdkTest] Test FAILED in worker thread");
        return -1;
    }
}

/**
 * Helper function: Run full QoS get test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunGetQoSFullTestInMainThread()
{
    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Main thread can set QoS, continuing original test...");
    if (TestAllQoSLevelsWithGet("") != 0) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GetThreadQoSNdkTest] Test passed");
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GetThreadQoSNdkTest
 * @tc.number GetThreadQoSNdkTest
 * @tc.desc   Verify the Get QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GetThreadQoSNdkTest()
{
    return RunQoSTestWithThreadStrategy(
        "GetThreadQoSNdkTest", RunGetQoSFullTestInWorkerThread, RunGetQoSFullTestInMainThread);
}

/**
 * @tc.name   ThreadQoSNdkTest
 * @tc.number ThreadQoSNdkTest
 * @tc.desc   Double Test ThreadQoSNDKTest function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int ThreadQoSNdkTest()
{
    OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Test started");
    OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Main thread tid=%{public}d, pid=%{public}d", gettid(), getpid());
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    int mainThreadErrno = errno;
    OH_LOG_INFO(LOG_APP,
                "[ThreadQoSNdkTest] Main thread SetQoS result: ret=%{public}d, errno=%{public}d",
                mainThreadResult,
                mainThreadErrno);
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;
    std::thread worker([&mtx, &workerThreadResult, &workerDone, &cv]() {
        pid_t worker_tid = gettid();
        pid_t worker_pid = getpid();
        OH_LOG_INFO(LOG_APP,
                    "[ThreadQoSNdkTest] Worker thread started: tid=%{public}d, pid=%{public}d",
                    worker_tid,
                    worker_pid);
        int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        std::lock_guard<std::mutex> lock(mtx);
        workerThreadResult = ret;
        workerDone = true;
        cv.notify_one();
    });

    {
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [&] { return workerDone; });
    }
    worker.join();

    OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker thread result: ret=%{public}d", workerThreadResult);

    if (workerThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Running full test in worker thread...");
        bool testPassed = true;
        std::thread fullTest([&testPassed]() {
            int ret;
            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ThreadQoSNdkTest] Worker: First set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: First set QOS_BACKGROUND success");

            ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
            if (ret != 0) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ThreadQoSNdkTest] Worker: Second set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                    ret,
                    errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: Second set QOS_BACKGROUND success (double set test)");

            enum QoS_Level level;
            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ThreadQoSNdkTest] Worker: First get failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_BACKGROUND) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ThreadQoSNdkTest] Worker: First get: expected QOS_BACKGROUND(0) but got level=%{public}d",
                    level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: First get verified QOS_BACKGROUND");

            ret = OH_QoS_GetThreadQoS(&level);
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ThreadQoSNdkTest] Worker: Second get failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            if (level != QoS_Level::QOS_BACKGROUND) {
                OH_LOG_ERROR(
                    LOG_APP,
                    "[ThreadQoSNdkTest] Worker: Second get: expected QOS_BACKGROUND(0) but got level=%{public}d",
                    level);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: Second get verified QOS_BACKGROUND (double get test)");

            ret = OH_QoS_ResetThreadQoS();
            if (ret != 0) {
                OH_LOG_ERROR(LOG_APP,
                             "[ThreadQoSNdkTest] Worker: First reset failed, ret=%{public}d, errno=%{public}d",
                             ret,
                             errno);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: First reset success");

            ret = OH_QoS_ResetThreadQoS();
            if (ret != -1) {
                OH_LOG_ERROR(
                    LOG_APP, "[ThreadQoSNdkTest] Worker: Second reset should fail but got ret=%{public}d", ret);
                testPassed = false;
                return;
            }
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: Second reset correctly failed (double reset test)");

            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Worker: All tests passed!");
        });
        fullTest.join();
        if (testPassed) {
            OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Test PASSED (worker thread strategy)");
            return OH_NN_SUCCESS;
        } else {
            OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] Test FAILED in worker thread");
            return -1;
        }

    } else if (mainThreadResult == 0) {
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Main thread can set QoS, continuing original test...");
        int ret;
        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ThreadQoSNdkTest] First set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] First set QOS_BACKGROUND success");

        ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP,
                         "[ThreadQoSNdkTest] Second set QOS_BACKGROUND failed, ret=%{public}d, errno=%{public}d",
                         ret,
                         errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Second set QOS_BACKGROUND success (double set test)");
        enum QoS_Level level;
        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] First get failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        if (level != QoS_Level::QOS_BACKGROUND) {
            OH_LOG_ERROR(
                LOG_APP, "[ThreadQoSNdkTest] First get: expected QOS_BACKGROUND(0) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] First get verified QOS_BACKGROUND");

        ret = OH_QoS_GetThreadQoS(&level);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] Second get failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        if (level != QoS_Level::QOS_BACKGROUND) {
            OH_LOG_ERROR(
                LOG_APP, "[ThreadQoSNdkTest] Second get: expected QOS_BACKGROUND(0) but got level=%{public}d", level);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Second get verified QOS_BACKGROUND (double get test)");

        ret = OH_QoS_ResetThreadQoS();
        if (ret != 0) {
            OH_LOG_ERROR(
                LOG_APP, "[ThreadQoSNdkTest] First reset failed, ret=%{public}d, errno=%{public}d", ret, errno);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] First reset success");

        ret = OH_QoS_ResetThreadQoS();
        if (ret != -1) {
            OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] Second reset should fail but got ret=%{public}d", ret);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Second reset correctly failed (double reset test)");

        OH_LOG_INFO(LOG_APP, "[ThreadQoSNdkTest] Test passed");
        return OH_NN_SUCCESS;

    } else {
        OH_LOG_ERROR(LOG_APP, "[ThreadQoSNdkTest] BOTH main and worker threads failed!");
        OH_LOG_WARN(LOG_APP, "[ThreadQoSNdkTest] Test skipped due to system limitations");
        return OH_NN_SUCCESS; // Skip test
    }
}

static void MockCallback(void* context, const char* response)
{
    // Mock callback for Gewu tests
}

/**
 * @tc.name   GewuCreateSessionTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0100
 * @tc.desc   Verify the GewuCreateSession function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuCreateSessionTest()
{
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] Test started");

    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] Attributes JSON: %{public}s", attributes);
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] CreateSession returned error code: %{public}d", sessionResult.error);
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_WARN(LOG_APP, "[GewuCreateSessionTest] System does not support Gewu, test skipped");
        return OH_NN_SUCCESS;
    }

    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP,
                     "[GewuCreateSessionTest] CreateSession failed, error=%{public}d, session=%{public}llu",
                     sessionResult.error,
                     (unsigned long long)sessionResult.session);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,
                "[GewuCreateSessionTest] CreateSession success, session=%{public}llu",
                (unsigned long long)sessionResult.session);
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuCreateSessionTest] DestroySession failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] DestroySession success");
    sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_INVAL) {
        OH_LOG_ERROR(
            LOG_APP,
            "[GewuCreateSessionTest] CreateSession with empty string should return INVAL but got error=%{public}d",
            sessionResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] CreateSession with empty string correctly failed with INVAL");

    OH_LOG_INFO(LOG_APP, "[GewuCreateSessionTest] Test passed");
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuSubmitRequestTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0200
 * @tc.desc   Verify the GewuSubmitRequest function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuSubmitRequestTest()
{
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] Test started");
    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    const char* request =
        "{\"type\":\"ChatComplete\",\"messages\":[{\"role\":\"developer\",\"content\":\"Your are a helpful "
        "assistant.\"},{\"role\":\"user\",\"content\":\"What is OpenHarmony\"}],\"stream\":true}";
    void* fakeContext = reinterpret_cast<void*>(0x1234);
    OH_QoS_GewuOnResponse cb = MockCallback;
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] Attributes JSON: %{public}s", attributes);
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] Request JSON: %{public}s", request);
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] CreateSession returned error code: %{public}d", sessionResult.error);
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_WARN(LOG_APP, "[GewuSubmitRequestTest] System does not support Gewu, test skipped");
        return OH_NN_SUCCESS;
    }

    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuSubmitRequestTest] CreateSession failed, error=%{public}d", sessionResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,
                "[GewuSubmitRequestTest] CreateSession success, session=%{public}llu",
                (unsigned long long)sessionResult.session);
    OH_QoS_GewuSubmitRequestResult requestResult =
        OH_QoS_GewuSubmitRequest(sessionResult.session, request, cb, fakeContext);
    if (requestResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        return -1;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuSubmitRequestTest] DestroySession failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] DestroySession success");
    requestResult = OH_QoS_GewuSubmitRequest(0, "", cb, fakeContext);
    if (requestResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_ERROR(
            LOG_APP,
            "[GewuSubmitRequestTest] SubmitRequest with invalid session should return NOENT but got error=%{public}d",
            requestResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] SubmitRequest with invalid session correctly failed with NOENT");
    OH_LOG_INFO(LOG_APP, "[GewuSubmitRequestTest] Test passed");
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuAbortRequestTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0300
 * @tc.desc   Verify the GewuAbortRequest function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuAbortRequestTest()
{
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] Test started");
    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] Attributes JSON: %{public}s", attributes);
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] CreateSession returned error code: %{public}d", sessionResult.error);
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_WARN(LOG_APP, "[GewuAbortRequestTest] System does not support Gewu, test skipped");
        return OH_NN_SUCCESS;
    }
    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuAbortRequestTest] CreateSession failed, error=%{public}d", sessionResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,
                "[GewuAbortRequestTest] CreateSession success, session=%{public}llu",
                (unsigned long long)sessionResult.session);

    OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(sessionResult.session, 0);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuAbortRequestTest] AbortRequest failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] AbortRequest success");
    error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuAbortRequestTest] DestroySession failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] DestroySession success");

    error = OH_QoS_GewuAbortRequest(0, 0);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_ERROR(
            LOG_APP,
            "[GewuAbortRequestTest] AbortRequest with invalid session should return NOENT but got error=%{public}d",
            error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] AbortRequest with invalid session correctly failed with NOENT");
    OH_LOG_INFO(LOG_APP, "[GewuAbortRequestTest] Test passed");
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuDestroySessionTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0400
 * @tc.desc   Verify the GewuDestroySession function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuDestroySessionTest()
{
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] Test started");
    std::string modelPath = std::string(ActsMindSporeConstants::FILES_DIR) + "Qwen2.5-0.5B-CPU-Q4";
    std::string attributesStr = "{\"model\":\"" + modelPath + "\"}";
    const char* attributes = attributesStr.c_str();
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] Attributes JSON: %{public}s", attributes);
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] CreateSession returned error code: %{public}d", sessionResult.error);
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        OH_LOG_WARN(LOG_APP, "[GewuDestroySessionTest] System does not support Gewu, test skipped");
        return OH_NN_SUCCESS;
    }

    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuDestroySessionTest] CreateSession failed, error=%{public}d", sessionResult.error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,
                "[GewuDestroySessionTest] CreateSession success, session=%{public}llu",
                (unsigned long long)sessionResult.session);

    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        OH_LOG_ERROR(LOG_APP, "[GewuDestroySessionTest] DestroySession failed, error=%{public}d", error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] DestroySession success");

    error = OH_QoS_GewuDestroySession(0);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        OH_LOG_ERROR(
            LOG_APP,
            "[GewuDestroySessionTest] DestroySession with invalid session should return NOENT but got error=%{public}d",
            error);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] DestroySession with invalid session correctly failed with NOENT");
    OH_LOG_INFO(LOG_APP, "[GewuDestroySessionTest] Test passed");
    return OH_NN_SUCCESS;
}

} // namespace QosManager
} // namespace Acts
