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
#include <arkui/native_node.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value ImageSpanResizableTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    ArkUI_NumberValue value[] = {
        {.f32 = PARAM_20}, {.f32 = PARAM_10}, {.f32 = PARAM_20}, {.f32 = PARAM_5}};
    ArkUI_AttributeItem item = {value, PARAM_4};
    int32_t setResult = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SPAN_RESIZABLE, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_IMAGE_SPAN_RESIZABLE ImageSpanResizableTest_001 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_RESIZABLE);
    ASSERT_EQ(itemptr->value[PARAM_0].f32, PARAM_20);
    ASSERT_EQ(itemptr->value[PARAM_1].f32, PARAM_10);
    ASSERT_EQ(itemptr->value[PARAM_2].f32, PARAM_20);
    ASSERT_EQ(itemptr->value[PARAM_3].f32, PARAM_5);
    NAPI_END(imageSpan);
}

static napi_value ImageSpanResizableTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    int32_t setResult = nodeAPI->resetAttribute(imageSpan, NODE_IMAGE_SPAN_RESIZABLE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_IMAGE_SPAN_RESIZABLE ImageSpanResizableTest_002 resetResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(imageSpan);
}

static napi_value ImageSpanResizableTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    ArkUI_NumberValue value[] = {
        {.f32 = PARAM_20}, {.f32 = PARAM_10}, {.f32 = PARAM_20}, {.f32 = PARAM_5}};
    ArkUI_AttributeItem item = {value, PARAM_4};
    int32_t setResult = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SPAN_RESIZABLE, &item);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    int32_t resetResult = nodeAPI->resetAttribute(imageSpan, NODE_IMAGE_SPAN_RESIZABLE);
    ASSERT_EQ(resetResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_RESIZABLE);
    ASSERT_EQ(itemptr->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(itemptr->value[PARAM_1].f32, PARAM_0);
    ASSERT_EQ(itemptr->value[PARAM_2].f32, PARAM_0);
    ASSERT_EQ(itemptr->value[PARAM_3].f32, PARAM_0);
    NAPI_END(imageSpan);
}

static napi_value ImageSpanResizableTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_RESIZABLE);
    ASSERT_EQ(itemptr->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(itemptr->value[PARAM_1].f32, PARAM_0);
    ASSERT_EQ(itemptr->value[PARAM_2].f32, PARAM_0);
    ASSERT_EQ(itemptr->value[PARAM_3].f32, PARAM_0);
    NAPI_END(imageSpan);
}

}
