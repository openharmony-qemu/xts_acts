/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include "include/VideoDecoderApiTest.h"
#include "include/VideoDecoderFuncTest.h"
#include <iostream>
#include <vector>
#include <functional>
#include <cstring>
#include <thread>
#include <mutex>
#include <condition_variable>

using TestFunction = std::function<int()>;

struct AsyncTestContext {
    napi_env env;
    napi_deferred deferred;
    napi_async_work work;
    TestFunction func;
    int result;
};

static void ExecuteTestAsync(napi_env env, void* data)
{
    AsyncTestContext* context = static_cast<AsyncTestContext*>(data);
    context->result = -1;
    if (context->func) {
        context->result = context->func();
    }
}

static void CompleteTestAsync(napi_env env, napi_status status, void* data)
{
    AsyncTestContext* context = static_cast<AsyncTestContext*>(data);
    if (status != napi_ok) {
        napi_value error;
        napi_create_string_utf8(env, "Async test failed", NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, context->deferred, error);
    } else {
        napi_value result;
        napi_create_int32(env, context->result, &result);
        napi_resolve_deferred(env, context->deferred, result);
    }
    napi_delete_async_work(env, context->work);
    delete context;
}

static napi_value RunTestAsync(napi_env env, TestFunction func,
                               const char* name)
{
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    AsyncTestContext* context = new AsyncTestContext{
        env, deferred, nullptr, func, -1};
    napi_value resourceName;
    napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName,
        ExecuteTestAsync, CompleteTestAsync, context, &context->work);
    napi_queue_async_work(env, context->work);
    return promise;
}

struct ThreadedTestContext {
    napi_env env;
    napi_deferred deferred;
    napi_async_work work;
    napi_callback func;
    napi_callback_info info;
    int32_t result;
    std::thread testThread;
    std::mutex mutex;
    std::condition_variable cv;
    bool done;
};

static void ExecuteThreadedTest(napi_env env, void* data)
{
    ThreadedTestContext* context = static_cast<ThreadedTestContext*>(data);
    std::unique_lock<std::mutex> lock(context->mutex);
    context->cv.wait(lock, [context]() { return context->done; });
}

static void CompleteThreadedTest(napi_env env, napi_status status, void* data)
{
    ThreadedTestContext* context = static_cast<ThreadedTestContext*>(data);
    if (status != napi_ok) {
        napi_value error;
        napi_create_string_utf8(env, "Async test failed", NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, context->deferred, error);
    } else {
        napi_value result;
        napi_create_int32(env, context->result, &result);
        napi_resolve_deferred(env, context->deferred, result);
    }
    napi_delete_async_work(env, context->work);
    if (context->testThread.joinable()) {
        context->testThread.join();
    }
    delete context;
}

EXTERN_C_START

struct Entry {
    napi_callback func;
    const char* name;
};

static napi_value AsyncWrapper(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
    auto* entry = static_cast<Entry*>(data);

    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    auto* context = new ThreadedTestContext{
        env, deferred, nullptr, entry->func, info, -1, {}, {}, {}, false};

    context->testThread = std::thread([context]() {
        int32_t val = -1;
        try {
            napi_value ret = context->func(context->env, context->info);
            napi_get_value_int32(context->env, ret, &val);
        } catch (...) {
            // Swallow exceptions to ensure done is set and cv is notified below
        }
        std::lock_guard<std::mutex> lock(context->mutex);
        context->result = val;
        context->done = true;
        context->cv.notify_all();
    });

    napi_value resourceName;
    napi_create_string_utf8(env, entry->name, NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName,
        ExecuteThreadedTest, CompleteThreadedTest, context, &context->work);
    napi_queue_async_work(env, context->work);
    return promise;
}

