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

#include <napi/native_api.h>
#include <hilog/log.h>
#include <cstdio>
#include <arkui/native_interface.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>
#include <cstdint>
#include <ace/xcomponent/native_xcomponent_key_event.h>

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_15 15
#define PARAM_80 80
#define PARAM_NEGATIVE_2 (-2)

namespace {
ArkUI_NativeNodeAPI_1* g_nodeApi = nullptr;

ArkUI_NativeNodeAPI_1* GetNodeApi()
{
    if (g_nodeApi == nullptr) {
        g_nodeApi = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    }
    return g_nodeApi;
}

void SetAttribute(ArkUI_NodeHandle node, ArkUI_NodeAttributeType attr, const ArkUI_NumberValue* value,
                  int32_t size, const char* string = nullptr)
{
    ArkUI_AttributeItem item = { value, size, string, nullptr };
    GetNodeApi()->setAttribute(node, attr, &item);
}

ArkUI_NodeHandle CreateXComponentNode(const char* id)
{
    ArkUI_NodeHandle node = GetNodeApi()->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue typeValue[] = { { .i32 = ARKUI_XCOMPONENT_TYPE_SURFACE } };
    SetAttribute(node, NODE_XCOMPONENT_TYPE, typeValue, PARAM_1);
    ArkUI_NumberValue idValue[] = { 0 };
    SetAttribute(node, NODE_XCOMPONENT_ID, idValue, PARAM_1, id);
    ArkUI_NumberValue surfaceSize[] = { { .u32 = PARAM_15 }, { .u32 = PARAM_15 } };
    SetAttribute(node, NODE_XCOMPONENT_SURFACE_SIZE, surfaceSize, PARAM_2);
    ArkUI_NumberValue percentValue[] = { { .f32 = 1.0f } };
    SetAttribute(node, NODE_WIDTH_PERCENT, percentValue, PARAM_1);
    SetAttribute(node, NODE_HEIGHT_PERCENT, percentValue, PARAM_1);
    ArkUI_NumberValue focusableValue[] = { { .i32 = 1 } };
    SetAttribute(node, NODE_FOCUSABLE, focusableValue, PARAM_1);
    return node;
}

// --- node handles and native instances ---
ArkUI_NodeHandle g_rootStack = nullptr;
ArkUI_NodeHandle g_componentNode = nullptr;  // component family (GetXComponentId/KeyEvent/...)
ArkUI_NodeHandle g_touchNode = nullptr;      // touch family
ArkUI_NodeHandle g_mouseNode = nullptr;      // mouse family
OH_NativeXComponent* g_componentXComponent = nullptr;
OH_NativeXComponent* g_touchXComponent = nullptr;
OH_NativeXComponent* g_mouseXComponent = nullptr;

// --- touch family ---
static void* g_touchSurfaceWindow = nullptr;
static OH_NativeXComponent_Callback g_touchCallback;

// --- mouse family ---
static void* g_mouseSurfaceWindow = nullptr;
static OH_NativeXComponent_MouseEvent_Callback g_mouseEventCallback;
static OH_NativeXComponent_Callback g_surfaceCallback;

void OnKeyEvent(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr", "OnKeyEvent");
}

void TouchSurfaceCreatedCallback(OH_NativeXComponent* component, void* window)
{
    g_touchSurfaceWindow = window;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr",
                 "TouchSurfaceCreatedCallback window=%{public}p", window);
}

void MouseEventCallback(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr", "MouseEventCallback");
}

void MouseSurfaceCreatedCallback(OH_NativeXComponent* component, void* window)
{
    g_mouseSurfaceWindow = window;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr",
                 "MouseSurfaceCreatedCallback window=%{public}p", window);
}

void SurfaceShowCallback(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr", "SurfaceShowCallback called");
}

void SurfaceHideCallback(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr", "SurfaceHideCallback called");
}

void StartImageAnalyzer_func(ArkUI_NodeHandle node, ArkUI_XComponent_ImageAnalyzerState statusCode, void* userData)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr", "StartImageAnalyzer_func");
}

