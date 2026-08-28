/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "common/native_common.h"
#include <thread>
#include <atomic>

static const int32_t STABLE_LOOP_COUNT = 10;

static napi_value Constructor(napi_env env, napi_callback_info info)
{
    return nullptr;
}

static napi_value CreateObjectStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_object(env, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateObjectMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_object(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateObjectMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value result = nullptr;
    napi_status status = napi_create_object(env, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateObjectRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value napiRet = nullptr;
        napi_status status = napi_create_object(newEnv, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateObjectWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_object(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPrototypeAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_prototype(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetPrototypeRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value result = nullptr;
    napi_status status = napi_get_prototype(env, obj, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetPrototypeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_value result = nullptr;
        napi_status status = napi_get_prototype(env, obj, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetPrototypeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_prototype(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPrototypeMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value result = nullptr;
    napi_status status = napi_get_prototype(env, obj, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetPrototypeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_value napiRet = nullptr;
        napi_status status = napi_get_prototype(newEnv, obj, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetPrototypeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_prototype(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ObjectFreezeStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_status status = napi_object_freeze(env, obj);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value ObjectFreezeMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_object_freeze(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ObjectFreezeMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_status status = napi_object_freeze(env, obj);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value ObjectFreezeRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_status status = napi_object_freeze(newEnv, obj);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ObjectFreezeWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_object_freeze(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ObjectSealStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_status status = napi_object_seal(env, obj);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value ObjectSealMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_object_seal(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ObjectSealMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_status status = napi_object_seal(env, obj);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value ObjectSealRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_status status = napi_object_seal(newEnv, obj);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ObjectSealWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_object_seal(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value TypeofStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        napi_valuetype type = napi_undefined;
        napi_status status = napi_typeof(env, obj, &type);
        int32_t singleRet = (status == napi_ok && type == napi_object) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value TypeofMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_typeof(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value TypeofMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_valuetype type = napi_undefined;
    napi_status status = napi_typeof(env, obj, &type);
    int32_t ret = (status == napi_ok && type == napi_object) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value TypeofRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        napi_valuetype type = napi_undefined;
        napi_status status = napi_typeof(newEnv, obj, &type);
        int32_t ret = (status == napi_ok && type == napi_object) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value TypeofWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_typeof(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value InstanceofStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value ctor = nullptr;
        napi_define_class(env, "TestClass", NAPI_AUTO_LENGTH, Constructor, nullptr, 0, nullptr, &ctor);
        napi_value inst = nullptr;
        napi_new_instance(env, ctor, 0, nullptr, &inst);
        bool isInst = false;
        napi_status status = napi_instanceof(env, inst, ctor, &isInst);
        int32_t singleRet = (status == napi_ok && isInst) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value InstanceofMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_instanceof(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value InstanceofMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value ctor = nullptr;
    napi_define_class(env, "TestClass", NAPI_AUTO_LENGTH, Constructor, nullptr, 0, nullptr, &ctor);
    napi_value inst = nullptr;
    napi_new_instance(env, ctor, 0, nullptr, &inst);
    bool isInst = false;
    napi_status status = napi_instanceof(env, inst, ctor, &isInst);
    int32_t ret = (status == napi_ok && isInst) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value InstanceofRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value ctor = nullptr;
        napi_define_class(newEnv, "TestClass", NAPI_AUTO_LENGTH, Constructor, nullptr, 0, nullptr, &ctor);
        napi_value inst = nullptr;
        napi_new_instance(newEnv, ctor, 0, nullptr, &inst);
        bool isInst = false;
        napi_status status = napi_instanceof(newEnv, inst, ctor, &isInst);
        int32_t ret = (status == napi_ok && isInst) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value InstanceofWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_instanceof(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value TypeTagObjectStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        static const napi_type_tag tag = {0x1234567890ABCDEFULL, 0xFEDCBA0987654321ULL};
        napi_status status = napi_type_tag_object(env, obj, &tag);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value TypeTagObjectMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_type_tag_object(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value TypeTagObjectMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    static const napi_type_tag tag = {0x1234567890ABCDEFULL, 0xFEDCBA0987654321ULL};
    napi_status status = napi_type_tag_object(env, obj, &tag);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value TypeTagObjectRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        static const napi_type_tag tag = {0x1234567890ABCDEFULL, 0xFEDCBA0987654321ULL};
        napi_status status = napi_type_tag_object(newEnv, obj, &tag);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value TypeTagObjectWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_type_tag_object(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CheckObjectTypeTagStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value obj = nullptr;
        napi_create_object(env, &obj);
        static const napi_type_tag tag = {0x1234567890ABCDEFULL, 0xFEDCBA0987654321ULL};
        napi_type_tag_object(env, obj, &tag);
        bool isTagged = false;
        napi_status status = napi_check_object_type_tag(env, obj, &tag, &isTagged);
        int32_t singleRet = (status == napi_ok && isTagged) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CheckObjectTypeTagMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_check_object_type_tag(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CheckObjectTypeTagMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    static const napi_type_tag tag = {0x1234567890ABCDEFULL, 0xFEDCBA0987654321ULL};
    napi_type_tag_object(env, obj, &tag);
    bool isTagged = false;
    napi_status status = napi_check_object_type_tag(env, obj, &tag, &isTagged);
    int32_t ret = (status == napi_ok && isTagged) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CheckObjectTypeTagRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value obj = nullptr;
        napi_create_object(newEnv, &obj);
        static const napi_type_tag tag = {0x1234567890ABCDEFULL, 0xFEDCBA0987654321ULL};
        napi_type_tag_object(newEnv, obj, &tag);
        bool isTagged = false;
        napi_status status = napi_check_object_type_tag(newEnv, obj, &tag, &isTagged);
        int32_t ret = (status == napi_ok && isTagged) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CheckObjectTypeTagWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_check_object_type_tag(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSymbolStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value desc = nullptr;
        napi_create_string_utf8(env, "sym", NAPI_AUTO_LENGTH, &desc);
        napi_value result = nullptr;
        napi_status status = napi_create_symbol(env, desc, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateSymbolMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_symbol(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSymbolMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value desc = nullptr;
    napi_create_string_utf8(env, "sym", NAPI_AUTO_LENGTH, &desc);
    napi_value result = nullptr;
    napi_status status = napi_create_symbol(env, desc, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateSymbolRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value desc = nullptr;
        napi_create_string_utf8(newEnv, "sym", NAPI_AUTO_LENGTH, &desc);
        napi_value napiRet = nullptr;
        napi_status status = napi_create_symbol(newEnv, desc, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateSymbolWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_symbol(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        static int32_t extData = 42;
        napi_value result = nullptr;
        napi_status status = napi_create_external(env, &extData, nullptr, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateExternalMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external(savedEnv, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    static int32_t extData = 42;
    napi_value result = nullptr;
    napi_status status = napi_create_external(env, &extData, nullptr, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateExternalRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        static int32_t extData = 42;
        napi_value napiRet = nullptr;
        napi_status status = napi_create_external(newEnv, &extData, nullptr, nullptr, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external(savedEnv, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueExternalStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        static int32_t extData = 42;
        napi_value ext = nullptr;
        napi_create_external(env, &extData, nullptr, nullptr, &ext);
        void* data = nullptr;
        napi_status status = napi_get_value_external(env, ext, &data);
        int32_t singleRet = (status == napi_ok && data != nullptr) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueExternalMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_external(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueExternalMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    static int32_t extData = 42;
    napi_value ext = nullptr;
    napi_create_external(env, &extData, nullptr, nullptr, &ext);
    void* data = nullptr;
    napi_status status = napi_get_value_external(env, ext, &data);
    int32_t ret = (status == napi_ok && data != nullptr) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueExternalRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        static int32_t extData = 42;
        napi_value ext = nullptr;
        napi_create_external(newEnv, &extData, nullptr, nullptr, &ext);
        void* data = nullptr;
        napi_status status = napi_get_value_external(newEnv, ext, &data);
        int32_t ret = (status == napi_ok && data != nullptr) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueExternalWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_external(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createObjectStable", CreateObjectStable),
        DECLARE_NAPI_FUNCTION("createObjectMultiThread", CreateObjectMultiThread),
        DECLARE_NAPI_FUNCTION("createObjectMultiCtx", CreateObjectMultiCtx),
        DECLARE_NAPI_FUNCTION("createObjectRuntime", CreateObjectRuntime),
        DECLARE_NAPI_FUNCTION("createObjectWorker", CreateObjectWorker),
        DECLARE_NAPI_FUNCTION("getPrototypeAbnormal", GetPrototypeAbnormal),
        DECLARE_NAPI_FUNCTION("getPrototypeRetVal", GetPrototypeRetVal),
        DECLARE_NAPI_FUNCTION("getPrototypeStable", GetPrototypeStable),
        DECLARE_NAPI_FUNCTION("getPrototypeMultiThread", GetPrototypeMultiThread),
        DECLARE_NAPI_FUNCTION("getPrototypeMultiCtx", GetPrototypeMultiCtx),
        DECLARE_NAPI_FUNCTION("getPrototypeRuntime", GetPrototypeRuntime),
        DECLARE_NAPI_FUNCTION("getPrototypeWorker", GetPrototypeWorker),
        DECLARE_NAPI_FUNCTION("objectFreezeStable", ObjectFreezeStable),
        DECLARE_NAPI_FUNCTION("objectFreezeMultiThread", ObjectFreezeMultiThread),
        DECLARE_NAPI_FUNCTION("objectFreezeMultiCtx", ObjectFreezeMultiCtx),
        DECLARE_NAPI_FUNCTION("objectFreezeRuntime", ObjectFreezeRuntime),
        DECLARE_NAPI_FUNCTION("objectFreezeWorker", ObjectFreezeWorker),
        DECLARE_NAPI_FUNCTION("objectSealStable", ObjectSealStable),
        DECLARE_NAPI_FUNCTION("objectSealMultiThread", ObjectSealMultiThread),
        DECLARE_NAPI_FUNCTION("objectSealMultiCtx", ObjectSealMultiCtx),
        DECLARE_NAPI_FUNCTION("objectSealRuntime", ObjectSealRuntime),
        DECLARE_NAPI_FUNCTION("objectSealWorker", ObjectSealWorker),
        DECLARE_NAPI_FUNCTION("typeofStable", TypeofStable),
        DECLARE_NAPI_FUNCTION("typeofMultiThread", TypeofMultiThread),
        DECLARE_NAPI_FUNCTION("typeofMultiCtx", TypeofMultiCtx),
        DECLARE_NAPI_FUNCTION("typeofRuntime", TypeofRuntime),
        DECLARE_NAPI_FUNCTION("typeofWorker", TypeofWorker),
        DECLARE_NAPI_FUNCTION("instanceofStable", InstanceofStable),
        DECLARE_NAPI_FUNCTION("instanceofMultiThread", InstanceofMultiThread),
        DECLARE_NAPI_FUNCTION("instanceofMultiCtx", InstanceofMultiCtx),
        DECLARE_NAPI_FUNCTION("instanceofRuntime", InstanceofRuntime),
        DECLARE_NAPI_FUNCTION("instanceofWorker", InstanceofWorker),
        DECLARE_NAPI_FUNCTION("typeTagObjectStable", TypeTagObjectStable),
        DECLARE_NAPI_FUNCTION("typeTagObjectMultiThread", TypeTagObjectMultiThread),
        DECLARE_NAPI_FUNCTION("typeTagObjectMultiCtx", TypeTagObjectMultiCtx),
        DECLARE_NAPI_FUNCTION("typeTagObjectRuntime", TypeTagObjectRuntime),
        DECLARE_NAPI_FUNCTION("typeTagObjectWorker", TypeTagObjectWorker),
        DECLARE_NAPI_FUNCTION("checkObjectTypeTagStable", CheckObjectTypeTagStable),
        DECLARE_NAPI_FUNCTION("checkObjectTypeTagMultiThread", CheckObjectTypeTagMultiThread),
        DECLARE_NAPI_FUNCTION("checkObjectTypeTagMultiCtx", CheckObjectTypeTagMultiCtx),
        DECLARE_NAPI_FUNCTION("checkObjectTypeTagRuntime", CheckObjectTypeTagRuntime),
        DECLARE_NAPI_FUNCTION("checkObjectTypeTagWorker", CheckObjectTypeTagWorker),
        DECLARE_NAPI_FUNCTION("createSymbolStable", CreateSymbolStable),
        DECLARE_NAPI_FUNCTION("createSymbolMultiThread", CreateSymbolMultiThread),
        DECLARE_NAPI_FUNCTION("createSymbolMultiCtx", CreateSymbolMultiCtx),
        DECLARE_NAPI_FUNCTION("createSymbolRuntime", CreateSymbolRuntime),
        DECLARE_NAPI_FUNCTION("createSymbolWorker", CreateSymbolWorker),
        DECLARE_NAPI_FUNCTION("createExternalStable", CreateExternalStable),
        DECLARE_NAPI_FUNCTION("createExternalMultiThread", CreateExternalMultiThread),
        DECLARE_NAPI_FUNCTION("createExternalMultiCtx", CreateExternalMultiCtx),
        DECLARE_NAPI_FUNCTION("createExternalRuntime", CreateExternalRuntime),
        DECLARE_NAPI_FUNCTION("createExternalWorker", CreateExternalWorker),
        DECLARE_NAPI_FUNCTION("getValueExternalStable", GetValueExternalStable),
        DECLARE_NAPI_FUNCTION("getValueExternalMultiThread", GetValueExternalMultiThread),
        DECLARE_NAPI_FUNCTION("getValueExternalMultiCtx", GetValueExternalMultiCtx),
        DECLARE_NAPI_FUNCTION("getValueExternalRuntime", GetValueExternalRuntime),
        DECLARE_NAPI_FUNCTION("getValueExternalWorker", GetValueExternalWorker),
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
    .nm_modname = "napiCovObject",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}