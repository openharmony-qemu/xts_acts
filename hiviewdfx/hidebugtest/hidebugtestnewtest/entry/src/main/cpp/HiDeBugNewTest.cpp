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
#include <string>
#include "hilog/log.h"
#include <cstdint>
#include <iomanip>
#include <thread>
#include <future>
#include <vector>
std::vector<uint32_t> tids;

namespace {
constexpr auto LOG_PRINT_DOMAIN = 0xFF00;
std::atomic_bool s {true} ;
std::mutex mutex;
}

void ThreadBlock(){
    while (s.load()){
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    };
}

__attribute__((noinline)) void StackDepth(int i) {
    if (i == 0 ){
        ThreadBlock();
        return;
    }
    return StackDepth(i-1);
}


static napi_value ClearThreads(napi_env env, napi_callback_info info){
    s.store(false);
    tids.clear();
    return nullptr;
}

static napi_value GetNativeMemInfoTrue(napi_env env, napi_callback_info info)
{
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfoWithCache(&nativeMemInfo, true);
    napi_value memInfo;
    napi_create_object(env, &memInfo);

    napi_value pss;
    napi_create_bigint_uint64(env, nativeMemInfo.pss, &pss);
    napi_set_named_property(env, memInfo, "pss", pss);

    napi_value rss;
    napi_create_bigint_uint64(env, nativeMemInfo.rss, &rss);
    napi_set_named_property(env, memInfo, "rss", rss);

    napi_value sharedDirty;
    napi_create_bigint_uint64(env, nativeMemInfo.sharedDirty, &sharedDirty);
    napi_set_named_property(env, memInfo, "sharedDirty", sharedDirty);

    napi_value privateDirty;
    napi_create_bigint_uint64(env, nativeMemInfo.privateDirty, &privateDirty);
    napi_set_named_property(env, memInfo, "privateDirty", privateDirty);

    napi_value sharedClean;
    napi_create_bigint_uint64(env, nativeMemInfo.sharedClean, &sharedClean);
    napi_set_named_property(env, memInfo, "sharedClean", sharedClean);

    napi_value privateClean;
    napi_create_bigint_uint64(env, nativeMemInfo.privateClean, &privateClean);
    napi_set_named_property(env, memInfo, "privateClean", privateClean);

    napi_value vss;
    napi_create_bigint_uint64(env, nativeMemInfo.vss, &vss);
    napi_set_named_property(env, memInfo, "vss", vss);
    return memInfo;
}

static napi_value GetNativeMemInfoFalse(napi_env env, napi_callback_info info)
{
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfoWithCache(&nativeMemInfo, false);
    napi_value memInfo;
    napi_create_object(env, &memInfo);

    napi_value pss;
    napi_create_bigint_uint64(env, nativeMemInfo.pss, &pss);
    napi_set_named_property(env, memInfo, "pss", pss);

    napi_value rss;
    napi_create_bigint_uint64(env, nativeMemInfo.rss, &rss);
    napi_set_named_property(env, memInfo, "rss", rss);

    napi_value sharedDirty;
    napi_create_bigint_uint64(env, nativeMemInfo.sharedDirty, &sharedDirty);
    napi_set_named_property(env, memInfo, "sharedDirty", sharedDirty);

    napi_value privateDirty;
    napi_create_bigint_uint64(env, nativeMemInfo.privateDirty, &privateDirty);
    napi_set_named_property(env, memInfo, "privateDirty", privateDirty);

    napi_value sharedClean;
    napi_create_bigint_uint64(env, nativeMemInfo.sharedClean, &sharedClean);
    napi_set_named_property(env, memInfo, "sharedClean", sharedClean);

    napi_value privateClean;
    napi_create_bigint_uint64(env, nativeMemInfo.privateClean, &privateClean);
    napi_set_named_property(env, memInfo, "privateClean", privateClean);

    napi_value vss;
    napi_create_bigint_uint64(env, nativeMemInfo.vss, &vss);
    napi_set_named_property(env, memInfo, "vss", vss);
    return memInfo;
}

static napi_value GetGraphicMemSummaryC(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int interval = 0;
    napi_get_value_int32(env, args[0], &interval);
    bool isUndefine = false;
    if (argc > 1) {
        napi_get_value_bool(env, args[1], &isUndefine);
    }
    HiDebug_GraphicsMemorySummary memorySummary{};
    HiDebug_ErrorCode retCode = HIDEBUG_SUCCESS;
    if (isUndefine) {
        retCode = OH_HiDebug_GetGraphicsMemorySummary(interval, nullptr);
    } else {
        retCode = OH_HiDebug_GetGraphicsMemorySummary(interval, &memorySummary);
    }
    if (retCode != HIDEBUG_SUCCESS) {
        napi_throw_error(env, std::to_string(retCode).c_str(), "hidebug OH_HiDebug_GetGraphicsMemorySummary error");
        return nullptr;
    }
    napi_value memInfo;
    napi_create_object(env, &memInfo);
    napi_value gl;
    napi_create_bigint_uint64(env, memorySummary.gl, &gl);
    napi_set_named_property(env, memInfo, "gl", gl);

    napi_value graph;
    napi_create_bigint_uint64(env, memorySummary.graph, &graph);
    napi_set_named_property(env, memInfo, "graph", graph);

    return memInfo;
}


