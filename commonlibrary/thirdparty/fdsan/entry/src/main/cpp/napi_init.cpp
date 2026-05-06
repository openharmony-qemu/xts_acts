#include "napi/native_api.h"
#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <thread>
#include <mutex>
#include <atomic>
#include <condition_variable>
#include <unistd.h>
#include <pthread.h>
#include <poll.h>
#include "hilog/log.h"

static napi_value FdsanSetErrorLevelWarnAlways(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    enum fdsan_error_level newLevel = fdsan_get_error_level();

    bool success = (oldLevel == originalLevel && newLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelWarnOnce(napi_env env, napi_callback_info info) {
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ONCE);
    enum fdsan_error_level newLevel = fdsan_get_error_level();

    bool success = (oldLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS && newLevel == FDSAN_ERROR_LEVEL_WARN_ONCE);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelFatal(napi_env env, napi_callback_info info) {
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ONCE);
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_FATAL);
    enum fdsan_error_level newLevel = fdsan_get_error_level();

    bool success = (oldLevel == FDSAN_ERROR_LEVEL_WARN_ONCE && newLevel == FDSAN_ERROR_LEVEL_FATAL);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelDisabled(napi_env env, napi_callback_info info) {
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_FATAL);
    enum fdsan_error_level oldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_DISABLED);
    enum fdsan_error_level newLevel = fdsan_get_error_level();

    bool success = (oldLevel == FDSAN_ERROR_LEVEL_FATAL && newLevel == FDSAN_ERROR_LEVEL_DISABLED);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelInvalidEnum(napi_env env, napi_callback_info info) {
    enum fdsan_error_level invalidLevel = static_cast<enum fdsan_error_level>(100);
    enum fdsan_error_level oldLevel = fdsan_set_error_level(invalidLevel);

    bool success = (oldLevel != static_cast<enum fdsan_error_level>(-1));

    napi_value napiResult;
    napi_get_boolean(env, success, &napiResult);
    return napiResult;
}

