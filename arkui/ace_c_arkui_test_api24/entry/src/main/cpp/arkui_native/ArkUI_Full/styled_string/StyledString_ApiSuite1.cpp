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

namespace ArkUICapiTest {

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED（OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED = -1）
 * 预期效果: 枚举/宏常量取值应为 -1。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED 并断言等于 -1。
 */
static napi_value TestArkUICapi_238(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = -1;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_FONT（OH_ARKUI_STYLEDSTRINGKEY_FONT = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_FONT 并断言等于 0。
 */
static napi_value TestArkUICapi_239(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_FONT)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_DECORATION（OH_ARKUI_STYLEDSTRINGKEY_DECORATION = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_DECORATION 并断言等于 1。
 */
static napi_value TestArkUICapi_240(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_DECORATION)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET（OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET 并断言等于 2。
 */
static napi_value TestArkUICapi_241(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING（OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING = 3）
 * 预期效果: 枚举/宏常量取值应为 3。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING 并断言等于 3。
 */
static napi_value TestArkUICapi_242(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 3;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW（OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW = 4）
 * 预期效果: 枚举/宏常量取值应为 4。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW 并断言等于 4。
 */
static napi_value TestArkUICapi_243(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 4;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT（OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT = 5）
 * 预期效果: 枚举/宏常量取值应为 5。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT 并断言等于 5。
 */
static napi_value TestArkUICapi_244(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 5;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR（OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR = 6）
 * 预期效果: 枚举/宏常量取值应为 6。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR 并断言等于 6。
 */
static napi_value TestArkUICapi_245(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 6;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_URL（OH_ARKUI_STYLEDSTRINGKEY_URL = 7）
 * 预期效果: 枚举/宏常量取值应为 7。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_URL 并断言等于 7。
 */
static napi_value TestArkUICapi_246(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 7;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_URL)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_GESTURE（OH_ARKUI_STYLEDSTRINGKEY_GESTURE = 100）
 * 预期效果: 枚举/宏常量取值应为 100。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_GESTURE 并断言等于 100。
 */
static napi_value TestArkUICapi_247(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 100;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_GESTURE)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE（OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE = 200）
 * 预期效果: 枚举/宏常量取值应为 200。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE 并断言等于 200。
 */
static napi_value TestArkUICapi_248(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 200;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_IMAGE（OH_ARKUI_STYLEDSTRINGKEY_IMAGE = 300）
 * 预期效果: 枚举/宏常量取值应为 300。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_IMAGE 并断言等于 300。
 */
static napi_value TestArkUICapi_249(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 300;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_IMAGE)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN（OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN = 400）
 * 预期效果: 枚举/宏常量取值应为 400。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN 并断言等于 400。
 */
static napi_value TestArkUICapi_250(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 400;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_USER_DATA（OH_ARKUI_STYLEDSTRINGKEY_USER_DATA = 500）
 * 预期效果: 枚举/宏常量取值应为 500。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_USER_DATA 并断言等于 500。
 */
static napi_value TestArkUICapi_251(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 500;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_USER_DATA)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_CreateWithString
 * 预期效果: 由非空 C 字符串创建描述符。
 * 实际测试: 使用合法字符串与 length=0、styles=nullptr 调用创建，再销毁。
 */
static napi_value TestArkUICapi_252(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *d = OH_ArkUI_StyledString_Descriptor_CreateWithString("xts_capi", nullptr, 0);
    if (((d)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(d);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_CreateWithImageAttachment
 * 预期效果: 由图片附件创建描述符。
 * 实际测试: 先创建 OH_ArkUI_ImageAttachment，再创建描述符，按序释放。
 */
static napi_value TestArkUICapi_253(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *img = OH_ArkUI_ImageAttachment_Create();
    if (((img)) == nullptr) {
        return nullptr;
    }

    auto *d = OH_ArkUI_StyledString_Descriptor_CreateWithImageAttachment(img);
    if (((d)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(d);
    OH_ArkUI_ImageAttachment_Destroy(img);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_CreateWithCustomSpan
 * 预期效果: 由自定义 Span 创建描述符。
 * 实际测试: 创建 CustomSpan 后组装描述符并释放。
 */
static napi_value TestArkUICapi_254(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cs = OH_ArkUI_CustomSpan_Create();
    if (((cs)) == nullptr) {
        return nullptr;
    }

    auto *d = OH_ArkUI_StyledString_Descriptor_CreateWithCustomSpan(cs);
    if (((d)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(d);
    OH_ArkUI_CustomSpan_Destroy(cs);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_GetLength(const ArkUI_StyledString_Descriptor *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_255(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_StyledString_Descriptor_GetLength(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_GetString(const ArkUI_StyledString_Descriptor *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_256(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_StyledString_Descriptor_GetString(obj, buf1, 0, &v3);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_IsEqual(const ArkUI_StyledString_Descriptor *,
 *     const ArkUI_StyledString_Descriptor *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_257(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    bool v2 = false;
    auto ec = OH_ArkUI_StyledString_Descriptor_IsEqual(
        obj,
        static_cast<const ArkUI_StyledString_Descriptor *>(nullptr),
        &v2);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_SubStyledString(const ArkUI_StyledString_Descriptor *,
 *     ArkUI_StyledString_Descriptor *, uint32_t, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_258(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_SubStyledString(
        obj,
        static_cast<ArkUI_StyledString_Descriptor *>(nullptr),
        0U,
        0U);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_GetStyles(const ArkUI_StyledString_Descriptor *, uint32_t, uint32_t,
 *     OH_ArkUI_StyledStringKey, OH_ArkUI_SpanStyle **, uint32_t, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_259(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_SpanStyle * holder4 = nullptr;
    OH_ArkUI_SpanStyle ** outPtr4 = &holder4;
    uint32_t v6 = 0U;
    auto ec = OH_ArkUI_StyledString_Descriptor_GetStyles(
        obj,
        0U,
        0U,
        static_cast<OH_ArkUI_StyledStringKey>(0),
        outPtr4,
        0U,
        &v6);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_FromHtml(ArkUI_StyledString_Descriptor *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_260(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    auto ec = OH_ArkUI_StyledString_Descriptor_FromHtml(obj, buf1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_ReplaceString(ArkUI_StyledString_Descriptor *, uint32_t, uint32_t, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_261(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf3[32] = {0};
    auto ec = OH_ArkUI_StyledString_Descriptor_ReplaceString(obj, 0U, 0U, buf3);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_InsertString(ArkUI_StyledString_Descriptor *, uint32_t, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_262(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf2[32] = {0};
    auto ec = OH_ArkUI_StyledString_Descriptor_InsertString(obj, 0U, buf2);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_RemoveString(ArkUI_StyledString_Descriptor *, uint32_t, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_263(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_RemoveString(obj, 0U, 0U);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_ReplaceStyle(ArkUI_StyledString_Descriptor *, const OH_ArkUI_SpanStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_264(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_ReplaceStyle(obj, static_cast<const OH_ArkUI_SpanStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_SetStyle(ArkUI_StyledString_Descriptor *, const OH_ArkUI_SpanStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_265(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_SetStyle(obj, static_cast<const OH_ArkUI_SpanStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_RemoveStyle(ArkUI_StyledString_Descriptor *, uint32_t, uint32_t,
 *     OH_ArkUI_StyledStringKey)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_266(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_RemoveStyle(obj, 0U, 0U, static_cast<OH_ArkUI_StyledStringKey>(0));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_ClearStyles(ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_267(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_ClearStyles(obj);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_ReplaceStyledString(ArkUI_StyledString_Descriptor *, uint32_t, uint32_t,
 *     const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_268(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_ReplaceStyledString(
        obj,
        0U,
        0U,
        static_cast<const ArkUI_StyledString_Descriptor *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_InsertStyledString(ArkUI_StyledString_Descriptor *, uint32_t,
 *     const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_269(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_InsertStyledString(
        obj,
        0U,
        static_cast<const ArkUI_StyledString_Descriptor *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_AppendStyledString(ArkUI_StyledString_Descriptor *,
 *     const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_270(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_AppendStyledString(
        obj,
        static_cast<const ArkUI_StyledString_Descriptor *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_InvalidateCustomSpan(const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_271(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_StyledString_Descriptor_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_InvalidateCustomSpan(obj);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL（OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL 并断言等于 0。
 */
static napi_value TestArkUICapi_272(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT（OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT 并断言等于 1。
 */
static napi_value TestArkUICapi_273(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT（OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT 并断言等于 2。
 */
static napi_value TestArkUICapi_274(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (static_cast<int32_t>(OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT)), (expected));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_275(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextStyle_Create() 后调用 OH_ArkUI_TextStyle_Destroy。
 */
static napi_value TestArkUICapi_276(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontColor(OH_ArkUI_TextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_277(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetFontColor(obj, 0U);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontColor(const OH_ArkUI_TextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_278(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextStyle_GetFontColor(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontFamily(OH_ArkUI_TextStyle *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_279(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    auto ec = OH_ArkUI_TextStyle_SetFontFamily(obj, buf1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontFamily(const OH_ArkUI_TextStyle *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_280(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextStyle_GetFontFamily(obj, buf1, 0, &v3);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontSize(OH_ArkUI_TextStyle *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_281(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetFontSize(obj, 0.0f);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontSize(const OH_ArkUI_TextStyle *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_282(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_TextStyle_GetFontSize(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontWeight(OH_ArkUI_TextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_283(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetFontWeight(obj, 0U);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontWeight(const OH_ArkUI_TextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_284(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextStyle_GetFontWeight(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontStyle(OH_ArkUI_TextStyle *, ArkUI_FontStyle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_285(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetFontStyle(obj, static_cast<ArkUI_FontStyle>(0));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontStyle(const OH_ArkUI_TextStyle *, ArkUI_FontStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_286(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_GetFontStyle(obj, static_cast<ArkUI_FontStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetStrokeWidth(OH_ArkUI_TextStyle *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_287(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetStrokeWidth(obj, 0.0f);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetStrokeWidth(const OH_ArkUI_TextStyle *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_288(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_TextStyle_GetStrokeWidth(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetStrokeColor(OH_ArkUI_TextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_289(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetStrokeColor(obj, 0U);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetStrokeColor(const OH_ArkUI_TextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_290(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextStyle_GetStrokeColor(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetSuperscript(OH_ArkUI_TextStyle *, OH_ArkUI_SuperscriptStyle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_291(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetSuperscript(obj, static_cast<OH_ArkUI_SuperscriptStyle>(0));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetSuperscript(const OH_ArkUI_TextStyle *, OH_ArkUI_SuperscriptStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_292(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_GetSuperscript(obj, static_cast<OH_ArkUI_SuperscriptStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_SpanStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_293(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_SpanStyle_Create() 后调用 OH_ArkUI_SpanStyle_Destroy。
 */
static napi_value TestArkUICapi_294(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetStyledKey(const OH_ArkUI_SpanStyle *, OH_ArkUI_StyledStringKey *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_295(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetStyledKey(obj, static_cast<OH_ArkUI_StyledStringKey *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetStart(OH_ArkUI_SpanStyle *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_296(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetStart(obj, 0);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetStart(const OH_ArkUI_SpanStyle *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_297(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_SpanStyle_GetStart(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetLength(OH_ArkUI_SpanStyle *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_298(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetLength(obj, 0);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetLength(const OH_ArkUI_SpanStyle *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_299(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_SpanStyle_GetLength(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetTextStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_TextStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_300(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetTextStyle(obj, static_cast<const OH_ArkUI_TextStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetTextStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_TextStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_301(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetTextStyle(obj, static_cast<OH_ArkUI_TextStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetParagraphStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_ParagraphStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_302(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetParagraphStyle(obj, static_cast<const OH_ArkUI_ParagraphStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetParagraphStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_ParagraphStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_303(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetParagraphStyle(obj, static_cast<OH_ArkUI_ParagraphStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetGestureStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_GestureStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_304(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetGestureStyle(obj, static_cast<const OH_ArkUI_GestureStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetGestureStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_GestureStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_305(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetGestureStyle(obj, static_cast<OH_ArkUI_GestureStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetTextShadowStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_TextShadowStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_306(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetTextShadowStyle(obj, static_cast<const OH_ArkUI_TextShadowStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetTextShadowStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_TextShadowStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_307(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetTextShadowStyle(obj, static_cast<OH_ArkUI_TextShadowStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetDecorationStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_DecorationStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_308(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetDecorationStyle(obj, static_cast<const OH_ArkUI_DecorationStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetDecorationStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_DecorationStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_309(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetDecorationStyle(obj, static_cast<OH_ArkUI_DecorationStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetBaselineOffsetStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_BaselineOffsetStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_310(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetBaselineOffsetStyle(
        obj,
        static_cast<const OH_ArkUI_BaselineOffsetStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetBaselineOffsetStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_BaselineOffsetStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_311(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetBaselineOffsetStyle(obj, static_cast<OH_ArkUI_BaselineOffsetStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetLetterSpacingStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_LetterSpacingStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_312(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetLetterSpacingStyle(obj, static_cast<const OH_ArkUI_LetterSpacingStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetLetterSpacingStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_LetterSpacingStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_313(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetLetterSpacingStyle(obj, static_cast<OH_ArkUI_LetterSpacingStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetLineHeightStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_LineHeightStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_314(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetLineHeightStyle(obj, static_cast<const OH_ArkUI_LineHeightStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetLineHeightStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_LineHeightStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_315(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetLineHeightStyle(obj, static_cast<OH_ArkUI_LineHeightStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetUrlStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_UrlStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_316(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetUrlStyle(obj, static_cast<const OH_ArkUI_UrlStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetUrlStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_UrlStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_317(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetUrlStyle(obj, static_cast<OH_ArkUI_UrlStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetBackgroundColorStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_BackgroundColorStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_318(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetBackgroundColorStyle(
        obj,
        static_cast<const OH_ArkUI_BackgroundColorStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetBackgroundColorStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_BackgroundColorStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_319(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetBackgroundColorStyle(obj, static_cast<OH_ArkUI_BackgroundColorStyle *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetUserDataSpan(OH_ArkUI_SpanStyle *, const OH_ArkUI_UserDataSpan *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_320(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetUserDataSpan(obj, static_cast<const OH_ArkUI_UserDataSpan *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetUserDataSpan(const OH_ArkUI_SpanStyle *, OH_ArkUI_UserDataSpan *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_321(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetUserDataSpan(obj, static_cast<OH_ArkUI_UserDataSpan *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetCustomSpan(OH_ArkUI_SpanStyle *, const OH_ArkUI_CustomSpan *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_322(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetCustomSpan(obj, static_cast<const OH_ArkUI_CustomSpan *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetCustomSpan(const OH_ArkUI_SpanStyle *, OH_ArkUI_CustomSpan *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_323(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetCustomSpan(obj, static_cast<OH_ArkUI_CustomSpan *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetImageAttachment(OH_ArkUI_SpanStyle *, const OH_ArkUI_ImageAttachment *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_324(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetImageAttachment(obj, static_cast<const OH_ArkUI_ImageAttachment *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetImageAttachment(const OH_ArkUI_SpanStyle *, OH_ArkUI_ImageAttachment *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_325(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_GetImageAttachment(obj, static_cast<OH_ArkUI_ImageAttachment *>(nullptr));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_LeadingMarginSpanDrawInfo_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_326(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_LeadingMarginSpanDrawInfo_Create() 后调用 OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy。
 */
static napi_value TestArkUICapi_327(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetX(OH_ArkUI_LeadingMarginSpanDrawInfo *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_328(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetX(obj, 0.0f);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_GetX(const OH_ArkUI_LeadingMarginSpanDrawInfo *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_329(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetX(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetTop(OH_ArkUI_LeadingMarginSpanDrawInfo *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_330(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetTop(obj, 0.0f);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_GetTop(const OH_ArkUI_LeadingMarginSpanDrawInfo *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_331(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetTop(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetBottom(OH_ArkUI_LeadingMarginSpanDrawInfo *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_332(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetBottom(obj, 0.0f);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_GetBottom(const OH_ArkUI_LeadingMarginSpanDrawInfo *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_333(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetBottom(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetBaseline(OH_ArkUI_LeadingMarginSpanDrawInfo *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_334(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetBaseline(obj, 0.0f);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_GetBaseline(const OH_ArkUI_LeadingMarginSpanDrawInfo *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_335(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetBaseline(obj, &v1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetTextDirection(OH_ArkUI_LeadingMarginSpanDrawInfo *, ArkUI_TextDirection)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_336(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetTextDirection(obj, static_cast<ArkUI_TextDirection>(0));
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_LeadingMarginSpanDrawInfo_GetTextDirection(const OH_ArkUI_LeadingMarginSpanDrawInfo *,
 *     ArkUI_TextDirection *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_337(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextDirection tdOut1 = static_cast<ArkUI_TextDirection>(0);
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetTextDirection(obj, &tdOut1);
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
