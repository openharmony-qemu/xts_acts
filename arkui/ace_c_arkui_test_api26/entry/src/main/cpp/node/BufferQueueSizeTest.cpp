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
#include <arkui/native_interface.h>

namespace ArkUICapiTest {

// NODE_XCOMPONENT_BUFFER_QUEUE_SIZE (value 12005) is introduced in API 26.1.0.
// It may not be defined in earlier SDK headers; define a local alias for compatibility.
#ifndef NODE_XCOMPONENT_BUFFER_QUEUE_SIZE
#define NODE_XCOMPONENT_BUFFER_QUEUE_SIZE static_cast<ArkUI_NodeAttributeType>(12005)
#endif

// Default buffer queue size per API documentation.
static constexpr int32_t BUFFER_QUEUE_SIZE_DEFAULT = 5;
// Minimum buffer queue size per API documentation.
static constexpr int32_t BUFFER_QUEUE_SIZE_MIN = 2;
// Maximum buffer queue size per API documentation.
static constexpr int32_t BUFFER_QUEUE_SIZE_MAX = 5;

/**
 * @tc.name: BufferQueueSizeTest001
 * @tc.desc: Set buffer queue size to 2 (normal value), verify set success and get correct value.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 2;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, size);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest002
 * @tc.desc: Set buffer queue size to 3 (normal value), verify set success and get correct value.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 3;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, size);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest003
 * @tc.desc: Set buffer queue size to 4 (normal value), verify set success and get correct value.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 4;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, size);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest004
 * @tc.desc: Set buffer queue size to 5 (default/max value), verify set success and get correct value.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 5;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, size);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest005
 * @tc.desc: Set buffer queue size to 2 (minimum boundary), verify set success and get correct value.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = BUFFER_QUEUE_SIZE_MIN;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, size);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest006
 * @tc.desc: Set buffer queue size to 5 (maximum boundary), verify set success and get correct value.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = BUFFER_QUEUE_SIZE_MAX;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, size);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest007
 * @tc.desc: Set buffer queue size to 1 (below minimum), verify clamped to 2.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 1;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, BUFFER_QUEUE_SIZE_MIN);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest008
 * @tc.desc: Set buffer queue size to 0 (below minimum), verify clamped to 2.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 0;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, BUFFER_QUEUE_SIZE_MIN);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest009
 * @tc.desc: Set buffer queue size to -1 (negative), verify clamped to 2.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest009(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, BUFFER_QUEUE_SIZE_MIN);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest010
 * @tc.desc: Set buffer queue size to 6 (above maximum), verify clamped to 5.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest010(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 6;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, BUFFER_QUEUE_SIZE_MAX);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest011
 * @tc.desc: Set buffer queue size to 100 (far above maximum), verify clamped to 5.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest011(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = PARAM_100;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, BUFFER_QUEUE_SIZE_MAX);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest012
 * @tc.desc: Get default buffer queue size without setting, verify default is 5.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest012(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    auto result = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result->value[PARAM_0].i32, BUFFER_QUEUE_SIZE_DEFAULT);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest013
 * @tc.desc: Set attribute with null item, verify returns INVALID_PARAM.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest013(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest014
 * @tc.desc: Reset attribute after setting, verify value returns to default 5.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest014(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 2;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret1 = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret1, SUCCESS);
    auto result1 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result1->value[PARAM_0].i32, size);
    auto ret2 = nodeAPI->resetAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(ret2, SUCCESS);
    auto result2 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result2->value[PARAM_0].i32, BUFFER_QUEUE_SIZE_DEFAULT);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest015
 * @tc.desc: Dynamically switch buffer queue size from 2 to 5, verify value changes correctly.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest015(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size1 = 2;
    ArkUI_NumberValue value1[] = {{.i32 = size1}};
    ArkUI_AttributeItem item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret1 = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item1);
    ASSERT_EQ(ret1, SUCCESS);
    auto result1 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result1->value[PARAM_0].i32, size1);

    int32_t size2 = 5;
    ArkUI_NumberValue value2[] = {{.i32 = size2}};
    ArkUI_AttributeItem item2 = {value2, sizeof(value2) / sizeof(ArkUI_NumberValue)};
    auto ret2 = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item2);
    ASSERT_EQ(ret2, SUCCESS);
    auto result2 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result2->value[PARAM_0].i32, size2);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest016
 * @tc.desc: Set the same value 2 multiple times, verify value remains stable.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest016(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size = 2;
    ArkUI_NumberValue value[] = {{.i32 = size}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret1 = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret1, SUCCESS);
    auto result1 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result1->value[PARAM_0].i32, size);

    auto ret2 = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret2, SUCCESS);
    auto result2 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result2->value[PARAM_0].i32, size);

    auto ret3 = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item);
    ASSERT_EQ(ret3, SUCCESS);
    auto result3 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result3->value[PARAM_0].i32, size);
    NAPI_END;
}

/**
 * @tc.name: BufferQueueSizeTest017
 * @tc.desc: Set, reset, then set again, verify the attribute can be repeatedly operated.
 * @tc.type: FUNC
 */
static napi_value BufferQueueSizeTest017(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    int32_t size1 = 3;
    ArkUI_NumberValue value1[] = {{.i32 = size1}};
    ArkUI_AttributeItem item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret1 = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item1);
    ASSERT_EQ(ret1, SUCCESS);
    auto result1 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result1->value[PARAM_0].i32, size1);

    auto ret2 = nodeAPI->resetAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(ret2, SUCCESS);
    auto result2 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result2->value[PARAM_0].i32, BUFFER_QUEUE_SIZE_DEFAULT);

    int32_t size3 = 2;
    ArkUI_NumberValue value3[] = {{.i32 = size3}};
    ArkUI_AttributeItem item3 = {value3, sizeof(value3) / sizeof(ArkUI_NumberValue)};
    auto ret3 = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE, &item3);
    ASSERT_EQ(ret3, SUCCESS);
    auto result3 = nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_BUFFER_QUEUE_SIZE);
    ASSERT_EQ(result3->value[PARAM_0].i32, size3);
    NAPI_END;
}

} // namespace ArkUICapiTest
