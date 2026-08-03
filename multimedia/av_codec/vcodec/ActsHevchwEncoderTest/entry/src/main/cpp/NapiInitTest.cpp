/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "include/CommonToolTest.h"
#include "include/BframeFuncTest.h"
#include "include/PostSqrFuncTest.h"
#include "include/PtsApiTest.h"
#include "include/RoiFuncTest.h"
#include "include/SqrFuncTest.h"
#include <vector>
#include <functional>

using namespace OHOS::Media;

using TestFunction = std::function<int()>;
using PrepareFunction = std::function<void()>;

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
    context->result = RESULT_ERROR;
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

static napi_value RunTestAsync(napi_env env, TestFunction func, const char* name)
{
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    AsyncTestContext* context = new AsyncTestContext{env, deferred, nullptr, func, RESULT_ERROR};
    napi_value resourceName;
    napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName,
        ExecuteTestAsync, CompleteTestAsync, context, &context->work);
    napi_queue_async_work(env, context->work);
    return promise;
}

EXTERN_C_START

struct AsyncEntry {
    napi_callback func;
    const char* name;
};

struct SyncEntry {
    PrepareFunction func;
};

static napi_value AsyncWrapper(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
    auto* entry = static_cast<AsyncEntry*>(data);
    napi_value ret = entry->func(env, info);
    int32_t val = RESULT_ERROR;
    napi_get_value_int32(env, ret, &val);
    return RunTestAsync(env, [val]() { return val; }, entry->name);
}

static napi_value SyncWrapper(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
    auto* entry = static_cast<SyncEntry*>(data);
    int32_t code = SUCCESS_CODE;
    if (entry->func) {
        try {
            entry->func();
        } catch (...) {
            code = RESULT_ERROR;
        }
    }
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_property_descriptor XL(const char* name, napi_callback func)
{
    auto* entry = new AsyncEntry{func, name};
    return {name, nullptr, AsyncWrapper, nullptr, nullptr, nullptr, napi_default, entry};
}

static napi_property_descriptor XL_SYNC(const char* name, PrepareFunction func)
{
    auto* entry = new SyncEntry{func};
    return {name, nullptr, SyncWrapper, nullptr, nullptr, nullptr, napi_default, entry};
}

// ====== Registration functions ======
static void InitPush1(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("VIDEO_HW_ENCODE_B_FUNC_001", VIDEO_HW_ENCODE_B_FUNC_001));
    desc.push_back(XL("VIDEO_HW_ENCODE_B_FUNC_002", VIDEO_HW_ENCODE_B_FUNC_002));
    desc.push_back(XL("VIDEO_HW_ENCODE_B_FUNC_003", VIDEO_HW_ENCODE_B_FUNC_003));
    desc.push_back(XL("VIDEO_HW_ENCODE_B_FUNC_004", VIDEO_HW_ENCODE_B_FUNC_004));
    desc.push_back(XL("VIDEO_HW_ENCODE_B_FUNC_005", VIDEO_HW_ENCODE_B_FUNC_005));
    desc.push_back(XL("VIDEO_HW_ENCODE_B_FUNC_006", VIDEO_HW_ENCODE_B_FUNC_006));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_001", VIDEO_HW_ENCODE_FUNC_SQR_001));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_002", VIDEO_HW_ENCODE_FUNC_SQR_002));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_003", VIDEO_HW_ENCODE_FUNC_SQR_003));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_004", VIDEO_HW_ENCODE_FUNC_SQR_004));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_005", VIDEO_HW_ENCODE_FUNC_SQR_005));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_006", VIDEO_HW_ENCODE_FUNC_SQR_006));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_007", VIDEO_HW_ENCODE_FUNC_SQR_007));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_008", VIDEO_HW_ENCODE_FUNC_SQR_008));
    desc.push_back(XL("VIDEO_HW_ENCODE_FUNC_SQR_009", VIDEO_HW_ENCODE_FUNC_SQR_009));
    desc.push_back(XL("VIDEO_HW_ENCODE_PTS_FUNC_001", VIDEO_HW_ENCODE_PTS_FUNC_001));
    desc.push_back(XL("VIDEO_HW_ENCODE_PTS_FUNC_002", VIDEO_HW_ENCODE_PTS_FUNC_002));
    desc.push_back(XL("VIDEO_HW_ENCODE_PTS_FUNC_003", VIDEO_HW_ENCODE_PTS_FUNC_003));
    desc.push_back(XL("VIDEO_HW_ENCODE_PTS_FUNC_004", VIDEO_HW_ENCODE_PTS_FUNC_004));
    desc.push_back(XL("VIDEO_HW_ENCODE_PTS_FUNC_005", VIDEO_HW_ENCODE_PTS_FUNC_005));
    desc.push_back(XL("VIDEO_HW_ENCODE_PTS_FUNC_006", VIDEO_HW_ENCODE_PTS_FUNC_006));
}

