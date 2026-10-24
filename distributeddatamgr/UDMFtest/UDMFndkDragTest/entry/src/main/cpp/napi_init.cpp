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
#include "common.h"
#include <cstdint>
#include <cstring>
#include <hilog/log.h>
#include <napi/native_api.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_err_code.h>
#include <database/udmf/uds.h>
#include <database/udmf/utd.h>
#include "database/udmf/udmf_meta.h"

const char *TAG = "UDMF_Ndk_Drag_Test: ";

static ArkUI_NativeNodeAPI_1* g_nodeApi = nullptr;
static ArkUI_NodeHandle g_dropTarget = nullptr;

static int g_overviewSizeResult = 0;
static int drag_testResult = 0;
static OH_UDMF_Summary* g_summary = nullptr;

void OH_UDMF_GetSummaryOverviewSize_005(ArkUI_DragEvent* dragEvent)
{
    OH_UDMF_Summary * summary = OH_UDMF_CreateSummary();
    if (summary == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_UDMF_GetSummaryOverviewSize_005: OH_UDMF_CreateSummary returned null");
        return;
    }
    int32_t summaryResult = OH_ArkUI_DragEvent_GetSummary(dragEvent, summary);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_UDMF_GetSummaryOverviewSize_005: OH_ArkUI_DragEvent_GetSummary result: %{public}d", summaryResult);
    if (summaryResult != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_UDMF_DestroySummary(summary);
        return;
    }
    g_summary = summary;
}

static void OnNodeEvent(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    if (eventType != NODE_ON_DRAG_ENTER && eventType != NODE_ON_DROP) {
        return;
    }
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    if (!dragEvent) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "ArkUI drag event is null");
        return;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "ArkUI drag event is nullNative drag callback, eventType=%{public}d", eventType);
    OH_UDMF_GetSummaryOverviewSize_005(dragEvent);
}


