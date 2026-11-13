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

#include "common/common.h"
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <cstring>
#include <cstdlib>
#include <cstdint>

namespace ArkUICapiTest {

static int32_t g_userData1 = 100;
static int32_t g_userData2 = 200;

static void InspectorTreeCallback1(void* userData, char** inspectorTree)
{
    if (inspectorTree == nullptr) {
        return;
    }
    const char* json = "{\"type\":\"custom\",\"children\":[]}";
    *inspectorTree = static_cast<char*>(malloc(strlen(json) + PARAM_1));
    if (*inspectorTree != nullptr) {
        strcpy(*inspectorTree, json);
    }
}

static void InspectorTreeCallback2(void* userData, char** inspectorTree)
{
    if (inspectorTree == nullptr) {
        return;
    }
    const char* json = "{\"type\":\"custom2\",\"children\":[{\"id\":1}]}";
    *inspectorTree = static_cast<char*>(malloc(strlen(json) + PARAM_1));
    if (*inspectorTree != nullptr) {
        strcpy(*inspectorTree, json);
    }
}

static napi_value RegisterInspectorTreeGetterTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret1 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData2, InspectorTreeCallback2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret1 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, nullptr, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(nullptr, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(nullptr, nullptr, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest009(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_BUTTON);
    auto ret = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RegisterInspectorTreeGetterTest010(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret1 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, InspectorTreeCallback1);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret1 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData2, InspectorTreeCallback2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, InspectorTreeCallback1);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret1 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData2, InspectorTreeCallback2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, nullptr);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret1 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, InspectorTreeCallback1);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, InspectorTreeCallback1);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret1 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData2, InspectorTreeCallback2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, nullptr);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_NativeModule_RegisterInspectorTreeGetter(node, &g_userData1, InspectorTreeCallback1);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(nullptr, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_BUTTON);
    auto ret = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest009(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnregisterInspectorTreeGetterTest010(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_UnregisterInspectorTreeGetter(node, InspectorTreeCallback1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest
