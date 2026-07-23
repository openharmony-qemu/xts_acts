#include "napi/native_api.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>
#include <cmath>
#include <thread>
#include <atomic>
#include <vector>
#include <unistd.h>
#include <sys/sendfile.h>
#include <fcntl.h>
#include <ctime>
#include <cerrno>
#include <unordered_set>
#include <mutex>
#include "hilog/log.h"

#undef LOG_DOMAIN
#define LOG_DOMAIN 0xd0d0
#undef LOG_TAG
#define LOG_TAG "NativeCases"

constexpr int PHYSICS_STATE_SIZE = 10;
constexpr int PHYSICS_STATE_BYTES = PHYSICS_STATE_SIZE * sizeof(float);
constexpr int STATE_POS_X = 0;
constexpr int STATE_POS_Y = 1;
constexpr int STATE_POS_Z = 2;
constexpr int STATE_VEL_X = 3;
constexpr int STATE_VEL_Y = 4;
constexpr int STATE_VEL_Z = 5;
constexpr int STATE_FORCE_X = 6;
constexpr int STATE_FORCE_Y = 7;
constexpr int STATE_FORCE_Z = 8;
constexpr int STATE_GRAVITY_INDEX = 9;
constexpr int MAX_ALLOC_SIZE = 1024 * 1024;
constexpr int MAX_TASK_COUNT = 8;
constexpr int MIN_TASK_COUNT = 2;
constexpr int FEATURE_SAMPLE_INTERVAL = 4;
constexpr int ASYNC_DELAY_MS = 100;
constexpr int INCREMENTS_PER_THREAD = 10000;
constexpr int ADD_ARG_A = 3;
constexpr int ADD_ARG_B = 5;
constexpr int SUB_ARG_A = 10;
constexpr int SUB_ARG_B = 4;
constexpr int DYN_FUNC_ARGC = 2;
constexpr int ARRAY_DOUBLE_FACTOR = 2;
constexpr size_t MAX_PATH_SIZE = 4096;

static std::unordered_set<uintptr_t> g_validHandles;
static std::mutex g_handleMutex;

static napi_value TestCase01ArrayDouble(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc < 1) {
        napi_throw_error(env, nullptr, "TestCase01ArrayDouble: expected 1 argument");
        return nullptr;
    }

    bool isArray = false;
    napi_status status = napi_is_array(env, args[0], &isArray);
    if (status != napi_ok || !isArray) {
        napi_throw_type_error(env, nullptr, "TestCase01ArrayDouble: argument must be an array");
        return nullptr;
    }

    uint32_t len = 0;
    status = napi_get_array_length(env, args[0], &len);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "TestCase01ArrayDouble: failed to get array length");
        return nullptr;
    }

    napi_value result;
    status = napi_create_array_with_length(env, len, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "TestCase01ArrayDouble: failed to create result array");
        return nullptr;
    }

    for (uint32_t i = 0; i < len; i++) {
        napi_value elem;
        if (napi_get_element(env, args[0], i, &elem) != napi_ok) {
            napi_throw_error(env, nullptr, "TestCase01ArrayDouble: failed to get element");
            return nullptr;
        }

        int32_t val = 0;
        if (napi_get_value_int32(env, elem, &val) != napi_ok) {
            napi_throw_type_error(env, nullptr, "TestCase01ArrayDouble: array element must be a number");
            return nullptr;
        }

        napi_value boxed;
        if (napi_create_int32(env, val * ARRAY_DOUBLE_FACTOR, &boxed) != napi_ok) {
            napi_throw_error(env, nullptr, "TestCase01ArrayDouble: failed to create number");
            return nullptr;
        }

        if (napi_set_element(env, result, i, boxed) != napi_ok) {
            napi_throw_error(env, nullptr, "TestCase01ArrayDouble: failed to set element");
            return nullptr;
        }
    }

    return result;
}

static bool ValidateArrayBufferInput(napi_env env, napi_value arg, void **data, size_t *size)
{
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arg, &isArrayBuffer);
    if (!isArrayBuffer) {
        napi_throw_type_error(env, nullptr, "TestCase02MatrixTranspose: argument 0 must be an ArrayBuffer");
        return false;
    }
    if (napi_get_arraybuffer_info(env, arg, data, size) != napi_ok) {
        napi_throw_error(env, nullptr, "TestCase02MatrixTranspose: failed to get ArrayBuffer info");
        return false;
    }
    if (*data == nullptr) {
        napi_throw_error(env, nullptr, "TestCase02MatrixTranspose: ArrayBuffer data is null");
        return false;
    }
    return true;
}