static napi_property_descriptor XL(const char* functionName,
                                   napi_callback func)
{
    auto* entry = new Entry{func, functionName};
    return {functionName, nullptr, AsyncWrapper, nullptr, nullptr,
            nullptr, napi_default, entry};
}

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoVc1DecCapApi0001", VideoVc1DecCapApi0001));
    desc.push_back(XL("VideoVc1DecCapApi0002", VideoVc1DecCapApi0002));
    desc.push_back(XL("VideoVc1DecCapApi0003", VideoVc1DecCapApi0003));
    desc.push_back(XL("VideoVc1DecCapApi0004", VideoVc1DecCapApi0004));
    desc.push_back(XL("VideoVc1DecCapApi0005", VideoVc1DecCapApi0005));
    desc.push_back(XL("VideoVc1DecCapApi0006", VideoVc1DecCapApi0006));
    desc.push_back(XL("VideoVc1DecCapApi0007", VideoVc1DecCapApi0007));
    desc.push_back(XL("VideoVc1DecCapApi0008", VideoVc1DecCapApi0008));
    desc.push_back(XL("VideoMsvideo1DecCapApi0009", VideoMsvideo1DecCapApi0009));
    desc.push_back(XL("VideoMsvideo1DecCapApi0010", VideoMsvideo1DecCapApi0010));
    desc.push_back(XL("VideoMsvideo1DecCapApi0011", VideoMsvideo1DecCapApi0011));
    desc.push_back(XL("VideoMsvideo1DecCapApi0012", VideoMsvideo1DecCapApi0012));
    desc.push_back(XL("VideoVp8DecCapApi0001", VideoVp8DecCapApi0001));
    desc.push_back(XL("VideoVp9DecCapApi0001", VideoVp9DecCapApi0001));
    desc.push_back(XL("VideoAv1DecCapApi0001", VideoAv1DecCapApi0001));
    desc.push_back(XL("VideoRv30DecCapApi0001", VideoRv30DecCapApi0001));
    desc.push_back(XL("VideoRv40DecCapApi0001", VideoRv40DecCapApi0001));
    desc.push_back(XL("VideoMjpegDecCapApi0001", VideoMjpegDecCapApi0001));
    desc.push_back(XL("VideoMsvideo1DecCapApi0001", VideoMsvideo1DecCapApi0001));
    desc.push_back(XL("VideoRawvideoDecCapApi0001", VideoRawvideoDecCapApi0001));
    desc.push_back(XL("VideoMpeg1DecCapApi0001", VideoMpeg1DecCapApi0001));
    desc.push_back(XL("VideoWvc1DecCapApi0001", VideoWvc1DecCapApi0001));
    desc.push_back(XL("VideoWmv3DecCapApi0001", VideoWmv3DecCapApi0001));
    desc.push_back(XL("VideoDvvideoDecCapApi0001", VideoDvvideoDecCapApi0001));
    desc.push_back(XL("VideoVp9DecCapApi0013", VideoVp9DecCapApi0013));
    desc.push_back(XL("VideoAv1DecCapApi0014", VideoAv1DecCapApi0014));
    desc.push_back(XL("VideoAv1DecCapApi0015", VideoAv1DecCapApi0015));
    desc.push_back(XL("VideoWvc1DecCapApi0016", VideoWvc1DecCapApi0016));
    desc.push_back(XL("VideoAv1DecCapApi0017", VideoAv1DecCapApi0017));
    desc.push_back(XL("VideoEncCapApi0018", VideoEncCapApi0018));
    desc.push_back(XL("VideoDecCapApi0019", VideoDecCapApi0019));
    desc.push_back(XL("VideoEncCapApi0020", VideoEncCapApi0020));
    desc.push_back(XL("VideoDecCapApi0021", VideoDecCapApi0021));
    desc.push_back(XL("VideoEncCapApi0022", VideoEncCapApi0022));
    desc.push_back(XL("VideoDecCapApi0023", VideoDecCapApi0023));
    desc.push_back(XL("VideoDecCapApi0024", VideoDecCapApi0024));
    desc.push_back(XL("VideoDecCapApi0025", VideoDecCapApi0025));
    desc.push_back(XL("VideoDecCapApi0026", VideoDecCapApi0026));
    desc.push_back(XL("VideoDecCapApi0027", VideoDecCapApi0027));
    desc.push_back(XL("VideoDecCapApi0028", VideoDecCapApi0028));
    desc.push_back(XL("VideoDecCapApi0029", VideoDecCapApi0029));
    desc.push_back(XL("VideoDecCapApi0030", VideoDecCapApi0030));
}

static void InitPush2(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoVc1DecFunction0001", VideoVc1DecFunction0001));
    desc.push_back(XL("VideoMjpegDecFunction0003", VideoMjpegDecFunction0003));
    desc.push_back(XL("VideoMsvideo1DecFunction0005", VideoMsvideo1DecFunction0005));
    desc.push_back(XL("VideoVc1DecFunction0002", VideoVc1DecFunction0002));
    desc.push_back(XL("VideoMjpegDecFunction0004", VideoMjpegDecFunction0004));
    desc.push_back(XL("VideoMsvideo1DecFunction0006", VideoMsvideo1DecFunction0006));
    desc.push_back(XL("VideoVp8DecFunction0007", VideoVp8DecFunction0007));
    desc.push_back(XL("VideoVp9DecFunction0008", VideoVp9DecFunction0008));
    desc.push_back(XL("VideoVp9DecFunction0009", VideoVp9DecFunction0009));
    desc.push_back(XL("VideoVp9DecFunction0010", VideoVp9DecFunction0010));
    desc.push_back(XL("VideoVp9DecFunction0011", VideoVp9DecFunction0011));
    desc.push_back(XL("VideoAv1DecFunction0012", VideoAv1DecFunction0012));
    desc.push_back(XL("VideoAv1DecFunction0013", VideoAv1DecFunction0013));
    desc.push_back(XL("VideoAv1DecFunction0015", VideoAv1DecFunction0015));
    desc.push_back(XL("VideoAv1DecFunction0016", VideoAv1DecFunction0016));
    desc.push_back(XL("VideoVp9DecFunction0019", VideoVp9DecFunction0019));
    desc.push_back(XL("VideoVp9DecFunction0020", VideoVp9DecFunction0020));
    desc.push_back(XL("VideoVp8DecFunction0021", VideoVp8DecFunction0021));
    desc.push_back(XL("VideoCinepakDecFunction0022", VideoCinepakDecFunction0022));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "decoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
