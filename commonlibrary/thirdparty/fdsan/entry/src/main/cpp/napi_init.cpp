/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2026. All rights reserved.
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
 
#include "napi/native_api.h"
#include <fcntl.h>
#include <csignal>
#include <cstdint>
#include <cstdio>
#include <thread>
#include <mutex>
#include <atomic>
#include <condition_variable>
#include <unistd.h>
#include <pthread.h>
#include <poll.h>
#include <sys/time.h>
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001
#define LOG_TAG "FDSAN_TEST"
#define PRINT_DEBUG(fmt, ...) OH_LOG_DEBUG(LOG_APP, "[%{public}s:%d] " fmt, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define PRINT_INFO(fmt, ...)  OH_LOG_INFO(LOG_APP, "[%{public}s:%d] " fmt, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define PRINT_ERROR(fmt, ...) OH_LOG_ERROR(LOG_APP, "[%{public}s:%d] " fmt, __FUNCTION__, __LINE__, ##__VA_ARGS__)

static constexpr int32_t K_THREAD_SLEEP_MS = 50;
static constexpr int32_t K_THREAD_LONG_SLEEP_MS = 100;
static constexpr int32_t K_THREAD_CLOSE_WAIT_MS = 1020;
static constexpr useconds_t K_POLL_INTERVAL_US = 10000;
static constexpr int32_t K_INVALID_ERROR_LEVEL = -1;
static constexpr int32_t K_MAX_ERROR_LEVEL = 100;
static constexpr int32_t K_INVALID_OWNER_TYPE = 99;

static void EnsureFdUnowned(int fd)
{
    if (fd < 0) {
        return;
    }
    uint64_t currentTag = fdsan_get_owner_tag(fd);
    if (currentTag != 0) {
        fdsan_exchange_owner_tag(fd, currentTag, 0);
    }
}

static napi_value FdsanSetErrorLevelWarnAlways(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    enum fdsan_error_level newLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);
    bool success = (oldLevel == originalLevel && newLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelWarnOnce(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ONCE);
    enum fdsan_error_level newLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);
    bool success = (oldLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS && newLevel == FDSAN_ERROR_LEVEL_WARN_ONCE);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelFatal(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ONCE);
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_FATAL);
    enum fdsan_error_level newLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);
    bool success = (oldLevel == FDSAN_ERROR_LEVEL_WARN_ONCE && newLevel == FDSAN_ERROR_LEVEL_FATAL);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelDisabled(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_FATAL);
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_DISABLED);
    enum fdsan_error_level newLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);
    bool success = (oldLevel == FDSAN_ERROR_LEVEL_FATAL && newLevel == FDSAN_ERROR_LEVEL_DISABLED);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelInvalidEnum(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();

    enum fdsan_error_level invalidLevel = static_cast<enum fdsan_error_level>(-1);
    fdsan_set_error_level(invalidLevel);
    
    enum fdsan_error_level currentLevel = fdsan_get_error_level();
    
    fdsan_set_error_level(originalLevel);
    enum fdsan_error_level restoredLevel = fdsan_get_error_level();
    
    bool success = (restoredLevel == originalLevel);
    
    napi_value napiResult;
    napi_get_boolean(env, success, &napiResult);
    return napiResult;
}

