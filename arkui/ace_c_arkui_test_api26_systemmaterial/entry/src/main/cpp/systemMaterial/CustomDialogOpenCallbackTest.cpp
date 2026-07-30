/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "systemMaterial/CustomDialogApi26Compat.h"
#include "systemMaterial/MaterialHelpers.h"
#include "systemMaterial/MaterialTestDecl.h"

#include <unistd.h>
#include <atomic>

/* normal SDK libace may lack the symbol; device/static lib provides strong def. */
extern "C" __attribute__((weak)) void OH_ArkUI_CustomDialog_OpenDialogWithCallback(
    ArkUI_CustomDialogOptions *options, void *userData, ArkUI_OpenDialogCallback callback)
{
    (void)options;
    if (callback != nullptr) {
        callback(401, -1, userData);
    }
}

namespace ArkUICapiTest {

namespace {

struct OpenDialogCallbackRecord {
    std::atomic<bool> called { false };
    int32_t errorCode { 0 };
    int32_t dialogId { 0 };
    void *userData { nullptr };
};

OpenDialogCallbackRecord g_openDialogRecord;

void ResetOpenDialogRecord()
{
    g_openDialogRecord.called.store(false);
    g_openDialogRecord.errorCode = 0;
    g_openDialogRecord.dialogId = 0;
    g_openDialogRecord.userData = nullptr;
}

void CaptureOpenDialogCallback(int32_t errorCode, int32_t dialogId, void *userData)
{
    g_openDialogRecord.errorCode = errorCode;
    g_openDialogRecord.dialogId = dialogId;
    g_openDialogRecord.userData = userData;
    g_openDialogRecord.called.store(true);
}

bool WaitForOpenDialogCallback(int maxRetries, int sleepUs)
{
    for (int retry = 0; retry < maxRetries; ++retry) {
        if (g_openDialogRecord.called.load()) {
            return true;
        }
        usleep(static_cast<useconds_t>(sleepUs));
    }
    return g_openDialogRecord.called.load();
}

bool IsDocumentedOpenDialogError(int32_t errorCode)
{
    return (errorCode == SUCCESS) || (errorCode == INVALID_PARAM) ||
        (errorCode == DIALOG_ERR_NODE_MOUNT_FAILURE) ||
        (errorCode == DIALOG_ERR_SUBWINDOW_CREATE_FAILURE);
}

ArkUI_CustomDialogOptions *CreateDialogOptionsWithContent()
{
    auto *nodeAPI = GetNodeApi();
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    return OH_ArkUI_CustomDialog_CreateOptions(content);
}

} // namespace

napi_value TestDialogOpenCallbackErrorEnumValues001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(DIALOG_ERR_NODE_MOUNT_FAILURE, 103306);
    ASSERT_EQ(DIALOG_ERR_SUBWINDOW_CREATE_FAILURE, 103308);
#ifdef ARKUI_HAS_OPEN_DIALOG_WITH_CALLBACK
    ASSERT_EQ(ARKUI_ERROR_CODE_DIALOG_NODE_MOUNT_FAILURE, DIALOG_ERR_NODE_MOUNT_FAILURE);
    ASSERT_EQ(ARKUI_ERROR_CODE_DIALOG_SUBWINDOW_CREATE_FAILURE, DIALOG_ERR_SUBWINDOW_CREATE_FAILURE);
#endif
    NAPI_END;
}

napi_value TestCustomDialogOpenDialogWithCallbackNullOptions001(napi_env env, napi_callback_info info)
{
    (void)info;
    ResetOpenDialogRecord();
    OH_ArkUI_CustomDialog_OpenDialogWithCallback(nullptr, nullptr, CaptureOpenDialogCallback);
    ASSERT_EQ(WaitForOpenDialogCallback(SIZE_100, PARAM_10000), true);
    ASSERT_EQ(g_openDialogRecord.errorCode, INVALID_PARAM);
    ASSERT_EQ(g_openDialogRecord.dialogId, PARAM_NEGATIVE_1);
    NAPI_END;
}

napi_value TestCustomDialogOpenDialogWithCallbackUserData001(napi_env env, napi_callback_info info)
{
    (void)info;
    int32_t marker = PARAM_100;
    ResetOpenDialogRecord();
    OH_ArkUI_CustomDialog_OpenDialogWithCallback(nullptr, &marker, CaptureOpenDialogCallback);
    ASSERT_EQ(WaitForOpenDialogCallback(SIZE_100, PARAM_10000), true);
    ASSERT_OBJ(g_openDialogRecord.userData, &marker);
    NAPI_END;
}

napi_value TestCustomDialogOpenDialogWithCallbackValidOptions001(napi_env env, napi_callback_info info)
{
    (void)info;
    ResetOpenDialogRecord();
    ArkUI_CustomDialogOptions *options = CreateDialogOptionsWithContent();
    ASSERT_NOTNULL(options);
    OH_ArkUI_CustomDialog_OpenDialogWithCallback(options, nullptr, CaptureOpenDialogCallback);
    ASSERT_EQ(WaitForOpenDialogCallback(SIZE_200, PARAM_10000), true);
    ASSERT_EQ(IsDocumentedOpenDialogError(g_openDialogRecord.errorCode), true);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    NAPI_END;
}

} // namespace ArkUICapiTest
