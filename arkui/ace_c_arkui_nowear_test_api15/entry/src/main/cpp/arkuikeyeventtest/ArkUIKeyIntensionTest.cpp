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

#include "ArkUIKeyEventTest.h"
#include "common/KeyEventCommon.h"

namespace ArkUIKeyEventTest {
std::unordered_map<ArkUI_KeyIntension, int32_t> g_keyIntensionMap;
static int32_t g_lastKeyCode = -1;

static const int32_t AXIS_VALUE_COUNT = 8;
static const int32_t AXIS_INDEX_HAT_X = 6;
static const int32_t AXIS_INDEX_HAT_Y = 7;
static const int32_t AXIS_INDEX_GAS = 4;
static const int32_t AXIS_INDEX_BRAKE = 5;

void UIInputEventCallback2(ArkUI_NodeEvent* event)
{
    ArkUI_UIInputEvent* uiEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    ArkUI_KeyIntension KeyIntensionType = OH_ArkUI_KeyEvent_GetKeyIntensionCode(uiEvent);
    g_lastKeyCode = OH_ArkUI_KeyEvent_GetKeyCode(uiEvent);
    if (g_keyIntensionMap.count(KeyIntensionType) == 0) {
        g_keyIntensionMap.insert({KeyIntensionType, KeyIntensionType});
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "UIInputEventCallback2",
                 "OnUIInputEventCallback2: %{public}d, keyCode: %{public}d",
                 KeyIntensionType, g_lastKeyCode);
    return;
}

napi_value CreateNativeNode2(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    ArkUI_NativeNodeAPI_1* nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto component = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    nodeAPI->registerNodeEvent(component, NODE_ON_KEY_EVENT, 0, nullptr);
    int32_t setResult = nodeAPI->addNodeEventReceiver(component, UIInputEventCallback2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNode2", "CreateNativeNode2: %{public}d", setResult);
    ArkUI_NumberValue FocusValue[] = {{.i32 = 1}};
    ArkUI_AttributeItem FocusItem = {FocusValue, 1};
    nodeAPI->setAttribute(component, NODE_FOCUSABLE, &FocusItem);
    nodeAPI->setAttribute(component, NODE_DEFAULT_FOCUS, &FocusItem);
    int32_t ret = OH_ArkUI_NodeContent_AddNode(nodeContentHandle_, component);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeAttach", "setUserData failed error=%{public}d", ret);
    return nullptr;
}

ArkUI_KeyIntension CheckKeyIntension2(int32_t KeyIntension)
{
    if (KeyIntension == ARKUI_KEY_INTENSION_PAGE_DOWN ||
        KeyIntension == ARKUI_KEY_INTENSION_ZOOM_OUT ||
        KeyIntension == ARKUI_KEY_INTENSION_ZOOM_IN ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_PLAY_PAUSE ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_FAST_FORWARD ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_FAST_PLAYBACK ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_NEXT ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_PREVIOUS ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_MUTE ||
        KeyIntension == ARKUI_KEY_INTENTION_VOLUME_UP ||
        KeyIntension == ARKUI_KEY_INTENTION_VOLUME_DOWN ||
        KeyIntension == ARKUI_KEY_INTENTION_CALL ||
        KeyIntension == ARKUI_KEY_INTENTION_CAMERA) {
        return ArkUI_KeyIntension(KeyIntension);
    } else {
        return ArkUI_KeyIntension(PARAM_NEGATIVE_2);
    }
}

ArkUI_KeyIntension CheckKeyIntension1(int32_t KeyIntension)
{
    if (KeyIntension == ARKUI_KEY_INTENSION_UNKNOWN ||
        KeyIntension == ARKUI_KEY_INTENSION_UP ||
        KeyIntension == ARKUI_KEY_INTENSION_DOWN ||
        KeyIntension == ARKUI_KEY_INTENSION_LEFT ||
        KeyIntension == ARKUI_KEY_INTENSION_RIGHT ||
        KeyIntension == ARKUI_KEY_INTENSION_SELECT ||
        KeyIntension == ARKUI_KEY_INTENSION_ESCAPE ||
        KeyIntension == ARKUI_KEY_INTENSION_BACK ||
        KeyIntension == ARKUI_KEY_INTENSION_FORWARD ||
        KeyIntension == ARKUI_KEY_INTENSION_MENU ||
        KeyIntension == ARKUI_KEY_INTENSION_HOME ||
        KeyIntension == ARKUI_KEY_INTENSION_PAGE_UP) {
        return ArkUI_KeyIntension(KeyIntension);
    } else {
        return CheckKeyIntension2(KeyIntension);
    }
}

napi_value GetKeyIntensionType(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t getParam;
    napi_get_value_int32(env, args[0], &getParam);
    ArkUI_KeyIntension KeyIntensionType = CheckKeyIntension1(getParam);
    if (g_keyIntensionMap.count(KeyIntensionType) == 1) {
        napi_create_int32(env, 1, &args[0]);
    } else {
        napi_create_int32(env, 0, &args[0]);
    }
    g_keyIntensionMap.clear();
    return args[0];
}

napi_value GetLastKeyCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, g_lastKeyCode, &result);
    g_lastKeyCode = -1;
    return result;
}

static double g_axisValues[AXIS_VALUE_COUNT] = {0, 0, 0, 0, 0, 0, 0, 0};

void GameControllerKeyCallback(ArkUI_NodeEvent* event)
{
    ArkUI_UIInputEvent* uiEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    g_lastKeyCode = OH_ArkUI_KeyEvent_GetKeyCode(uiEvent);
    for (int i = 0; i < AXIS_VALUE_COUNT; i++) {
        g_axisValues[i] = OH_ArkUI_FocusAxisEvent_GetAxisValue(uiEvent, i);
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GameController",
                 "keyCode=%{public}d, hat0X=%{public}f, hat0Y=%{public}f, gas=%{public}f, brake=%{public}f",
                 g_lastKeyCode, g_axisValues[AXIS_INDEX_HAT_X], g_axisValues[AXIS_INDEX_HAT_Y],
                 g_axisValues[AXIS_INDEX_GAS], g_axisValues[AXIS_INDEX_BRAKE]);
}

napi_value SetupGameController(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        return nullptr;
    }
    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    ArkUI_NodeHandle handle = nullptr;
    int32_t ret = OH_ArkUI_GetNodeHandleFromNapiValue(env, args[0], &handle);
    if (ret != 0 || handle == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GameController",
                     "GetNodeHandleFromNapiValue failed: %{public}d", ret);
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (nodeAPI == nullptr) {
        return nullptr;
    }

    ArkUI_NumberValue focusValue[] = {{.i32 = 1}};
    ArkUI_AttributeItem focusItem = {focusValue, 1};
    nodeAPI->setAttribute(handle, NODE_FOCUSABLE, &focusItem);
    nodeAPI->setAttribute(handle, NODE_DEFAULT_FOCUS, &focusItem);
    nodeAPI->registerNodeEvent(handle, NODE_ON_KEY_EVENT, 0, nullptr);
    nodeAPI->addNodeEventReceiver(handle, GameControllerKeyCallback);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GameController", "SetupGameController success");
    return nullptr;
}

napi_value GetLastAxisValue(napi_env env, napi_callback_info info)
{
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr);
    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t axisType = 0;
    napi_get_value_int32(env, args[0], &axisType);
    if (axisType < 0 || axisType >= AXIS_VALUE_COUNT) {
        napi_throw_type_error(env, NULL, "axisType out of range");
        return nullptr;
    }
    napi_value result = nullptr;
    napi_create_double(env, g_axisValues[axisType], &result);
    return result;
}
}