/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include <arkui/native_type.h>

namespace ArkUICapiTest {

static napi_value RichEditorScrollToVisibleTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    auto controller = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_EQ((controller != nullptr), true);
    ArkUI_AttributeItem controllerItem = {.object = controller};
    auto setRet = nodeAPI->setAttribute(textEditor, NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER, &controllerItem);
    ASSERT_EQ(setRet, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret = OH_ArkUI_TextEditorStyledStringController_ScrollToVisible(controller, PARAM_0, PARAM_10);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(controller);
    NAPI_END(textEditor);
}

static napi_value RichEditorScrollToVisibleTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    auto ret = OH_ArkUI_TextEditorStyledStringController_ScrollToVisible(nullptr, PARAM_0, PARAM_10);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(textEditor);
}

static napi_value RichEditorScrollToVisibleTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    auto controller = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_EQ((controller != nullptr), true);
    ArkUI_AttributeItem controllerItem = {.object = controller};
    auto setRet = nodeAPI->setAttribute(textEditor, NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER, &controllerItem);
    ASSERT_EQ(setRet, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret = OH_ArkUI_TextEditorStyledStringController_ScrollToVisible(controller, PARAM_5, PARAM_2);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(controller);
    NAPI_END(textEditor);
}

static napi_value RichEditorScrollToVisibleTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    auto controller = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_EQ((controller != nullptr), true);
    ArkUI_AttributeItem controllerItem = {.object = controller};
    auto setRet = nodeAPI->setAttribute(textEditor, NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER, &controllerItem);
    ASSERT_EQ(setRet, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret = OH_ArkUI_TextEditorStyledStringController_ScrollToVisible(controller, PARAM_0, PARAM_0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(controller);
    NAPI_END(textEditor);
}

static napi_value RichEditorScrollToVisibleTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    auto controller = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_EQ((controller != nullptr), true);
    ArkUI_AttributeItem controllerItem = {.object = controller};
    auto setRet = nodeAPI->setAttribute(textEditor, NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER, &controllerItem);
    ASSERT_EQ(setRet, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret = OH_ArkUI_TextEditorStyledStringController_ScrollToVisible(controller, PARAM_NEGATIVE_1, PARAM_10);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(controller);
    NAPI_END(textEditor);
}

}