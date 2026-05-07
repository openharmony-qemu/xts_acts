#include "napi/native_api.h"
#include <fcntl.h>
#include <csignal>
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

static constexpr int kThreadSleepMs = 50;
static constexpr int kThreadLongSleepMs = 100;
static constexpr useconds_t kPollIntervalUs = 10000;
static constexpr int kInvalidErrorLevel = -1;
static constexpr int kMaxErrorLevel = 100;

static napi_value FdsanSetErrorLevelWarnAlways(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_get_error_level();
    enum fdsan_error_level OldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    enum fdsan_error_level NewLevel = fdsan_get_error_level();
    bool Success = (OldLevel == OriginalLevel && NewLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanSetErrorLevelWarnOnce(napi_env env, napi_callback_info info)
{
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    enum fdsan_error_level OldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ONCE);
    enum fdsan_error_level NewLevel = fdsan_get_error_level();
    bool Success = (OldLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS && NewLevel == FDSAN_ERROR_LEVEL_WARN_ONCE);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanSetErrorLevelFatal(napi_env env, napi_callback_info info)
{
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ONCE);
    enum fdsan_error_level OldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_FATAL);
    enum fdsan_error_level NewLevel = fdsan_get_error_level();
    bool Success = (OldLevel == FDSAN_ERROR_LEVEL_WARN_ONCE && NewLevel == FDSAN_ERROR_LEVEL_FATAL);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanSetErrorLevelDisabled(napi_env env, napi_callback_info info)
{
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_FATAL);
    enum fdsan_error_level OldLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_DISABLED);
    enum fdsan_error_level NewLevel = fdsan_get_error_level();
    bool Success = (OldLevel == FDSAN_ERROR_LEVEL_FATAL && NewLevel == FDSAN_ERROR_LEVEL_DISABLED);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanSetErrorLevelInvalidEnum(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level InvalidLevel = static_cast<enum fdsan_error_level>(100);
    enum fdsan_error_level OldLevel = fdsan_set_error_level(InvalidLevel);
    bool Success = (OldLevel != static_cast<enum fdsan_error_level>(-1));
    napi_value NapiResult;
    napi_get_boolean(env, Success, &NapiResult);
    return NapiResult;
}