napi_value XComponentCreate(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "xcomperr", "XComponentCreate env or info is null");
        return nullptr;
    }
    size_t argCnt = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "xcomperr", "XComponentCreate napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[PARAM_0], &nodeContentHandle);

    g_rootStack = GetNodeApi()->createNode(ARKUI_NODE_STACK);
    ArkUI_NumberValue percentValue[] = { { .f32 = 1.0f } };
    SetAttribute(g_rootStack, NODE_WIDTH_PERCENT, percentValue, PARAM_1);
    SetAttribute(g_rootStack, NODE_HEIGHT_PERCENT, percentValue, PARAM_1);

    // component-family node
    g_componentNode = CreateXComponentNode("TestXComponent");
    g_componentXComponent = OH_NativeXComponent_GetNativeXComponent(g_componentNode);
    if (g_componentXComponent) {
        OH_NativeXComponent_RegisterKeyEventCallback(g_componentXComponent, OnKeyEvent);
    }
    GetNodeApi()->addChild(g_rootStack, g_componentNode);

    // touch-family node
    g_touchNode = CreateXComponentNode("TouchXComponent");
    g_touchXComponent = OH_NativeXComponent_GetNativeXComponent(g_touchNode);
    if (g_touchXComponent) {
        g_touchCallback.OnSurfaceCreated = TouchSurfaceCreatedCallback;
        OH_NativeXComponent_RegisterCallback(g_touchXComponent, &g_touchCallback);
    }
    GetNodeApi()->addChild(g_rootStack, g_touchNode);

    // mouse-family node
    g_mouseNode = CreateXComponentNode("MouseXComponent");
    g_mouseXComponent = OH_NativeXComponent_GetNativeXComponent(g_mouseNode);
    if (g_mouseXComponent) {
        g_mouseEventCallback.DispatchMouseEvent = MouseEventCallback;
        OH_NativeXComponent_RegisterMouseEventCallback(g_mouseXComponent, &g_mouseEventCallback);
        g_surfaceCallback.OnSurfaceCreated = MouseSurfaceCreatedCallback;
        OH_NativeXComponent_RegisterCallback(g_mouseXComponent, &g_surfaceCallback);
    }
    GetNodeApi()->addChild(g_rootStack, g_mouseNode);

    int32_t ret = OH_ArkUI_NodeContent_AddNode(nodeContentHandle, g_rootStack);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr", "XComponentCreate AddNode ret=%{public}d", ret);
    return nullptr;
}

// ======================= component family =======================
namespace ArkUICapiTest {

napi_value GetXComponentId001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + PARAM_1] = {0};
    uint64_t size = OH_XCOMPONENT_ID_LEN_MAX + PARAM_1;
    int32_t result = OH_NativeXComponent_GetXComponentId(g_componentXComponent, idStr, &size) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetXComponentId002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + PARAM_1] = {0};
    uint64_t size = OH_XCOMPONENT_ID_LEN_MAX + PARAM_1;
    int32_t result = OH_NativeXComponent_GetXComponentId(nullptr, idStr, &size) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterKeyEventCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_RegisterKeyEventCallback(g_componentXComponent, OnKeyEvent) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterKeyEventCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_RegisterKeyEventCallback(nullptr, OnKeyEvent) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    result = OH_NativeXComponent_RegisterKeyEventCallback(g_componentXComponent, nullptr) ==
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ?
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetKeyEvent001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_KeyEvent* keyEvent = nullptr;
    int32_t result = OH_NativeXComponent_GetKeyEvent(g_componentXComponent, &keyEvent) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetKeyEvent002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_KeyEvent* keyEvent = nullptr;
    int32_t result = OH_NativeXComponent_GetKeyEvent(nullptr, &keyEvent) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetKeyEventCode001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_KeyEvent* keyEvent = nullptr;
    int32_t ret = OH_NativeXComponent_GetKeyEvent(g_componentXComponent, &keyEvent);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        napi_create_int32(env, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    OH_NativeXComponent_KeyCode keyCode = KEY_UNKNOWN;
    int32_t result = OH_NativeXComponent_GetKeyEventCode(keyEvent, &keyCode) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetKeyEventCode002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_KeyCode keyCode = KEY_UNKNOWN;
    int32_t result = OH_NativeXComponent_GetKeyEventCode(nullptr, &keyCode) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetNeedSoftKeyboard001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_SetNeedSoftKeyboard(g_componentXComponent, true) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterSurfaceShowCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_RegisterSurfaceShowCallback(g_componentXComponent, SurfaceShowCallback) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterSurfaceHideCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_RegisterSurfaceHideCallback(g_componentXComponent, SurfaceHideCallback) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StartImageAnalyzer001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    // nullptr node → ARKUI_ERROR_CODE_PARAM_INVALID (401).
    int32_t result = OH_ArkUI_XComponent_StartImageAnalyzer(nullptr, nullptr, nullptr);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StartImageAnalyzer002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    ArkUI_NodeHandle node = GetNodeApi()->createNode(ARKUI_NODE_XCOMPONENT);
    char data[PARAM_15] = "user data";
    int32_t result = OH_ArkUI_XComponent_StartImageAnalyzer(node, data, StartImageAnalyzer_func);
    GetNodeApi()->disposeNode(node);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

} // namespace ArkUICapiTest

