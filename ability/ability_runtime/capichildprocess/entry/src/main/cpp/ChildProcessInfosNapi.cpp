/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
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

#include "ChildProcessInfosNapi.h"

#include <cstdint>
#include <cstring>
#include <unistd.h>
#include <vector>

#include "AbilityKit/ability_runtime/application_context.h"
#include "AbilityKit/ability_runtime/child_process_info.h"
#include "AbilityKit/native_child_process.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "CHILD_INFOS"

namespace {

// G.CNS.02: named lengths for NAPI int arrays returned to Hypium.
constexpr size_t K_ACQUIRE_RESULT_LEN = 2;
constexpr size_t K_QUERY_RESULT_LEN = 9;
constexpr size_t K_PARENT_PID_DETAIL_LEN = 3;
constexpr size_t K_PARENT_PID_ERR_ENUM_LEN = 2;

struct QueryResultFields {
    int32_t acquireCode = 0;
    int32_t count = 0;
    int32_t indexCode = 0;
    int32_t pid = 0;
    int32_t pidCode = 0;
    int32_t nameCode = 0;
    int32_t nameLen = 0;
    int32_t parentPid = 0;
    int32_t parentPidCode = 0;
};

napi_value MakeInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value MakeIntArray(napi_env env, const int32_t *values, size_t len)
{
    napi_value arr = nullptr;
    napi_create_array_with_length(env, len, &arr);
    for (size_t i = 0; i < len; ++i) {
        napi_value item = nullptr;
        napi_create_int32(env, values[i], &item);
        napi_set_element(env, arr, i, item);
    }
    return arr;
}

napi_value MakeAcquirePair(napi_env env, int32_t ret, uint32_t count)
{
    int32_t vals[K_ACQUIRE_RESULT_LEN] = {
        ret,
        static_cast<int32_t>(count),
    };
    return MakeIntArray(env, vals, K_ACQUIRE_RESULT_LEN);
}

napi_value AcquireChildInvalidParam(napi_env env, napi_callback_info info)
{
    (void)info;
    uint32_t count = 0;
    Ability_NativeChildProcess_ErrCode ret =
        OH_Ability_AcquireChildProcessInfos(nullptr, &count);
    return MakeInt32(env, static_cast<int32_t>(ret));
}

napi_value AcquireChildEmpty(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    Ability_NativeChildProcess_ErrCode ret =
        OH_Ability_AcquireChildProcessInfos(&infos, &count);
    OH_LOG_INFO(LOG_APP, "AcquireChild empty ret=%{public}d count=%{public}u",
        ret, count);
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    return MakeAcquirePair(env, static_cast<int32_t>(ret), count);
}

napi_value AcquireUIAbilityInvalidParam(napi_env env, napi_callback_info info)
{
    (void)info;
    uint32_t count = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_AcquireUIAbilityChildProcessInfos(nullptr, &count);
    return MakeInt32(env, static_cast<int32_t>(ret));
}

napi_value AcquireUIAbilityEmpty(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_AcquireUIAbilityChildProcessInfos(&infos, &count);
    OH_LOG_INFO(LOG_APP, "AcquireUIAbility empty ret=%{public}d count=%{public}u",
        ret, count);
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    return MakeAcquirePair(env, static_cast<int32_t>(ret), count);
}

napi_value GetInfoByIndexInvalid(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfoHandle child = nullptr;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_GetChildProcessInfoByIndex(nullptr, 0, &child);
    return MakeInt32(env, static_cast<int32_t>(ret));
}

napi_value GetPidInvalid(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t pid = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ChildProcessInfo_GetPid(nullptr, &pid);
    return MakeInt32(env, static_cast<int32_t>(ret));
}

napi_value GetParentPidInvalid(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t parentPid = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ChildProcessInfo_GetParentPid(nullptr, &parentPid);
    return MakeInt32(env, static_cast<int32_t>(ret));
}

napi_value GetParentPidBothNull(napi_env env, napi_callback_info info)
{
    (void)info;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ChildProcessInfo_GetParentPid(nullptr, nullptr);
    return MakeInt32(env, static_cast<int32_t>(ret));
}

napi_value GetParentPidErrorEnums(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t vals[K_PARENT_PID_ERR_ENUM_LEN] = {
        static_cast<int32_t>(ABILITY_RUNTIME_ERROR_CODE_NO_ERROR),
        static_cast<int32_t>(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID),
    };
    return MakeIntArray(env, vals, K_PARENT_PID_ERR_ENUM_LEN);
}

napi_value GetProcessNameInvalid(napi_env env, napi_callback_info info)
{
    (void)info;
    char buf[8] = {0};
    uint32_t required = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ChildProcessInfo_GetProcessName(
            nullptr, buf, sizeof(buf), &required);
    return MakeInt32(env, static_cast<int32_t>(ret));
}

napi_value ReleaseInfosNull(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    OH_AbilityRuntime_ReleaseChildProcessInfos(nullptr);
    return MakeInt32(env, 0);
}

AbilityRuntime_ErrorCode FillProcessName(
    OH_AbilityRuntime_ChildProcessInfoHandle child,
    std::vector<char> &nameBuf, uint32_t &required)
{
    required = 0;
    char probe[2] = {0};
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ChildProcessInfo_GetProcessName(
            child, probe, sizeof(probe), &required);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_BUFFER_TOO_SMALL && required > 0) {
        nameBuf.assign(required, '\0');
        ret = OH_AbilityRuntime_ChildProcessInfo_GetProcessName(
            child, nameBuf.data(), required, &required);
    } else if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        nameBuf.assign(probe, probe + std::strlen(probe) + 1);
        required = static_cast<uint32_t>(nameBuf.size());
    }
    return ret;
}

