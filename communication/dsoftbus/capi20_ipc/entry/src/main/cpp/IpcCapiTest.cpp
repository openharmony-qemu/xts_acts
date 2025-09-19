/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <IPCKit/ipc_kit.h>
#include <IPCKit/ipc_cparcel.h>
#include <bits/alltypes.h>
#include <fcntl.h>
#include <future>
#include <thread>
#include <cinttypes>
#include <cstring>
#include <cstdlib>
#include "AbilityKit/native_child_process.h"
#include <hilog/log.h>

static const char *TEST_STR = "STUB_DESCRIPTOR";

int OnRemoteRequestStub(uint32_t code, const OHIPCParcel *data, OHIPCParcel *reply,
    void *userData)
{
    (void)userData;
    (void)code;
    (void)data;
    (void)reply;
    return 0;
}

void OnRemoteDestroyCallback(void *userData)
{
    (void)userData;
}

static napi_value OHIPCParcelRewindReadPositionParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = nullptr;
    uint32_t newPosition = 0;
    int ret = OH_IPCParcel_RewindReadPosition(parcel, newPosition);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelRewindWritePositionParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = nullptr;
    uint32_t newPosition = 0;
    int ret = OH_IPCParcel_RewindWritePosition(parcel, newPosition);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt8WriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    uint32_t val = 0;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_WriteInt8(parcel, val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt8ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    uint32_t val = 0;
    int ret = OH_IPCParcel_WriteInt8(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt8ReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int8_t val = 0;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_ReadInt8(parcel, &val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt8ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int8_t val = 0;
    int ret = OH_IPCParcel_ReadInt8(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt16WriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int16_t val = 0;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_WriteInt16(parcel, val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt16ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int16_t val = 0;
    int ret = OH_IPCParcel_WriteInt16(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt16ReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int16_t val = 0;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_ReadInt16(parcel, &val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt16ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int16_t val = 0;
    int ret = OH_IPCParcel_ReadInt16(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt32WriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t val = 0;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_WriteInt32(parcel, val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt32ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t val = 0;
    int ret = OH_IPCParcel_WriteInt32(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt32ReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t val = 0;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_ReadInt32(parcel, &val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt32ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t val = 0;
    int ret = OH_IPCParcel_ReadInt32(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt64WriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int64_t val = 0;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_WriteInt64(parcel, val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt64ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int64_t val = 0;
    int ret = OH_IPCParcel_WriteInt64(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt64ReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int64_t val = 0;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_ReadInt64(parcel, &val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt64ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int64_t val = 0;
    int ret = OH_IPCParcel_ReadInt64(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteFloatWriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    float val = 0.0f;
    OH_IPCParcel_Destroy(parcel);
    int ret = OH_IPCParcel_WriteFloat(parcel, val);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteFloatParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    float val = 0.0f;
    int ret = OH_IPCParcel_WriteFloat(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

napi_property_descriptor desc[] = {
    {"OHIPCParcelRewindReadPositionParamError", nullptr, OHIPCParcelRewindReadPositionParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelRewindWritePositionParamError", nullptr, OHIPCParcelRewindWritePositionParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt8WriteError", nullptr, OHIPCParcelWriteInt8WriteError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt8ParamError", nullptr, OHIPCParcelWriteInt8ParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInt8ReadError", nullptr, OHIPCParcelReadInt8ReadError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInt8ParamError", nullptr, OHIPCParcelReadInt8ParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt16WriteError", nullptr, OHIPCParcelWriteInt16WriteError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt16ParamError", nullptr, OHIPCParcelWriteInt16ParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInt16ReadError", nullptr, OHIPCParcelReadInt16ReadError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInt16ParamError", nullptr, OHIPCParcelReadInt16ParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt32WriteError", nullptr, OHIPCParcelWriteInt32WriteError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt32ParamError", nullptr, OHIPCParcelWriteInt32ParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInt32ReadError", nullptr, OHIPCParcelReadInt32ReadError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInt32ParamError", nullptr, OHIPCParcelReadInt32ParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt64WriteError", nullptr, OHIPCParcelWriteInt64WriteError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt64ParamError", nullptr, OHIPCParcelWriteInt64ParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInt64ReadError", nullptr, OHIPCParcelReadInt64ReadError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInt64ParamError", nullptr, OHIPCParcelReadInt64ParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteFloatWriteError", nullptr, OHIPCParcelWriteFloatWriteError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteFloatParamError", nullptr, OHIPCParcelWriteFloatParamError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    };

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "IPC20CApi",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}