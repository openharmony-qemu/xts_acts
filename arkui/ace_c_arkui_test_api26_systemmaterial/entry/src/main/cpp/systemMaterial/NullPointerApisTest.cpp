/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "systemMaterial/MaterialTestDecl.h"
#include "common/common.h"

#include <arkui/native_node.h>
#include <arkui/native_render.h>
#include <arkui/native_type.h>
#include <arkui/node_attributes/text.h>
#include <arkui/styled_string.h>
#include <dlfcn.h>
#include <window_manager/oh_window.h>
#include <window_manager/oh_window_comm.h>
#include <window_manager/oh_window_event_filter.h>

namespace ArkUICapiTest {

// SDK stub libnative_window_manager.so may lag headers for Get*EventFilter; resolve on device.
template <typename Fn>
static Fn LoadWindowManagerFn(const char *name)
{
    void *handle = dlopen("libnative_window_manager.so", RTLD_NOW);
    if (handle == nullptr) {
        return nullptr;
    }
    return reinterpret_cast<Fn>(dlsym(handle, name));
}

napi_value TestGetNodeSnapshotSizeLimitationNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t maxWidth = 0;
    int32_t maxHeight = 0;
    ASSERT_EQ(OH_ArkUI_GetNodeSnapshotSizeLimitation(nullptr, &maxHeight), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_GetNodeSnapshotSizeLimitation(&maxWidth, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_GetNodeSnapshotSizeLimitation(nullptr, nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestRenderNodeUtilsSetRectShapeOptionValueNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionValue(nullptr, 50.0f, 50.0f, 100.0f, 100.0f);
    NAPI_END;
}

napi_value TestRenderNodeUtilsSetRoundRectShapeOptionValueNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionValue(nullptr, 50.0f, 50.0f, 100.0f, 100.0f);
    NAPI_END;
}

napi_value TestRenderNodeUtilsDisposeBlurStyleOptionNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_RenderNodeUtils_DisposeBlurStyleOption(nullptr);
    NAPI_END;
}

napi_value TestLinearGradientOptionsDestroyNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_LinearGradientOptions_Destroy(nullptr);
    NAPI_END;
}

napi_value TestRadialGradientOptionsDestroyNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_RadialGradientOptions_Destroy(nullptr);
    NAPI_END;
}

napi_value TestNativeWindowManagerGetKeyEventFilterNull001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t windowId = 0;
    if (argc >= 1) {
        napi_get_value_int32(env, args[0], &windowId);
    }
    using Fn = WindowManager_ErrorCode (*)(int32_t, OH_NativeWindowManager_KeyEventFilter *);
    auto fn = LoadWindowManagerFn<Fn>("OH_NativeWindowManager_GetKeyEventFilter");
    ASSERT_NOTNULL(fn);
    ASSERT_EQ(fn(windowId, nullptr), WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
    NAPI_END;
}

napi_value TestNativeWindowManagerGetMouseEventFilterNull001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t windowId = 0;
    if (argc >= 1) {
        napi_get_value_int32(env, args[0], &windowId);
    }
    using Fn = WindowManager_ErrorCode (*)(int32_t, OH_NativeWindowManager_MouseEventFilter *);
    auto fn = LoadWindowManagerFn<Fn>("OH_NativeWindowManager_GetMouseEventFilter");
    ASSERT_NOTNULL(fn);
    ASSERT_EQ(fn(windowId, nullptr), WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
    NAPI_END;
}

napi_value TestNativeWindowManagerGetTouchEventFilterNull001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t windowId = 0;
    if (argc >= 1) {
        napi_get_value_int32(env, args[0], &windowId);
    }
    using Fn = WindowManager_ErrorCode (*)(int32_t, OH_NativeWindowManager_TouchEventFilter *);
    auto fn = LoadWindowManagerFn<Fn>("OH_NativeWindowManager_GetTouchEventFilter");
    ASSERT_NOTNULL(fn);
    ASSERT_EQ(fn(windowId, nullptr), WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
    NAPI_END;
}

napi_value TestFrameMetricsIsFirstDrawFrameNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    bool isFirst = false;
    ASSERT_EQ(OH_WindowManager_FrameMetrics_IsFirstDrawFrame(nullptr, &isFirst),
              WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
    NAPI_END;
}

napi_value TestFrameMetricsGetInputHandlingDurationNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    uint64_t duration = 0;
    ASSERT_EQ(OH_WindowManager_FrameMetrics_GetInputHandlingDuration(nullptr, &duration),
              WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
    NAPI_END;
}

napi_value TestFrameMetricsGetLayoutMeasureDurationNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    uint64_t duration = 0;
    ASSERT_EQ(OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration(nullptr, &duration),
              WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
    NAPI_END;
}

napi_value TestFrameMetricsGetVsyncTimestampNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    uint64_t timestamp = 0;
    ASSERT_EQ(OH_WindowManager_FrameMetrics_GetVsyncTimestamp(nullptr, &timestamp),
              WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
    NAPI_END;
}

napi_value TestLineSpacingStyleDestroyNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_LineSpacingStyle_Destroy(nullptr);
    NAPI_END;
}

napi_value TestFontConfigsGetFontWeightConfigsNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    auto *got = OH_ArkUI_FontConfigs_GetFontWeightConfigs(nullptr);
    ASSERT_OBJ(got, nullptr);
    NAPI_END;
}

napi_value TestTextControllerDestroyNull001(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_ArkUI_TextController_Destroy(nullptr);
    NAPI_END;
}

} // namespace ArkUICapiTest