static void InitPush2(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_001", VIDEO_HW_ENCODE_ROI_FUNC_001));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_002", VIDEO_HW_ENCODE_ROI_FUNC_002));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_003", VIDEO_HW_ENCODE_ROI_FUNC_003));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_004", VIDEO_HW_ENCODE_ROI_FUNC_004));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_005", VIDEO_HW_ENCODE_ROI_FUNC_005));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_006", VIDEO_HW_ENCODE_ROI_FUNC_006));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_007", VIDEO_HW_ENCODE_ROI_FUNC_007));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_008", VIDEO_HW_ENCODE_ROI_FUNC_008));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_009", VIDEO_HW_ENCODE_ROI_FUNC_009));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_010", VIDEO_HW_ENCODE_ROI_FUNC_010));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_011", VIDEO_HW_ENCODE_ROI_FUNC_011));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_012", VIDEO_HW_ENCODE_ROI_FUNC_012));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_013", VIDEO_HW_ENCODE_ROI_FUNC_013));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_014", VIDEO_HW_ENCODE_ROI_FUNC_014));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_015", VIDEO_HW_ENCODE_ROI_FUNC_015));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_016", VIDEO_HW_ENCODE_ROI_FUNC_016));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_017", VIDEO_HW_ENCODE_ROI_FUNC_017));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_FUNC_018", VIDEO_HW_ENCODE_ROI_FUNC_018));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_019", VIDEO_HW_ENCODE_ROI_API_019));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_020", VIDEO_HW_ENCODE_ROI_API_020));
}

static void InitPush3(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_021", VIDEO_HW_ENCODE_ROI_API_021));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_022", VIDEO_HW_ENCODE_ROI_API_022));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_023", VIDEO_HW_ENCODE_ROI_API_023));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_024", VIDEO_HW_ENCODE_ROI_API_024));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_025", VIDEO_HW_ENCODE_ROI_API_025));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_026", VIDEO_HW_ENCODE_ROI_API_026));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_027", VIDEO_HW_ENCODE_ROI_API_027));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_028", VIDEO_HW_ENCODE_ROI_API_028));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_029", VIDEO_HW_ENCODE_ROI_API_029));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_030", VIDEO_HW_ENCODE_ROI_API_030));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_031", VIDEO_HW_ENCODE_ROI_API_031));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_032", VIDEO_HW_ENCODE_ROI_API_032));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_033", VIDEO_HW_ENCODE_ROI_API_033));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_034", VIDEO_HW_ENCODE_ROI_API_034));
    desc.push_back(XL("VIDEO_HW_ENCODE_ROI_API_035", VIDEO_HW_ENCODE_ROI_API_035));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_001", VIDEO_HW_ENCODE_SQR_FUNC_001));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_002", VIDEO_HW_ENCODE_SQR_FUNC_002));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_003", VIDEO_HW_ENCODE_SQR_FUNC_003));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_004", VIDEO_HW_ENCODE_SQR_FUNC_004));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_005", VIDEO_HW_ENCODE_SQR_FUNC_005));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_006", VIDEO_HW_ENCODE_SQR_FUNC_006));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_007", VIDEO_HW_ENCODE_SQR_FUNC_007));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_008", VIDEO_HW_ENCODE_SQR_FUNC_008));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_009", VIDEO_HW_ENCODE_SQR_FUNC_009));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_010", VIDEO_HW_ENCODE_SQR_FUNC_010));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_011", VIDEO_HW_ENCODE_SQR_FUNC_011));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_012", VIDEO_HW_ENCODE_SQR_FUNC_012));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_013", VIDEO_HW_ENCODE_SQR_FUNC_013));
    desc.push_back(XL("VIDEO_HW_ENCODE_SQR_FUNC_014", VIDEO_HW_ENCODE_SQR_FUNC_014));
}

static void InitPush4(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL_SYNC("Bframe_SetUpTestCase", []() { BframeFuncTest::SetUpTestCase(); }));
    desc.push_back(XL_SYNC("Bframe_TearDown", []() { BframeFuncTest::TearDown(); }));
    desc.push_back(XL_SYNC("PostSqr_SetUpTestCase", []() { PostSqrFuncTest::SetUpTestCase(); }));
    desc.push_back(XL_SYNC("PostSqr_TearDown", []() { PostSqrFuncTest::TearDown(); }));
    desc.push_back(XL_SYNC("PtsApi_SetUpTestCase", []() { PtsApiTest::SetUpTestCase(); }));
    desc.push_back(XL_SYNC("PtsApi_TearDown", []() { PtsApiTest::TearDown(); }));
    desc.push_back(XL_SYNC("Roi_SetUpTestCase", []() { RoiFuncTest::SetUpTestCase(); }));
    desc.push_back(XL_SYNC("Roi_TearDown", []() { RoiFuncTest::TearDown(); }));
    desc.push_back(XL_SYNC("Sqr_SetUpTestCase", []() { SqrFuncTest::SetUpTestCase(); }));
    desc.push_back(XL_SYNC("Sqr_TearDown", []() { SqrFuncTest::TearDown(); }));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    InitPush4(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
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
