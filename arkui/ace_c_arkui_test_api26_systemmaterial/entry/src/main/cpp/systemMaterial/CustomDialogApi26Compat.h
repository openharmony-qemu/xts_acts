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

#ifndef ARKUI_CAPI_CUSTOM_DIALOG_API26_COMPAT_H
#define ARKUI_CAPI_CUSTOM_DIALOG_API26_COMPAT_H

#include <arkui/error_code.h>
#include <arkui/native_dialog.h>
#include <cstdint>

namespace ArkUICapiTest {

constexpr int32_t DIALOG_ERR_NODE_MOUNT_FAILURE = 103306;
constexpr int32_t DIALOG_ERR_SUBWINDOW_CREATE_FAILURE = 103308;

} // namespace ArkUICapiTest

#if !defined(ARKUI_HAS_OPEN_DIALOG_WITH_CALLBACK)
#ifdef __cplusplus
extern "C" {
#endif

typedef void (*ArkUI_OpenDialogCallback)(int32_t errorCode, int32_t dialogId, void *userData);

void OH_ArkUI_CustomDialog_OpenDialogWithCallback(ArkUI_CustomDialogOptions *options, void *userData,
    ArkUI_OpenDialogCallback callback);

#ifdef __cplusplus
}
#endif
#endif

#endif
