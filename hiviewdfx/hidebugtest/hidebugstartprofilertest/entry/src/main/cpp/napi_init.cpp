/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "hidebug/hidebug.h"
#include "hidebug/hidebug_type.h"
#include "hicollie/hicollie.h"
#include <string>
#include "hilog/log.h"
#include <cstdint>
#include <iomanip>
#include <thread>
#include <future>
#include <vector>
#undef LOG_TAG
#undef LOG_DOMAIN
#define LOG_TAG "Hiprofiler"
#define LOG_DOMAIN 0xD002D0C

static constexpr uint32_t MIN_DURATION_SEC = 1;
static constexpr uint32_t MAX_DURATION_SEC = 3600;
static constexpr uint32_t OVER_MAX_DURATION_SEC = 3601;
static constexpr uint32_t MIN_FILTER_SIZE = 1;
static constexpr uint32_t MAX_STACK_DEPTH = 30;
static constexpr uint32_t MAX_STATISTICS_INTERVAL_SEC = 3600;
static constexpr uint32_t MIN_SAMPLE_INTERVAL_BYTES = 384;
static constexpr uint32_t MIN_ASYNC_NESTING_DEPTH = 1;
static constexpr uint32_t MAX_ASYNC_NESTING_DEPTH = 16;
static constexpr uint32_t MIN_ASYNC_STACK_DEPTH = 1;
static constexpr uint32_t MAX_ASYNC_STACK_DEPTH = 256;
static constexpr uint32_t VALID_STATISTICS_INTERVAL_ZERO = 0;
static constexpr uint32_t VALID_STACK_DEPTH_ZERO = 0;
static constexpr uint32_t BELOW_MIN_DURATION_SEC = 0;
static constexpr uint32_t VALID_ASYNC_TASK_STACK_DEPTH = 16;
static constexpr uint32_t NUMBER = 2;

std::vector<uint32_t> tids;

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}
static napi_value TestCreateProfilerOptions(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestCreateProfilerOptions start");
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    napi_value result;
    if (opts == nullptr) {
        OH_LOG_ERROR(LOG_APP, "testTag OH_HiDebug_CreateProfilerOptions returned nullptr");
        napi_create_int32(env, 0, &result);
    } else {
        OH_HiDebug_DestroyProfilerOptions(opts);
        napi_create_int32(env, 1, &result);
    }
    return result;
}