napi_value BuildQueryResult(napi_env env, const QueryResultFields &fields)
{
    int32_t vals[K_QUERY_RESULT_LEN] = {
        fields.acquireCode,
        fields.count,
        fields.indexCode,
        fields.pid,
        fields.pidCode,
        fields.nameCode,
        fields.nameLen,
        fields.parentPid,
        fields.parentPidCode,
    };
    return MakeIntArray(env, vals, K_QUERY_RESULT_LEN);
}

void FillChildInfoFields(
    OH_AbilityRuntime_ChildProcessInfoHandle child, QueryResultFields &fields)
{
    fields.pidCode = OH_AbilityRuntime_ChildProcessInfo_GetPid(child, &fields.pid);
    fields.parentPidCode = OH_AbilityRuntime_ChildProcessInfo_GetParentPid(
        child, &fields.parentPid);
    std::vector<char> nameBuf;
    uint32_t required = 0;
    fields.nameCode = FillProcessName(child, nameBuf, required);
    fields.nameLen = static_cast<int32_t>(required);
}

napi_value QueryNativeChildInfos(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    Ability_NativeChildProcess_ErrCode acq =
        OH_Ability_AcquireChildProcessInfos(&infos, &count);
    QueryResultFields fields;
    fields.acquireCode = static_cast<int32_t>(acq);
    fields.count = static_cast<int32_t>(count);
    fields.indexCode = -1;
    fields.pidCode = -1;
    fields.nameCode = -1;
    fields.parentPidCode = -1;
    if (acq == NCP_NO_ERROR && infos != nullptr && count > 0) {
        OH_AbilityRuntime_ChildProcessInfoHandle child = nullptr;
        fields.indexCode = OH_AbilityRuntime_GetChildProcessInfoByIndex(
            infos, 0, &child);
        if (fields.indexCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR &&
            child != nullptr) {
            FillChildInfoFields(child, fields);
        }
    }
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    return BuildQueryResult(env, fields);
}

napi_value QueryUIAbilityChildInfos(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    AbilityRuntime_ErrorCode acq =
        OH_AbilityRuntime_AcquireUIAbilityChildProcessInfos(&infos, &count);
    QueryResultFields fields;
    fields.acquireCode = static_cast<int32_t>(acq);
    fields.count = static_cast<int32_t>(count);
    fields.indexCode = -1;
    fields.pidCode = -1;
    fields.nameCode = -1;
    fields.parentPidCode = -1;
    if (acq == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && infos != nullptr &&
        count > 0) {
        OH_AbilityRuntime_ChildProcessInfoHandle child = nullptr;
        fields.indexCode = OH_AbilityRuntime_GetChildProcessInfoByIndex(
            infos, 0, &child);
        if (fields.indexCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR &&
            child != nullptr) {
            FillChildInfoFields(child, fields);
        }
    }
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    return BuildQueryResult(env, fields);
}

