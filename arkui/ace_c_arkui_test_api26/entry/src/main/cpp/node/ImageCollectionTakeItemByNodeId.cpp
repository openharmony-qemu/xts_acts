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
#include <arkui/native_node_napi.h>
#include <arkui/ui_info_collection.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <string>
#include <vector>
#include "ImageCollectionTakeItemByNodeId.h"

static ArkUI_NativeNodeAPI_1 *api = nullptr;
static ArkUI_NodeHandle text = nullptr;
static ArkUI_NodeHandle text1 = nullptr;
static ArkUI_NodeHandle text2 = nullptr;
static ArkUI_NodeHandle text3 = nullptr;
static ArkUI_NodeHandle text4 = nullptr;
static ArkUI_NodeHandle text5 = nullptr;
static ArkUI_NodeHandle text6 = nullptr;
static ArkUI_NodeHandle text7 = nullptr;
static ArkUI_NodeHandle text8 = nullptr;

namespace ArkUICapiTest {

static void OnCollection1(ArkUI_ErrorCode, OH_ArkUI_NativeModule_ImageCollection *col, void *userData)
{
    auto *ids = static_cast<std::vector<int32_t> *>(userData);
    ArkUI_NumberValue green[] = {{.u32 = 0xFF00FF00}};
    ArkUI_AttributeItem gi = {green, 1};
    if (col && ids) {
        for (int32_t nodeId : *ids) {
            OH_PixelmapNative *pixelmap = nullptr;
            ArkUI_ErrorCode itemError = ARKUI_ERROR_CODE_NO_ERROR;
            auto code1 = OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(col, nodeId, &pixelmap, &itemError);
            auto code2 = OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(nullptr, nodeId, &pixelmap, &itemError);
            auto code3 = OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(col, nodeId, nullptr, &itemError);
            auto code4 = OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(col, nodeId, &pixelmap, nullptr);
            auto code5 = OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(col, nodeId, &pixelmap, &itemError);
            auto code6 = OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(col, 25, &pixelmap, &itemError);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageCollectionTakeItemByNodeId",
                "code1=%{public}d code2=%{public}d code3=%{public}d code4=%{public}d code5=%{public}d code6=%{public}d",
                static_cast<int32_t>(code1), static_cast<int32_t>(code2), static_cast<int32_t>(code3),
                static_cast<int32_t>(code4), static_cast<int32_t>(code5), static_cast<int32_t>(code6));
            if (code1 == ARKUI_ERROR_CODE_NO_ERROR) {
                api->setAttribute(text3, NODE_BACKGROUND_COLOR, &gi);
            }
            if (code2 == ARKUI_ERROR_CODE_PARAM_INVALID) {
                api->setAttribute(text4, NODE_BACKGROUND_COLOR, &gi);
            }
            if (code3 == ARKUI_ERROR_CODE_PARAM_INVALID) {
                api->setAttribute(text5, NODE_BACKGROUND_COLOR, &gi);
            }
            if (code4 == ARKUI_ERROR_CODE_PARAM_INVALID) {
                api->setAttribute(text6, NODE_BACKGROUND_COLOR, &gi);
            }
            if (code5 == ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN) {
                api->setAttribute(text7, NODE_BACKGROUND_COLOR, &gi);
            }
            if (code6 == ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND) {
                api->setAttribute(text8, NODE_BACKGROUND_COLOR, &gi);
            }
        }
        OH_ArkUI_NativeModule_ImageCollectionDestroy(col);
    }
}

static void OnCollection2(ArkUI_ErrorCode, OH_ArkUI_NativeModule_ImageCollection *col, void *userData)
{
    auto *ids = static_cast<std::vector<int32_t> *>(userData);
    if (col && ids) {
        for (int32_t nodeId : *ids) {
            OH_PixelmapNative *pixelmap = nullptr;
            ArkUI_ErrorCode itemError = ARKUI_ERROR_CODE_NODE_NOT_FOUND;
            auto code = OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(col, nodeId, &pixelmap, &itemError);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageCollectionTakeItemByNodeId",
                "OnCollection2 code=%{public}d itemError=%{public}d", static_cast<int32_t>(code),
                static_cast<int32_t>(itemError));
        }
        OH_ArkUI_NativeModule_ImageCollectionDestroy(col);
    }
}

