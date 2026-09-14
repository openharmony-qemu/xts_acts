/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "napi/native_api.h"
#include "native_common.h"
#include "napicoveraddbatch2_extra.h"
#include <atomic>
#include <cstdint>
#include <cstdio>
#include <cstring>

static std::atomic<int32_t> g_finalizeCount{0};

struct RemoveWrapData {
    bool finalized = false;
};

static napi_value BoolResult(napi_env env, bool value) { return Ret(env, value ? 1 : 0); }

static bool IsPendingAndClear(napi_env env)
{
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
    return pending;
}

static void CountFinalizer(napi_env env, void *data, void *hint)
{
    (void)env;
    (void)hint;
    g_finalizeCount.fetch_add(1);
    delete reinterpret_cast<int32_t *>(data);
}

static void RemoveWrapSpecFinalizer(napi_env env, void *data, void *hint)
{
    (void)env;
    (void)hint;
    g_finalizeCount.fetch_add(1);
    auto *specData = reinterpret_cast<RemoveWrapData *>(data);
    if (specData != nullptr) {
        specData->finalized = true;
    }
}

// ========== 原有测试 ==========

static napi_value DeleteReferenceTriggersFinalizer(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue57 = 57;
    g_finalizeCount.store(0);
    napi_value object = nullptr;
    napi_create_object(env, &object);
    auto *data = new int32_t(kTestValue57);
    napi_ref ref = nullptr;
    napi_status addStatus = napi_add_finalizer(env, object, data, CountFinalizer, nullptr, &ref);
    if (addStatus != napi_ok || ref == nullptr) {
        delete data;
        return BoolResult(env, false);
    }
    napi_status deleteStatus = napi_delete_reference(env, ref);
    return BoolResult(env, deleteStatus == napi_ok && g_finalizeCount.load() == 1);
}

static napi_value RemoveWrapCallsFinalizerBeforeRemoving(napi_env env, napi_callback_info info)
{
    (void)info;
    g_finalizeCount.store(0);
    napi_value object = nullptr;
    napi_create_object(env, &object);
    auto *data = new RemoveWrapData();
    napi_status wrapStatus = napi_wrap(env, object, data, RemoveWrapSpecFinalizer, nullptr, nullptr);
    if (wrapStatus != napi_ok) {
        delete data;
        return BoolResult(env, false);
    }
    void *removed = nullptr;
    napi_status removeStatus = napi_remove_wrap(env, object, &removed);
    bool ok = removeStatus == napi_ok && removed == data && data->finalized && g_finalizeCount.load() == 1;
    delete data;
    return BoolResult(env, ok);
}

static napi_value AddFinalizerResultReferenceIsStrong(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue59 = 59;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    auto *data = new int32_t(kTestValue59);
    napi_ref ref = nullptr;
    napi_status addStatus = napi_add_finalizer(env, object, data, CountFinalizer, nullptr, &ref);
    if (addStatus != napi_ok || ref == nullptr) {
        delete data;
        return BoolResult(env, false);
    }
    napi_value refValue = nullptr;
    napi_status getStatus = napi_get_reference_value(env, ref, &refValue);
    bool same = false;
    napi_strict_equals(env, object, refValue, &same);
    napi_delete_reference(env, ref);
    return BoolResult(env, getStatus == napi_ok && same);
}

static napi_value CreateStrongReferenceKeepsValue(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue33 = 33;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value value = nullptr;
    napi_create_int32(env, kTestValue33, &value);
    napi_set_named_property(env, object, "value", value);

    napi_strong_ref ref = nullptr;
    napi_status createStatus = napi_create_strong_reference(env, object, &ref);
    napi_value refValue = nullptr;
    napi_status getStatus = napi_get_strong_reference_value(env, ref, &refValue);
    bool same = false;
    napi_strict_equals(env, object, refValue, &same);
    napi_status deleteStatus = napi_delete_strong_reference(env, ref);
    return BoolResult(env, createStatus == napi_ok && getStatus == napi_ok && deleteStatus == napi_ok && same);
}

static napi_value DeleteStrongReferenceOnceWorks(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_strong_ref ref = nullptr;
    napi_status createStatus = napi_create_strong_reference(env, object, &ref);
    napi_status deleteStatus = napi_delete_strong_reference(env, ref);
    return BoolResult(env, createStatus == napi_ok && deleteStatus == napi_ok);
}

static napi_value GetStrongReferenceValueWorksBeforeDelete(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_strong_ref ref = nullptr;
    napi_create_strong_reference(env, object, &ref);
    napi_value refValue = nullptr;
    napi_status getStatus = napi_get_strong_reference_value(env, ref, &refValue);
    bool same = false;
    napi_strict_equals(env, object, refValue, &same);
    napi_delete_strong_reference(env, ref);
    return BoolResult(env, getStatus == napi_ok && same);
}

