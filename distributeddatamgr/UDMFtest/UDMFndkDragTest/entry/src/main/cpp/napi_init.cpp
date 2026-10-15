/*
 * UDMF NDK drag-and-drop XTS test suite - NAPI entry points.
 *
 * This translation unit publishes the native helpers consumed by the ArkTS
 * test cases: it builds the native drop target node, captures the summary of
 * an in-flight drag, and exercises the UDMF summary / UTD utility C APIs.
 */

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

#include "common.h"

/* ---------------------------------------------------------------------------
 * Module-wide state
 * ------------------------------------------------------------------------- */

/* Log tag prepended to every record emitted from this translation unit. */
const char *TAG = "UDMF_Ndk_Drag_Test: ";

/* Native node API implementation, fetched lazily on first use. */
static ArkUI_NativeNodeAPI_1* g_nodeApi = nullptr;

/* Text node acting as the drag-and-drop target attached to the page. */
static ArkUI_NodeHandle g_dropTarget = nullptr;

/* Outcome of the most recent overview-size query: 1 = success, 0 = failure. */
static int g_overviewSizeResult = 0;

/* Summary captured while a drag is in progress; released once consumed. */
static OH_UDMF_Summary* g_summary = nullptr;

/* ---------------------------------------------------------------------------
 * Drag event handling
 * ------------------------------------------------------------------------- */

/*
 * Captures the summary carried by the drag currently interacting with the
 * target node and stores it in g_summary so GetOverviewSizeResult_001 can
 * inspect it afterwards.
 *
 * Params:
 *   dragEvent - drag event reported by ArkUI; must not be null.
 */
void OH_UDMF_GetSummaryOverviewSize_005(ArkUI_DragEvent* dragEvent)
{
    OH_UDMF_Summary *summary = OH_UDMF_CreateSummary();
    if (summary == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
            "OH_UDMF_GetSummaryOverviewSize_005: OH_UDMF_CreateSummary returned null");
        return;
    }

    int32_t getSummaryResult = OH_ArkUI_DragEvent_GetSummary(dragEvent, summary);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "OH_UDMF_GetSummaryOverviewSize_005: OH_ArkUI_DragEvent_GetSummary ret=%{public}d", getSummaryResult);
    if (getSummaryResult != ARKUI_ERROR_CODE_NO_ERROR) {
        /* The summary could not be read: release the scratch object and keep
         * the previously captured summary, if any. */
        OH_UDMF_DestroySummary(summary);
        return;
    }

    g_summary = summary;
}

/*
 * Node event receiver installed by CreateDropTarget_001. Forwards drag-enter
 * and drop events to the summary capture helper; every other event type is
 * ignored.
 *
 * Params:
 *   event - node event dispatched by the ArkUI native framework.
 */
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

    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "Native drag callback received, eventType=%{public}d", eventType);
    OH_UDMF_GetSummaryOverviewSize_005(dragEvent);
}

/* ---------------------------------------------------------------------------
 * NAPI entry points
 * ------------------------------------------------------------------------- */

/*
 * Creates the native drop target node and attaches it to the NodeContent
 * handed over by the ArkTS side.
 *
 * Params (via napi_callback_info):
 *   args[0] - NodeContent handle of the NodeController hosting the target.
 * Returns:
 *   0 when the node was attached successfully; -1 when the NodeContent
 *   argument, the native node API or the node creation is unavailable;
 *   otherwise the raw return code of OH_ArkUI_NodeContent_AddNode.
 */