static napi_value CreateDropTarget_001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, TAG, "CreateDropTarget_001 start");
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    ArkUI_NodeContentHandle content = nullptr;
    if (argc != 1 || OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &content) != 0 || !content) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, TAG, "CreateDropTarget_001: Failed to obtain NodeContent");
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
    if (!g_nodeApi) {
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeApi);
    }
    if (!g_nodeApi) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, TAG, "CreateDropTarget_001: Failed to obtain ArkUI_NativeNodeAPI_1");
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    g_dropTarget = g_nodeApi->createNode(ARKUI_NODE_TEXT);
    if (!g_dropTarget) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, TAG, "CreateDropTarget_001: Failed to create drop target node");
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    ArkUI_NumberValue width[] = { { .f32 = 300.0f } };
    ArkUI_AttributeItem widthItem = { width, 1 };
    g_nodeApi->setAttribute(g_dropTarget, NODE_WIDTH, &widthItem);
    ArkUI_NumberValue height[] = { { .f32 = 120.0f } };
    ArkUI_AttributeItem heightItem = { height, 1 };
    g_nodeApi->setAttribute(g_dropTarget, NODE_HEIGHT, &heightItem);
    ArkUI_NumberValue color[] = { { .u32 = 0xFFE8EEF7 } };
    ArkUI_AttributeItem colorItem = { color, 1 };
    g_nodeApi->setAttribute(g_dropTarget, NODE_BACKGROUND_COLOR, &colorItem);

    g_nodeApi->registerNodeEventReceiver(OnNodeEvent);
    g_nodeApi->registerNodeEvent(g_dropTarget, NODE_ON_DRAG_ENTER, 1, nullptr);
    g_nodeApi->registerNodeEvent(g_dropTarget, NODE_ON_DROP, 2, nullptr);
    int ret = OH_ArkUI_NodeContent_AddNode(content, g_dropTarget);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, TAG, "CreateDropTarget_001: Native drop target created, ret=%{public}d", ret);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetOverviewSizeResult_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_overviewSizeResult = 0;

    if (!g_summary) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "GetOverviewSizeResult_001: g_summary is null");
        napi_create_int32(env, 0, &result);
        return result;
    }

    int64_t dataSize_1 = 0;
    int ret_1 = OH_UDMF_GetSummaryOverviewSize(g_summary, "general.image", &dataSize_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "GetOverviewSizeResult_001: OH_UDMF_GetSummaryOverviewSize result: %{public}d, dataSize: %{public}lld", ret_1, (long long)dataSize_1);
    g_overviewSizeResult = (ret_1 == UDMF_E_OK) ? 1 : 0;
    NAPI_ASSERT(env, ret_1 == UDMF_E_OK, "OH_Preferences_Open is fail.");
    
    int64_t dataSize_2 = 0;
    int ret_2 = OH_UDMF_GetSummaryOverviewSize(g_summary, "general.audio", &dataSize_2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "GetOverviewSizeResult_001: OH_UDMF_GetSummaryOverviewSize result: %{public}d, dataSize: %{public}lld", ret_2, (long long)dataSize_2);
    g_overviewSizeResult = (ret_2 == UDMF_E_OK) ? 1 : 0;
    NAPI_ASSERT(env, ret_2 == UDMF_E_OK, "OH_Preferences_Open is fail.");
    
    int returnCode = 1;
    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_UDMF_CreateSummary_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    napi_create_int32(env, summary != nullptr, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewTypes_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char* const* types = nullptr;
    int64_t count = 0;
    int ret = OH_UDMF_GetSummaryOverviewTypes(nullptr, &types, &count);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewTypes_002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int64_t count = 0;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int ret = OH_UDMF_GetSummaryOverviewTypes(summary, nullptr, &count);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewTypes_003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char* const* types = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int ret = OH_UDMF_GetSummaryOverviewTypes(summary, &types, nullptr);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewTypes_004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();

    const char* const* types = nullptr;
    int64_t count = 0;
    int ret = OH_UDMF_GetSummaryOverviewTypes(summary, &types, &count);
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewSize_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int64_t dataSize = 0;
    int ret = OH_UDMF_GetSummaryOverviewSize(nullptr, "general.file", &dataSize);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewSize_002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int64_t dataSize = 0;
    int ret = OH_UDMF_GetSummaryOverviewSize(summary, nullptr, &dataSize);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewSize_003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int ret = OH_UDMF_GetSummaryOverviewSize(summary, "general.file", nullptr);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewSize_004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int64_t dataSize = 0;
    int ret = OH_UDMF_GetSummaryOverviewSize(summary, "general.file", &dataSize);
    napi_create_int32(env, ret == UDMF_ERR, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryOverviewSize_006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int64_t dataSize = 0;
    int ret = OH_UDMF_GetSummaryOverviewSize(summary, "", &dataSize);
    napi_create_int32(env, ret == UDMF_ERR, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryFilenameExtensions_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char* const* extensions = nullptr;
    int64_t count = 0;
    int ret = OH_UDMF_GetSummaryFilenameExtensions(nullptr, &extensions, &count);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UDMF_GetSummaryFilenameExtensions_002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int64_t count = 0;
    int ret = OH_UDMF_GetSummaryFilenameExtensions(summary, nullptr, &count);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryFilenameExtensions_003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    const char* const* extensions = nullptr;
    int ret = OH_UDMF_GetSummaryFilenameExtensions(summary, &extensions, nullptr);
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value OH_UDMF_GetSummaryFilenameExtensions_004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    const char* const* extensions = nullptr;
    int64_t count = 0;
    int ret = OH_UDMF_GetSummaryFilenameExtensions(summary, &extensions, &count);
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

static napi_value DragTest_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    NAPI_ASSERT(env, g_summary != nullptr, "DragTest_001: g_summary is null.");

    const char* const* types = nullptr;
    int64_t count = 0;
    int retTypes = OH_UDMF_GetSummaryOverviewTypes(g_summary, &types, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_001: OH_UDMF_GetSummaryOverviewTypes ret=%{public}d, count=%{public}lld",
        retTypes, (long long)count);
    NAPI_ASSERT(env, retTypes == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewTypes is fail.");
    NAPI_ASSERT(env, types != nullptr, "DragTest_001: types is null.");
    NAPI_ASSERT(env, count > 0, "DragTest_001: count <= 0.");

    const char* const kExpectedTypes[] = { "general.audio", "general.video" };
    const int64_t kExpectedCount = sizeof(kExpectedTypes) / sizeof(kExpectedTypes[0]);
    NAPI_ASSERT(env, count == kExpectedCount, "DragTest_001: count mismatch.");

    bool typeAudioFound = false;
    bool typeVideoFound = false;
    for (int64_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, types[i] != nullptr, "DragTest_001: types[i] is null.");
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "DragTest_001: types[%{public}lld]=%{public}s", (long long)i, types[i]);
        if (strcmp(types[i], kExpectedTypes[0]) == 0) {
            typeAudioFound = true;
        } else if (strcmp(types[i], kExpectedTypes[1]) == 0) {
            typeVideoFound = true;
        }
    }
    NAPI_ASSERT(env, typeAudioFound, "DragTest_001: general.audio not found.");
    NAPI_ASSERT(env, typeVideoFound, "DragTest_001: general.video not found.");

    int64_t dataSizeAudio = 0;
    int retAudio = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[0], &dataSizeAudio);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_001: GetSummaryOverviewSize(audio) ret=%{public}d, dataSize=%{public}lld",
        retAudio, (long long)dataSizeAudio);
    NAPI_ASSERT(env, retAudio == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(audio) is fail.");
    NAPI_ASSERT(env, dataSizeAudio != -1, "DragTest_001: audio dataSize == -1.");

    int64_t dataSizeVideo = 0;
    int retVideo = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[1], &dataSizeVideo);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_001: GetSummaryOverviewSize(video) ret=%{public}d, dataSize=%{public}lld",
        retVideo, (long long)dataSizeVideo);
    NAPI_ASSERT(env, retVideo == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(video) is fail.");
    NAPI_ASSERT(env, dataSizeVideo != -1, "DragTest_001: video dataSize == -1.");

    const char* const* extensions = nullptr;
    int64_t extCount = 0;
    int retExt = OH_UDMF_GetSummaryFilenameExtensions(g_summary, &extensions, &extCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_001: GetSummaryFilenameExtensions ret=%{public}d, count=%{public}lld",
        retExt, (long long)extCount);
    NAPI_ASSERT(env, retExt == UDMF_E_OK, "DragTest_001: GetSummaryFilenameExtensions is fail.");
    NAPI_ASSERT(env, extCount == 2, "DragTest_001: extCount mismatch.");
    bool extMp3Found = false;
    bool extMp4Found = false;
    for (int64_t i = 0; i < extCount; ++i) {
        NAPI_ASSERT(env, extensions[i] != nullptr, "DragTest_001: extensions[i] is null.");
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "DragTest_001: extensions[%{public}lld]=%{public}s", (long long)i, extensions[i]);
        if (strcmp(extensions[i], ".mp3") == 0) extMp3Found = true;
        if (strcmp(extensions[i], ".mp4") == 0) extMp4Found = true;
    }
    NAPI_ASSERT(env, extMp3Found, "DragTest_001: extension .mp3 not found.");
    NAPI_ASSERT(env, extMp4Found, "DragTest_001: extension .mp4 not found.");

    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;

    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DragTest_002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    NAPI_ASSERT(env, g_summary != nullptr, "DragTest_002: g_summary is null.");

    const char* const* types = nullptr;
    int64_t count = 0;
    int retTypes = OH_UDMF_GetSummaryOverviewTypes(g_summary, &types, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_002: OH_UDMF_GetSummaryOverviewTypes ret=%{public}d, count=%{public}lld",
        retTypes, (long long)count);
    NAPI_ASSERT(env, retTypes == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewTypes is fail.");
    NAPI_ASSERT(env, types != nullptr, "DragTest_002: types is null.");
    NAPI_ASSERT(env, count > 0, "DragTest_002: count <= 0.");

    const char* const kExpectedTypes[] = { "general.image" };
    const int64_t kExpectedCount = sizeof(kExpectedTypes) / sizeof(kExpectedTypes[0]);
    NAPI_ASSERT(env, count == kExpectedCount, "DragTest_002: count mismatch.");

    bool typeImageFound = false;
    for (int64_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, types[i] != nullptr, "DragTest_002: types[i] is null.");
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "DragTest_002: types[%{public}lld]=%{public}s", (long long)i, types[i]);
        if (strcmp(types[i], kExpectedTypes[0]) == 0) {
            typeImageFound = true;
        }
    }
    NAPI_ASSERT(env, typeImageFound, "DragTest_002: general.image not found.");

    int64_t dataSizeImage = 0;
    int retImage = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[0], &dataSizeImage);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_002: GetSummaryOverviewSize(image) ret=%{public}d, dataSize=%{public}lld",
        retImage, (long long)dataSizeImage);
    NAPI_ASSERT(env, retImage == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(image) is fail.");
    NAPI_ASSERT(env, dataSizeImage != -1, "DragTest_002: image dataSize == -1.");

    const char* const* extensions = nullptr;
    int64_t extCount = 0;
    int retExt = OH_UDMF_GetSummaryFilenameExtensions(g_summary, &extensions, &extCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_002: GetSummaryFilenameExtensions ret=%{public}d, count=%{public}lld",
        retExt, (long long)extCount);
    NAPI_ASSERT(env, retExt == UDMF_E_OK, "DragTest_002: GetSummaryFilenameExtensions is fail.");
    NAPI_ASSERT(env, extCount == 1, "DragTest_002: extCount mismatch.");
    NAPI_ASSERT(env, extensions[0] != nullptr, "DragTest_002: extensions[0] is null.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_002: extensions[0]=%{public}s", extensions[0]);
    NAPI_ASSERT(env, strcmp(extensions[0], ".png") == 0, "DragTest_002: extension .png not found.");

    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;

    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DragTest_003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    NAPI_ASSERT(env, g_summary != nullptr, "DragTest_003: g_summary is null.");

    const char* const* types = nullptr;
    int64_t count = 0;
    int retTypes = OH_UDMF_GetSummaryOverviewTypes(g_summary, &types, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_003: OH_UDMF_GetSummaryOverviewTypes ret=%{public}d, count=%{public}lld",
        retTypes, (long long)count);
    NAPI_ASSERT(env, retTypes == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewTypes is fail.");
    NAPI_ASSERT(env, types != nullptr, "DragTest_003: types is null.");
    NAPI_ASSERT(env, count > 0, "DragTest_003: count <= 0.");

    const char* const kExpectedTypes[] = { "general.image" };
    const int64_t kExpectedCount = sizeof(kExpectedTypes) / sizeof(kExpectedTypes[0]);
    NAPI_ASSERT(env, count == kExpectedCount, "DragTest_003: count mismatch.");

    bool typeImageFound = false;
    for (int64_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, types[i] != nullptr, "DragTest_003: types[i] is null.");
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "DragTest_003: types[%{public}lld]=%{public}s", (long long)i, types[i]);
        if (strcmp(types[i], kExpectedTypes[0]) == 0) {
            typeImageFound = true;
        }
    }
    NAPI_ASSERT(env, typeImageFound, "DragTest_003: general.image not found.");

    int64_t dataSizeImage = 0;
    int retImage = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[0], &dataSizeImage);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_003: GetSummaryOverviewSize(image) ret=%{public}d, dataSize=%{public}lld",
        retImage, (long long)dataSizeImage);
    NAPI_ASSERT(env, retImage == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(image) is fail.");
    NAPI_ASSERT(env, dataSizeImage != -1, "DragTest_003: image dataSize == -1.");

    const char* const* extensions = nullptr;
    int64_t extCount = 0;
    int retExt = OH_UDMF_GetSummaryFilenameExtensions(g_summary, &extensions, &extCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_003: GetSummaryFilenameExtensions ret=%{public}d, count=%{public}lld",
        retExt, (long long)extCount);
    NAPI_ASSERT(env, retExt == UDMF_E_OK, "DragTest_003: GetSummaryFilenameExtensions is fail.");
    NAPI_ASSERT(env, extCount == 1, "DragTest_003: extCount mismatch.");
    NAPI_ASSERT(env, extensions[0] != nullptr, "DragTest_003: extensions[0] is null.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_003: extensions[0]=%{public}s", extensions[0]);
    NAPI_ASSERT(env, strcmp(extensions[0], ".png") == 0, "DragTest_003: extension .png not found.");

    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;

    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DragTest_004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    NAPI_ASSERT(env, g_summary != nullptr, "DragTest_004: g_summary is null.");

    const char* const* types = nullptr;
    int64_t count = 0;
    int retTypes = OH_UDMF_GetSummaryOverviewTypes(g_summary, &types, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_004: OH_UDMF_GetSummaryOverviewTypes ret=%{public}d, count=%{public}lld",
        retTypes, (long long)count);
    NAPI_ASSERT(env, retTypes == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewTypes is fail.");
    NAPI_ASSERT(env, types != nullptr, "DragTest_004: types is null.");
    NAPI_ASSERT(env, count > 0, "DragTest_004: count <= 0.");

    const char* const kExpectedTypes[] = { "general.image" };
    const int64_t kExpectedCount = sizeof(kExpectedTypes) / sizeof(kExpectedTypes[0]);
    NAPI_ASSERT(env, count == kExpectedCount, "DragTest_004: count mismatch.");

    bool typeImageFound = false;
    for (int64_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, types[i] != nullptr, "DragTest_004: types[i] is null.");
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "DragTest_004: types[%{public}lld]=%{public}s", (long long)i, types[i]);
        if (strcmp(types[i], kExpectedTypes[0]) == 0) {
            typeImageFound = true;
        }
    }
    NAPI_ASSERT(env, typeImageFound, "DragTest_004: general.image not found.");

    int64_t dataSizeImage = 0;
    int retImage = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[0], &dataSizeImage);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_004: GetSummaryOverviewSize(image) ret=%{public}d, dataSize=%{public}lld",
        retImage, (long long)dataSizeImage);
    NAPI_ASSERT(env, retImage == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(image) is fail.");
    NAPI_ASSERT(env, dataSizeImage != -1, "DragTest_004: image dataSize == -1.");

    const char* const* extensions = nullptr;
    int64_t extCount = 0;
    int retExt = OH_UDMF_GetSummaryFilenameExtensions(g_summary, &extensions, &extCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_004: GetSummaryFilenameExtensions ret=%{public}d, count=%{public}lld",
        retExt, (long long)extCount);
    NAPI_ASSERT(env, retExt == UDMF_E_OK, "DragTest_004: GetSummaryFilenameExtensions is fail.");
    NAPI_ASSERT(env, extCount == 1, "DragTest_004: extCount mismatch.");
    NAPI_ASSERT(env, extensions[0] != nullptr, "DragTest_004: extensions[0] is null.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_004: extensions[0]=%{public}s", extensions[0]);
    NAPI_ASSERT(env, strcmp(extensions[0], ".png") == 0, "DragTest_004: extension .png not found.");

    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;

    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DragTest_005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    NAPI_ASSERT(env, g_summary != nullptr, "DragTest_005: g_summary is null.");

    const char* const* types = nullptr;
    int64_t count = 0;
    int retTypes = OH_UDMF_GetSummaryOverviewTypes(g_summary, &types, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_005: OH_UDMF_GetSummaryOverviewTypes ret=%{public}d, count=%{public}lld",
        retTypes, (long long)count);
    NAPI_ASSERT(env, retTypes == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewTypes is fail.");
    NAPI_ASSERT(env, types != nullptr, "DragTest_005: types is null.");
    NAPI_ASSERT(env, count > 0, "DragTest_005: count <= 0.");

    const char* const kExpectedTypes[] = { "general.image" };
    const int64_t kExpectedCount = sizeof(kExpectedTypes) / sizeof(kExpectedTypes[0]);
    NAPI_ASSERT(env, count == kExpectedCount, "DragTest_005: count mismatch.");

    bool typeImageFound = false;
    for (int64_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, types[i] != nullptr, "DragTest_005: types[i] is null.");
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "DragTest_005: types[%{public}lld]=%{public}s", (long long)i, types[i]);
        if (strcmp(types[i], kExpectedTypes[0]) == 0) {
            typeImageFound = true;
        }
    }
    NAPI_ASSERT(env, typeImageFound, "DragTest_005: general.image not found.");

    int64_t dataSizeImage = 0;
    int retImage = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[0], &dataSizeImage);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_005: GetSummaryOverviewSize(image) ret=%{public}d, dataSize=%{public}lld",
        retImage, (long long)dataSizeImage);
    NAPI_ASSERT(env, retImage == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(image) is fail.");
    NAPI_ASSERT(env, dataSizeImage != -1, "DragTest_005: image dataSize == -1.");

    const char* const* extensions = nullptr;
    int64_t extCount = 0;
    int retExt = OH_UDMF_GetSummaryFilenameExtensions(g_summary, &extensions, &extCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_005: GetSummaryFilenameExtensions ret=%{public}d, count=%{public}lld",
        retExt, (long long)extCount);
    NAPI_ASSERT(env, retExt == UDMF_E_OK, "DragTest_005: GetSummaryFilenameExtensions is fail.");
    NAPI_ASSERT(env, extCount == 1, "DragTest_005: extCount mismatch.");
    NAPI_ASSERT(env, extensions[0] != nullptr, "DragTest_005: extensions[0] is null.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_005: extensions[0]=%{public}s", extensions[0]);
    NAPI_ASSERT(env, strcmp(extensions[0], ".png") == 0, "DragTest_005: extension .png not found.");

    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;

    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DragTest_006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    NAPI_ASSERT(env, g_summary != nullptr, "DragTest_006: g_summary is null.");

    const char* const* types = nullptr;
    int64_t count = 0;
    int retTypes = OH_UDMF_GetSummaryOverviewTypes(g_summary, &types, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_006: OH_UDMF_GetSummaryOverviewTypes ret=%{public}d, count=%{public}lld",
        retTypes, (long long)count);
    NAPI_ASSERT(env, retTypes == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewTypes is fail.");
    NAPI_ASSERT(env, types != nullptr, "DragTest_006: types is null.");
    NAPI_ASSERT(env, count > 0, "DragTest_006: count <= 0.");
    
    const int64_t kExpectedCount = 125;
    NAPI_ASSERT(env, count == kExpectedCount, "DragTest_006: count mismatch.");
    
    const char* const kSampleTypes[] = { "general.png", "general.avi", "general.mp3" };
    bool sampleFound[3] = { false, false, false };
    for (int64_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, types[i] != nullptr, "DragTest_006: types[i] is null.");
        if (i < 5) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
                "DragTest_006: types[%{public}lld]=%{public}s", (long long)i, types[i]);
        }
        for (int j = 0; j < 3; ++j) {
            if (!sampleFound[j] && strcmp(types[i], kSampleTypes[j]) == 0) {
                sampleFound[j] = true;
            }
        }
    }
    NAPI_ASSERT(env, sampleFound[0], "DragTest_006: general.png not found.");
    NAPI_ASSERT(env, sampleFound[1], "DragTest_006: general.avi not found.");
    NAPI_ASSERT(env, sampleFound[2], "DragTest_006: general.mp3 not found.");
    
    for (int j = 0; j < 3; ++j) {
        int64_t dataSize = 0;
        int ret = OH_UDMF_GetSummaryOverviewSize(g_summary, kSampleTypes[j], &dataSize);
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "DragTest_006: GetSummaryOverviewSize(%{public}s) ret=%{public}d, dataSize=%{public}lld",
            kSampleTypes[j], ret, (long long)dataSize);
        NAPI_ASSERT(env, ret == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(sample) is fail.");
    }
    
    const char* const* extensions = nullptr;
    int64_t extCount = 0;
    int retExt = OH_UDMF_GetSummaryFilenameExtensions(g_summary, &extensions, &extCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_006: GetSummaryFilenameExtensions ret=%{public}d, count=%{public}lld",
        retExt, (long long)extCount);
    NAPI_ASSERT(env, retExt == UDMF_E_OK, "DragTest_006: GetSummaryFilenameExtensions is fail.");
    NAPI_ASSERT(env, extCount == 173, "DragTest_006: extCount mismatch.");
    const char* const kSampleExt6[] = { ".mp3", ".mp4", ".png" };
    bool extFound6[3] = { false, false, false };
    for (int64_t i = 0; i < extCount; ++i) {
        NAPI_ASSERT(env, extensions[i] != nullptr, "DragTest_006: extensions[i] is null.");
        if (i < 5) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
                "DragTest_006: extensions[%{public}lld]=%{public}s", (long long)i, extensions[i]);
        }
        for (int j = 0; j < 3; ++j) {
            if (!extFound6[j] && strcmp(extensions[i], kSampleExt6[j]) == 0) {
                extFound6[j] = true;
            }
        }
    }
    NAPI_ASSERT(env, extFound6[0], "DragTest_006: extension .mp3 not found.");
    NAPI_ASSERT(env, extFound6[1], "DragTest_006: extension .mp4 not found.");
    NAPI_ASSERT(env, extFound6[2], "DragTest_006: extension .png not found.");

    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;

    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DragTest_007(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    NAPI_ASSERT(env, g_summary != nullptr, "DragTest_007: g_summary is null.");

    const char* const* types = nullptr;
    int64_t count = 0;
    int retTypes = OH_UDMF_GetSummaryOverviewTypes(g_summary, &types, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_007: OH_UDMF_GetSummaryOverviewTypes ret=%{public}d, count=%{public}lld",
        retTypes, (long long)count);
    NAPI_ASSERT(env, retTypes == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewTypes is fail.");
    NAPI_ASSERT(env, types != nullptr, "DragTest_007: types is null.");
    NAPI_ASSERT(env, count > 0, "DragTest_007: count <= 0.");

    const char* const kExpectedTypes[] = { "general.audio", "general.video", "general.image" };
    const int64_t kExpectedCount = sizeof(kExpectedTypes) / sizeof(kExpectedTypes[0]);
    NAPI_ASSERT(env, count == kExpectedCount, "DragTest_007: count mismatch.");

    bool typeAudioFound = false;
    bool typeVideoFound = false;
    bool typeImageFound = false;
    for (int64_t i = 0; i < count; ++i) {
        NAPI_ASSERT(env, types[i] != nullptr, "DragTest_007: types[i] is null.");
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "DragTest_007: types[%{public}lld]=%{public}s", (long long)i, types[i]);
        if (strcmp(types[i], kExpectedTypes[0]) == 0) {
            typeAudioFound = true;
        } else if (strcmp(types[i], kExpectedTypes[1]) == 0) {
            typeVideoFound = true;
        } else if (strcmp(types[i], kExpectedTypes[2]) == 0) {
            typeImageFound = true;
        }
    }
    NAPI_ASSERT(env, typeAudioFound, "DragTest_007: general.audio not found.");
    NAPI_ASSERT(env, typeVideoFound, "DragTest_007: general.video not found.");
    NAPI_ASSERT(env, typeImageFound, "DragTest_007: general.image not found.");

    int64_t dataSizeAudio = 0;
    int retAudio = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[0], &dataSizeAudio);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_007: GetSummaryOverviewSize(audio) ret=%{public}d, dataSize=%{public}lld",
        retAudio, (long long)dataSizeAudio);
    NAPI_ASSERT(env, retAudio == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(audio) is fail.");
    NAPI_ASSERT(env, dataSizeAudio != -1, "DragTest_007: audio dataSize == -1.");

    int64_t dataSizeVideo = 0;
    int retVideo = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[1], &dataSizeVideo);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_007: GetSummaryOverviewSize(video) ret=%{public}d, dataSize=%{public}lld",
        retVideo, (long long)dataSizeVideo);
    NAPI_ASSERT(env, retVideo == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(video) is fail.");
    NAPI_ASSERT(env, dataSizeVideo != -1, "DragTest_007: video dataSize == -1.");

    int64_t dataSizeImage = 0;
    int retImage = OH_UDMF_GetSummaryOverviewSize(g_summary, kExpectedTypes[2], &dataSizeImage);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_007: GetSummaryOverviewSize(image) ret=%{public}d, dataSize=%{public}lld",
        retImage, (long long)dataSizeImage);
    NAPI_ASSERT(env, retImage == UDMF_E_OK, "OH_UDMF_GetSummaryOverviewSize(image) is fail.");
    NAPI_ASSERT(env, dataSizeImage != -1, "DragTest_007: image dataSize == -1.");
    
    const char* const* extensions = nullptr;
    int64_t extCount = 0;
    int retExt = OH_UDMF_GetSummaryFilenameExtensions(g_summary, &extensions, &extCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "DragTest_007: GetSummaryFilenameExtensions ret=%{public}d, count=%{public}lld",
        retExt, (long long)extCount);
    NAPI_ASSERT(env, retExt == UDMF_E_OK, "DragTest_007: GetSummaryFilenameExtensions is fail.");
    NAPI_ASSERT(env, extCount == 173, "DragTest_007: extCount mismatch.");
    const char* const kSampleExt[] = { ".mp3", ".mp4", ".png" };
    bool extFound[3] = { false, false, false };
    for (int64_t i = 0; i < extCount; ++i) {
        NAPI_ASSERT(env, extensions[i] != nullptr, "DragTest_007: extensions[i] is null.");
        if (i < 5) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
                "DragTest_007: extensions[%{public}lld]=%{public}s", (long long)i, extensions[i]);
        }
        for (int j = 0; j < 3; ++j) {
            if (!extFound[j] && strcmp(extensions[i], kSampleExt[j]) == 0) {
                extFound[j] = true;
            }
        }
    }
    NAPI_ASSERT(env, extFound[0], "DragTest_007: extension .mp3 not found.");
    NAPI_ASSERT(env, extFound[1], "DragTest_007: extension .mp4 not found.");
    NAPI_ASSERT(env, extFound[2], "DragTest_007: extension .png not found.");

    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;

    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value OH_Utd_BelongsTo_006(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_BelongsTo("", "general.text");
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_BelongsTo_007(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_BelongsTo("general.plain-text", "");
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetTypesByFilenameExtension_004(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    auto typeIdsNullptr = OH_Utd_GetTypesByFilenameExtension("", &count);
    napi_value returnCode;
    napi_create_int32(env, typeIdsNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetTypesByMimeType_004(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    auto typeIdsNullptr = OH_Utd_GetTypesByMimeType("", &count);
    napi_value returnCode;
    napi_create_int32(env, typeIdsNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsHigher_007(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsHigher("", UDMF_META_PLAIN_TEXT);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsHigher_008(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsHigher(UDMF_META_PLAIN_TEXT, "");
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsLower_007(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsLower("", UDMF_META_TEXT);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsLower_008(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsLower(UDMF_META_PLAIN_TEXT, "");
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "CreateDropTarget_001", nullptr, CreateDropTarget_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetOverviewSizeResult_001", nullptr, GetOverviewSizeResult_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_CreateSummary_001", nullptr, OH_UDMF_CreateSummary_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewTypes_001", nullptr, OH_UDMF_GetSummaryOverviewTypes_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewTypes_002", nullptr, OH_UDMF_GetSummaryOverviewTypes_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewTypes_003", nullptr, OH_UDMF_GetSummaryOverviewTypes_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewTypes_004", nullptr, OH_UDMF_GetSummaryOverviewTypes_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewSize_001", nullptr, OH_UDMF_GetSummaryOverviewSize_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewSize_002", nullptr, OH_UDMF_GetSummaryOverviewSize_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewSize_003", nullptr, OH_UDMF_GetSummaryOverviewSize_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewSize_004", nullptr, OH_UDMF_GetSummaryOverviewSize_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryOverviewSize_006", nullptr, OH_UDMF_GetSummaryOverviewSize_006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryFilenameExtensions_001", nullptr, OH_UDMF_GetSummaryFilenameExtensions_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryFilenameExtensions_002", nullptr, OH_UDMF_GetSummaryFilenameExtensions_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryFilenameExtensions_003", nullptr, OH_UDMF_GetSummaryFilenameExtensions_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_UDMF_GetSummaryFilenameExtensions_004", nullptr, OH_UDMF_GetSummaryFilenameExtensions_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DragTest_001", nullptr, DragTest_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DragTest_002", nullptr, DragTest_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DragTest_003", nullptr, DragTest_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DragTest_004", nullptr, DragTest_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DragTest_005", nullptr, DragTest_005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DragTest_006", nullptr, DragTest_006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DragTest_007", nullptr, DragTest_007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Utd_BelongsTo_006", nullptr, OH_Utd_BelongsTo_006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Utd_BelongsTo_007", nullptr, OH_Utd_BelongsTo_007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Utd_GetTypesByFilenameExtension_004", nullptr, OH_Utd_GetTypesByFilenameExtension_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Utd_GetTypesByMimeType_004", nullptr, OH_Utd_GetTypesByMimeType_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Utd_IsHigher_007", nullptr, OH_Utd_IsHigher_007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Utd_IsHigher_008", nullptr, OH_Utd_IsHigher_008, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Utd_IsLower_007", nullptr, OH_Utd_IsLower_007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Utd_IsLower_008", nullptr, OH_Utd_IsLower_008, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