static napi_value CreateTransposedBuffer(napi_env env, const void *srcData, int32_t rows, int32_t cols)
{
    size_t expectedSize = static_cast<size_t>(rows) * static_cast<size_t>(cols) * sizeof(float);
    void *dstData = nullptr;
    napi_value result;
    if (napi_create_arraybuffer(env, expectedSize, &dstData, &result) != napi_ok) {
        napi_throw_error(env, nullptr, "TestCase02MatrixTranspose: failed to create ArrayBuffer");
        return nullptr;
    }
    const float *src = static_cast<const float *>(srcData);
    float *dst = static_cast<float *>(dstData);
    for (int32_t r = 0; r < rows; r++) {
        for (int32_t c = 0; c < cols; c++) {
            dst[c * rows + r] = src[r * cols + c];
        }
    }
    return result;
}

static napi_value TestCase02MatrixTranspose(napi_env env, napi_callback_info info)
{
    constexpr size_t matrixArgc = 3;
    size_t argc = matrixArgc;
    napi_value args[matrixArgc] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc != matrixArgc) {
        napi_throw_error(env, nullptr, "TestCase02MatrixTranspose: expected exactly 3 arguments");
        return nullptr;
    }

    void *srcData = nullptr;
    size_t srcSize = 0;
    if (!ValidateArrayBufferInput(env, args[0], &srcData, &srcSize)) {
        return nullptr;
    }

    int32_t rows = 0;
    int32_t cols = 0;
    constexpr size_t matrixRowIdx = 1;
    constexpr size_t matrixColIdx = 2;
    if (napi_get_value_int32(env, args[matrixRowIdx], &rows) != napi_ok ||
        napi_get_value_int32(env, args[matrixColIdx], &cols) != napi_ok) {
        napi_throw_type_error(env, nullptr, "TestCase02MatrixTranspose: rows and cols must be integers");
        return nullptr;
    }

    if (rows <= 0 || cols <= 0) {
        napi_throw_range_error(env, nullptr, "TestCase02MatrixTranspose: rows and cols must be positive");
        return nullptr;
    }

    const size_t maxSize = SIZE_MAX / sizeof(float);
    if (static_cast<size_t>(rows) > maxSize / static_cast<size_t>(cols)) {
        napi_throw_range_error(env, nullptr, "TestCase02MatrixTranspose: rows * cols overflow");
        return nullptr;
    }

    size_t expectedSize = static_cast<size_t>(rows) * static_cast<size_t>(cols) * sizeof(float);
    if (srcSize < expectedSize) {
        napi_throw_range_error(env, nullptr, "TestCase02MatrixTranspose: ArrayBuffer too small");
        return nullptr;
    }

    return CreateTransposedBuffer(env, srcData, rows, cols);
}

static napi_value TestCase03XorEncrypt(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc < 1) {
        napi_throw_error(env, nullptr, "TestCase03XorEncrypt: expected 1 argument");
        return nullptr;
    }

    bool isArrayBuffer = false;
    napi_status status = napi_is_arraybuffer(env, args[0], &isArrayBuffer);
    if (status != napi_ok || !isArrayBuffer) {
        napi_throw_type_error(env, nullptr, "TestCase03XorEncrypt: argument must be an ArrayBuffer");
        return nullptr;
    }

    void *data = nullptr;
    size_t size = 0;
    if (napi_get_arraybuffer_info(env, args[0], &data, &size) != napi_ok) {
        napi_throw_error(env, nullptr, "TestCase03XorEncrypt: failed to get ArrayBuffer info");
        return nullptr;
    }

    if (data == nullptr || size == 0) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    auto *bytes = static_cast<uint8_t *>(data);
    for (size_t i = 0; i < size; i++) {
        bytes[i] = ~bytes[i];
    }

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