static napi_value FdsanCreateOwnerTagNormal(napi_env env, napi_callback_info info)
{
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    uint64_t expected = (0x01ULL << 56) | 0x12345678;
    bool success = (tag == expected);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCreateOwnerTagZero(napi_env env, napi_callback_info info)
{
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_DIRECTORY, 0);
    bool success = (tag == 0);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCreateOwnerTagInvalidType(napi_env env, napi_callback_info info)
{
    uint64_t tag = fdsan_create_owner_tag(static_cast<enum fdsan_owner_type>(K_INVALID_OWNER_TYPE), 0x1234);
    const char *typeName = fdsan_get_tag_type(tag);
    uint64_t value = fdsan_get_tag_value(tag);
    bool success = (typeName != nullptr && value == 0x1234);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetOwnerTagWithTagSet(napi_env env, napi_callback_info info)
{
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t expectedTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xabcdef);
    fdsan_exchange_owner_tag(fd, 0, expectedTag);
    uint64_t actualTag = fdsan_get_owner_tag(fd);
    close(fd);
    fd = -1;
    bool success = (actualTag == expectedTag);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetOwnerTagNoTagSet(napi_env env, napi_callback_info info)
{
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t tag = fdsan_get_owner_tag(fd);
    close(fd);
    fd = -1;
    const char *typeName = fdsan_get_tag_type(tag);
    bool success = (typeName != nullptr);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetOwnerTagInvalidFd(napi_env env, napi_callback_info info)
{
    uint64_t tag = fdsan_get_owner_tag(-1);
    bool success = (tag == 0);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetTagTypeAndValue(napi_env env, napi_callback_info info)
{
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xabcdef);
    const char *typeStr = fdsan_get_tag_type(tag);
    uint64_t value = fdsan_get_tag_value(tag);
    bool success = (typeStr != nullptr && value == 0xabcdef);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagZeroToNew(napi_env env, napi_callback_info info)
{
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t newTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    if (newTag == 0) {
        close(fd);
        fd = -1;
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    fdsan_exchange_owner_tag(fd, 0, newTag);
    int32_t ret = fdsan_close_with_tag(fd, newTag);
    if (ret != 0) {
        close(fd);
        fd = -1;
    }
    napi_value result;
    napi_get_boolean(env, ret == 0, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagOldToNew(napi_env env, napi_callback_info info)
{
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t oldTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t newTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    if (oldTag == 0 || newTag == 0) {
        close(fd);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    fdsan_exchange_owner_tag(fd, 0, oldTag);
    fdsan_exchange_owner_tag(fd, oldTag, newTag);
    int32_t ret = fdsan_close_with_tag(fd, newTag);
    if (ret != 0) {
        close(fd);
    }

    napi_value result;
    napi_get_boolean(env, ret == 0, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagMismatch(napi_env env, napi_callback_info info)
{
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t tagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t tagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    if (tagA == 0 || tagB == 0) {
        close(fd);
        fd = -1;
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    fdsan_exchange_owner_tag(fd, 0, tagA);
    fdsan_exchange_owner_tag(fd, tagB, 0);
    int32_t ret = fdsan_close_with_tag(fd, tagA);
    if (ret != 0) {
        close(fd);
        fd = -1;
    }

    napi_value result;
    napi_get_boolean(env, ret == 0, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagInvalidFd(napi_env env, napi_callback_info info)
{
    uint64_t newTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    bool success = (newTag != 0);
    fdsan_exchange_owner_tag(-1, 0, newTag);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}


static napi_value FdsanCloseWithTagMatch(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    fdsan_exchange_owner_tag(fd, 0, tag);
    int32_t ret = fdsan_close_with_tag(fd, tag);
    fdsan_set_error_level(originalLevel);
    bool success = (ret == 0);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagMismatch(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    
    EnsureFdUnowned(fd);
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    uint64_t wrongTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xFFFFFFFF);
    fdsan_exchange_owner_tag(fd, 0, tag);
    
    int32_t ret = fdsan_close_with_tag(fd, wrongTag);
    if (ret != 0) {
        ret = fdsan_close_with_tag(fd, tag);
    }
    fd = -1;
    
    fdsan_set_error_level(originalLevel);
    bool success = (ret == 0);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagFdAlreadyClosed(napi_env env, napi_callback_info info)
{
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, (uint64_t)fd);
    fdsan_exchange_owner_tag(fd, 0, tag);
    close(fd);
    fd = -1;
    int32_t ret = fdsan_close_with_tag(fd, tag);
    bool success = (ret == -1);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagFdMinusOne(napi_env env, napi_callback_info info)
{
    int32_t ret = fdsan_close_with_tag(-1, 0);
    bool success = (ret == -1);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagInvalidFd(napi_env env, napi_callback_info info)
{
    int32_t ret = fdsan_close_with_tag(-2, 0);
    bool success = (ret == -1);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelNegativeOrOverRange(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(static_cast<enum fdsan_error_level>(K_INVALID_ERROR_LEVEL));
    fdsan_set_error_level(static_cast<enum fdsan_error_level>(K_MAX_ERROR_LEVEL));
    fdsan_set_error_level(originalLevel);
    enum fdsan_error_level finalLevel = fdsan_get_error_level();
    bool success = (finalLevel == originalLevel);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCreateOwnerTagTypeOutOfRange(napi_env env, napi_callback_info info)
{
    enum fdsan_owner_type invalidType = static_cast<enum fdsan_owner_type>(K_INVALID_OWNER_TYPE);
    uint64_t tag = fdsan_create_owner_tag(invalidType, 0x1234);
    
    const char *typeName = fdsan_get_tag_type(tag);
    uint64_t value = fdsan_get_tag_value(tag);
    
    bool success = (tag != 0 && typeName != nullptr && value == 0x1234);
    
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagFdMinusOne(napi_env env, napi_callback_info info)
{
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    bool success = (tag != 0);
    fdsan_exchange_owner_tag(-1, 0, tag);
    int32_t ret = fdsan_close_with_tag(-1, 0);
    success = (ret == -1);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetOwnerTagFdMinusOne(napi_env env, napi_callback_info info)
{
    uint64_t tag = fdsan_get_owner_tag(-1);
    bool success = (tag == 0);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetTagTypeTagZero(napi_env env, napi_callback_info info)
{
    const char *typeStr = fdsan_get_tag_type(0);
    bool success = (typeStr != nullptr);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanComTransferFdOwnership(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t tagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t tagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    if (tagA == 0 || tagB == 0) {
        close(fd);
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    fdsan_exchange_owner_tag(fd, 0, tagA);
    fdsan_exchange_owner_tag(fd, tagA, tagB);
    int32_t ret = fdsan_close_with_tag(fd, tagB);
    if (ret != 0) {
        close(fd);
    }
    fdsan_set_error_level(originalLevel);
    napi_value result;
    napi_get_boolean(env, ret == 0, &result);
    return result;
}

static napi_value FdsanComMoveSemanticsRaii(napi_env env, napi_callback_info info)
{
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xABCD);
    fdsan_exchange_owner_tag(fd, 0, tag);
    int32_t newFd = dup(fd);
    if (newFd < 0) {
        fdsan_close_with_tag(fd, tag);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    fdsan_close_with_tag(fd, tag);
    int32_t ret2 = close(newFd);
    
    bool success = (ret2 == 0);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanComNestedErrorLevelWarnAlways(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    bool success = false;
    int fd = open("/dev/null", O_RDONLY);
    if (fd >= 0) {
        EnsureFdUnowned(fd);
        close(fd);
        close(fd);
        success = true;
    }
    fdsan_set_error_level(originalLevel);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

struct ThreadData {
    int fd;
    uint64_t tag;
    std::atomic<bool> *fdClosed;
    std::mutex *fdMutex;
    std::atomic<bool> *shouldStop;
};

static void *ThreadFunc1(void *arg)
{
    std::unique_ptr<ThreadData> data(static_cast<ThreadData *>(arg));
    {
        std::lock_guard<std::mutex> lock(*data->fdMutex);
        if (data->shouldStop && data->shouldStop->load()) {
            return nullptr;
        }
        fdsan_exchange_owner_tag(data->fd, 0, data->tag);
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(K_THREAD_LONG_SLEEP_MS));
    {
        std::lock_guard<std::mutex> lock(*data->fdMutex);
        if (data->shouldStop && data->shouldStop->load()) {
            return nullptr;
        }
        int32_t ret = fdsan_close_with_tag(data->fd, data->tag);
        if (data->fdClosed != nullptr) {
            data->fdClosed->store(ret == 0);
        }
    }
    return nullptr;
}

static void *ThreadFunc2(void *arg)
{
    std::unique_ptr<ThreadData> data(static_cast<ThreadData *>(arg));
    std::this_thread::sleep_for(std::chrono::milliseconds(K_THREAD_SLEEP_MS));
    {
        std::lock_guard<std::mutex> lock(*data->fdMutex);
        if (data->shouldStop && data->shouldStop->load()) {
            return nullptr;
        }
        fdsan_exchange_owner_tag(data->fd, 0, data->tag);
    }
    return nullptr;
}

static bool MultiThreadClose(int fd, uint64_t tagA, uint64_t tagB, std::atomic<bool> &fdClosed, std::mutex &fdMutex)
{
    ThreadData *d1 = new ThreadData{fd, tagA, &fdClosed, &fdMutex, nullptr};
    ThreadData *d2 = new ThreadData{fd, tagB, nullptr, &fdMutex, nullptr};

    pthread_t t1;
    pthread_t t2;
    bool ok1 = (pthread_create(&t1, nullptr, ThreadFunc1, d1) == 0);
    bool ok2 = (pthread_create(&t2, nullptr, ThreadFunc2, d2) == 0);
    if (!ok1 || !ok2) {
        if (ok1) {
            pthread_join(t1, nullptr);
        }
        delete d1;
        delete d2;
        close(fd);
        fd = -1;
        return false;
    }

    pthread_join(t1, nullptr);
    pthread_join(t2, nullptr);

    std::lock_guard<std::mutex> lock(fdMutex);
    if (fdClosed.load()) {
        return true;
    }
    bool result = (close(fd) == 0);
    fd = -1;
    return result;
}

static napi_value FdsanComMultiThreadMixedOperation(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    auto setResult = [env, originalLevel](bool success, int fd) -> napi_value {
        if (fd >= 0) close(fd);
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, success, &result);
        return result;
    };

    int fd = open("/dev/null", O_RDWR);
    if (fd < 0) {
        return setResult(false, fd);
    }
    EnsureFdUnowned(fd);

    uint64_t tagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t tagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    if (tagA == 0 || tagB == 0) return setResult(false, fd);

    std::atomic<bool> fdClosed{false};
    std::mutex fdMutex;
    bool closed = MultiThreadClose(fd, tagA, tagB, fdClosed, fdMutex);
    fd = -1;
    return setResult(closed, fd);
}

struct DoubleCloseData {
    int fd;
    uint64_t tag;
    std::mutex mtx;
    std::condition_variable cv;
    bool threadAReady;
    bool threadAClosed;
    bool threadBClosed;
};

static void *ThreadAFunc(void *arg)
{
    DoubleCloseData *data = static_cast<DoubleCloseData *>(arg);
    
    {
        std::unique_lock<std::mutex> lock(data->mtx);
        data->cv.wait(lock, [data] { return data->threadAReady; });
    }
    
    int32_t ret = close(data->fd);
    
    {
        std::lock_guard<std::mutex> lock(data->mtx);
        data->threadAClosed = true;
    }
    
    return nullptr;
}

static void *ThreadBFunc(void *arg)
{
    DoubleCloseData *data = static_cast<DoubleCloseData *>(arg);
    
    fdsan_exchange_owner_tag(data->fd, 0, data->tag);
    
    {
        std::lock_guard<std::mutex> lock(data->mtx);
        data->threadAReady = true;
        data->cv.notify_one();
    }
    
    std::this_thread::sleep_for(std::chrono::milliseconds(K_THREAD_SLEEP_MS));
    
    int32_t ret = fdsan_close_with_tag(data->fd, data->tag);
    
    {
        std::lock_guard<std::mutex> lock(data->mtx);
        data->threadBClosed = true;
    }
    
    return nullptr;
}

static napi_value FdsanDoubleCloseCrossThread(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    
    int fd = open("/dev/null", O_RDWR);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xF02);
    if (tag == 0) {
        close(fd);
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    
    DoubleCloseData data;
    data.fd = fd;
    data.tag = tag;
    data.threadAReady = false;
    data.threadAClosed = false;
    data.threadBClosed = false;
    
    pthread_t threadA;
    pthread_t threadB;
    pthread_create(&threadA, nullptr, ThreadAFunc, &data);
    pthread_create(&threadB, nullptr, ThreadBFunc, &data);
    
    pthread_join(threadA, nullptr);
    pthread_join(threadB, nullptr);
    
    uint64_t currentTag = fdsan_get_owner_tag(fd);
    if (currentTag != 0 && fcntl(fd, F_GETFD) != -1) {
        fdsan_close_with_tag(fd, currentTag);
    } else if (fcntl(fd, F_GETFD) != -1) {
        close(fd);
    }
    
    fdsan_set_error_level(originalLevel);
    
    bool success = (data.threadAClosed && data.threadBClosed);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanDoubleCloseSameThread(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    close(fd);
    close(fd);
    enum fdsan_error_level level = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);
    bool success = (level == FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanUseAfterClose(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    
    EnsureFdUnowned(fd);
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xABCD);
    fdsan_exchange_owner_tag(fd, 0, tag);

    int closeResult = close(fd);
    fd = -1;

    char buf[10];
    ssize_t ret = read(fd, buf, sizeof(buf));
    
    bool success = (ret == -1);
    
    fdsan_set_error_level(originalLevel);
    
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanLevelWarnOnce(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ONCE);
    
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    
    close(fd);
    close(fd);
    
    int fd2 = open("/dev/null", O_RDONLY);
    if (fd2 < 0) {
        close(fd);
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    
    int closeRet1 = close(fd2);
    int closeRet2 = close(fd2);
    
    fdsan_set_error_level(originalLevel);
    
    bool success = (closeRet1 == 0 && closeRet2 == -1);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanLevelWarnAlways(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    close(fd);
    close(fd);
    enum fdsan_error_level restoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);
    bool success = (restoredLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanLevelFatal(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_FATAL);
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    close(fd);
    close(fd);
    enum fdsan_error_level restoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);
    bool success = (restoredLevel == FDSAN_ERROR_LEVEL_FATAL);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanLevelDisabled(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_DISABLED);
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    close(fd);
    close(fd);
    enum fdsan_error_level restoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);
    bool success = (restoredLevel == FDSAN_ERROR_LEVEL_DISABLED);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static void *ThreadCloseFileFunc(void *arg)
{
    FILE *file = static_cast<FILE *>(arg);
    if (file == nullptr) {
        return nullptr;
    }

    std::this_thread::sleep_for(std::chrono::milliseconds(K_THREAD_CLOSE_WAIT_MS));

    int fd = fileno(file);
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }

    return nullptr;
}

static napi_value FdsanStdlibFopenFclose(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    FILE *file = fopen("/dev/null", "w");
    if (file == nullptr) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    pthread_t closeThread = 0;
    int ret = pthread_create(&closeThread, nullptr, ThreadCloseFileFunc, file);
    if (ret != 0) {
        fclose(file);
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    int joinRet = pthread_join(closeThread, nullptr);
    int fcloseRet = fclose(file);
    fdsan_set_error_level(originalLevel);

    bool success = (ret == 0 && joinRet == 0 && fcloseRet != 0);
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanStdlibFdopen(napi_env env, napi_callback_info info)
{
    int fd = open("/dev/null", O_WRONLY);
    if (fd == -1) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    EnsureFdUnowned(fd);
    FILE *file = fdopen(fd, "w");
    bool success = (file != nullptr);
    if (file != nullptr) {
        int fcloseRet = fclose(file);
        success = (success && fcloseRet == 0);
    } else {
        int closeRet = close(fd);
        success = (success && closeRet == 0);
    }
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static std::mutex g_signalMutex;
static std::atomic<bool> g_signalReceived{false};
static enum fdsan_error_level g_errorLevelInHandler{FDSAN_ERROR_LEVEL_DISABLED};
static enum fdsan_error_level g_errorLevelAfterSet{FDSAN_ERROR_LEVEL_DISABLED};

static void SafeSignalHandler(int sig)
{
    g_errorLevelInHandler = fdsan_get_error_level();
    
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ONCE);
    g_errorLevelAfterSet = fdsan_get_error_level();
    
    fdsan_set_error_level(oldLevel);
    g_signalReceived.store(true);
}

static napi_value FdsanSignalSafety(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    
    enum fdsan_error_level expectedLevel = fdsan_get_error_level();
    
    struct sigaction sa;
    sa.sa_handler = SafeSignalHandler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART;
    if (sigaction(SIGUSR1, &sa, nullptr) < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    
    g_signalReceived.store(false);
    g_errorLevelInHandler = FDSAN_ERROR_LEVEL_DISABLED;
    g_errorLevelAfterSet = FDSAN_ERROR_LEVEL_DISABLED;
    
    raise(SIGUSR1);
    
    int timeout = 100;
    while (--timeout > 0 && !g_signalReceived.load()) {
        usleep(K_POLL_INTERVAL_US);
    }
    
    struct sigaction defaultSa;
    defaultSa.sa_handler = SIG_DFL;
    sigemptyset(&defaultSa.sa_mask);
    sigaction(SIGUSR1, &defaultSa, nullptr);
    
    bool levelMatched = (g_errorLevelInHandler == expectedLevel);
    
    bool setLevelMatched = (g_errorLevelAfterSet == FDSAN_ERROR_LEVEL_WARN_ONCE);
    
    enum fdsan_error_level currentLevel = fdsan_get_error_level();
    bool levelRestored = (currentLevel == expectedLevel);
    
    fdsan_set_error_level(originalLevel);
    
    bool success = (g_signalReceived.load() && levelMatched && setLevelMatched && levelRestored);
    
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

EXTERN_C_START
static napi_value RegisterEntryModule(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testFdsanSetErrorLevelWarnAlways", nullptr, FdsanSetErrorLevelWarnAlways, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanSetErrorLevelWarnOnce", nullptr, FdsanSetErrorLevelWarnOnce, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanSetErrorLevelFatal", nullptr, FdsanSetErrorLevelFatal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanSetErrorLevelDisabled", nullptr, FdsanSetErrorLevelDisabled, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanSetErrorLevelInvalidEnum", nullptr, FdsanSetErrorLevelInvalidEnum, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanCreateOwnerTagNormal", nullptr, FdsanCreateOwnerTagNormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanCreateOwnerTagZero", nullptr, FdsanCreateOwnerTagZero, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanCreateOwnerTagInvalidType", nullptr, FdsanCreateOwnerTagInvalidType, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanGetOwnerTagWithTagSet", nullptr, FdsanGetOwnerTagWithTagSet, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanGetOwnerTagNoTagSet", nullptr, FdsanGetOwnerTagNoTagSet, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanGetOwnerTagInvalidFd", nullptr, FdsanGetOwnerTagInvalidFd, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanGetTagTypeAndValue", nullptr, FdsanGetTagTypeAndValue, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanExchangeOwnerTagZeroToNew", nullptr, FdsanExchangeOwnerTagZeroToNew, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanExchangeOwnerTagOldToNew", nullptr, FdsanExchangeOwnerTagOldToNew, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanExchangeOwnerTagMismatch", nullptr, FdsanExchangeOwnerTagMismatch, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanExchangeOwnerTagInvalidFd", nullptr, FdsanExchangeOwnerTagInvalidFd, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanCloseWithTagMatch", nullptr, FdsanCloseWithTagMatch, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanCloseWithTagMismatch", nullptr, FdsanCloseWithTagMismatch, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanCloseWithTagFdAlreadyClosed", nullptr, FdsanCloseWithTagFdAlreadyClosed, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanCloseWithTagInvalidFd", nullptr, FdsanCloseWithTagInvalidFd, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanSetErrorLevelNegativeOrOverRange", nullptr, FdsanSetErrorLevelNegativeOrOverRange, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testFdsanCreateOwnerTagTypeOutOfRange", nullptr, FdsanCreateOwnerTagTypeOutOfRange, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanExchangeOwnerTagFdMinusOne", nullptr, FdsanExchangeOwnerTagFdMinusOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanCloseWithTagFdMinusOne", nullptr, FdsanCloseWithTagFdMinusOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanGetOwnerTagFdMinusOne", nullptr, FdsanGetOwnerTagFdMinusOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanGetTagTypeTagZero", nullptr, FdsanGetTagTypeTagZero, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanComTransferFdOwnership", nullptr, FdsanComTransferFdOwnership, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanComMoveSemanticsRaii", nullptr, FdsanComMoveSemanticsRaii, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanComNestedErrorLevelWarnAlways", nullptr, FdsanComNestedErrorLevelWarnAlways, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"testFdsanComMultiThreadMixedOperation", nullptr, FdsanComMultiThreadMixedOperation, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanDoubleCloseSameThread", nullptr, FdsanDoubleCloseSameThread, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanDoubleCloseCrossThread", nullptr, FdsanDoubleCloseCrossThread, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanUseAfterClose", nullptr, FdsanUseAfterClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testFdsanLevelWarnOnce", nullptr, FdsanLevelWarnOnce, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testFdsanLevelWarnAlways", nullptr, FdsanLevelWarnAlways, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testFdsanLevelFatal", nullptr, FdsanLevelFatal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testFdsanLevelDisabled", nullptr, FdsanLevelDisabled, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testFdsanStdlibFopenFclose", nullptr, FdsanStdlibFopenFclose, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanStdlibFdopen", nullptr, FdsanStdlibFdopen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testFdsanSignalSafety", nullptr, FdsanSignalSafety, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = RegisterEntryModule,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModuleEntry(void) { napi_module_register(&demoModule); }
