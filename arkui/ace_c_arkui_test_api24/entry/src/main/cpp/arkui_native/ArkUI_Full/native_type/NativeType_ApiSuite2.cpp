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
#include <arkui/native_type.h>

namespace ArkUICapiTest {

/*
 * 测试接口: OH_ArkUI_ShadowOptions_GetFill(OH_ArkUI_ShadowOptions *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_159(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    ASSERT_NOTNULL(obj);
    bool v1 = false;
    auto ec = OH_ArkUI_ShadowOptions_GetFill(obj, &v1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_ShadowOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextEditorTextStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_160(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextEditorTextStyle_Create() 后调用 OH_ArkUI_TextEditorTextStyle_Destroy。
 */
static napi_value TestArkUICapi_161(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontColor(OH_ArkUI_TextEditorTextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_162(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontColor(obj, 0U);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontColor(OH_ArkUI_TextEditorTextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_163(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontColor(obj, &v1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontSize(OH_ArkUI_TextEditorTextStyle *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_164(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontSize(obj, 0.0f);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontSize(OH_ArkUI_TextEditorTextStyle *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_165(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    float v1 = 0.0f;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontSize(obj, &v1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontStyle(OH_ArkUI_TextEditorTextStyle *, ArkUI_FontStyle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_166(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontStyle(obj, static_cast<ArkUI_FontStyle>(0));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontStyle(OH_ArkUI_TextEditorTextStyle *, ArkUI_FontStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_167(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontStyle(obj, static_cast<ArkUI_FontStyle *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontWeight(OH_ArkUI_TextEditorTextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_168(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontWeight(obj, 0U);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontWeight(OH_ArkUI_TextEditorTextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_169(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontWeight(obj, &v1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontFamily(OH_ArkUI_TextEditorTextStyle *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_170(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    char buf1[32] = {0};
    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontFamily(obj, buf1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontFamily(OH_ArkUI_TextEditorTextStyle *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_171(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontFamily(obj, buf1, 0, &v3);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetDecoration(OH_ArkUI_TextEditorTextStyle *, OH_ArkUI_DecorationStyleOptions *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_172(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetDecoration(obj, static_cast<OH_ArkUI_DecorationStyleOptions *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetDecoration(OH_ArkUI_TextEditorTextStyle *, OH_ArkUI_DecorationStyleOptions *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_173(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_GetDecoration(obj, static_cast<OH_ArkUI_DecorationStyleOptions *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetTextShadows(OH_ArkUI_TextEditorTextStyle *, const OH_ArkUI_ShadowOptions **, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_174(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_ShadowOptions * holder1 = nullptr;
    OH_ArkUI_ShadowOptions ** outPtr1 = &holder1;
    auto ec = OH_ArkUI_TextEditorTextStyle_SetTextShadows(obj, outPtr1, 0);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetTextShadows(OH_ArkUI_TextEditorTextStyle *, OH_ArkUI_ShadowOptions **, uint32_t, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_175(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_ShadowOptions * holder1 = nullptr;
    OH_ArkUI_ShadowOptions ** outPtr1 = &holder1;
    uint32_t v3 = 0U;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetTextShadows(obj, outPtr1, 0U, &v3);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetLineHeight(OH_ArkUI_TextEditorTextStyle *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_176(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetLineHeight(obj, 0);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetLineHeight(OH_ArkUI_TextEditorTextStyle *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_177(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    int32_t v1 = 0;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetLineHeight(obj, &v1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetLetterSpacing(OH_ArkUI_TextEditorTextStyle *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_178(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetLetterSpacing(obj, 0);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetLetterSpacing(OH_ArkUI_TextEditorTextStyle *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_179(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    int32_t v1 = 0;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetLetterSpacing(obj, &v1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontFeature(OH_ArkUI_TextEditorTextStyle *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_180(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    char buf1[32] = {0};
    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontFeature(obj, buf1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontFeature(OH_ArkUI_TextEditorTextStyle *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_181(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontFeature(obj, buf1, 0, &v3);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetHalfLeading(OH_ArkUI_TextEditorTextStyle *, bool)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_182(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetHalfLeading(obj, false);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetHalfLeading(OH_ArkUI_TextEditorTextStyle *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_183(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    bool v1 = false;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetHalfLeading(obj, &v1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetTextBackgroundColor(OH_ArkUI_TextEditorTextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_184(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetTextBackgroundColor(obj, 0U);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetTextBackgroundColor(OH_ArkUI_TextEditorTextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_185(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetTextBackgroundColor(obj, &v1);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetTextBackgroundRadius(OH_ArkUI_TextEditorTextStyle *, float, float, float, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_186(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorTextStyle_SetTextBackgroundRadius(obj, 0.0f, 0.0f, 0.0f, 0.0f);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetTextBackgroundRadius(OH_ArkUI_TextEditorTextStyle *, float *, float *, float *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_187(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    ASSERT_NOTNULL(obj);
    float v1 = 0.0f;
    float v2 = 0.0f;
    float v3 = 0.0f;
    float v4 = 0.0f;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetTextBackgroundRadius(obj, &v1, &v2, &v3, &v4);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_SetTypingStyle(OH_ArkUI_TextEditorStyledStringController *, OH_ArkUI_TextEditorTextStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_188(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorStyledStringController_SetTypingStyle(obj, static_cast<OH_ArkUI_TextEditorTextStyle *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_GetTypingStyle(OH_ArkUI_TextEditorStyledStringController *, OH_ArkUI_TextEditorTextStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_189(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorStyledStringController_GetTypingStyle(obj, static_cast<OH_ArkUI_TextEditorTextStyle *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextEditorSelectionMenuOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_190(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextEditorSelectionMenuOptions_Create() 后调用 OH_ArkUI_TextEditorSelectionMenuOptions_Destroy。
 */
static napi_value TestArkUICapi_191(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_SetSpanType(OH_ArkUI_TextEditorSelectionMenuOptions *, OH_ArkUI_TextEditorSpanType)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_192(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetSpanType(obj, static_cast<OH_ArkUI_TextEditorSpanType>(0));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_GetSpanType(OH_ArkUI_TextEditorSelectionMenuOptions *, OH_ArkUI_TextEditorSpanType *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_193(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetSpanType(obj, static_cast<OH_ArkUI_TextEditorSpanType *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_SetContentNode(OH_ArkUI_TextEditorSelectionMenuOptions *, ArkUI_NodeHandle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_194(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetContentNode(obj, static_cast<ArkUI_NodeHandle>(0));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_GetContentNode(OH_ArkUI_TextEditorSelectionMenuOptions *, ArkUI_NodeHandle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_195(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetContentNode(obj, static_cast<ArkUI_NodeHandle *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_SetResponseType(OH_ArkUI_TextEditorSelectionMenuOptions *, OH_ArkUI_TextEditorResponseType)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_196(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetResponseType(obj, static_cast<OH_ArkUI_TextEditorResponseType>(0));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_GetResponseType(OH_ArkUI_TextEditorSelectionMenuOptions *, OH_ArkUI_TextEditorResponseType *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_197(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetResponseType(obj, static_cast<OH_ArkUI_TextEditorResponseType *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_SetMenuType(OH_ArkUI_TextEditorSelectionMenuOptions *, OH_ArkUI_TextMenuType)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_198(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetMenuType(obj, static_cast<OH_ArkUI_TextMenuType>(0));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_GetMenuType(OH_ArkUI_TextEditorSelectionMenuOptions *, OH_ArkUI_TextMenuType *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_199(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetMenuType(obj, static_cast<OH_ArkUI_TextMenuType *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuShowCallback(OH_ArkUI_TextEditorSelectionMenuOptions *, void *, void (*)(int32_t, int32_t, void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_200(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuShowCallback(obj, static_cast<void *>(nullptr), static_cast<void (*)(int32_t, int32_t, void *)>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuHideCallback(OH_ArkUI_TextEditorSelectionMenuOptions *, void *, void (*)(int32_t, int32_t, void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_201(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuHideCallback(obj, static_cast<void *>(nullptr), static_cast<void (*)(int32_t, int32_t, void *)>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuAppearCallback(OH_ArkUI_TextEditorSelectionMenuOptions *, void *, void (*)(int32_t, int32_t, void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_202(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuAppearCallback(obj, static_cast<void *>(nullptr), static_cast<void (*)(int32_t, int32_t, void *)>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuDisappearCallback(OH_ArkUI_TextEditorSelectionMenuOptions *, void *, void (*)(void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_203(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuDisappearCallback(obj, static_cast<void *>(nullptr), static_cast<void (*)(void *)>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_SetHapticFeedbackMode(OH_ArkUI_TextEditorSelectionMenuOptions *, OH_ArkUI_HapticFeedbackMode)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_204(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetHapticFeedbackMode(obj, static_cast<OH_ArkUI_HapticFeedbackMode>(0));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_GetHapticFeedbackMode(OH_ArkUI_TextEditorSelectionMenuOptions *, OH_ArkUI_HapticFeedbackMode *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_205(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetHapticFeedbackMode(obj, static_cast<OH_ArkUI_HapticFeedbackMode *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_CloseSelectionMenu(OH_ArkUI_TextEditorStyledStringController *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_206(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorStyledStringController_CloseSelectionMenu(obj, );
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_GetSelection(const OH_ArkUI_TextEditorStyledStringController *, uint32_t *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_207(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_NOTNULL(obj);
    uint32_t v1 = 0U;
    uint32_t v2 = 0U;
    auto ec = OH_ArkUI_TextEditorStyledStringController_GetSelection(obj, &v1, &v2);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_SetStyledString(const OH_ArkUI_TextEditorStyledStringController *, const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_208(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorStyledStringController_SetStyledString(obj, static_cast<const ArkUI_StyledString_Descriptor *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_GetStyledString(const OH_ArkUI_TextEditorStyledStringController *, ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_209(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorStyledStringController_GetStyledString(obj, static_cast<ArkUI_StyledString_Descriptor *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_SetStyledPlaceholder(const OH_ArkUI_TextEditorStyledStringController *, const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_210(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_TextEditorStyledStringController_SetStyledPlaceholder(obj, static_cast<const ArkUI_StyledString_Descriptor *>(nullptr));
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4ScaleOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_Matrix4ScaleOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_211(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4ScaleOptions_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_Matrix4ScaleOptions_Dispose(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4ScaleOptions_SetCenterY(ArkUI_Matrix4ScaleOptions *, const float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_Matrix4ScaleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_212(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4ScaleOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_Matrix4ScaleOptions_SetCenterY(obj, 0.0f);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4ScaleOptions_Dispose(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4RotationOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_Matrix4RotationOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_213(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4RotationOptions_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_Matrix4RotationOptions_Dispose(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4TranslationOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_Matrix4TranslationOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_214(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4TranslationOptions_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_Matrix4TranslationOptions_Dispose(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4TranslationOptions_SetZ(ArkUI_Matrix4TranslationOptions *, const float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_Matrix4TranslationOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_215(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4TranslationOptions_Create();
    ASSERT_NOTNULL(obj);
    auto ec = OH_ArkUI_Matrix4TranslationOptions_SetZ(obj, 0.0f);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4TranslationOptions_Dispose(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_CreateIdentity
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_Matrix4_CreateIdentity，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_216(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4_CreateIdentity();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_Matrix4_Dispose(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_CreateByElements
 * 预期效果: 由 16 元数组创建矩阵成功。
 * 实际测试: 传入单位矩阵数组，创建后 Dispose。
 */
static napi_value TestArkUICapi_217(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    float elements[16] = {
        1, 0, 0, 0,  0, 1, 0, 0,  0, 0, 1, 0,  0, 0, 0, 1};
    auto *m = OH_ArkUI_Matrix4_CreateByElements(elements);
    ASSERT_NOTNULL(m);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Copy
 * 预期效果: 矩阵拷贝得到新对象。
 * 实际测试: CreateIdentity 后 Copy，双 Dispose。
 */
static napi_value TestArkUICapi_218(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *src = OH_ArkUI_Matrix4_CreateIdentity();
    ASSERT_NOTNULL(src);
    auto *cp = OH_ArkUI_Matrix4_Copy(src);
    ASSERT_NOTNULL(cp);
    OH_ArkUI_Matrix4_Dispose(cp);
    OH_ArkUI_Matrix4_Dispose(src);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Invert
 * 预期效果: 可逆矩阵 Invert 成功。
 * 实际测试: 单位矩阵上调用 Invert。
 */
static napi_value TestArkUICapi_219(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    ASSERT_NOTNULL(m);
    auto ec = OH_ArkUI_Matrix4_Invert(m);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Combine
 * 预期效果: 两合法矩阵 Combine 成功。
 * 实际测试: 双 CreateIdentity，调用 Combine，断言 NO_ERROR，双 Dispose。
 */
static napi_value TestArkUICapi_220(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *a = OH_ArkUI_Matrix4_CreateIdentity();
    auto *b = OH_ArkUI_Matrix4_CreateIdentity();
    ASSERT_NOTNULL(a);
    ASSERT_NOTNULL(b);
    auto ec = OH_ArkUI_Matrix4_Combine(a, b);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4_Dispose(a);
    OH_ArkUI_Matrix4_Dispose(b);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Translate
 * 预期效果: 矩阵与平移选项组合成功。
 * 实际测试: CreateIdentity + TranslationOptions_Create，调用 Translate。
 */
static napi_value TestArkUICapi_221(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    auto *tr = OH_ArkUI_Matrix4TranslationOptions_Create();
    ASSERT_NOTNULL(m);
    ASSERT_NOTNULL(tr);
    auto ec = OH_ArkUI_Matrix4_Translate(m, tr);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4TranslationOptions_Dispose(tr);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Scale
 * 预期效果: 矩阵与缩放选项组合成功。
 * 实际测试: CreateIdentity + ScaleOptions_Create，调用 Scale。
 */
static napi_value TestArkUICapi_222(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    auto *sc = OH_ArkUI_Matrix4ScaleOptions_Create();
    ASSERT_NOTNULL(m);
    ASSERT_NOTNULL(sc);
    auto ec = OH_ArkUI_Matrix4_Scale(m, sc);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4ScaleOptions_Dispose(sc);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Rotate
 * 预期效果: 矩阵与旋转选项组合成功。
 * 实际测试: CreateIdentity + RotationOptions_Create，调用 Rotate。
 */
static napi_value TestArkUICapi_223(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    auto *ro = OH_ArkUI_Matrix4RotationOptions_Create();
    ASSERT_NOTNULL(m);
    ASSERT_NOTNULL(ro);
    auto ec = OH_ArkUI_Matrix4_Rotate(m, ro);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4RotationOptions_Dispose(ro);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Skew
 * 预期效果: 矩阵 Skew 合法 float 参数调用成功。
 * 实际测试: 单位矩阵 + (0,0) skew。
 */
static napi_value TestArkUICapi_224(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    ASSERT_NOTNULL(m);
    auto ec = OH_ArkUI_Matrix4_Skew(m, 0.0f, 0.0f);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_TransformPoint
 * 预期效果: 点坐标经矩阵变换成功。
 * 实际测试: 单位矩阵下变换栈上 ArkUI_PointF。
 */
static napi_value TestArkUICapi_225(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    ASSERT_NOTNULL(m);
    ArkUI_PointF src = {1.0f, 2.0f};
    ArkUI_PointF dst = {0.0f, 0.0f};
    auto ec = OH_ArkUI_Matrix4_TransformPoint(m, &src, &dst);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_SetPolyToPoly
 * 预期效果: 四点多边形映射设置成功。
 * 实际测试: 栈上两组 ArkUI_PointF[4]，pointCount=4。
 */
static napi_value TestArkUICapi_226(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    ASSERT_NOTNULL(m);
    ArkUI_PointF src[4] = {{0.0f, 0.0f}, {100.0f, 0.0f}, {0.0f, 100.0f}, {100.0f, 100.0f}};
    ArkUI_PointF dst[4] = {{0.0f, 0.0f}, {100.0f, 0.0f}, {0.0f, 100.0f}, {100.0f, 100.0f}};
    auto ec = OH_ArkUI_Matrix4_SetPolyToPoly(m, src, dst, 4U);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_Matrix4_GetElements
 * 预期效果: 读出矩阵 16 元数组成功。
 * 实际测试: 单位矩阵 + 栈上 float[16] 出参。
 */
static napi_value TestArkUICapi_227(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    ASSERT_NOTNULL(m);
    float out[16] = {0};
    auto ec = OH_ArkUI_Matrix4_GetElements(m, out);
    ASSERT_EQ(ec, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_Matrix4_Dispose(m);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_FontWeightConfigs_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_228(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_FontWeightConfigs_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_FontWeightConfigs_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_FontWeightConfigs_Create() 后调用 OH_ArkUI_FontWeightConfigs_Destroy。
 */
static napi_value TestArkUICapi_229(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_FontWeightConfigs_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_FontWeightConfigs_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_SetEnableVariableFontWeight
 * 预期效果: 在合法 FontWeightConfigs 上设置布尔开关。
 * 实际测试: Create 后 SetEnableVariableFontWeight(true)，再 Destroy。
 */
static napi_value TestArkUICapi_230(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cfg = OH_ArkUI_FontWeightConfigs_Create();
    ASSERT_NOTNULL(cfg);
    OH_ArkUI_FontWeightConfigs_SetEnableVariableFontWeight(cfg, true);
    OH_ArkUI_FontWeightConfigs_Destroy(cfg);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_GetEnableVariableFontWeight(OH_ArkUI_FontWeightConfigs *)
 * 预期效果: 在合法 FontWeightConfigs 上读取布尔配置。
 * 实际测试: 创建 OH_ArkUI_FontWeightConfigs 后调用 Getter，再销毁。
 */
static napi_value TestArkUICapi_231(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cfg = OH_ArkUI_FontWeightConfigs_Create();
    ASSERT_NOTNULL(cfg);
    (void)OH_ArkUI_FontWeightConfigs_GetEnableVariableFontWeight(cfg);
    OH_ArkUI_FontWeightConfigs_Destroy(cfg);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_SetEnableDeviceFontWeightCategory
 * 预期效果: 在合法 FontWeightConfigs 上设置设备字重类别开关。
 * 实际测试: Create 后 Set，再 Destroy。
 */
static napi_value TestArkUICapi_232(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cfg = OH_ArkUI_FontWeightConfigs_Create();
    ASSERT_NOTNULL(cfg);
    OH_ArkUI_FontWeightConfigs_SetEnableDeviceFontWeightCategory(cfg, false);
    OH_ArkUI_FontWeightConfigs_Destroy(cfg);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_GetEnableDeviceFontWeightCategory(OH_ArkUI_FontWeightConfigs *)
 * 预期效果: 在合法 FontWeightConfigs 上读取布尔配置。
 * 实际测试: 创建 OH_ArkUI_FontWeightConfigs 后调用 Getter，再销毁。
 */
static napi_value TestArkUICapi_233(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cfg = OH_ArkUI_FontWeightConfigs_Create();
    ASSERT_NOTNULL(cfg);
    (void)OH_ArkUI_FontWeightConfigs_GetEnableDeviceFontWeightCategory(cfg);
    OH_ArkUI_FontWeightConfigs_Destroy(cfg);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontConfigs_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_FontConfigs_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_234(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_FontConfigs_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_FontConfigs_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontConfigs_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_FontConfigs_Create() 后调用 OH_ArkUI_FontConfigs_Destroy。
 */
static napi_value TestArkUICapi_235(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_FontConfigs_Create();
    ASSERT_NOTNULL(obj);
    OH_ArkUI_FontConfigs_Destroy(obj);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontConfigs_SetFontWeightConfigs
 * 预期效果: 将 FontWeightConfigs 关联到 FontConfigs。
 * 实际测试: 分别创建 FontConfigs 与 FontWeightConfigs，调用 Set 后按序释放。
 */
static napi_value TestArkUICapi_236(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *fc = OH_ArkUI_FontConfigs_Create();
    ASSERT_NOTNULL(fc);
    auto *fw = OH_ArkUI_FontWeightConfigs_Create();
    ASSERT_NOTNULL(fw);
    OH_ArkUI_FontConfigs_SetFontWeightConfigs(fc, fw);
    OH_ArkUI_FontWeightConfigs_Destroy(fw);
    OH_ArkUI_FontConfigs_Destroy(fc);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_FontConfigs_GetFontWeightConfigs
 * 预期效果: SetFontWeightConfigs 后 GetFontWeightConfigs 返回非空配置指针。
 * 实际测试: 按 capi-native-type-h.md：先 Create 二者并 Set，再 Get 断言非空，释放顺序与 SetFontWeightConfigs 用例一致。
 */
static napi_value TestArkUICapi_237(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *fc = OH_ArkUI_FontConfigs_Create();
    ASSERT_NOTNULL(fc);
    auto *fw = OH_ArkUI_FontWeightConfigs_Create();
    ASSERT_NOTNULL(fw);
    OH_ArkUI_FontConfigs_SetFontWeightConfigs(fc, fw);
    auto *got = OH_ArkUI_FontConfigs_GetFontWeightConfigs(fc);
    ASSERT_NOTNULL(got);
    OH_ArkUI_FontWeightConfigs_Destroy(fw);
    OH_ArkUI_FontConfigs_Destroy(fc);
    NAPI_END;
}

} // namespace ArkUICapiTest