static char *ResolveStringArg(napi_env env, napi_value arg, const char *name)
{
    constexpr size_t probeSize = 64;
    char probe[probeSize];
    size_t needed = 0;
    napi_get_value_string_utf8(env, arg, probe, sizeof(probe), &needed);
    if (needed == 0 || needed > MAX_PATH_SIZE) {
        return nullptr;
    }
    char *buf = static_cast<char *>(malloc(needed + 1));
    if (buf == nullptr) {
        return nullptr;
    }
    if (napi_get_value_string_utf8(env, arg, buf, needed + 1, &needed) != napi_ok) {
        free(buf);
        return nullptr;
    }
    return buf;
}

static napi_value FileCopyImpl(napi_env env, char *srcBuf, char *dstBuf, int64_t size)
{
    int srcFd = open(srcBuf, O_RDONLY);
    if (srcFd < 0) {
        free(srcBuf);
        free(dstBuf);
        napi_throw_error(env, nullptr, "TestCase04FileCopy: failed to open source file");
        return nullptr;
    }

    int dstFd = open(dstBuf, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (dstFd < 0) {
        close(srcFd);
        free(srcBuf);
        free(dstBuf);
        napi_throw_error(env, nullptr, "TestCase04FileCopy: failed to open destination file");
        return nullptr;
    }

    off_t offset = 0;
    ssize_t ret = sendfile(dstFd, srcFd, &offset, static_cast<size_t>(size));
    bool passed = (ret == size);

    close(srcFd);
    close(dstFd);
    free(srcBuf);
    free(dstBuf);

    napi_value result;
    napi_get_boolean(env, passed, &result);
    return result;
}

static napi_value TestCase04FileCopy(napi_env env, napi_callback_info info)
{
    constexpr size_t filecopyArgc = 3;
    size_t argc = filecopyArgc;
    napi_value args[filecopyArgc] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc != filecopyArgc) {
        napi_throw_error(env, nullptr, "TestCase04FileCopy: expected 3 arguments");
        return nullptr;
    }

    char *srcBuf = ResolveStringArg(env, args[0], "src");
    if (srcBuf == nullptr) {
        napi_throw_type_error(env, nullptr, "TestCase04FileCopy: invalid src path");
        return nullptr;
    }

    char *dstBuf = ResolveStringArg(env, args[1], "dst");
    if (dstBuf == nullptr) {
        free(srcBuf);
        napi_throw_type_error(env, nullptr, "TestCase04FileCopy: invalid dst path");
        return nullptr;
    }

    constexpr size_t copySizeIdx = 2;
    int64_t size = 0;
    if (napi_get_value_int64(env, args[COPY_SIZE_IDX], &size) != napi_ok || size <= 0) {
        free(srcBuf);
        free(dstBuf);
        napi_throw_type_error(env, nullptr, "TestCase04FileCopy: size must be a positive integer");
        return nullptr;
    }

    return FileCopyImpl(env, srcBuf, dstBuf, size);
}

static napi_value TestCase05SysInfo(napi_env env, napi_callback_info info)
{
    long cores = sysconf(_SC_NPROCESSORS_ONLN);
    long pageSize = sysconf(_SC_PAGESIZE);

    napi_value obj;
    napi_create_object(env, &obj);

    napi_value coresVal;
    napi_create_int32(env, static_cast<int32_t>(cores > 0 ? cores : 0), &coresVal);
    napi_set_named_property(env, obj, "cpuCores", coresVal);

    napi_value pageVal;
    napi_create_int32(env, static_cast<int32_t>(pageSize > 0 ? pageSize : 0), &pageVal);
    napi_set_named_property(env, obj, "pageSize", pageVal);

    return obj;
}

static napi_value TestCase06CreatePhysics(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double gravity = 0;
    if (argc >= 1) {
        if (napi_get_value_double(env, args[0], &gravity) != napi_ok) {
            napi_throw_type_error(env, nullptr, "TestCase06CreatePhysics: gravity must be a number");
            return nullptr;
        }
    }

    if (PHYSICS_STATE_BYTES == 0 || PHYSICS_STATE_BYTES > MAX_ALLOC_SIZE) {
        napi_value result;
        napi_create_int64(env, 0, &result);
        return result;
    }

    auto *state = static_cast<float *>(malloc(PHYSICS_STATE_BYTES));
    if (state == nullptr) {
        napi_value result;
        napi_create_int64(env, 0, &result);
        return result;
    }
    memset_s(state, PHYSICS_STATE_BYTES, 0, PHYSICS_STATE_BYTES);
    state[STATE_GRAVITY_INDEX] = static_cast<float>(gravity);

    {
        std::lock_guard<std::mutex> lock(g_handleMutex);
        g_validHandles.insert(reinterpret_cast<uintptr_t>(state));
    }

    napi_value result;
    napi_create_int64(env, reinterpret_cast<int64_t>(state), &result);
    return result;
}

