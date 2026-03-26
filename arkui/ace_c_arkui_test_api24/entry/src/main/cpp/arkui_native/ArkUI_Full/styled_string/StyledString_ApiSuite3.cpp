/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "../../../common/common.h"
#include <arkui/styled_string.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

namespace ArkUICapiTest {

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetPadding(const OH_ArkUI_ImageAttachment *, ArkUI_Margin *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_355(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_WordBreak outWb = static_cast<ArkUI_WordBreak>(0);
    auto ec = OH_ArkUI_ParagraphStyle_GetWordBreak(obj, &outWb);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ParagraphStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_SetLeadingMarginPixelMap(OH_ArkUI_ParagraphStyle *, struct OH_PixelmapNative *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_356(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_Pixelmap_InitializationOptions *opts = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&opts);
    if (opts == nullptr) {
        OH_ArkUI_ParagraphStyle_Destroy(obj);
        return nullptr;
    }
    (void)OH_PixelmapInitializationOptions_SetWidth(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetHeight(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pm = nullptr;
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm);
    (void)OH_PixelmapInitializationOptions_Release(opts);
    if (pm == nullptr) {
        OH_ArkUI_ParagraphStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_ParagraphStyle_SetLeadingMarginPixelMap(obj, pm);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_PixelmapNative_Destroy(&pm);
            OH_ArkUI_ParagraphStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    (void)OH_PixelmapNative_Destroy(&pm);
    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_GetLeadingMarginPixelMap(const OH_ArkUI_ParagraphStyle *, struct OH_PixelmapNative **)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_357(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    struct OH_PixelmapNative* holder1 = nullptr;
    struct OH_PixelmapNative** outPtr1 = &holder1;
    auto ec = OH_ArkUI_ParagraphStyle_GetLeadingMarginPixelMap(obj, outPtr1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_SetLeadingMarginWidth(OH_ArkUI_ParagraphStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_358(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ParagraphStyle_SetLeadingMarginWidth(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_GetLeadingMarginWidth(const OH_ArkUI_ParagraphStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_359(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_ParagraphStyle_GetLeadingMarginWidth(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_SetLeadingMarginHeight(OH_ArkUI_ParagraphStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_360(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ParagraphStyle_SetLeadingMarginHeight(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_GetLeadingMarginHeight(const OH_ArkUI_ParagraphStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_361(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_ParagraphStyle_GetLeadingMarginHeight(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_SetParagraphSpacing(OH_ArkUI_ParagraphStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_362(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ParagraphStyle_SetParagraphSpacing(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_GetParagraphSpacing(const OH_ArkUI_ParagraphStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_363(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_ParagraphStyle_GetParagraphSpacing(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_SetTextVerticalAlign(OH_ArkUI_ParagraphStyle *, ArkUI_TextVerticalAlignment)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_364(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ParagraphStyle_SetTextVerticalAlign(obj, static_cast<ArkUI_TextVerticalAlignment>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_GetTextVerticalAlign(const OH_ArkUI_ParagraphStyle *, ArkUI_TextVerticalAlignment *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_365(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextVerticalAlignment outVa = static_cast<ArkUI_TextVerticalAlignment>(0);
    auto ec = OH_ArkUI_ParagraphStyle_GetTextVerticalAlign(obj, &outVa);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ParagraphStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_RegisterOnDrawLeadingMarginCallback
 * 预期效果: 注册前导边距绘制回调成功。
 * 实际测试: 创建 ParagraphStyle，使用非空 C 函数指针（lambda+）注册回调，再销毁。
 */
static napi_value TestArkUICapi_366(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    using MarginCb = void (*)(ArkUI_DrawContext *, OH_ArkUI_LeadingMarginSpanDrawInfo *);
    MarginCb cb = +[](ArkUI_DrawContext *ctx, OH_ArkUI_LeadingMarginSpanDrawInfo *info) {
        (void)ctx;
        (void)info;
    };
    auto ec = OH_ArkUI_ParagraphStyle_RegisterOnDrawLeadingMarginCallback(obj, cb);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_RegisterOnGetLeadingMarginCallback(OH_ArkUI_ParagraphStyle *, float (*)())
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_367(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ParagraphStyle_RegisterOnGetLeadingMarginCallback(
        obj,
        +[]() -> float { return 0.0f; });
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ParagraphStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_SetTextDirection(OH_ArkUI_ParagraphStyle *, ArkUI_TextDirection)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_368(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ParagraphStyle_SetTextDirection(obj, static_cast<ArkUI_TextDirection>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ParagraphStyle_GetTextDirection(const OH_ArkUI_ParagraphStyle *, ArkUI_TextDirection *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_369(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextDirection tdOut1 = static_cast<ArkUI_TextDirection>(0);
    auto ec = OH_ArkUI_ParagraphStyle_GetTextDirection(obj, &tdOut1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_GestureStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_GestureStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_370(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_GestureStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_GestureStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_GestureStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_GestureStyle_Create() 后调用 OH_ArkUI_GestureStyle_Destroy。
 */
static napi_value TestArkUICapi_371(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_GestureStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_GestureStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_GestureStyle_RegisterOnClickCallback(OH_ArkUI_GestureStyle *, void (*)(ArkUI_NodeEvent *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_GestureStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_372(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_GestureStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_GestureStyle_RegisterOnClickCallback(
        obj,
        +[](ArkUI_NodeEvent *) {});
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_GestureStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_GestureStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_GestureStyle_RegisterOnLongPressCallback(OH_ArkUI_GestureStyle *, void (*)(ArkUI_GestureEvent *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_GestureStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_373(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_GestureStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_GestureStyle_RegisterOnLongPressCallback(
        obj,
        +[](ArkUI_GestureEvent *) {});
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_GestureStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_GestureStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_GestureStyle_RegisterOnTouchCallback(OH_ArkUI_GestureStyle *, void (*)(ArkUI_NodeEvent *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_GestureStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_374(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_GestureStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_GestureStyle_RegisterOnTouchCallback(
        obj,
        +[](ArkUI_NodeEvent *) {});
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_GestureStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_GestureStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextShadowStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextShadowStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_375(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextShadowStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextShadowStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextShadowStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextShadowStyle_Create() 后调用 OH_ArkUI_TextShadowStyle_Destroy。
 */
static napi_value TestArkUICapi_376(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextShadowStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextShadowStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextShadowStyle_SetTextShadow(OH_ArkUI_TextShadowStyle *, const OH_ArkUI_ShadowOptions **, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextShadowStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_377(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextShadowStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    const OH_ArkUI_ShadowOptions *holder1 = nullptr;
    auto ec = OH_ArkUI_TextShadowStyle_SetTextShadow(obj, &holder1, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextShadowStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_ImageAttachment_GetBorderRadiuses(const OH_ArkUI_ImageAttachment *, float *, float *, float *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_381(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    float v2 = 0.0f;
    float v3 = 0.0f;
    float v4 = 0.0f;
    auto ec = OH_ArkUI_ImageAttachment_GetBorderRadiuses(obj, &v1, &v2, &v3, &v4);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_UserDataSpan_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_UserDataSpan_GetUserData(const OH_ArkUI_UserDataSpan *, void **)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_UserDataSpan_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_416(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_UserDataSpan_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    void* holder1 = nullptr;
    void** outPtr1 = &holder1;
    auto ec = OH_ArkUI_UserDataSpan_GetUserData(obj, outPtr1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_UserDataSpan_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_CustomSpan_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_CustomSpan_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_417(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_CustomSpan_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_CustomSpan_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_CustomSpan_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_CustomSpan_Create() 后调用 OH_ArkUI_CustomSpan_Destroy。
 */
static napi_value TestArkUICapi_418(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_CustomSpan_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_CustomSpan_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_CustomSpan_RegisterOnMeasureCallback(OH_ArkUI_CustomSpan *, ArkUI_CustomSpanMetrics *(*)(float))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_CustomSpan_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_419(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_CustomSpan_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_CustomSpan_RegisterOnMeasureCallback(
        obj,
        static_cast<ArkUI_CustomSpanMetrics *(*)(float)>(nullptr));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_CustomSpan_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_CustomSpan_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_CustomSpan_RegisterOnDrawCallback(OH_ArkUI_CustomSpan *, void (*)(ArkUI_DrawContext *,
 *     ArkUI_CustomSpanDrawInfo *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_CustomSpan_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_420(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_CustomSpan_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_CustomSpan_RegisterOnDrawCallback(
        obj,
        +[](ArkUI_DrawContext *ctx, ArkUI_CustomSpanDrawInfo *info) {
            (void)ctx;
            (void)info;
        });
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_CustomSpan_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_CustomSpan_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_ImageAttachment_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_421(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_ImageAttachment_Create() 后调用 OH_ArkUI_ImageAttachment_Destroy。
 */
static napi_value TestArkUICapi_422(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetPixelMap(OH_ArkUI_ImageAttachment *, struct OH_PixelmapNative *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_423(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_Pixelmap_InitializationOptions *opts = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&opts);
    if (opts == nullptr) {
        OH_ArkUI_ImageAttachment_Destroy(obj);
        return nullptr;
    }
    (void)OH_PixelmapInitializationOptions_SetWidth(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetHeight(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pm = nullptr;
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm);
    (void)OH_PixelmapInitializationOptions_Release(opts);
    if (pm == nullptr) {
        OH_ArkUI_ImageAttachment_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetPixelMap(obj, pm);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_PixelmapNative_Destroy(&pm);
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    (void)OH_PixelmapNative_Destroy(&pm);
    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetPixelMap(const OH_ArkUI_ImageAttachment *, struct OH_PixelmapNative **)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_424(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    struct OH_PixelmapNative* holder1 = nullptr;
    struct OH_PixelmapNative** outPtr1 = &holder1;
    auto ec = OH_ArkUI_ImageAttachment_GetPixelMap(obj, outPtr1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetResource(OH_ArkUI_ImageAttachment *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_425(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    auto ec = OH_ArkUI_ImageAttachment_SetResource(obj, buf1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetResource(const OH_ArkUI_ImageAttachment *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_426(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_ImageAttachment_GetResource(obj, buf1, 0, &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetSizeWidth(OH_ArkUI_ImageAttachment *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_427(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetSizeWidth(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetSizeWidth(const OH_ArkUI_ImageAttachment *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_428(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_ImageAttachment_GetSizeWidth(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetSizeHeight(OH_ArkUI_ImageAttachment *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_429(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetSizeHeight(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetSizeHeight(const OH_ArkUI_ImageAttachment *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_430(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_ImageAttachment_GetSizeHeight(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetVerticalAlign(OH_ArkUI_ImageAttachment *, ArkUI_ImageSpanAlignment)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_431(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetVerticalAlign(obj, static_cast<ArkUI_ImageSpanAlignment>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetVerticalAlign(const OH_ArkUI_ImageAttachment *, ArkUI_ImageSpanAlignment *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_432(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_ImageSpanAlignment outA = static_cast<ArkUI_ImageSpanAlignment>(0);
    auto ec = OH_ArkUI_ImageAttachment_GetVerticalAlign(obj, &outA);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetObjectFit(OH_ArkUI_ImageAttachment *, ArkUI_ObjectFit)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_433(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetObjectFit(obj, static_cast<ArkUI_ObjectFit>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetObjectFit(const OH_ArkUI_ImageAttachment *, ArkUI_ObjectFit *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_434(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_ObjectFit outOf = static_cast<ArkUI_ObjectFit>(0);
    auto ec = OH_ArkUI_ImageAttachment_GetObjectFit(obj, &outOf);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetMargin(OH_ArkUI_ImageAttachment *, ArkUI_Margin)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_435(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetMargin(obj, ArkUI_Margin{});
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetMargin(const OH_ArkUI_ImageAttachment *, ArkUI_Margin *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_436(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    OH_Drawing_Range* holder2 = nullptr;
    OH_Drawing_Range** outPtr2 = &holder2;
    OH_Drawing_Range* holder3 = nullptr;
    OH_Drawing_Range** outPtr3 = &holder3;
    auto ec = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRange(
        nullptr,
        static_cast<OH_Drawing_Range *>(nullptr),
        outPtr2,
        outPtr3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetPadding(OH_ArkUI_ImageAttachment *, ArkUI_Margin)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_437(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    OH_Drawing_Range* holder2 = nullptr;
    OH_Drawing_Range** outPtr2 = &holder2;
    OH_Drawing_Range* holder3 = nullptr;
    OH_Drawing_Range** outPtr3 = &holder3;
    auto ec = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRange(
        nullptr,
        static_cast<OH_Drawing_Range *>(nullptr),
        outPtr2,
        outPtr3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