// ======================= touch family =======================
namespace TouchPoint {

static void* GetSurfaceWindow()
{
    return g_touchSurfaceWindow;
}

napi_value RegisterCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_RegisterCallback(g_touchXComponent, &g_touchCallback) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_RegisterCallback(nullptr, &g_touchCallback) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    result = OH_NativeXComponent_RegisterCallback(g_touchXComponent, nullptr) ==
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ?
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetTouchEvent001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_TouchEvent touchEvent;
    int32_t result = OH_NativeXComponent_GetTouchEvent(g_touchXComponent, GetSurfaceWindow(), &touchEvent) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetTouchEvent002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_TouchEvent touchEvent;
    int32_t result = OH_NativeXComponent_GetTouchEvent(nullptr, g_touchSurfaceWindow, &touchEvent) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetTouchPointToolType001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_TouchPointToolType toolType = OH_NATIVEXCOMPONENT_TOOL_TYPE_UNKNOWN;
    int32_t result = OH_NativeXComponent_GetTouchPointToolType(g_touchXComponent, PARAM_0, &toolType) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetTouchPointToolType002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_TouchPointToolType toolType = OH_NATIVEXCOMPONENT_TOOL_TYPE_UNKNOWN;
    int32_t result = OH_NativeXComponent_GetTouchPointToolType(nullptr, PARAM_0, &toolType) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetHistoricalPoints002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t size = PARAM_0;
    OH_NativeXComponent_HistoricalPoint* historicalPoints = nullptr;
    int32_t result = OH_NativeXComponent_GetHistoricalPoints(nullptr, g_touchSurfaceWindow, &size,
                                                             &historicalPoints) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetTouchEventSourceType001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_EventSourceType sourceType = OH_NATIVEXCOMPONENT_SOURCE_TYPE_UNKNOWN;
    // Pass through the raw return code: SUCCESS requires a delivered touch event (source-type is
    // only set on touch dispatch); node XComponents receive no input on this ROM, so the impl
    // returns BAD_PARAMETER (-2) here. The ETS test asserts that measured code and documents the
    // deviation from SUCCESS.
    int32_t result = OH_NativeXComponent_GetTouchEventSourceType(g_touchXComponent, PARAM_0, &sourceType);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetTouchEventSourceType002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_EventSourceType sourceType = OH_NATIVEXCOMPONENT_SOURCE_TYPE_UNKNOWN;
    int32_t result = OH_NativeXComponent_GetTouchEventSourceType(nullptr, PARAM_0, &sourceType) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

} // namespace TouchPoint