static napi_value TestCase06StepPhysics(napi_env env, napi_callback_info info)
{
    constexpr size_t stepPhysicsArgc = 2;
    size_t argc = stepPhysicsArgc;
    napi_value args[stepPhysicsArgc] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc < stepPhysicsArgc) {
        napi_throw_error(env, nullptr, "TestCase06StepPhysics: expected 2 arguments");
        return nullptr;
    }

    int64_t handle = 0;
    if (napi_get_value_int64(env, args[0], &handle) != napi_ok || handle == 0) {
        napi_throw_type_error(env, nullptr, "TestCase06StepPhysics: invalid handle");
        return nullptr;
    }

    auto handleAddr = static_cast<uintptr_t>(handle);
    {
        std::lock_guard<std::mutex> lock(g_handleMutex);
        if (g_validHandles.find(handleAddr) == g_validHandles.end()) {
            napi_value result;
            napi_create_double(env, 0.0, &result);
            return result;
        }
    }

    auto *state = reinterpret_cast<float *>(handleAddr);

    double dt = 0;
    if (napi_get_value_double(env, args[1], &dt) != napi_ok) {
        napi_throw_type_error(env, nullptr, "TestCase06StepPhysics: dt must be a number");
        return nullptr;
    }

    if (dt <= 0.0) {
        napi_value result;
        napi_create_double(env, 0.0, &result);
        return result;
    }

    if (fabsf(state[STATE_GRAVITY_INDEX]) < 1e-3f) {
        napi_value result;
        napi_create_double(env, 0.0, &result);
        return result;
    }

    float invMass = 1.0f / state[STATE_GRAVITY_INDEX];
    state[STATE_VEL_X] += state[STATE_FORCE_X] * invMass * static_cast<float>(dt);
    state[STATE_VEL_Y] += state[STATE_FORCE_Y] * invMass * static_cast<float>(dt);
    state[STATE_VEL_Z] += state[STATE_FORCE_Z] * invMass * static_cast<float>(dt);
    state[STATE_POS_X] += state[STATE_VEL_X] * static_cast<float>(dt);
    state[STATE_POS_Y] += state[STATE_VEL_Y] * static_cast<float>(dt);
    state[STATE_POS_Z] += state[STATE_VEL_Z] * static_cast<float>(dt);

    napi_value result;
    napi_create_double(env, static_cast<double>(dt * state[STATE_GRAVITY_INDEX]), &result);
    return result;
}

static napi_value TestCase06DestroyPhysics(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc < 1) {
        napi_throw_error(env, nullptr, "TestCase06DestroyPhysics: expected 1 argument");
        return nullptr;
    }

    int64_t handle = 0;
    if (napi_get_value_int64(env, args[0], &handle) != napi_ok) {
        napi_throw_type_error(env, nullptr, "TestCase06DestroyPhysics: handle must be a number");
        return nullptr;
    }

    if (handle != 0) {
        auto handleAddr = static_cast<uintptr_t>(handle);
        {
            std::lock_guard<std::mutex> lock(g_handleMutex);
            g_validHandles.erase(handleAddr);
        }
        auto *state = reinterpret_cast<float *>(handleAddr);
        memset_s(state, PHYSICS_STATE_BYTES, 0, PHYSICS_STATE_BYTES);
        free(state);
    }

    napi_value result;
    napi_get_undefined(env, &result);
    return result;
}