static napi_value CreateDropTarget_001(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "CreateDropTarget_001 start");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    ArkUI_NodeContentHandle content = nullptr;
    if (argc != 1 || OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &content) != 0 || !content) {
        /* The ArkTS side did not pass a usable NodeContent. */
        OH_LOG_INFO(LOG_APP, "CreateDropTarget_001: Failed to obtain NodeContent");
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    if (!g_nodeApi) {
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeApi);
    }
    if (!g_nodeApi) {
        /* The native node API could not be resolved. */
        OH_LOG_INFO(LOG_APP, "CreateDropTarget_001: Failed to obtain ArkUI_NativeNodeAPI_1");
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    g_dropTarget = g_nodeApi->createNode(ARKUI_NODE_TEXT);
    if (!g_dropTarget) {
        /* Node allocation failed: nothing to register or attach. */
        OH_LOG_INFO(LOG_APP, "CreateDropTarget_001: Failed to create drop target node");
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    /* Give the target a fixed size of 300 x 120 so it can receive drops. */
    ArkUI_NumberValue width[] = { { .f32 = 300.0f } };
    ArkUI_AttributeItem widthItem = { width, 1 };
    g_nodeApi->setAttribute(g_dropTarget, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue height[] = { { .f32 = 120.0f } };
    ArkUI_AttributeItem heightItem = { height, 1 };
    g_nodeApi->setAttribute(g_dropTarget, NODE_HEIGHT, &heightItem);

    /* Light background colour so the drop area is visible on screen. */
    ArkUI_NumberValue color[] = { { .u32 = 0xFFE8EEF7 } };
    ArkUI_AttributeItem colorItem = { color, 1 };
    g_nodeApi->setAttribute(g_dropTarget, NODE_BACKGROUND_COLOR, &colorItem);

    /* Observe drag-enter and drop so the drag summary gets captured. */
    g_nodeApi->registerNodeEventReceiver(OnNodeEvent);
    g_nodeApi->registerNodeEvent(g_dropTarget, NODE_ON_DRAG_ENTER, 1, nullptr);
    g_nodeApi->registerNodeEvent(g_dropTarget, NODE_ON_DROP, 2, nullptr);

    int attachResult = OH_ArkUI_NodeContent_AddNode(content, g_dropTarget);
    OH_LOG_INFO(LOG_APP, "CreateDropTarget_001: Native drop target created, ret=%{public}d", attachResult);

    napi_value result = nullptr;
    napi_create_int32(env, attachResult, &result);
    return result;
}

/*
 * Consumes the summary captured by the drag callbacks and queries the overview
 * size for the image and audio UTD types.
 *
 * Returns:
 *   1 when both queries returned UDMF_E_OK; 0 when no summary was captured.
 *   Throws a NAPI error when either query fails.
 */
static napi_value GetOverviewSizeResult_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_overviewSizeResult = 0;

    if (!g_summary) {
        /* No drag happened since the target was created, or the summary was
         * already consumed: report failure to the caller. */
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "GetOverviewSizeResult_001: g_summary is null");
        napi_create_int32(env, 0, &result);
        return result;
    }

    /* Query the overview size of the image type. */
    int64_t imageOverviewSize = 0;
    int imageQueryResult = OH_UDMF_GetSummaryOverviewSize(g_summary, "general.image", &imageOverviewSize);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "GetOverviewSizeResult_001: image overview query ret=%{public}d, size=%{public}lld",
        imageQueryResult, (long long)imageOverviewSize);
    g_overviewSizeResult = (imageQueryResult == UDMF_E_OK) ? 1 : 0;
    NAPI_ASSERT(env, imageQueryResult == UDMF_E_OK, "OH_Preferences_Open is fail.");

    /* Query the overview size of the audio type. */
    int64_t audioOverviewSize = 0;
    int audioQueryResult = OH_UDMF_GetSummaryOverviewSize(g_summary, "general.audio", &audioOverviewSize);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG,
        "GetOverviewSizeResult_001: audio overview query ret=%{public}d, size=%{public}lld",
        audioQueryResult, (long long)audioOverviewSize);
    g_overviewSizeResult = (audioQueryResult == UDMF_E_OK) ? 1 : 0;
    NAPI_ASSERT(env, audioQueryResult == UDMF_E_OK, "OH_Preferences_Open is fail.");

    /* Both queries succeeded: release the summary and report success. */
    int returnCode = 1;
    OH_UDMF_DestroySummary(g_summary);
    g_summary = nullptr;
    napi_create_int32(env, returnCode, &result);
    return result;
}

/*
 * Verifies that OH_UDMF_CreateSummary produces a non-null summary object.
 * Returns 1 on success, 0 when the creation failed.
 */
static napi_value OH_UDMF_CreateSummary_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    napi_create_int32(env, summary != nullptr, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/* --- OH_UDMF_GetSummaryOverviewTypes ------------------------------------- */

/*
 * Passing a null summary to OH_UDMF_GetSummaryOverviewTypes must be rejected
 * with UDMF_E_INVALID_PARAM. Returns 1 when the expected error is reported.
 */
static napi_value OH_UDMF_GetSummaryOverviewTypes_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char* const* types = nullptr;
    int64_t count = 0;
    int queryResult = OH_UDMF_GetSummaryOverviewTypes(nullptr, &types, &count);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    return result;
}

/*
 * Passing a null types output to OH_UDMF_GetSummaryOverviewTypes must be
 * rejected with UDMF_E_INVALID_PARAM. Returns 1 when the expected error is
 * reported.
 */
static napi_value OH_UDMF_GetSummaryOverviewTypes_002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int64_t count = 0;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int queryResult = OH_UDMF_GetSummaryOverviewTypes(summary, nullptr, &count);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/*
 * Passing a null count output to OH_UDMF_GetSummaryOverviewTypes must be
 * rejected with UDMF_E_INVALID_PARAM. Returns 1 when the expected error is
 * reported.
 */