static napi_value WrapEnhanceSyncAndAsyncFinalizerCanBeCreated(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue2702 = 2702;
    const int32_t kTestValue2701 = 2701;
    napi_value syncObject = nullptr;
    napi_value asyncObject = nullptr;
    napi_create_object(env, &syncObject);
    napi_create_object(env, &asyncObject);
    auto *syncData = new int32_t(kTestValue2701);
    auto *asyncData = new int32_t(kTestValue2702);

    napi_ref syncRef = nullptr;
    napi_ref asyncRef = nullptr;

    napi_status syncStatus =
        napi_wrap_enhance(env, syncObject, syncData, CountFinalizer, false, nullptr, sizeof(int32_t), &syncRef);
    napi_status asyncStatus =
        napi_wrap_enhance(env, asyncObject, asyncData, CountFinalizer, true, nullptr, sizeof(int32_t), &asyncRef);

    if (syncStatus != napi_ok) {
        delete syncData;
    }
    if (asyncStatus != napi_ok) {
        delete asyncData;
    }

    if (syncRef != nullptr) {
        napi_delete_reference(env, syncRef);
    }
    if (asyncRef != nullptr) {
        napi_delete_reference(env, asyncRef);
    }

    return BoolResult(env, syncStatus == napi_ok && asyncStatus == napi_ok);
}

void SendableRemoveWrapFinalizer(napi_env env, void *data, void *hint)
{
    (void)env;
    (void)data;
    (void)hint;
    g_finalizeCount.fetch_add(1);
}

static napi_value RemoveWrapSendableReturnsNativePointerWithoutImmediateFinalizer(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue2601 = 2601;
    g_finalizeCount.store(0);
    napi_value object = nullptr;
    napi_status createStatus = napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
    if (createStatus != napi_ok) {
        return BoolResult(env, false);
    }
    auto *data = new int32_t(kTestValue2601);
    napi_status wrapStatus = napi_wrap_sendable(env, object, data, SendableRemoveWrapFinalizer, nullptr);
    if (wrapStatus != napi_ok) {
        delete data;
        return BoolResult(env, false);
    }
    void *removed = nullptr;
    napi_status removeStatus = napi_remove_wrap_sendable(env, object, &removed);
    bool ok = removeStatus == napi_ok && removed == data && g_finalizeCount.load() == 0;
    delete reinterpret_cast<int32_t *>(removed);
    return BoolResult(env, ok);
}

static napi_value StrongSendableReferenceNormalPath(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_status createObjectStatus = napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
    if (createObjectStatus != napi_ok) {
        return BoolResult(env, false);
    }
    napi_sendable_ref ref = nullptr;
    napi_status createRefStatus = napi_create_strong_sendable_reference(env, object, &ref);
    napi_value refValue = nullptr;
    napi_status getStatus = napi_get_strong_sendable_reference_value(env, ref, &refValue);
    bool same = false;
    napi_strict_equals(env, object, refValue, &same);
    napi_status deleteStatus = napi_delete_strong_sendable_reference(env, ref);
    return BoolResult(env, createRefStatus == napi_ok && getStatus == napi_ok && deleteStatus == napi_ok && same);
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    // 先注册 extra 文件的函数
    InitNapiCoverAddBatch2Extra(env, exports);

    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("deleteReferenceTriggersFinalizer", DeleteReferenceTriggersFinalizer),
        DECLARE_NAPI_FUNCTION("removeWrapCallsFinalizerBeforeRemoving", RemoveWrapCallsFinalizerBeforeRemoving),
        DECLARE_NAPI_FUNCTION("addFinalizerResultReferenceIsStrong", AddFinalizerResultReferenceIsStrong),
        DECLARE_NAPI_FUNCTION("createStrongReferenceKeepsValue", CreateStrongReferenceKeepsValue),
        DECLARE_NAPI_FUNCTION("deleteStrongReferenceOnceWorks", DeleteStrongReferenceOnceWorks),
        DECLARE_NAPI_FUNCTION("getStrongReferenceValueWorksBeforeDelete", GetStrongReferenceValueWorksBeforeDelete),
        DECLARE_NAPI_FUNCTION("wrapEnhanceSyncAndAsyncFinalizerCanBeCreated",
                              WrapEnhanceSyncAndAsyncFinalizerCanBeCreated),
        DECLARE_NAPI_FUNCTION("strongSendableReferenceNormalPath", StrongSendableReferenceNormalPath),
        DECLARE_NAPI_FUNCTION("removeWrapSendableReturnsNativePointerWithoutImmediateFinalizer",
                              RemoveWrapSendableReturnsNativePointerWithoutImmediateFinalizer),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

static napi_module napiCoverAddBatch2Module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "napicoveraddbatch2ndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterNapiCoverAddBatch2Module(void)
{
    napi_module_register(&napiCoverAddBatch2Module);
}
EXTERN_C_END