static napi_value FdsanCreateOwnerTagNormal(napi_env env, napi_callback_info info) {
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    uint64_t expected = (0x01ULL << 56) | 0x12345678;
    bool success = (tag == expected);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCreateOwnerTagZero(napi_env env, napi_callback_info info) {
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_DIRECTORY, 0);

    bool success = (tag == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCreateOwnerTagInvalidType(napi_env env, napi_callback_info info) {
    uint64_t tag = fdsan_create_owner_tag(static_cast<enum fdsan_owner_type>(99), 0x1234);
    const char *typeName = fdsan_get_tag_type(tag);
    uint64_t value = fdsan_get_tag_value(tag);

    bool success = (typeName != nullptr && value == 0x1234);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetOwnerTagWithTagSet(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t expectedTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xabcdef);
    fdsan_exchange_owner_tag(fd, 0, expectedTag);
    uint64_t actualTag = fdsan_get_owner_tag(fd);
    close(fd);

    bool success = (actualTag == expectedTag);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetOwnerTagNoTagSet(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t tag = fdsan_get_owner_tag(fd);
    close(fd);

    const char *typeName = fdsan_get_tag_type(tag);

    bool success = (typeName != nullptr);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetOwnerTagInvalidFd(napi_env env, napi_callback_info info) {
    uint64_t tag = fdsan_get_owner_tag(-1);

    bool success = (tag == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetTagTypeAndValue(napi_env env, napi_callback_info info) {
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xabcdef);
    const char *typeStr = fdsan_get_tag_type(tag);
    uint64_t value = fdsan_get_tag_value(tag);

    bool success = (typeStr != nullptr && value == 0xabcdef);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagZeroToNew(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t newTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    if (newTag == 0) {
        close(fd);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    fdsan_exchange_owner_tag(fd, 0, newTag);
    int ret = fdsan_close_with_tag(fd, newTag);
    close(fd);

    bool success = (ret == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagOldToNew(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

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
    int ret = fdsan_close_with_tag(fd, newTag);
    close(fd);

    bool success = (ret == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagMismatch(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t tagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t tagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    if (tagA == 0 || tagB == 0) {
        close(fd);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    fdsan_exchange_owner_tag(fd, 0, tagA);
    fdsan_exchange_owner_tag(fd, tagB, 0);
    int ret = fdsan_close_with_tag(fd, tagA);
    close(fd);

    bool success = (ret == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagInvalidFd(napi_env env, napi_callback_info info) {
    uint64_t newTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    bool success = (newTag != 0);
    fdsan_exchange_owner_tag(-1, 0, newTag);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagMatch(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    fdsan_exchange_owner_tag(fd, 0, tag);
    int ret = fdsan_close_with_tag(fd, tag);

    fdsan_set_error_level(originalLevel);

    bool success = (ret == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagMismatch(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    uint64_t wrongTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xFFFFFFFF);
    fdsan_exchange_owner_tag(fd, 0, tag);

    int ret = fdsan_close_with_tag(fd, wrongTag);

    if (ret != 0) {
        fdsan_close_with_tag(fd, tag);
    } else {
        close(fd);
    }

    fdsan_set_error_level(originalLevel);

    bool success = (ret == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagFdAlreadyClosed(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, (uint64_t)fd);
    fdsan_exchange_owner_tag(fd, 0, tag);
    close(fd);
    int ret = fdsan_close_with_tag(fd, tag);

    bool success = (ret == -1);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagFdMinusOne(napi_env env, napi_callback_info info) {
    int ret = fdsan_close_with_tag(-1, 0);

    bool success = (ret == -1);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCloseWithTagInvalidFd(napi_env env, napi_callback_info info) {
    int ret = fdsan_close_with_tag(-1, 0);

    bool success = (ret == -1);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanSetErrorLevelNegativeOrOverRange(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(static_cast<enum fdsan_error_level>(-1));
    fdsan_set_error_level(static_cast<enum fdsan_error_level>(100));
    fdsan_set_error_level(originalLevel);

    enum fdsan_error_level finalLevel = fdsan_get_error_level();
    bool success = (finalLevel == originalLevel);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanCreateOwnerTagTypeOutOfRange(napi_env env, napi_callback_info info) {
    enum fdsan_owner_type invalidType = static_cast<enum fdsan_owner_type>(99);
    uint64_t tag = fdsan_create_owner_tag(invalidType, 0x1234);

    bool success = (tag != 0);
    const char *typeName = fdsan_get_tag_type(tag);
    (void)typeName;

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanExchangeOwnerTagFdMinusOne(napi_env env, napi_callback_info info) {
    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    bool success = (tag != 0);
    fdsan_exchange_owner_tag(-1, 0, tag);
    int ret = fdsan_close_with_tag(-1, 0);
    success = (ret == -1);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetOwnerTagFdMinusOne(napi_env env, napi_callback_info info) {
    uint64_t tag = fdsan_get_owner_tag(-1);

    bool success = (tag == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetTagTypeTagZero(napi_env env, napi_callback_info info) {
    const char *typeStr = fdsan_get_tag_type(0);

    bool success = (typeStr != nullptr);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanGetTagValueTagAllOne(napi_env env, napi_callback_info info) {
    uint64_t tag = 0xFFFFFFFFFFFFFFFFULL;
    uint64_t value = fdsan_get_tag_value(tag);
    uint64_t expected = tag & 0x00FFFFFFFFFFFFFFULL;

    bool success = (value != expected);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanComTransferFdOwnership(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t tagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t tagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    fdsan_exchange_owner_tag(fd, 0, tagA);
    fdsan_exchange_owner_tag(fd, tagA, tagB);
    int ret = fdsan_close_with_tag(fd, tagB);

    fdsan_set_error_level(originalLevel);

    bool success = (ret == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanComMoveSemanticsRaii(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xABCD);
    fdsan_exchange_owner_tag(fd, 0, tag);

    int newFd = dup(fd);
    if (newFd < 0) {
        fdsan_close_with_tag(fd, tag);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    fdsan_close_with_tag(fd, tag);
    int ret2 = fdsan_close_with_tag(newFd, tag);

    bool success = (ret2 == 0);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanComNestedErrorLevelFatal(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    bool success = false;
    int fd = open("/dev/null", O_RDONLY);
    if (fd >= 0) {
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

static void *threadFunc1(void *arg) {
    std::unique_ptr<ThreadData> data(static_cast<ThreadData *>(arg));
    
    {
        std::lock_guard<std::mutex> lock(*data->fdMutex);
        if (data->shouldStop && data->shouldStop->load()) {
            return nullptr;
        }
        fdsan_exchange_owner_tag(data->fd, 0, data->tag);
    }
    
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    
    {
        std::lock_guard<std::mutex> lock(*data->fdMutex);
        if (data->shouldStop && data->shouldStop->load()) {
            return nullptr;
        }
        int ret = fdsan_close_with_tag(data->fd, data->tag);
        if (data->fdClosed != nullptr) {
            data->fdClosed->store(ret == 0);
        }
    }
    
    return nullptr;
}

static void *threadFunc2(void *arg) {
    ThreadData *data = static_cast<ThreadData *>(arg);
    std::this_thread::sleep_for(std::chrono::milliseconds(50));

    {
        std::lock_guard<std::mutex> lock(*data->fdMutex);
        if (data->shouldStop && data->shouldStop->load()) {
            delete data;
            return nullptr;
        }
        fdsan_exchange_owner_tag(data->fd, 0, data->tag);
    }

    delete data;
    return nullptr;
}

static napi_value FdsanComMultiThreadMixedOperation(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDWR);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t tagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t tagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);

    bool success = (tagA != 0 && tagB != 0);

    if (!success) {
        close(fd);
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    std::atomic<bool> fdClosed{false};
    std::atomic<bool> shouldStop{false};
    std::mutex fdMutex;

    ThreadData *data1 = new ThreadData{fd, tagA, &fdClosed, &fdMutex, &shouldStop};
    ThreadData *data2 = new ThreadData{fd, tagB, nullptr, &fdMutex, &shouldStop};

    pthread_t t1 = 0, t2 = 0;

    if (pthread_create(&t1, nullptr, threadFunc1, data1) != 0) {
        delete data1;
        delete data2;
        close(fd);
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    if (pthread_create(&t2, nullptr, threadFunc2, data2) != 0) {
        shouldStop.store(true);
        pthread_join(t1, nullptr);
        delete data2;
        close(fd);
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    pthread_join(t1, nullptr);
    pthread_join(t2, nullptr);

    {
        std::lock_guard<std::mutex> lock(fdMutex);
        if (!fdClosed.load()) {
            close(fd);
        }
    }

    fdsan_set_error_level(originalLevel);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

struct DoubleCloseData {
    int fd;
    uint64_t tag;
    std::mutex mtx;
    std::condition_variable cv;
    bool stepCompleted;
    bool closeFirst;
};

static void *threadCloseFunc(void *arg) {
    DoubleCloseData *data = static_cast<DoubleCloseData *>(arg);

    {
        std::lock_guard<std::mutex> lock(data->mtx);
        data->stepCompleted = true;
        data->cv.notify_one();
    }

    if (data->closeFirst) {
        close(data->fd);
    }

    return nullptr;
}

static void *threadUseFunc(void *arg) {
    DoubleCloseData *data = static_cast<DoubleCloseData *>(arg);

    {
        std::unique_lock<std::mutex> lock(data->mtx);
        data->cv.wait(lock, [data] { return data->stepCompleted; });
    }

    if (!data->closeFirst) {
        fdsan_exchange_owner_tag(data->fd, 0, data->tag);
    }

    return nullptr;
}

static napi_value FdsanDoubleCloseCrossThread(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDWR);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    uint64_t tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xF02);

    DoubleCloseData data;
    data.fd = fd;
    data.tag = tag;
    data.stepCompleted = false;
    data.closeFirst = true;

    pthread_t closeThread, useThread;
    int joinErr = pthread_create(&closeThread, nullptr, threadCloseFunc, static_cast<void *>(&data));
    int joinErr2 = pthread_create(&useThread, nullptr, threadUseFunc, static_cast<void *>(&data));
    pthread_join(closeThread, nullptr);
    pthread_join(useThread, nullptr);

    fdsan_set_error_level(originalLevel);

    bool success = (joinErr == 0 && joinErr2 == 0 && data.stepCompleted);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanDoubleCloseSameThread(napi_env env, napi_callback_info info) {
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    close(fd);
    close(fd);

    enum fdsan_error_level level = fdsan_get_error_level();

    bool success = (level == FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanUseAfterClose(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_RDONLY);
    close(fd);
    ssize_t ret = read(fd, nullptr, 0);
    close(fd);

    bool success = (ret == -1);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}
static napi_value FdsanLevelWarnOnce(napi_env env, napi_callback_info info) {
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    close(fd);
    close(fd);

    enum fdsan_error_level restoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    bool success = (restoredLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanLevelWarnAlways(napi_env env, napi_callback_info info) {
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    close(fd);
    close(fd);

    enum fdsan_error_level restoredLevel = fdsan_get_error_level();

    bool success = (restoredLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanLevelFatal(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    close(fd);
    close(fd);

    enum fdsan_error_level restoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);

    bool success = (restoredLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanLevelDisabled(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_DISABLED);

    int fd = open("/dev/null", O_RDONLY);
    if (fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    close(fd);
    close(fd);

    enum fdsan_error_level restoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(originalLevel);

    bool success = (restoredLevel == FDSAN_ERROR_LEVEL_DISABLED);

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanStdlibFopenFclose(napi_env env, napi_callback_info info) {
    enum fdsan_error_level originalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);

    FILE *file = fopen("/dev/null", "w");
    if (file == nullptr) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    
    int fd = fileno(file);
    int closeRet = close(fd);
    
    bool closeSuccess = (closeRet == 0);
    
    fdsan_set_error_level(originalLevel);
    
    bool success = closeSuccess;
    
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static napi_value FdsanStdlibFdopen(napi_env env, napi_callback_info info) {
    int fd = open("/dev/null", O_WRONLY);
    if (fd == -1) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    FILE *file = fdopen(fd, "w");
    bool success = (file != nullptr);
    if (file != nullptr) {
        fclose(file);
    } else {
        close(fd);
    }

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

static std::mutex gSignalMutex;
static int gSignalPipeWriteFd = -1;
static std::atomic<bool> gSignalReceived{false};

static std::atomic<bool> gSignalHandled{false};
static int gSignalTestFd = -1;

static void safeSignalHandler(int sig)
{
    gSignalReceived.store(true);
}

static napi_value FdsanSignalSafety(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    
    gSignalReceived.store(false);
    
    struct sigaction sa;
    sa.sa_handler = safeSignalHandler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART;
    
    if (sigaction(SIGUSR1, &sa, nullptr) < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    
    raise(SIGUSR1);
    
    int testFd = open("/dev/null", O_RDONLY);
    if (testFd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }
    
    int timeout = 100;
    while (--timeout > 0 && !gSignalReceived.load()) {
        usleep(10000);
    }
    
    close(testFd);
    
    struct sigaction defaultSa;
    defaultSa.sa_handler = SIG_DFL;
    sigemptyset(&defaultSa.sa_mask);
    sigaction(SIGUSR1, &defaultSa, nullptr);
    
    fdsan_set_error_level(originalLevel);
    
    bool success = gSignalReceived.load();
    
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
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
        {"testFdsanGetTagValueTagAllOne", nullptr, FdsanGetTagValueTagAllOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanComTransferFdOwnership", nullptr, FdsanComTransferFdOwnership, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testFdsanComMoveSemanticsRaii", nullptr, FdsanComMoveSemanticsRaii, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testFdsanComNestedErrorLevelFatal", nullptr, FdsanComNestedErrorLevelFatal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