static napi_value OH_UDMF_GetSummaryOverviewTypes_003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char* const* types = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int queryResult = OH_UDMF_GetSummaryOverviewTypes(summary, &types, nullptr);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/*
 * Calls OH_UDMF_GetSummaryOverviewTypes with a valid, empty summary and all
 * output pointers set. Returns 1 when the call reports UDMF_E_OK.
 */
static napi_value OH_UDMF_GetSummaryOverviewTypes_004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();

    const char* const* types = nullptr;
    int64_t count = 0;
    int queryResult = OH_UDMF_GetSummaryOverviewTypes(summary, &types, &count);
    napi_create_int32(env, queryResult == UDMF_E_OK, &result);

    OH_UDMF_DestroySummary(summary);
    return result;
}

/* --- OH_UDMF_GetSummaryOverviewSize -------------------------------------- */

/*
 * Passing a null summary to OH_UDMF_GetSummaryOverviewSize must be rejected
 * with UDMF_E_INVALID_PARAM. Returns 1 when the expected error is reported.
 */
static napi_value OH_UDMF_GetSummaryOverviewSize_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int64_t overviewSize = 0;
    int queryResult = OH_UDMF_GetSummaryOverviewSize(nullptr, "general.file", &overviewSize);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    return result;
}

/*
 * Passing a null type id to OH_UDMF_GetSummaryOverviewSize must be rejected
 * with UDMF_E_INVALID_PARAM. Returns 1 when the expected error is reported.
 */
static napi_value OH_UDMF_GetSummaryOverviewSize_002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int64_t overviewSize = 0;
    int queryResult = OH_UDMF_GetSummaryOverviewSize(summary, nullptr, &overviewSize);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/*
 * Passing a null size output to OH_UDMF_GetSummaryOverviewSize must be
 * rejected with UDMF_E_INVALID_PARAM. Returns 1 when the expected error is
 * reported.
 */
static napi_value OH_UDMF_GetSummaryOverviewSize_003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int queryResult = OH_UDMF_GetSummaryOverviewSize(summary, "general.file", nullptr);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/*
 * Queries the overview size of "general.file" on an empty summary: no record
 * of that type exists, so UDMF_ERR is expected. Returns 1 when the expected
 * error code is reported.
 */