static napi_value FdsanCreateOwnerTagNormal(napi_env env, napi_callback_info info)
{
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    uint64_t Expected = (0x01ULL << 56) | 0x12345678;
    bool Success = (Tag == Expected);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanCreateOwnerTagZero(napi_env env, napi_callback_info info)
{
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_DIRECTORY, 0);
    bool Success = (Tag == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanCreateOwnerTagInvalidType(napi_env env, napi_callback_info info)
{
    uint64_t Tag = fdsan_create_owner_tag(static_cast<enum fdsan_owner_type>(99), 0x1234);
    const char *TypeName = fdsan_get_tag_type(Tag);
    uint64_t Value = fdsan_get_tag_value(Tag);
    bool Success = (TypeName != nullptr && Value == 0x1234);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanGetOwnerTagWithTagSet(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t ExpectedTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xabcdef);
    fdsan_exchange_owner_tag(Fd, 0, ExpectedTag);
    uint64_t ActualTag = fdsan_get_owner_tag(Fd);
    close(Fd);
    bool Success = (ActualTag == ExpectedTag);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanGetOwnerTagNoTagSet(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t Tag = fdsan_get_owner_tag(Fd);
    close(Fd);
    const char *TypeName = fdsan_get_tag_type(Tag);
    bool Success = (TypeName != nullptr);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanGetOwnerTagInvalidFd(napi_env env, napi_callback_info info)
{
    uint64_t Tag = fdsan_get_owner_tag(-1);
    bool Success = (Tag == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanGetTagTypeAndValue(napi_env env, napi_callback_info info)
{
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xabcdef);
    const char *TypeStr = fdsan_get_tag_type(Tag);
    uint64_t Value = fdsan_get_tag_value(Tag);
    bool Success = (TypeStr != nullptr && Value == 0xabcdef);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanExchangeOwnerTagZeroToNew(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t NewTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    if (NewTag == 0) {
        close(Fd);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    fdsan_exchange_owner_tag(Fd, 0, NewTag);
    int Ret = fdsan_close_with_tag(Fd, NewTag);
    close(Fd);
    bool Success = (Ret == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanExchangeOwnerTagOldToNew(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t OldTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t NewTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    if (OldTag == 0 || NewTag == 0) {
        close(Fd);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    fdsan_exchange_owner_tag(Fd, 0, OldTag);
    fdsan_exchange_owner_tag(Fd, OldTag, NewTag);
    int Ret = fdsan_close_with_tag(Fd, NewTag);
    close(Fd);
    bool Success = (Ret == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanExchangeOwnerTagMismatch(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t TagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t TagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    if (TagA == 0 || TagB == 0) {
        close(Fd);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    fdsan_exchange_owner_tag(Fd, 0, TagA);
    fdsan_exchange_owner_tag(Fd, TagB, 0);
    int Ret = fdsan_close_with_tag(Fd, TagA);
    close(Fd);
    bool Success = (Ret == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanExchangeOwnerTagInvalidFd(napi_env env, napi_callback_info info)
{
    uint64_t NewTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    bool Success = (NewTag != 0);
    fdsan_exchange_owner_tag(-1, 0, NewTag);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanCloseWithTagMatch(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        fdsan_set_error_level(OriginalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    fdsan_exchange_owner_tag(Fd, 0, Tag);
    int Ret = fdsan_close_with_tag(Fd, Tag);
    fdsan_set_error_level(OriginalLevel);
    bool Success = (Ret == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanCloseWithTagMismatch(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        fdsan_set_error_level(OriginalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0x12345678);
    uint64_t WrongTag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xFFFFFFFF);
    fdsan_exchange_owner_tag(Fd, 0, Tag);
    int Ret = fdsan_close_with_tag(Fd, WrongTag);
    if (Ret != 0) {
        fdsan_close_with_tag(Fd, Tag);
    } else {
        close(Fd);
    }
    fdsan_set_error_level(OriginalLevel);
    bool Success = (Ret == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanCloseWithTagFdAlreadyClosed(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, (uint64_t)Fd);
    fdsan_exchange_owner_tag(Fd, 0, Tag);
    close(Fd);
    Fd = -1;
    int Ret = fdsan_close_with_tag(Fd, Tag);
    bool Success = (Ret == -1);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanCloseWithTagFdMinusOne(napi_env env, napi_callback_info info)
{
    int Ret = fdsan_close_with_tag(-1, 0);
    bool Success = (Ret == -1);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanCloseWithTagInvalidFd(napi_env env, napi_callback_info info)
{
    int Ret = fdsan_close_with_tag(-1, 0);
    bool Success = (Ret == -1);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanSetErrorLevelNegativeOrOverRange(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_get_error_level();
    fdsan_set_error_level(static_cast<enum fdsan_error_level>(kInvalidErrorLevel));
    fdsan_set_error_level(static_cast<enum fdsan_error_level>(kMaxErrorLevel));
    fdsan_set_error_level(OriginalLevel);
    enum fdsan_error_level FinalLevel = fdsan_get_error_level();
    bool Success = (FinalLevel == OriginalLevel);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanCreateOwnerTagTypeOutOfRange(napi_env env, napi_callback_info info)
{
    enum fdsan_owner_type InvalidType = static_cast<enum fdsan_owner_type>(99);
    uint64_t Tag = fdsan_create_owner_tag(InvalidType, 0x1234);
    bool Success = (Tag != 0);
    const char *TypeName = fdsan_get_tag_type(Tag);
    (void)TypeName;
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanExchangeOwnerTagFdMinusOne(napi_env env, napi_callback_info info)
{
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    bool Success = (Tag != 0);
    fdsan_exchange_owner_tag(-1, 0, Tag);
    int Ret = fdsan_close_with_tag(-1, 0);
    Success = (Ret == -1);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanGetOwnerTagFdMinusOne(napi_env env, napi_callback_info info)
{
    uint64_t Tag = fdsan_get_owner_tag(-1);
    bool Success = (Tag == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanGetTagTypeTagZero(napi_env env, napi_callback_info info)
{
    const char *TypeStr = fdsan_get_tag_type(0);
    bool Success = (TypeStr != nullptr);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanGetTagValueTagAllOne(napi_env env, napi_callback_info info)
{
    uint64_t Tag = 0xFFFFFFFFFFFFFFFFULL;
    uint64_t Value = fdsan_get_tag_value(Tag);
    uint64_t Expected = Tag & 0x00FFFFFFFFFFFFFFULL;
    bool Success = (Value != Expected);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanComTransferFdOwnership(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        fdsan_set_error_level(OriginalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t TagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t TagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    fdsan_exchange_owner_tag(Fd, 0, TagA);
    fdsan_exchange_owner_tag(Fd, TagA, TagB);
    int Ret = fdsan_close_with_tag(Fd, TagB);
    fdsan_set_error_level(OriginalLevel);
    bool Success = (Ret == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanComMoveSemanticsRaii(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xABCD);
    fdsan_exchange_owner_tag(Fd, 0, Tag);
    int NewFd = dup(Fd);
    if (NewFd < 0) {
        fdsan_close_with_tag(Fd, Tag);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    fdsan_close_with_tag(Fd, Tag);
    int Ret2 = fdsan_close_with_tag(NewFd, Tag);
    bool Success = (Ret2 == 0);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanComNestedErrorLevelFatal(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    bool Success = false;
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd >= 0) {
        close(Fd);
        close(Fd);
        Success = true;
    }
    fdsan_set_error_level(OriginalLevel);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

struct ThreadData {
    int Fd;
    uint64_t Tag;
    std::atomic<bool> *FdClosed;
    std::mutex *FdMutex;
    std::atomic<bool> *ShouldStop;
};

static void *ThreadFunc1(void *arg)
{
    std::unique_ptr<ThreadData> data(static_cast<ThreadData *>(arg));
    {
        std::lock_guard<std::mutex> lock(*data->FdMutex);
        if (data->ShouldStop && data->ShouldStop->load()) {
            return nullptr;
        }
        fdsan_exchange_owner_tag(data->Fd, 0, data->Tag);
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(kThreadLongSleepMs));
    {
        std::lock_guard<std::mutex> lock(*data->FdMutex);
        if (data->ShouldStop && data->ShouldStop->load()) {
            return nullptr;
        }
        int Ret = fdsan_close_with_tag(data->Fd, data->Tag);
        if (data->FdClosed != nullptr) {
            data->FdClosed->store(Ret == 0);
        }
    }
    return nullptr;
}

static void *ThreadFunc2(void *arg)
{
    ThreadData *data = static_cast<ThreadData *>(arg);
    std::this_thread::sleep_for(std::chrono::milliseconds(kThreadSleepMs));
    {
        std::lock_guard<std::mutex> lock(*data->FdMutex);
        if (data->ShouldStop && data->ShouldStop->load()) {
            delete data;
            return nullptr;
        }
        fdsan_exchange_owner_tag(data->Fd, 0, data->Tag);
    }
    delete data;
    return nullptr;
}

static napi_value FdsanComMultiThreadMixedOperation(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level originalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDWR);
    if (Fd < 0) {
        fdsan_set_error_level(originalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t TagA = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xA);
    uint64_t TagB = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xB);
    std::atomic<bool> FdClosed{false};
    std::atomic<bool> ShouldStop{false};
    std::mutex FdMutex;
    ThreadData *Data1 = new ThreadData{Fd, TagA, &FdClosed, &FdMutex, &ShouldStop};
    ThreadData *Data2 = new ThreadData{Fd, TagB, nullptr, &FdMutex, &ShouldStop};
    pthread_t T1 = 0;
    pthread_t T2 = 0;
    if (pthread_create(&T1, nullptr, ThreadFunc1, Data1) != 0) {
        delete Data1;
        delete Data2;
        close(Fd);
        fdsan_set_error_level(originalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    if (pthread_create(&T2, nullptr, ThreadFunc2, Data2) != 0) {
        ShouldStop.store(true);
        pthread_join(T1, nullptr);
        delete Data2;
        close(Fd);
        fdsan_set_error_level(originalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    pthread_join(T1, nullptr);
    pthread_join(T2, nullptr);
    {
        std::lock_guard<std::mutex> lock(FdMutex);
        if (!FdClosed.load()) {
            close(Fd);
        }
    }
    fdsan_set_error_level(originalLevel);
    napi_value Result;
    napi_get_boolean(env, true, &Result);
    return Result;
}
struct DoubleCloseData {
    int Fd;
    uint64_t Tag;
    std::mutex Mtx;
    std::condition_variable Cv;
    bool StepCompleted;
    bool CloseFirst;
};

static void *ThreadCloseFunc(void *arg)
{
    DoubleCloseData *data = static_cast<DoubleCloseData *>(arg);
    {
        std::lock_guard<std::mutex> lock(data->Mtx);
        data->StepCompleted = true;
        data->Cv.notify_one();
    }
    if (data->CloseFirst) {
        close(data->Fd);
    }
    return nullptr;
}

static void *ThreadUseFunc(void *arg)
{
    DoubleCloseData *data = static_cast<DoubleCloseData *>(arg);
    {
        std::unique_lock<std::mutex> lock(data->Mtx);
        data->Cv.wait(lock, [data] { return data->StepCompleted; });
    }
    if (!data->CloseFirst) {
        fdsan_exchange_owner_tag(data->Fd, 0, data->Tag);
    }
    return nullptr;
}

static napi_value FdsanDoubleCloseCrossThread(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDWR);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    uint64_t Tag = fdsan_create_owner_tag(FDSAN_OWNER_TYPE_FILE, 0xF02);
    DoubleCloseData Data;
    Data.Fd = Fd;
    Data.Tag = Tag;
    Data.StepCompleted = false;
    Data.CloseFirst = true;
    pthread_t CloseThread;
    pthread_t UseThread;
    int JoinErr = pthread_create(&CloseThread, nullptr, ThreadCloseFunc, static_cast<void *>(&Data));
    int JoinErr2 = pthread_create(&UseThread, nullptr, ThreadUseFunc, static_cast<void *>(&Data));
    pthread_join(CloseThread, nullptr);
    pthread_join(UseThread, nullptr);
    fdsan_set_error_level(OriginalLevel);
    bool Success = (JoinErr == 0 && JoinErr2 == 0 && Data.StepCompleted);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanDoubleCloseSameThread(napi_env env, napi_callback_info info)
{
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    close(Fd);
    close(Fd);
    enum fdsan_error_level Level = fdsan_get_error_level();
    bool Success = (Level == FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanUseAfterClose(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_RDONLY);
    close(Fd);
    Fd = -1;
    ssize_t Ret = read(Fd, nullptr, 0);
    close(Fd);
    bool Success = (Ret == -1);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanLevelWarnOnce(napi_env env, napi_callback_info info)
{
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    close(Fd);
    close(Fd);
    enum fdsan_error_level RestoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    bool Success = (RestoredLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanLevelWarnAlways(napi_env env, napi_callback_info info)
{
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    close(Fd);
    close(Fd);
    enum fdsan_error_level RestoredLevel = fdsan_get_error_level();
    bool Success = (RestoredLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanLevelFatal(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        fdsan_set_error_level(OriginalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    close(Fd);
    close(Fd);
    enum fdsan_error_level RestoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(OriginalLevel);
    bool Success = (RestoredLevel == FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanLevelDisabled(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_DISABLED);
    int Fd = open("/dev/null", O_RDONLY);
    if (Fd < 0) {
        fdsan_set_error_level(OriginalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    close(Fd);
    close(Fd);
    enum fdsan_error_level RestoredLevel = fdsan_get_error_level();
    fdsan_set_error_level(OriginalLevel);
    bool Success = (RestoredLevel == FDSAN_ERROR_LEVEL_DISABLED);
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanStdlibFopenFclose(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_get_error_level();
    fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    FILE *File = fopen("/dev/null", "w");
    if (File == nullptr) {
        fdsan_set_error_level(OriginalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    int Fd = fileno(File);
    int CloseRet = close(Fd);
    bool CloseSuccess = (CloseRet == 0);
    fdsan_set_error_level(OriginalLevel);
    bool Success = CloseSuccess;
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static napi_value FdsanStdlibFdopen(napi_env env, napi_callback_info info)
{
    int Fd = open("/dev/null", O_WRONLY);
    if (Fd == -1) {
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    FILE *File = fdopen(Fd, "w");
    bool Success = (File != nullptr);
    if (File != nullptr) {
        fclose(File);
    } else {
        close(Fd);
    }
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
}

static std::mutex g_signalMutex;
static int g_signalPipeWriteFd = -1;
static std::atomic<bool> g_signalReceived{false};

static std::atomic<bool> g_signalHandled{false};
static int g_signalTestFd = -1;

static void SafeSignalHandler(int sig)
{
    g_signalReceived.store(true);
}

static napi_value FdsanSignalSafety(napi_env env, napi_callback_info info)
{
    enum fdsan_error_level OriginalLevel = fdsan_set_error_level(FDSAN_ERROR_LEVEL_WARN_ALWAYS);
    g_signalReceived.store(false);
    struct sigaction Sa;
    Sa.sa_handler = SafeSignalHandler;
    sigemptyset(&Sa.sa_mask);
    Sa.sa_flags = SA_RESTART;
    if (sigaction(SIGUSR1, &Sa, nullptr) < 0) {
        fdsan_set_error_level(OriginalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    raise(SIGUSR1);
    int TestFd = open("/dev/null", O_RDONLY);
    if (TestFd < 0) {
        fdsan_set_error_level(OriginalLevel);
        napi_value Result;
        napi_get_boolean(env, false, &Result);
        return Result;
    }
    int Timeout = 100;
    while (--Timeout > 0 && !g_signalReceived.load()) {
        usleep(kPollIntervalUs);
    }
    close(TestFd);
    struct sigaction DefaultSa;
    DefaultSa.sa_handler = SIG_DFL;
    sigemptyset(&DefaultSa.sa_mask);
    sigaction(SIGUSR1, &DefaultSa, nullptr);
    fdsan_set_error_level(OriginalLevel);
    bool Success = g_signalReceived.load();
    napi_value Result;
    napi_get_boolean(env, Success, &Result);
    return Result;
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
    .nm_register_func = RegisterEntryModule,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModuleEntry(void)
{ napi_module_register(&demoModule); }