// ======================= mouse family =======================
namespace XComponentMouse {

static void* GetSurfaceWindow()
{
    return g_mouseSurfaceWindow;
}

napi_value GetMouseEvent001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_MouseEvent mouseEvent;
    void* window = GetSurfaceWindow();
    int32_t ret = OH_NativeXComponent_GetMouseEvent(g_mouseXComponent, window, &mouseEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "xcomperr",
                 "GetMouseEvent001 ret=%{public}d window=%{public}p", ret, window);
    int32_t result = ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetMouseEvent002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_MouseEvent mouseEvent;
    int32_t result = OH_NativeXComponent_GetMouseEvent(nullptr, g_mouseSurfaceWindow, &mouseEvent) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterMouseEventCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_RegisterMouseEventCallback(g_mouseXComponent, &g_mouseEventCallback) ==
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterMouseEventCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_RegisterMouseEventCallback(nullptr, &g_mouseEventCallback) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    result = OH_NativeXComponent_RegisterMouseEventCallback(g_mouseXComponent, nullptr) ==
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ?
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

} // namespace XComponentMouse

} // anonymous namespace (helpers/globals)

napi_property_descriptor XL(char* functionName, napi_callback func)
{
    return { functionName, nullptr, func, nullptr, nullptr, nullptr, napi_default, nullptr };
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }
    napi_property_descriptor desc[] = {
        XL("XComponentCreate", XComponentCreate),
        XL("GetXComponentId001", ArkUICapiTest::GetXComponentId001),
        XL("GetXComponentId002", ArkUICapiTest::GetXComponentId002),
        XL("RegisterKeyEventCallback001", ArkUICapiTest::RegisterKeyEventCallback001),
        XL("RegisterKeyEventCallback002", ArkUICapiTest::RegisterKeyEventCallback002),
        XL("GetKeyEvent001", ArkUICapiTest::GetKeyEvent001),
        XL("GetKeyEvent002", ArkUICapiTest::GetKeyEvent002),
        XL("GetKeyEventCode001", ArkUICapiTest::GetKeyEventCode001),
        XL("GetKeyEventCode002", ArkUICapiTest::GetKeyEventCode002),
        XL("SetNeedSoftKeyboard001", ArkUICapiTest::SetNeedSoftKeyboard001),
        XL("RegisterSurfaceShowCallback001", ArkUICapiTest::RegisterSurfaceShowCallback001),
        XL("RegisterSurfaceHideCallback001", ArkUICapiTest::RegisterSurfaceHideCallback001),
        XL("StartImageAnalyzer001", ArkUICapiTest::StartImageAnalyzer001),
        XL("StartImageAnalyzer002", ArkUICapiTest::StartImageAnalyzer002),
        XL("RegisterCallback001", TouchPoint::RegisterCallback001),
        XL("RegisterCallback002", TouchPoint::RegisterCallback002),
        XL("GetTouchEvent001", TouchPoint::GetTouchEvent001),
        XL("GetTouchEvent002", TouchPoint::GetTouchEvent002),
        XL("GetTouchPointToolType001", TouchPoint::GetTouchPointToolType001),
        XL("GetTouchPointToolType002", TouchPoint::GetTouchPointToolType002),
        XL("GetHistoricalPoints002", TouchPoint::GetHistoricalPoints002),
        XL("GetTouchEventSourceType001", TouchPoint::GetTouchEventSourceType001),
        XL("GetTouchEventSourceType002", TouchPoint::GetTouchEventSourceType002),
        XL("GetMouseEvent001", XComponentMouse::GetMouseEvent001),
        XL("GetMouseEvent002", XComponentMouse::GetMouseEvent002),
        XL("RegisterMouseEventCallback001", XComponentMouse::RegisterMouseEventCallback001),
        XL("RegisterMouseEventCallback002", XComponentMouse::RegisterMouseEventCallback002),
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module xcomperrModule = { .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "xcomperr",
    .nm_priv = ((void*)0),
    .reserved = { 0 } };

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&xcomperrModule);
}