static napi_value TestDestroyProfilerOptionsNull(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestDestroyProfilerOptionsNull start");
    OH_HiDebug_DestroyProfilerOptions(nullptr);
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value TestSetMaxAsyncNestingDepth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t depth;
    napi_get_value_uint32(env, args[0], &depth);
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxAsyncNestingDepth depth=%{public}u", depth);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebug_ErrorCode code = OH_HiDebug_SetMaxAsyncNestingDepth(opts, depth);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetMaxAsyncTaskStackDepth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t depth;
    napi_get_value_uint32(env, args[0], &depth);
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxAsyncTaskStackDepth depth=%{public}u", depth);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebug_ErrorCode code = OH_HiDebug_SetMaxAsyncTaskStackDepth(opts, depth);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetSampleIntervalBytes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t bytes;
    napi_get_value_uint32(env, args[0], &bytes);
    OH_LOG_INFO(LOG_APP, "testTag TestSetSampleIntervalBytes bytes=%{public}u", bytes);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebug_ErrorCode code = OH_HiDebug_SetSampleIntervalBytes(opts, bytes);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetStatisticsIntervalSec(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t seconds;
    napi_get_value_uint32(env, args[0], &seconds);
    OH_LOG_INFO(LOG_APP, "testTag TestSetStatisticsIntervalSec seconds=%{public}u", seconds);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebug_ErrorCode code = OH_HiDebug_SetStatisticsIntervalSec(opts, seconds);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetMaxStackDepth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t depth;
    napi_get_value_uint32(env, args[0], &depth);
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxStackDepth depth=%{public}u", depth);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebug_ErrorCode code = OH_HiDebug_SetMaxStackDepth(opts, depth);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetFilterSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t size;
    napi_get_value_uint32(env, args[0], &size);
    OH_LOG_INFO(LOG_APP, "testTag TestSetFilterSize size=%{public}u", size);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebug_ErrorCode code = OH_HiDebug_SetFilterSize(opts, size);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetMaxDurationSec(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t seconds;
    napi_get_value_uint32(env, args[0], &seconds);
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxDurationSec seconds=%{public}u", seconds);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebug_ErrorCode code = OH_HiDebug_SetMaxDurationSec(opts, seconds);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

struct ProfilerOptionsCallbackState {
    std::mutex mutex;
    std::condition_variable cv;
    bool done = false;
    HiDebug_ErrorCode callbackCode = HIDEBUG_SUCCESS;
    OH_HiDebug_ResourceType callbackType = OH_RES_TYPE_FD;
    std::string callbackPath;
};
ProfilerOptionsCallbackState g_profilerOptsState;

void OnProfilerOptionsResult(OH_HiDebug_ProfilingResult* result) {
    std::lock_guard<std::mutex> lock(g_profilerOptsState.mutex);
    g_profilerOptsState.done = true;
    if (result != nullptr) {
        g_profilerOptsState.callbackType = result->resourceType;
        g_profilerOptsState.callbackPath = result->filePath == nullptr ? "" : result->filePath;
    }
    OH_LOG_INFO(LOG_APP, "ProfilerOptions callback triggered: type=%d, path=%s",
                g_profilerOptsState.callbackType, g_profilerOptsState.callbackPath.c_str());
    g_profilerOptsState.cv.notify_one();
}

static napi_value TestStartProfilerWithOptions(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < NUMBER) {
        napi_throw_error(env, nullptr, "need 2 params");
        return nullptr;
    }
    int32_t resourceType;
    napi_get_value_int32(env, args[0], &resourceType);
    uint32_t maxDuration;
    napi_get_value_uint32(env, args[1], &maxDuration);
    OH_LOG_INFO(LOG_APP, "testTag TestStartProfilerWithOptions type=%{public}d maxDuration=%{public}u",
                resourceType, maxDuration);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_HiDebug_SetMaxDurationSec(opts, maxDuration);
    OH_HiDebug_SetFilterSize(opts, MIN_FILTER_SIZE);
    OH_HiDebug_SetSampleIntervalBytes(opts, MIN_SAMPLE_INTERVAL_BYTES);
    HiDebug_ErrorCode code = OH_HiDebug_StartProfilerWithOptions(
        static_cast<OH_HiDebug_ResourceType>(resourceType), opts, OnProfilerOptionsResult);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestStartProfilerWithOptionsNullOpts(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < MIN_DURATION_SEC) {
        napi_throw_error(env, nullptr, "need 1 param");
        return nullptr;
    }
    int32_t resourceType;
    napi_get_value_int32(env, args[0], &resourceType);
    OH_LOG_INFO(LOG_APP, "testTag TestStartProfilerWithOptionsNullOpts type=%{public}d", resourceType);
    HiDebug_ErrorCode code = OH_HiDebug_StartProfilerWithOptions(
        static_cast<OH_HiDebug_ResourceType>(resourceType), nullptr, OnProfilerOptionsResult);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetMaxAsyncNestingDepthNull(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxAsyncNestingDepthNull start");
    HiDebug_ErrorCode code = OH_HiDebug_SetMaxAsyncNestingDepth(nullptr, MIN_ASYNC_NESTING_DEPTH);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetMaxAsyncTaskStackDepthNull(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxAsyncTaskStackDepthNull start");
    HiDebug_ErrorCode code = OH_HiDebug_SetMaxAsyncTaskStackDepth(nullptr, MIN_ASYNC_STACK_DEPTH);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetSampleIntervalBytesNull(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetSampleIntervalBytesNull start");
    HiDebug_ErrorCode code = OH_HiDebug_SetSampleIntervalBytes(nullptr, MIN_SAMPLE_INTERVAL_BYTES);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetStatisticsIntervalSecNull(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetStatisticsIntervalSecNull start");
    HiDebug_ErrorCode code = OH_HiDebug_SetStatisticsIntervalSec(nullptr, VALID_STATISTICS_INTERVAL_ZERO);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetMaxStackDepthNull(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxStackDepthNull start");
    HiDebug_ErrorCode code = OH_HiDebug_SetMaxStackDepth(nullptr, VALID_STACK_DEPTH_ZERO);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetFilterSizeNull(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetFilterSizeNull start");
    HiDebug_ErrorCode code = OH_HiDebug_SetFilterSize(nullptr, MIN_FILTER_SIZE);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetMaxDurationSecNull(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxDurationSecNull start");
    HiDebug_ErrorCode code = OH_HiDebug_SetMaxDurationSec(nullptr, MIN_DURATION_SEC);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestDestroyProfilerOptionsNullReturnCode(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestDestroyProfilerOptionsNullReturnCode start");
    HiDebug_ErrorCode code = OH_HiDebug_DestroyProfilerOptions(nullptr);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestStartProfilerWithOptionsNullCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < NUMBER) {
        napi_throw_error(env, nullptr, "need 2 params");
        return nullptr;
    }
    int32_t resourceType;
    napi_get_value_int32(env, args[0], &resourceType);
    uint32_t maxDuration;
    napi_get_value_uint32(env, args[1], &maxDuration);
    OH_LOG_INFO(LOG_APP, "testTag TestStartProfilerWithOptionsNullCallback type=%{public}d maxDuration=%{public}u",
                resourceType, maxDuration);
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_HiDebug_SetMaxDurationSec(opts, maxDuration);
    OH_HiDebug_SetFilterSize(opts, MIN_FILTER_SIZE);
    OH_HiDebug_SetSampleIntervalBytes(opts, MIN_SAMPLE_INTERVAL_BYTES);
    HiDebug_ErrorCode code = OH_HiDebug_StartProfilerWithOptions(
        static_cast<OH_HiDebug_ResourceType>(resourceType), opts, nullptr);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestSetMaxDurationSecInvalidReturn(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetMaxDurationSecInvalidReturn start");
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebug_ErrorCode code1 = OH_HiDebug_SetMaxDurationSec(opts, BELOW_MIN_DURATION_SEC);
    HiDebug_ErrorCode code2 = OH_HiDebug_SetMaxDurationSec(opts, OVER_MAX_DURATION_SEC);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    napi_value val1;
    napi_create_int32(env, code1, &val1);
    napi_set_named_property(env, resultObj, "zero", val1);
    napi_value val2;
    napi_create_int32(env, code2, &val2);
    napi_set_named_property(env, resultObj, "overMax", val2);
    return resultObj;
}

struct HiDebugProfilerOptionsLayout {
    uint32_t maxDuration;
    uint32_t filterSize;
    uint32_t maxStackDepth;
    uint32_t statisticsInterval;
    uint32_t sampleInterval;
    uint32_t maxAsyncNestingDepth;
    uint32_t maxAsyncStackDepth;
};

static napi_value TestGetProfilerOptionsDefaults(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestGetProfilerOptionsDefaults start");
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    HiDebugProfilerOptionsLayout* layout = reinterpret_cast<HiDebugProfilerOptionsLayout*>(opts);
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    napi_value val1;
    napi_create_uint32(env, layout->maxDuration, &val1);
    napi_set_named_property(env, resultObj, "maxDuration", val1);
    napi_value val2;
    napi_create_uint32(env, layout->filterSize, &val2);
    napi_set_named_property(env, resultObj, "filterSize", val2);
    napi_value val3;
    napi_create_uint32(env, layout->maxStackDepth, &val3);
    napi_set_named_property(env, resultObj, "maxStackDepth", val3);
    napi_value val4;
    napi_create_uint32(env, layout->statisticsInterval, &val4);
    napi_set_named_property(env, resultObj, "statisticsInterval", val4);
    napi_value val5;
    napi_create_uint32(env, layout->sampleInterval, &val5);
    napi_set_named_property(env, resultObj, "sampleInterval", val5);
    napi_value val6;
    napi_create_uint32(env, layout->maxAsyncNestingDepth, &val6);
    napi_set_named_property(env, resultObj, "maxAsyncNestingDepth", val6);
    napi_value val7;
    napi_create_uint32(env, layout->maxAsyncStackDepth, &val7);
    napi_set_named_property(env, resultObj, "maxAsyncStackDepth", val7);
    OH_HiDebug_DestroyProfilerOptions(opts);
    return resultObj;
}

static napi_value TestCreateAndDestroyProfilerOptions(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestCreateAndDestroyProfilerOptions start");
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, 0, &result);
        return result;
    }
    OH_HiDebug_SetMaxDurationSec(opts, MIN_DURATION_SEC);
    OH_HiDebug_SetFilterSize(opts, MIN_FILTER_SIZE);
    OH_HiDebug_SetSampleIntervalBytes(opts, MIN_SAMPLE_INTERVAL_BYTES);
    OH_HiDebug_SetStatisticsIntervalSec(opts, VALID_STATISTICS_INTERVAL_ZERO);
    OH_HiDebug_SetMaxStackDepth(opts, MAX_STACK_DEPTH);
    OH_HiDebug_SetMaxAsyncNestingDepth(opts, MIN_ASYNC_NESTING_DEPTH);
    OH_HiDebug_SetMaxAsyncTaskStackDepth(opts, VALID_ASYNC_TASK_STACK_DEPTH);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value TestSetAllOptionsBoundary(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "testTag TestSetAllOptionsBoundary start");
    OH_HiDebug_ProfilerOptions* opts = OH_HiDebug_CreateProfilerOptions();
    if (opts == nullptr) {
        napi_value result;
        napi_create_int32(env, 0, &result);
        return result;
    }
    HiDebug_ErrorCode code1 = OH_HiDebug_SetMaxAsyncNestingDepth(opts, MAX_ASYNC_NESTING_DEPTH);
    HiDebug_ErrorCode code2 = OH_HiDebug_SetMaxAsyncTaskStackDepth(opts, MAX_ASYNC_STACK_DEPTH);
    HiDebug_ErrorCode code3 = OH_HiDebug_SetSampleIntervalBytes(opts, UINT32_MAX);
    HiDebug_ErrorCode code4 = OH_HiDebug_SetStatisticsIntervalSec(opts, MAX_STATISTICS_INTERVAL_SEC);
    HiDebug_ErrorCode code5 = OH_HiDebug_SetMaxStackDepth(opts, MAX_STACK_DEPTH);
    HiDebug_ErrorCode code6 = OH_HiDebug_SetFilterSize(opts, UINT32_MAX);
    HiDebug_ErrorCode code7 = OH_HiDebug_SetMaxDurationSec(opts, MAX_DURATION_SEC);
    OH_HiDebug_DestroyProfilerOptions(opts);
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    napi_value val1;
    napi_create_int32(env, code1, &val1);
    napi_set_named_property(env, resultObj, "maxAsyncNestingDepth", val1);
    napi_value val2;
    napi_create_int32(env, code2, &val2);
    napi_set_named_property(env, resultObj, "maxAsyncTaskStackDepth", val2);
    napi_value val3;
    napi_create_int32(env, code3, &val3);
    napi_set_named_property(env, resultObj, "sampleIntervalBytes", val3);
    napi_value val4;
    napi_create_int32(env, code4, &val4);
    napi_set_named_property(env, resultObj, "statisticsIntervalSec", val4);
    napi_value val5;
    napi_create_int32(env, code5, &val5);
    napi_set_named_property(env, resultObj, "maxStackDepth", val5);
    napi_value val6;
    napi_create_int32(env, code6, &val6);
    napi_set_named_property(env, resultObj, "filterSize", val6);
    napi_value val7;
    napi_create_int32(env, code7, &val7);
    napi_set_named_property(env, resultObj, "maxDurationSec", val7);
    return resultObj;
}

static napi_value HiDebugStopProfiler(napi_env env, napi_callback_info info)
{
    HiDebug_ErrorCode stopResult = OH_HiDebug_StopProfiler();
    napi_value ret;
    if (stopResult == HIDEBUG_RES_PROF_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_HiDebug_StopProfiler success return code is:%{public}d", stopResult);
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_HiDebug_StopProfiler fail return code is:%{public}d", stopResult);
        napi_create_int32(env, stopResult, &ret);
        return ret;
    }
    napi_create_int32(env, stopResult, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"testCreateProfilerOptions", nullptr, TestCreateProfilerOptions, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testDestroyProfilerOptionsNull", nullptr, TestDestroyProfilerOptionsNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxAsyncNestingDepth", nullptr, TestSetMaxAsyncNestingDepth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxAsyncTaskStackDepth", nullptr, TestSetMaxAsyncTaskStackDepth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetSampleIntervalBytes", nullptr, TestSetSampleIntervalBytes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetStatisticsIntervalSec", nullptr, TestSetStatisticsIntervalSec, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxStackDepth", nullptr, TestSetMaxStackDepth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetFilterSize", nullptr, TestSetFilterSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxDurationSec", nullptr, TestSetMaxDurationSec, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testStartProfilerWithOptions", nullptr, TestStartProfilerWithOptions, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testStartProfilerWithOptionsNullOpts", nullptr, TestStartProfilerWithOptionsNullOpts, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxAsyncNestingDepthNull", nullptr, TestSetMaxAsyncNestingDepthNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxAsyncTaskStackDepthNull", nullptr, TestSetMaxAsyncTaskStackDepthNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetSampleIntervalBytesNull", nullptr, TestSetSampleIntervalBytesNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetStatisticsIntervalSecNull", nullptr, TestSetStatisticsIntervalSecNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxStackDepthNull", nullptr, TestSetMaxStackDepthNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetFilterSizeNull", nullptr, TestSetFilterSizeNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxDurationSecNull", nullptr, TestSetMaxDurationSecNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testDestroyProfilerOptionsNullReturnCode", nullptr, TestDestroyProfilerOptionsNullReturnCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testStartProfilerWithOptionsNullCallback", nullptr, TestStartProfilerWithOptionsNullCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetMaxDurationSecInvalidReturn", nullptr, TestSetMaxDurationSecInvalidReturn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetProfilerOptionsDefaults", nullptr, TestGetProfilerOptionsDefaults, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCreateAndDestroyProfilerOptions", nullptr, TestCreateAndDestroyProfilerOptions, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSetAllOptionsBoundary", nullptr, TestSetAllOptionsBoundary, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "stopProfiler", nullptr, HiDebugStopProfiler, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
