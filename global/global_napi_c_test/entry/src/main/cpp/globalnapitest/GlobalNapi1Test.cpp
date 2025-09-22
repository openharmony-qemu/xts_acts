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

#include <globalnapitest/GlobalNapiTest.h>

namespace GlobalNapiTest {
static NativeResourceManager* g_mNativeResMgr;
napi_value GetResourceManager(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    g_mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}

napi_value GetMediaBase640100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase640100", "GetMediaBase640100: %{public}d", id);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64(g_mNativeResMgr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaBase640200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase640200", "GetMediaBase640200: %{public}d", id);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64(nullptr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetMediaBase640300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase640300", "GetMediaBase640300: %{public}d", id);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64(g_mNativeResMgr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND : -1, &value);
    return value;
}

napi_value GetMediaBase64Data0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase64Data0100", "GetMediaBase64Data0100: %{public}d", id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64Data(g_mNativeResMgr, hexValue, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaBase64Data0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase64Data0200", "GetMediaBase64Data0200: %{public}d", id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64Data(nullptr, hexValue, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetMediaBase64Data0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase64Data0300", "GetMediaBase64Data0300: %{public}d", id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64Data(g_mNativeResMgr, hexValue, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND : -1, &value);
    return value;
}

}