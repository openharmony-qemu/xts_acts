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

#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <cstdint>
#include <string>

namespace ArkUICapiTest {

static napi_value TestContainerPickerDisplayedItemCount001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int itemCount = 8;
    int itemCountReal = 9;
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_NumberValue itemCountValue[] = { {.i32 = itemCount} };
    ArkUI_AttributeItem countItem = {
        itemCountValue, sizeof(itemCountValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT, &countItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(
        nodeAPI->getAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT)->value[PARAM_0].i32, itemCountReal);
    NAPI_END;
}
static napi_value TestContainerPickerDisplayedItemCount002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int itemCount = 8;
    int itemCountReal = 9;
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_NumberValue itemCountValue[] = { {.i32 = itemCount} };
    ArkUI_AttributeItem countItem = {
        itemCountValue, sizeof(itemCountValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT, &countItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(
        nodeAPI->getAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT)->value[PARAM_0].i32, itemCountReal);
    NAPI_END;
}
static napi_value TestContainerPickerDisplayedItemCount003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int itemCount = 100;
    int itemCountReal = 7;
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_NumberValue itemCountValue[] = { {.i32 = itemCount} };
    ArkUI_AttributeItem countItem = {
        itemCountValue, sizeof(itemCountValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT, &countItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(
        nodeAPI->getAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT)->value[PARAM_0].i32, itemCountReal);
    NAPI_END;
}
static napi_value TestContainerPickerDisplayedItemCount004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int itemCount = 2;
    int itemCountReal = 3;
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_NumberValue itemCountValue[] = { {.i32 = itemCount} };
    ArkUI_AttributeItem countItem = {
        itemCountValue, sizeof(itemCountValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT, &countItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(
        nodeAPI->getAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT)->value[PARAM_0].i32, itemCountReal);
    NAPI_END;
}
static napi_value TestContainerPickerDisplayedItemCount005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int itemCountReal = 7;
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ASSERT_EQ(
        nodeAPI->getAttribute(containerPicker, NODE_PICKER_DISPLAYED_ITEM_COUNT)->value[PARAM_0].i32, itemCountReal);
    NAPI_END;
}
} // namespace ArkUICapiTest
