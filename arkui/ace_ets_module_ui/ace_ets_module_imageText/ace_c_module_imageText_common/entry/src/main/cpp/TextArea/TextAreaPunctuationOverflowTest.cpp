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

static napi_value TextAreaPunctuationOverflowTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_1 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_PUNCTUATION_OVERFLOW TextAreaPunctuationOverflowTest_001 setResult=%{public}d",
        setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_1);
    NAPI_END(textArea);
}

static napi_value TextAreaPunctuationOverflowTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_0 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_PUNCTUATION_OVERFLOW TextAreaPunctuationOverflowTest_002 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(textArea);
}

static napi_value TextAreaPunctuationOverflowTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    int32_t setResult = nodeAPI->resetAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_PUNCTUATION_OVERFLOW TextAreaPunctuationOverflowTest_003 setResult=%{public}d",
        setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(textArea);
}

static napi_value TextAreaPunctuationOverflowTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_1 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW, &item);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    int32_t resetResult = nodeAPI->resetAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(resetResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(textArea);
}

static napi_value TextAreaPunctuationOverflowTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PUNCTUATION_OVERFLOW);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(textArea);
}

}