static napi_value TestCase07FeatureExtract(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "TestCase07FeatureExtract: expected 1 argument");
        return nullptr;
    }

    bool isArray = false;
    if (napi_is_array(env, args[0], &isArray) != napi_ok || !isArray) {
        napi_throw_error(env, nullptr, "TestCase07FeatureExtract: argument must be an array");
        return nullptr;
    }

    uint32_t len = 0;
    if (napi_get_array_length(env, args[0], &len) != napi_ok) {
        napi_throw_error(env, nullptr, "TestCase07FeatureExtract: failed to get array length");
        return nullptr;
    }

    napi_value dstArr;
    napi_create_array(env, &dstArr);

    if (len == 0) {
        napi_value obj;
        napi_create_object(env, &obj);
        napi_set_named_property(env, obj, "dst", dstArr);
        napi_value lenVal;
        napi_create_int32(env, 0, &lenVal);
        napi_set_named_property(env, obj, "len", lenVal);
        return obj;
    }

    uint32_t outIdx = 0;
    for (uint32_t i = 0; i < len; i += FEATURE_SAMPLE_INTERVAL) {
        napi_value elem;
        napi_get_element(env, args[0], i, &elem);
        double val = 0;
        napi_get_value_double(env, elem, &val);
        napi_value boxed;
        napi_create_double(env, val, &boxed);
        napi_set_element(env, dstArr, outIdx, boxed);
        outIdx++;
    }

    napi_value obj;
    napi_create_object(env, &obj);
    napi_set_named_property(env, obj, "dst", dstArr);
    napi_value lenVal;
    napi_create_int32(env, static_cast<int32_t>(outIdx), &lenVal);
    napi_set_named_property(env, obj, "len", lenVal);
    return obj;
}

static napi_value TestCase08ErrorTrigger(napi_env env, napi_callback_info info)
{
    napi_throw_error(env, nullptr, "TestCase08 intentional error");

    bool isPending = false;
    napi_is_exception_pending(env, &isPending);
    if (!isPending) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    napi_value error = nullptr;
    napi_get_and_clear_last_exception(env, &error);

    napi_value testObj = nullptr;
    napi_status recoveryStatus = napi_create_object(env, &testObj);

    napi_value result;
    napi_get_boolean(env, (recoveryStatus == napi_ok), &result);
    return result;
}