static napi_value OH_UDMF_GetSummaryOverviewSize_004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int64_t overviewSize = 0;
    int queryResult = OH_UDMF_GetSummaryOverviewSize(summary, "general.file", &overviewSize);
    napi_create_int32(env, queryResult == UDMF_ERR, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/*
 * Queries the overview size with an empty type id on an empty summary:
 * UDMF_ERR is expected. Returns 1 when the expected error code is reported.
 */
static napi_value OH_UDMF_GetSummaryOverviewSize_006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int64_t overviewSize = 0;
    int queryResult = OH_UDMF_GetSummaryOverviewSize(summary, "", &overviewSize);
    napi_create_int32(env, queryResult == UDMF_ERR, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/* --- OH_UDMF_GetSummaryFilenameExtensions ------------------------------- */

/*
 * Passing a null summary to OH_UDMF_GetSummaryFilenameExtensions must be
 * rejected with UDMF_E_INVALID_PARAM. Returns 1 when the expected error is
 * reported.
 */
static napi_value OH_UDMF_GetSummaryFilenameExtensions_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char* const* extensions = nullptr;
    int64_t count = 0;
    int queryResult = OH_UDMF_GetSummaryFilenameExtensions(nullptr, &extensions, &count);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    return result;
}

/*
 * Passing a null extensions output to OH_UDMF_GetSummaryFilenameExtensions
 * must be rejected with UDMF_E_INVALID_PARAM. Returns 1 when the expected
 * error is reported.
 */
static napi_value OH_UDMF_GetSummaryFilenameExtensions_002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    int64_t count = 0;
    int queryResult = OH_UDMF_GetSummaryFilenameExtensions(summary, nullptr, &count);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/*
 * Passing a null count output to OH_UDMF_GetSummaryFilenameExtensions must
 * be rejected with UDMF_E_INVALID_PARAM. Returns 1 when the expected error
 * is reported.
 */
static napi_value OH_UDMF_GetSummaryFilenameExtensions_003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    const char* const* extensions = nullptr;
    int queryResult = OH_UDMF_GetSummaryFilenameExtensions(summary, &extensions, nullptr);
    napi_create_int32(env, queryResult == UDMF_E_INVALID_PARAM, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/*
 * Calls OH_UDMF_GetSummaryFilenameExtensions with a valid, empty summary and
 * all output pointers set. Returns 1 when the call reports UDMF_E_OK.
 */
static napi_value OH_UDMF_GetSummaryFilenameExtensions_004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_UDMF_Summary* summary = OH_UDMF_CreateSummary();
    const char* const* extensions = nullptr;
    int64_t count = 0;
    int queryResult = OH_UDMF_GetSummaryFilenameExtensions(summary, &extensions, &count);
    napi_create_int32(env, queryResult == UDMF_E_OK, &result);
    OH_UDMF_DestroySummary(summary);
    return result;
}

/* --- OH_Utd type utilities ----------------------------------------------- */

/*
 * OH_Utd_BelongsTo must return false when the queried type id is empty.
 * Returns 1 when false is observed as expected.
 */
static napi_value OH_Utd_BelongsTo_006(napi_env env, napi_callback_info info)
{
    bool belongs = OH_Utd_BelongsTo("", "general.text");
    napi_value returnCode = nullptr;
    napi_create_int32(env, belongs == false, &returnCode);
    return returnCode;
}

/*
 * OH_Utd_BelongsTo must return false when the belonging type id is empty.
 * Returns 1 when false is observed as expected.
 */
static napi_value OH_Utd_BelongsTo_007(napi_env env, napi_callback_info info)
{
    bool belongs = OH_Utd_BelongsTo("general.plain-text", "");
    napi_value returnCode = nullptr;
    napi_create_int32(env, belongs == false, &returnCode);
    return returnCode;
}

/*
 * OH_Utd_GetTypesByFilenameExtension must return null for an empty
 * extension. Returns 1 when null is observed as expected.
 */
static napi_value OH_Utd_GetTypesByFilenameExtension_004(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    auto typeIds = OH_Utd_GetTypesByFilenameExtension("", &count);
    napi_value returnCode = nullptr;
    napi_create_int32(env, typeIds == nullptr, &returnCode);
    return returnCode;
}

/*
 * OH_Utd_GetTypesByMimeType must return null for an empty MIME type.
 * Returns 1 when null is observed as expected.
 */
static napi_value OH_Utd_GetTypesByMimeType_004(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    auto typeIds = OH_Utd_GetTypesByMimeType("", &count);
    napi_value returnCode = nullptr;
    napi_create_int32(env, typeIds == nullptr, &returnCode);
    return returnCode;
}

/*
 * OH_Utd_IsHigher must return false when the lower type id is empty.
 * Returns 1 when false is observed as expected.
 */
static napi_value OH_Utd_IsHigher_007(napi_env env, napi_callback_info info)
{
    bool isHigher = OH_Utd_IsHigher("", UDMF_META_PLAIN_TEXT);
    napi_value returnCode = nullptr;
    napi_create_int32(env, isHigher == false, &returnCode);
    return returnCode;
}

/*
 * OH_Utd_IsHigher must return false when the higher type id is empty.
 * Returns 1 when false is observed as expected.
 */
static napi_value OH_Utd_IsHigher_008(napi_env env, napi_callback_info info)
{
    bool isHigher = OH_Utd_IsHigher(UDMF_META_PLAIN_TEXT, "");
    napi_value returnCode = nullptr;
    napi_create_int32(env, isHigher == false, &returnCode);
    return returnCode;
}

/*
 * OH_Utd_IsLower must return false when the higher type id is empty.
 * Returns 1 when false is observed as expected.
 */
static napi_value OH_Utd_IsLower_007(napi_env env, napi_callback_info info)
{
    bool isLower = OH_Utd_IsLower("", UDMF_META_TEXT);
    napi_value returnCode = nullptr;
    napi_create_int32(env, isLower == false, &returnCode);
    return returnCode;
}

/*
 * OH_Utd_IsLower must return false when the lower type id is empty.
 * Returns 1 when false is observed as expected.
 */
static napi_value OH_Utd_IsLower_008(napi_env env, napi_callback_info info)
{
    bool isLower = OH_Utd_IsLower(UDMF_META_PLAIN_TEXT, "");
    napi_value returnCode = nullptr;
    napi_create_int32(env, isLower == false, &returnCode);
    return returnCode;
}

/* ---------------------------------------------------------------------------
 * Module registration
 * ------------------------------------------------------------------------- */

EXTERN_C_START
/*
 * Publishes all native test entry points on the exports object of the module.
 *
 * Params:
 *   env     - NAPI environment of the registering runtime.
 *   exports - object the test functions are attached to.
 * Returns:
 *   The enriched exports object.
 */
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

/* Descriptor of the "entry" NAPI module provided by this library. */
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

/* Runs when the library is loaded: hands the module descriptor to NAPI. */
extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