static void OnCollection3(ArkUI_ErrorCode, OH_ArkUI_NativeModule_ImageCollection *col, void *userData)
{
    auto *ids = static_cast<std::vector<int32_t> *>(userData);
    if (col && ids) {
        for (int32_t nodeId : *ids) {
            OH_PixelmapNative *pixelmap = nullptr;
            ArkUI_ErrorCode itemError = ARKUI_ERROR_CODE_COMPONENT_SNAPSHOT_TIMEOUT;
            auto code = OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(col, nodeId, &pixelmap, &itemError);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageCollectionTakeItemByNodeId",
                "OnCollection3 code=%{public}d itemError=%{public}d", static_cast<int32_t>(code),
                static_cast<int32_t>(itemError));
        }
        OH_ArkUI_NativeModule_ImageCollectionDestroy(nullptr);
    }
}

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle root = api->createNode(ARKUI_NODE_COLUMN);

    text = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti = {.string = "duplicate id expect 106414"};
    api->setAttribute(text, NODE_TEXT_CONTENT, &ti);
    api->addChild(root, text);
    ArkUI_AttributeItem textId = {.string = "text_repeat_id"};
    api->setAttribute(text, NODE_ID, &textId);

    text1 = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti1 = {.string = "expect 0"};
    api->setAttribute(text1, NODE_TEXT_CONTENT, &ti1);
    api->addChild(root, text1);
    ArkUI_AttributeItem text1Id = {.string = "text_repeat1_id"};
    api->setAttribute(text1, NODE_ID, &text1Id);

    text2 = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti2 = {.string = "expect 106413"};
    api->setAttribute(text2, NODE_TEXT_CONTENT, &ti2);
    api->addChild(root, text2);
    ArkUI_AttributeItem text2Id = {.string = "text_repeat2_id"};
    api->setAttribute(text2, NODE_ID, &text2Id);

    text3 = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti3 = {.string = "0"};
    api->setAttribute(text3, NODE_TEXT_CONTENT, &ti3);
    api->addChild(root, text3);
    ArkUI_AttributeItem text3Id = {.string = "text_repeat3_id"};
    api->setAttribute(text3, NODE_ID, &text3Id);

    text4 = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti4 = {.string = "401"};
    api->setAttribute(text4, NODE_TEXT_CONTENT, &ti4);
    api->addChild(root, text4);
    ArkUI_AttributeItem text4Id = {.string = "text_repeat4_id"};
    api->setAttribute(text4, NODE_ID, &text4Id);

    text5 = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti5 = {.string = "401"};
    api->setAttribute(text5, NODE_TEXT_CONTENT, &ti5);
    api->addChild(root, text5);
    ArkUI_AttributeItem text5Id = {.string = "text_repeat5_id"};
    api->setAttribute(text5, NODE_ID, &text5Id);

    text6 = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti6 = {.string = "401"};
    api->setAttribute(text6, NODE_TEXT_CONTENT, &ti6);
    api->addChild(root, text6);
    ArkUI_AttributeItem text6Id = {.string = "text_repeat6_id"};
    api->setAttribute(text6, NODE_ID, &text6Id);

    text7 = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti7 = {.string = "106416"};
    api->setAttribute(text7, NODE_TEXT_CONTENT, &ti7);
    api->addChild(root, text7);
    ArkUI_AttributeItem text7Id = {.string = "text_repeat7_id"};
    api->setAttribute(text7, NODE_ID, &text7Id);

    text8 = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem ti8 = {.string = "106415"};
    api->setAttribute(text8, NODE_TEXT_CONTENT, &ti8);
    api->addChild(root, text8);
    ArkUI_AttributeItem text8Id = {.string = "text_repeat8_id"};
    api->setAttribute(text8, NODE_ID, &text8Id);

    return root;
}

napi_value ImageCollectionTakeItemByNodeId::ImageCollectionTakeItemByNodeIdTest001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    ArkUI_NodeContentHandle handle;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &handle);
    if (!handle) {
        return nullptr;
    }

    if (!api) {
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, api);
    }

    ArkUI_NodeHandle root = CreateChildNode(api);
    OH_ArkUI_NodeContent_AddNode(handle, root);

    ArkUI_ContextHandle ctx = OH_ArkUI_GetContextByNode(root);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageCollectionTakeItemByNodeId", "ctx=%{public}p", ctx);
    if (ctx) {
        int32_t nodeId = 1;
        auto *ids1 = new std::vector<int32_t>({nodeId});
        ArkUI_ErrorCode code1 = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(ctx, ids1->data(), 1, OnCollection1, ids1);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageCollectionTakeItemByNodeId",
            "first call result=%{public}d", static_cast<int32_t>(code1));
        if (code1 == ARKUI_ERROR_CODE_NO_ERROR) {
            ArkUI_NumberValue green[] = {{.u32 = 0xFF00FF00}};
            ArkUI_AttributeItem gi = {green, 1};
            api->setAttribute(text1, NODE_BACKGROUND_COLOR, &gi);
        }

        auto *ids2 = new std::vector<int32_t>({nodeId});
        ArkUI_ErrorCode code2 = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(ctx, ids2->data(), 1, OnCollection2, ids2);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageCollectionTakeItemByNodeId",
            "second call result=%{public}d (expect 106413)", static_cast<int32_t>(code2));
        if (code2 == ARKUI_ERROR_CODE_COMMAND_UNFINISHED) {
            ArkUI_NumberValue green[] = {{.u32 = 0xFF00FF00}};
            ArkUI_AttributeItem gi = {green, 1};
            api->setAttribute(text2, NODE_BACKGROUND_COLOR, &gi);
        }

        auto *ids3 = new std::vector<int32_t>({nodeId, nodeId});
        ArkUI_ErrorCode code3 = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(ctx, ids3->data(), 2, OnCollection3, ids3);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageCollectionTakeItemByNodeId",
            "duplicate call result=%{public}d (expect 106414)", static_cast<int32_t>(code3));
        if (code3 == ARKUI_ERROR_CODE_DUPLICATE_NODE_ID) {
            ArkUI_NumberValue green[] = {{.u32 = 0xFF00FF00}};
            ArkUI_AttributeItem gi = {green, 1};
            api->setAttribute(text, NODE_BACKGROUND_COLOR, &gi);
        }
    }
    return nullptr;
}

} // namespace ArkUICapiTest
