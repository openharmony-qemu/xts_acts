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
#include <arkui/ui_info_collection.h>
#include <arkui/ui_json_wrapper.h>

namespace ArkUICapiTest {

namespace {
constexpr uint32_t INVALID_EVENT_MASK = 1U << 31;
constexpr uint32_t INVALID_IGNORE_MASK = 1U << 31;
constexpr uint64_t UNKNOWN_SUBSCRIPTION_ID = 0xFFFFFFFFFFFFFFFFULL;

int32_t g_userDataValue = PARAM_0;
} // namespace

static void ContentChangeCallback(const OH_ArkUI_NativeModule_UIContentChangeEvent* event, void* userData)
{
    (void)event;
    (void)userData;
}

// 创建节点并返回其关联的UI上下文，失败时返回nullptr。
static ArkUI_ContextHandle GetTestContext(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    return OH_ArkUI_GetContextByNode(column);
}

static napi_value ContentChangeEventTest001(napi_env env, napi_callback_info info)
{
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        nullptr, true, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL, PARAM_0, nullptr, ContentChangeCallback,
        &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_UI_CONTEXT_INVALID);
    ASSERT_EQ(subscriptionId, PARAM_0);
    NAPI_END;
}

static napi_value ContentChangeEventTest002(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, true, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_0, nullptr, nullptr, &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CALLBACK_INVALID);
    ASSERT_EQ(subscriptionId, PARAM_0);
    NAPI_END;
}

static napi_value ContentChangeEventTest003(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, true, PARAM_0, PARAM_0, nullptr, ContentChangeCallback, &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value ContentChangeEventTest004(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, true, INVALID_EVENT_MASK, PARAM_0, nullptr, ContentChangeCallback, &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value ContentChangeEventTest005(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, INVALID_IGNORE_MASK, nullptr, ContentChangeCallback,
        &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value ContentChangeEventTest006(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, true, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_0, nullptr, ContentChangeCallback, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value ContentChangeEventTest007(napi_env env, napi_callback_info info)
{
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        nullptr, true, PARAM_0, PARAM_0, nullptr, nullptr, &subscriptionId);
    auto errorRet = ErrCodeAnyOfFailed(env, ret,
        { ARKUI_ERROR_CODE_UI_CONTEXT_INVALID, ARKUI_ERROR_CODE_CALLBACK_INVALID, ARKUI_ERROR_CODE_PARAM_INVALID });
    if (errorRet) {
        return errorRet;
    }
    NAPI_END;
}

static napi_value ContentChangeEventTest008(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, true, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL, PARAM_0, nullptr, ContentChangeCallback,
        &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest009(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, true, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_0, nullptr, ContentChangeCallback,
        &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest010(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, true, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL, PARAM_0, nullptr, ContentChangeCallback,
        &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest011(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, true, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY, PARAM_0, nullptr, ContentChangeCallback,
        &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest012(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE | OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL |
            OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY,
        PARAM_0, nullptr, ContentChangeCallback, &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest013(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(
        context, false, OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_0, nullptr, ContentChangeCallback,
        &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest014(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL, OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY,
        nullptr, ContentChangeCallback, &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest015(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL,
        OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO | OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST,
        nullptr, ContentChangeCallback, &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest016(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_0, &g_userDataValue, ContentChangeCallback,
        &subscriptionId);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId != PARAM_0, true);
    auto unret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(unret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest017(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId1 = PARAM_0;
    uint64_t subscriptionId2 = PARAM_0;
    auto ret1 = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_0, nullptr, ContentChangeCallback, &subscriptionId1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL, PARAM_0, nullptr, ContentChangeCallback, &subscriptionId2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(subscriptionId1 != subscriptionId2, true);
    auto unret1 = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId1);
    ASSERT_EQ(unret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto unret2 = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId2);
    ASSERT_EQ(unret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest018(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(nullptr, PARAM_1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_UI_CONTEXT_INVALID);
    NAPI_END;
}

static napi_value ContentChangeEventTest019(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    auto ret = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, PARAM_0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value ContentChangeEventTest020(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret1 = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_0, nullptr, ContentChangeCallback, &subscriptionId);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, UNKNOWN_SUBSCRIPTION_ID);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value ContentChangeEventTest021(napi_env env, napi_callback_info info)
{
    auto context = GetTestContext(env, info);
    ASSERT_EQ(context != nullptr, true);
    uint64_t subscriptionId = PARAM_0;
    auto ret1 = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(context, true,
        OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_0, nullptr, ContentChangeCallback, &subscriptionId);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(context, subscriptionId);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value ContentChangeEventTest022(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE, PARAM_1);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL, PARAM_2);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY, PARAM_4);
    ASSERT_EQ(static_cast<int32_t>(OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL), PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value ContentChangeEventTest023(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY, PARAM_1);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO, PARAM_2);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST, PARAM_4);
    NAPI_END;
}

static napi_value ContentChangeEventTest024(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START, PARAM_0);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END, PARAM_1);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START, PARAM_2);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END, PARAM_3);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW, PARAM_4);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE, PARAM_5);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START, PARAM_6);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END, PARAM_7);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL, PARAM_8);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_TABS_START, PARAM_9);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_TABS_END, PARAM_10);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL, PARAM_11);
    NAPI_END;
}

static napi_value ContentChangeEventTest025(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NativeModule_UIContentChangeEventType type = OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START;
    auto ret1 = OH_ArkUI_NativeModule_UIContentChangeEventGetType(nullptr, &type);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_PARAM_INVALID);
    uint64_t nanoTimestamp = PARAM_0;
    auto ret2 = OH_ArkUI_NativeModule_UIContentChangeEventGetTimestamp(nullptr, &nanoTimestamp);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    ArkUI_ContextHandle uiContext = nullptr;
    auto ret3 = OH_ArkUI_NativeModule_UIContentChangeEventGetContext(nullptr, &uiContext);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    const OH_ArkUI_NativeModule_UIJsonWrapper* json = nullptr;
    auto ret4 = OH_ArkUI_NativeModule_UIContentChangeEventGetContentChangeEventJson(nullptr, &json);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest
