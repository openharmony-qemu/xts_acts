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
    int32_t vals[2] = { static_cast<int32_t>(ret), static_cast<int32_t>(count) };
    return MakeIntArray(env, vals, 2);
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
    int32_t vals[2] = { static_cast<int32_t>(ret), static_cast<int32_t>(count) };
    return MakeIntArray(env, vals, 2);
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

napi_value BuildQueryResult(napi_env env, int32_t acquireCode, uint32_t count,
    int32_t indexCode, int32_t pid, int32_t pidCode, int32_t nameCode,
    int32_t nameLen)
{
    int32_t vals[7] = {
        acquireCode,
        static_cast<int32_t>(count),
        indexCode,
        pid,
        pidCode,
        nameCode,
        nameLen,
    };
    return MakeIntArray(env, vals, 7);
}

napi_value QueryNativeChildInfos(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    Ability_NativeChildProcess_ErrCode acq =
        OH_Ability_AcquireChildProcessInfos(&infos, &count);
    int32_t indexCode = -1;
    int32_t pid = 0;
    int32_t pidCode = -1;
    int32_t nameCode = -1;
    int32_t nameLen = 0;
    if (acq == NCP_NO_ERROR && infos != nullptr && count > 0) {
        OH_AbilityRuntime_ChildProcessInfoHandle child = nullptr;
        indexCode = OH_AbilityRuntime_GetChildProcessInfoByIndex(
            infos, 0, &child);
        if (indexCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && child != nullptr) {
            pidCode = OH_AbilityRuntime_ChildProcessInfo_GetPid(child, &pid);
            std::vector<char> nameBuf;
            uint32_t required = 0;
            nameCode = FillProcessName(child, nameBuf, required);
            nameLen = static_cast<int32_t>(required);
        }
    }
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    return BuildQueryResult(env, static_cast<int32_t>(acq), count, indexCode, pid,
        pidCode, nameCode, nameLen);
}

napi_value QueryUIAbilityChildInfos(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AbilityRuntime_ChildProcessInfosHandle infos = nullptr;
    uint32_t count = 0;
    AbilityRuntime_ErrorCode acq =
        OH_AbilityRuntime_AcquireUIAbilityChildProcessInfos(&infos, &count);
    int32_t indexCode = -1;
    int32_t pid = 0;
    int32_t pidCode = -1;
    int32_t nameCode = -1;
    int32_t nameLen = 0;
    if (acq == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && infos != nullptr &&
        count > 0) {
        OH_AbilityRuntime_ChildProcessInfoHandle child = nullptr;
        indexCode = OH_AbilityRuntime_GetChildProcessInfoByIndex(
            infos, 0, &child);
        if (indexCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && child != nullptr) {
            pidCode = OH_AbilityRuntime_ChildProcessInfo_GetPid(child, &pid);
            std::vector<char> nameBuf;
            uint32_t required = 0;
            nameCode = FillProcessName(child, nameBuf, required);
            nameLen = static_cast<int32_t>(required);
        }
    }
    if (infos != nullptr) {
        OH_AbilityRuntime_ReleaseChildProcessInfos(&infos);
    }
    return BuildQueryResult(env, static_cast<int32_t>(acq), count, indexCode, pid,
        pidCode, nameCode, nameLen);
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