napi_value GetParentPidNullOut(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    Ability_NativeChildProcess_ErrCode acq =
        OH_Ability_AcquireChildProcessInfos(&infos, &count);
    int32_t result = static_cast<int32_t>(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    if (acq == NCP_NO_ERROR && infos != nullptr && count > 0) {
        OH_AbilityRuntime_ChildProcessInfoHandle child = nullptr;
        AbilityRuntime_ErrorCode idx =
            OH_AbilityRuntime_GetChildProcessInfoByIndex(infos, 0, &child);
        if (idx == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && child != nullptr) {
            result = OH_AbilityRuntime_ChildProcessInfo_GetParentPid(
                child, nullptr);
        }
    }
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    return MakeInt32(env, result);
}

napi_value QueryParentPidDetail(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    Ability_NativeChildProcess_ErrCode acq =
        OH_Ability_AcquireChildProcessInfos(&infos, &count);
    int32_t code = static_cast<int32_t>(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    int32_t parentPid = 0;
    int32_t selfPid = static_cast<int32_t>(getpid());
    if (acq == NCP_NO_ERROR && infos != nullptr && count > 0) {
        OH_AbilityRuntime_ChildProcessInfoHandle child = nullptr;
        AbilityRuntime_ErrorCode idx =
            OH_AbilityRuntime_GetChildProcessInfoByIndex(infos, 0, &child);
        if (idx == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && child != nullptr) {
            code = OH_AbilityRuntime_ChildProcessInfo_GetParentPid(
                child, &parentPid);
        }
    }
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    int32_t vals[K_PARENT_PID_DETAIL_LEN] = { code, parentPid, selfPid };
    return MakeIntArray(env, vals, K_PARENT_PID_DETAIL_LEN);
}

napi_value GetProcessNameBufferTooSmall(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    Ability_NativeChildProcess_ErrCode acq =
        OH_Ability_AcquireChildProcessInfos(&infos, &count);
    int32_t result = static_cast<int32_t>(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    if (acq == NCP_NO_ERROR && infos != nullptr && count > 0) {
        OH_AbilityRuntime_ChildProcessInfoHandle child = nullptr;
        AbilityRuntime_ErrorCode idx =
            OH_AbilityRuntime_GetChildProcessInfoByIndex(infos, 0, &child);
        if (idx == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && child != nullptr) {
            char tiny[1] = {0};
            uint32_t required = 0;
            result = OH_AbilityRuntime_ChildProcessInfo_GetProcessName(
                child, tiny, sizeof(tiny), &required);
        }
    }
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    return MakeInt32(env, result);
}

} // namespace

void RegisterChildProcessInfosNapi(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "acquireChildProcessInfosInvalidParam", nullptr,
            AcquireChildInvalidParam, nullptr, nullptr, nullptr, napi_default,
            nullptr },
        { "acquireChildProcessInfosEmpty", nullptr, AcquireChildEmpty, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "acquireUIAbilityChildProcessInfosInvalidParam", nullptr,
            AcquireUIAbilityInvalidParam, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "acquireUIAbilityChildProcessInfosEmpty", nullptr,
            AcquireUIAbilityEmpty, nullptr, nullptr, nullptr, napi_default,
            nullptr },
        { "getChildProcessInfoByIndexInvalid", nullptr, GetInfoByIndexInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "childProcessInfoGetPidInvalid", nullptr, GetPidInvalid, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "childProcessInfoGetParentPidInvalid", nullptr, GetParentPidInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "childProcessInfoGetParentPidBothNull", nullptr, GetParentPidBothNull,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "childProcessInfoGetParentPidErrorEnums", nullptr,
            GetParentPidErrorEnums, nullptr, nullptr, nullptr, napi_default,
            nullptr },
        { "childProcessInfoGetParentPidNullOut", nullptr, GetParentPidNullOut,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queryChildProcessInfoParentPid", nullptr, QueryParentPidDetail,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "childProcessInfoGetProcessNameInvalid", nullptr,
            GetProcessNameInvalid, nullptr, nullptr, nullptr, napi_default,
            nullptr },
        { "releaseChildProcessInfosNull", nullptr, ReleaseInfosNull, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "queryNativeChildProcessInfos", nullptr, QueryNativeChildInfos,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queryUIAbilityChildProcessInfos", nullptr, QueryUIAbilityChildInfos,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "childProcessInfoGetProcessNameBufferTooSmall", nullptr,
            GetProcessNameBufferTooSmall, nullptr, nullptr, nullptr,
            napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}