static bool RunParallelSumTest(int taskCount)
{
    std::atomic<int> sum{0};
    std::vector<std::thread> threads;
    for (int i = 0; i < taskCount; i++) {
        threads.emplace_back([i, &sum]() {
            sum.fetch_add(i * i, std::memory_order_relaxed);
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    int expected = 0;
    for (int i = 0; i < taskCount; i++) {
        expected += i * i;
    }
    return sum.load() == expected;
}

static bool RunContentionTest(int taskCount)
{
    std::atomic<int> counter{0};
    std::vector<std::thread> threads;
    for (int i = 0; i < taskCount; i++) {
        threads.emplace_back([&counter]() {
            for (int j = 0; j < INCREMENTS_PER_THREAD; j++) {
                counter.fetch_add(1, std::memory_order_relaxed);
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return counter.load() == taskCount * INCREMENTS_PER_THREAD;
}

static napi_value TestCase09ParallelSum(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int taskCount = MIN_TASK_COUNT;
    if (argc >= 1) {
        napi_get_value_int32(env, args[0], &taskCount);
    }
    if (taskCount < MIN_TASK_COUNT) {
        taskCount = MIN_TASK_COUNT;
    }
    if (taskCount > MAX_TASK_COUNT) {
        taskCount = MAX_TASK_COUNT;
    }

    bool sumCorrect = RunParallelSumTest(taskCount);
    bool contentionCorrect = RunContentionTest(taskCount);

    napi_value obj;
    napi_create_object(env, &obj);

    napi_value sumVal;
    napi_create_int32(env, sumCorrect ? 1 : 0, &sumVal);
    napi_set_named_property(env, obj, "sumCorrect", sumVal);

    napi_value contentionVal;
    napi_create_int32(env, contentionCorrect ? 1 : 0, &contentionVal);
    napi_set_named_property(env, obj, "contentionCorrect", contentionVal);

    return obj;
}

static napi_threadsafe_function g_tsfn = nullptr;

static napi_value TestCase10AsyncCompute(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value callback = args[0];

    if (g_tsfn != nullptr) {
        napi_release_threadsafe_function(g_tsfn, napi_tsfn_release);
        g_tsfn = nullptr;
    }

    napi_value asyncName;
    napi_create_string_utf8(env, "asyncCallback", NAPI_AUTO_LENGTH, &asyncName);
    napi_create_threadsafe_function(env, callback, nullptr, asyncName, 0, 1, nullptr, nullptr, nullptr, nullptr,
                                    &g_tsfn);

    std::thread([]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(ASYNC_DELAY_MS));
        if (g_tsfn != nullptr) {
            napi_call_threadsafe_function(g_tsfn, nullptr, napi_tsfn_blocking);
        }
    }).detach();

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_ref g_cachedStringCtor = nullptr;

static napi_value TestCase11CachedLookup(napi_env env, napi_callback_info info)
{
    if (g_cachedStringCtor == nullptr) {
        napi_value global;
        napi_get_global(env, &global);
        napi_value stringCtor;
        if (napi_get_named_property(env, global, "String", &stringCtor) != napi_ok) {
            napi_value result;
            napi_get_boolean(env, false, &result);
            return result;
        }
        if (napi_create_reference(env, stringCtor, 1, &g_cachedStringCtor) != napi_ok) {
            napi_value result;
            napi_get_boolean(env, false, &result);
            return result;
        }
    }

    napi_value cached;
    napi_get_reference_value(env, g_cachedStringCtor, &cached);

    napi_value arg;
    napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &arg);
    napi_value strObj;
    napi_status status = napi_new_instance(env, cached, 1, &arg, &strObj);

    napi_value result;
    napi_get_boolean(env, (status == napi_ok && strObj != nullptr), &result);
    return result;
}

static napi_value DynAdd(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t a = 0;
    int32_t b = 0;
    napi_get_value_int32(env, args[0], &a);
    napi_get_value_int32(env, args[1], &b);

    napi_value result;
    napi_create_int32(env, a + b, &result);
    return result;
}

static napi_value DynSub(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t a = 0;
    int32_t b = 0;
    napi_get_value_int32(env, args[0], &a);
    napi_get_value_int32(env, args[1], &b);

    napi_value result;
    napi_create_int32(env, a - b, &result);
    return result;
}

static napi_value TestCase12DynamicRegistration(napi_env env, napi_callback_info info)
{
    napi_value obj;
    napi_create_object(env, &obj);

    napi_property_descriptor methods[] = {
        {"add", nullptr, DynAdd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sub", nullptr, DynSub, nullptr, nullptr, nullptr, napi_default, nullptr},
    };

    napi_status regStatus = napi_define_properties(env, obj, 2, methods);
    if (regStatus != napi_ok) {
        napi_value result;
        napi_get_boolean(env, false, &result);
        return result;
    }

    napi_value addFn;
    napi_get_named_property(env, obj, "add", &addFn);
    napi_value addArgs[2];
    napi_create_int32(env, ADD_ARG_A, &addArgs[0]);
    napi_create_int32(env, ADD_ARG_B, &addArgs[1]);
    napi_value addResult;
    napi_call_function(env, obj, addFn, DYN_FUNC_ARGC, addArgs, &addResult);
    int32_t addVal = 0;
    napi_get_value_int32(env, addResult, &addVal);

    napi_value subFn;
    napi_get_named_property(env, obj, "sub", &subFn);
    napi_value subArgs[DYN_FUNC_ARGC];
    napi_create_int32(env, SUB_ARG_A, &subArgs[0]);
    napi_create_int32(env, SUB_ARG_B, &subArgs[1]);
    napi_value subResult;
    napi_call_function(env, obj, subFn, DYN_FUNC_ARGC, subArgs, &subResult);
    int32_t subVal = 0;
    napi_get_value_int32(env, subResult, &subVal);

    bool passed = (addVal == 8) && (subVal == 6);

    napi_value result;
    napi_get_boolean(env, passed, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testAniArrayDouble", nullptr, TestCase01ArrayDouble, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniMatrixTranspose", nullptr, TestCase02MatrixTranspose, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testAniXorEncrypt", nullptr, TestCase03XorEncrypt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniFileCopy", nullptr, TestCase04FileCopy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniSysInfo", nullptr, TestCase05SysInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniCreatePhysics", nullptr, TestCase06CreatePhysics, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniStepPhysics", nullptr, TestCase06StepPhysics, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniDestroyPhysics", nullptr, TestCase06DestroyPhysics, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniFeatureExtract", nullptr, TestCase07FeatureExtract, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniErrorTrigger", nullptr, TestCase08ErrorTrigger, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniParallelSum", nullptr, TestCase09ParallelSum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniAsyncCompute", nullptr, TestCase10AsyncCompute, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniCachedLookup", nullptr, TestCase11CachedLookup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAniDynamicRegistration", nullptr, TestCase12DynamicRegistration, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"dynAdd", nullptr, DynAdd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dynSub", nullptr, DynSub, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
