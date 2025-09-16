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
#include "InputmethodTextConfigCapiTest.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <inputmethod/inputmethod_text_avoid_info_capi.h>
#include <inputmethod/inputmethod_text_config_capi.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>

void AddInputMethodTextConfigCapiTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextConfigSetInputTypeNullPointer", nullptr, TestOhTextConfigSetInputTypeNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetInputTypeOk", nullptr, TestOhTextConfigSetInputTypeOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetEnterKeyTypeNullPointer", nullptr,
                        TestOhTextConfigSetEnterKeyTypeNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetEnterKeyTypeOk", nullptr, TestOhTextConfigSetEnterKeyTypeOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetPreviewTextSupportNullPointer", nullptr,
                        TestOhTextConfigSetPreviewTextSupportNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextConfigSetPreviewTextSupportOk", nullptr, TestOhTextConfigSetPreviewTextSupportOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetSelectionNullPointer", nullptr, TestOhTextConfigSetSelectionNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetSelectionOk", nullptr, TestOhTextConfigSetSelectionOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetWindowIdNullPointer", nullptr, TestOhTextConfigSetWindowIdNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetWindowIdOk", nullptr, TestOhTextConfigSetWindowIdOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetPlaceholderNullPointer", nullptr, TestOhTextConfigSetPlaceholderNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetPlaceholderOk", nullptr, TestOhTextConfigSetPlaceholderOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetAbilityNameNullPointer", nullptr, TestOhTextConfigSetAbilityNameNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetAbilityNameOk", nullptr, TestOhTextConfigSetAbilityNameOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

void AddInputMethodTextConfigCapiTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextConfigGetInputTypeNullPointer", nullptr, TestOhTextConfigGetInputTypeNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetInputTypeOk", nullptr, TestOhTextConfigGetInputTypeOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetEnterKeyTypeNullPointer", nullptr,
                        TestOhTextConfigGetEnterKeyTypeNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetEnterKeyTypeOk", nullptr, TestOhTextConfigGetEnterKeyTypeOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
}

void AddInputMethodTextConfigCapiTest(std::vector<napi_property_descriptor> &descData)
{
    AddInputMethodTextConfigCapiTest1(descData);
    AddInputMethodTextConfigCapiTest2(descData);
}

napi_value TestOhTextConfigSetInputTypeNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    int ret = OH_TextConfig_SetInputType(nullptr, inputType);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetInputTypeOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    int ret = OH_TextConfig_SetInputType(config, inputType);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetEnterKeyTypeNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    int ret = OH_TextConfig_SetEnterKeyType(nullptr, enterKeyType);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetEnterKeyTypeOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    int ret = OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetPreviewTextSupportNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    bool supported = true;
    int ret = OH_TextConfig_SetPreviewTextSupport(nullptr, supported);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetPreviewTextSupportOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    bool supported = true;
    int ret = OH_TextConfig_SetPreviewTextSupport(config, supported);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetSelectionNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t start = 1;
    int32_t end = 2;
    int ret = OH_TextConfig_SetSelection(nullptr, start, end);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetSelectionOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t start = 1;
    int32_t end = 2;
    int ret = OH_TextConfig_SetSelection(config, start, end);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetWindowIdNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t windowId = 1;
    int ret = OH_TextConfig_SetWindowId(nullptr, windowId);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetWindowIdOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t windowId = 1;
    int ret = OH_TextConfig_SetWindowId(config, windowId);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetPlaceholderNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *placeholder = u"abcdef";
    size_t length = 3;
    int ret = OH_TextConfig_SetPlaceholder(nullptr, placeholder, length);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetPlaceholderOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *placeholder = u"abcdef";
    size_t length = 3;
    int ret = OH_TextConfig_SetPlaceholder(config, placeholder, length);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetAbilityNameNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *abilityName = u"abcdef";
    size_t abilityNameLength = 3;
    int ret = OH_TextConfig_SetAbilityName(nullptr, abilityName, abilityNameLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetAbilityNameOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *abilityName = u"abcdef";
    size_t abilityNameLength = 3;
    int ret = OH_TextConfig_SetAbilityName(config, abilityName, abilityNameLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetInputTypeNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType inputType1;
    int ret = OH_TextConfig_GetInputType(nullptr, &inputType1);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetInputTypeOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType inputType1;
    int ret = OH_TextConfig_GetInputType(config, &inputType1);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetEnterKeyTypeNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType enterKeyType1;
    int ret = OH_TextConfig_GetEnterKeyType(nullptr, &enterKeyType1);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetEnterKeyTypeOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType enterKeyType1;
    int ret = OH_TextConfig_GetEnterKeyType(config, &enterKeyType1);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}