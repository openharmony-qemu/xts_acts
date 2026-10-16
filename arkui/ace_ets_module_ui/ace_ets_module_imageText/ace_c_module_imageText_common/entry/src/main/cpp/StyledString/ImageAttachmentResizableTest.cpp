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
#include <arkui/styled_string.h>
#include <hilog/log.h>
#include <native_drawing/drawing_lattice.h>
#include <native_drawing/drawing_rect.h>

namespace ArkUICapiTest {

static OH_Drawing_Lattice* CreateAttachmentLattice()
{
    int xDivs[PARAM_2] = {PARAM_10, PARAM_20};
    int yDivs[PARAM_2] = {PARAM_10, PARAM_20};
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PARAM_0, PARAM_0, PARAM_100, PARAM_100);
    if (rect == nullptr) {
        return nullptr;
    }
    OH_Drawing_LatticeRectType rectTypes[PARAM_9] = {DEFAULT};
    uint32_t colors[PARAM_9] = {COLOR_RED};
    OH_Drawing_Lattice* lattice = nullptr;
    auto code = OH_Drawing_LatticeCreate(xDivs, yDivs, PARAM_2, PARAM_2, rect, rectTypes, PARAM_9, colors, PARAM_9,
        &lattice);
    OH_Drawing_RectDestroy(rect);
    if (code != OH_DRAWING_SUCCESS) {
        return nullptr;
    }
    return lattice;
}

static napi_value ImageAttachmentResizableTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto attachment = OH_ArkUI_ImageAttachment_Create();
    ASSERT_EQ(attachment != nullptr, true);
    auto ret = OH_ArkUI_ImageAttachment_SetResizableSlice(attachment, PARAM_20, PARAM_10, PARAM_20, PARAM_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ImageAttachmentResizableTest_001 SetResizableSlice ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_ImageAttachment_Destroy(attachment);
    NAPI_END(text);
}

static napi_value ImageAttachmentResizableTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto attachment = OH_ArkUI_ImageAttachment_Create();
    ASSERT_EQ(attachment != nullptr, true);
    OH_ArkUI_ImageAttachment_SetResizableSlice(attachment, PARAM_20, PARAM_10, PARAM_20, PARAM_5);
    float left = PARAM_0;
    float top = PARAM_0;
    float right = PARAM_0;
    float bottom = PARAM_0;
    auto ret = OH_ArkUI_ImageAttachment_GetResizableSlice(attachment, &left, &top, &right, &bottom);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ImageAttachmentResizableTest_002 GetResizableSlice ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(left, PARAM_20);
    ASSERT_EQ(top, PARAM_10);
    ASSERT_EQ(right, PARAM_20);
    ASSERT_EQ(bottom, PARAM_5);
    OH_ArkUI_ImageAttachment_Destroy(attachment);
    NAPI_END(text);
}

static napi_value ImageAttachmentResizableTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_ImageAttachment_SetResizableSlice(nullptr, PARAM_20, PARAM_10, PARAM_20, PARAM_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ImageAttachmentResizableTest_003 SetResizableSlice nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value ImageAttachmentResizableTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float left = PARAM_0;
    float top = PARAM_0;
    float right = PARAM_0;
    float bottom = PARAM_0;
    auto ret = OH_ArkUI_ImageAttachment_GetResizableSlice(nullptr, &left, &top, &right, &bottom);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ImageAttachmentResizableTest_004 GetResizableSlice nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value ImageAttachmentResizableTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto attachment = OH_ArkUI_ImageAttachment_Create();
    ASSERT_EQ(attachment != nullptr, true);
    auto ret = OH_ArkUI_ImageAttachment_GetResizableSlice(attachment, nullptr, nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ImageAttachmentResizableTest_005 GetResizableSlice null out ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_ImageAttachment_Destroy(attachment);
    NAPI_END(text);
}

static napi_value ImageAttachmentResizableTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto attachment = OH_ArkUI_ImageAttachment_Create();
    ASSERT_EQ(attachment != nullptr, true);
    auto lattice = CreateAttachmentLattice();
    ASSERT_EQ(lattice != nullptr, true);
    auto ret = OH_ArkUI_ImageAttachment_SetResizableLattice(attachment, lattice);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ImageAttachmentResizableTest_006 SetResizableLattice ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_Drawing_LatticeDestroy(lattice);
    OH_ArkUI_ImageAttachment_Destroy(attachment);
    NAPI_END(text);
}

static napi_value ImageAttachmentResizableTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lattice = CreateAttachmentLattice();
    ASSERT_EQ(lattice != nullptr, true);
    auto ret = OH_ArkUI_ImageAttachment_SetResizableLattice(nullptr, lattice);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ImageAttachmentResizableTest_008 SetResizableLattice nullptr att ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_Drawing_LatticeDestroy(lattice);
    NAPI_END(text);
}

static napi_value ImageAttachmentResizableTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto attachment = OH_ArkUI_ImageAttachment_Create();
    ASSERT_EQ(attachment != nullptr, true);
    auto ret = OH_ArkUI_ImageAttachment_SetResizableLattice(attachment, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ImageAttachmentResizableTest_009 SetResizableLattice nullptr lattice ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_ImageAttachment_Destroy(attachment);
    NAPI_END(text);
}

}
