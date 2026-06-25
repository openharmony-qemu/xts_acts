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
#include "manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value RichEditorPunctuationOverflowTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_1 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW RichEditorPunctuationOverflowTest_001 setResult=%{public}d",
        setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_1);
    NAPI_END(textEditor);
}

static napi_value RichEditorPunctuationOverflowTest_002(napi_env env, napi_callback_info info)
 {
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_0 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW RichEditorPunctuationOverflowTest_002 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(textEditor);
}

static napi_value RichEditorPunctuationOverflowTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    int32_t setResult = nodeAPI->resetAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW RichEditorPunctuationOverflowTest_003 setResult=%{public}d",
        setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(textEditor);
}

static napi_value RichEditorPunctuationOverflowTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_1 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW, &item);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    int32_t resetResult = nodeAPI->resetAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(resetResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);  
    NAPI_END(textEditor);
}

static napi_value RichEditorPunctuationOverflowTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(textEditor, ARKUI_NODE_TEXT_EDITOR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textEditor, NODE_TEXT_EDITOR_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(textEditor);
}

}