static napi_value StartErrStack(napi_env env, napi_callback_info info) {
    std::promise<int> resultPromise;
    std::future<int> resultFuture = resultPromise.get_future();
    std::thread([resultPromise = std::move(resultPromise)]() mutable {
        static int count = 0;
        HiDebug_ProcessSamplerConfig config{
            .tids = tids.data(),
            .size = static_cast<uint32_t>(tids.size()),
            .frequency = 100,
            .duration = 10000,
            .reserved = 0,
        };
        int code = OH_HiDebug_RequestThreadLiteSampling(&config, nullptr);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}d",code );
        resultPromise.set_value(code);
    }).detach();
    int code = resultFuture.get();
    napi_value sum;
    napi_create_double(env, code, &sum);
    return sum;
}

static napi_value StartErrConfig(napi_env env, napi_callback_info info) {
    std::promise<int> resultPromise;
    std::future<int> resultFuture = resultPromise.get_future();
    std::thread([resultPromise = std::move(resultPromise)]() mutable {
        int code = OH_HiDebug_RequestThreadLiteSampling(nullptr, [](const char *stack) {
            std::string stacks(stack);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}lu",
                             stacks.size());
            if (stacks.empty()) {
                return;
            }
            size_t start = 0;
            size_t end = 0;
            while ((end = stacks.find('\n', start)) != std::string::npos) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
                start = end + 1;
            }
            // 打印最后一部分
            if (start < stacks.size()) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
            }

        });
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks 11 %{public}d", code );
        resultPromise.set_value(code);
    }).detach();
    int code = resultFuture.get();
    napi_value sum;
    napi_create_double(env, code, &sum);
    return sum;
}


static napi_value StartErrConfigtid(napi_env env, napi_callback_info info) {
    std::promise<int> resultPromise;
    std::future<int> resultFuture = resultPromise.get_future();
    std::thread([resultPromise = std::move(resultPromise)]() mutable {
        static int count = 0;
        HiDebug_ProcessSamplerConfig config{
//            .tids = tids.data(),
            .tids = nullptr,
            .size = static_cast<uint32_t>(tids.size()),
            .frequency = 100,
            .duration = 3000,
            .reserved = 0,
        };
        int code = OH_HiDebug_RequestThreadLiteSampling(&config, [](const char *stack) {
            std::string stacks(stack);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}lu",
                             stacks.size());
            if (stacks.empty()) {
                return;
            }
            size_t start = 0;
            size_t end = 0;
            while ((end = stacks.find('\n', start)) != std::string::npos) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
                start = end + 1;
            }
            // 打印最后一部分
            if (start < stacks.size()) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
            }

        });
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}d",code );
        resultPromise.set_value(code);
    }).detach();
    int code = resultFuture.get();
    napi_value sum;
    napi_create_double(env, code, &sum);
    return sum;
}

static napi_value Start(napi_env env, napi_callback_info info) {
    napi_value sum;
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);

    int32_t value1;
    napi_get_value_int32(env, args[1], &value1);
        static int count = 0;
        HiDebug_ProcessSamplerConfig config{
            .tids = tids.data(),
            .size = static_cast<uint32_t>(tids.size()),
            .frequency = static_cast<uint32_t>(value0),
            .duration = static_cast<uint32_t>(value1),
            .reserved = 0,
        };
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get params  %{public}d  %{public}d", value0,value1 );
        auto code = OH_HiDebug_RequestThreadLiteSampling(&config, [](const char *stack) {
            std::string stacks(stack);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}lu",
                             stacks.size());
            if (stacks.empty()) {
                return;
            }
            size_t start = 0;
            size_t end = 0;
            while ((end = stacks.find('\n', start)) != std::string::npos) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
                start = end + 1;
            }
            if (start < stacks.size()) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
            }
        });
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get Errcode %{public}d", code );
    napi_create_double(env, code, &sum);
    return sum;
    return nullptr;
}

static  napi_value AddThread(napi_env env, napi_callback_info info) {
    s.store(true);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    std::thread ([value0]{
        auto tid = gettid();
        {
            std::lock_guard<std::mutex> guard(mutex);
            tids.emplace_back(tid);
        }
        StackDepth(value0);
        {
            std::lock_guard<std::mutex> guard(mutex);
            tids.clear();
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "clear tid done" );
        }
    }).detach();
    return nullptr;
}

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

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


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getNativeMemInfoTrue", nullptr, GetNativeMemInfoTrue, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getNativeMemInfoFalse", nullptr, GetNativeMemInfoFalse, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getGraphicMemSummaryC", nullptr, GetGraphicMemSummaryC, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"addthread", nullptr, AddThread, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearthreads", nullptr, ClearThreads, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"start", nullptr, Start, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"starterrstack", nullptr, StartErrStack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"starterrconfig", nullptr, StartErrConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"starterrconfigtid", nullptr, StartErrConfigtid, nullptr, nullptr, nullptr, napi_default, nullptr},
        
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
