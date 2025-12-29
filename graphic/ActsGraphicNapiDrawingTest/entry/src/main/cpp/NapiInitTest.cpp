/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "include/NativeCopyStyleTest.h"
#include "include/NativeDrawingFontMgrTest.h"
#include "include/NativeFontTest.h"
#include "include/NativeTextLineTest.h"
#include "include/NativeTextRunTest.h"
#include "include/NativeTypographyAutoSpaceTest.h"
#include "include/NativeTypographyUpdateTest.h"
#include "include/NativeUndefinedGlyphDisplayTest.h"
#include "include/OHDrawingTypographyTest.h"
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

using CaseFn = int (*)();

enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5,
    CASE_NUM_6,
    CASE_NUM_7,
    CASE_NUM_8,
    CASE_NUM_9,
    CASE_NUM_10,
    CASE_NUM_11,
    CASE_NUM_12,
    CASE_NUM_13,
    CASE_NUM_14,
    CASE_NUM_15,
    CASE_NUM_16,
    CASE_NUM_17,
    CASE_NUM_18,
    CASE_NUM_19,
    CASE_NUM_20,
    CASE_NUM_21,
    CASE_NUM_22,
    CASE_NUM_23,
    CASE_NUM_24,
    CASE_NUM_25,
    CASE_NUM_26,
    CASE_NUM_27,
    CASE_NUM_28,
    CASE_NUM_29,
    CASE_NUM_30,
    CASE_NUM_31,
    CASE_NUM_32,
    CASE_NUM_33,
    CASE_NUM_34,
    CASE_NUM_35,
    CASE_NUM_36,
    CASE_NUM_37,
    CASE_NUM_38,
    CASE_NUM_39,
    CASE_NUM_40,
    CASE_NUM_41,
    CASE_NUM_42,
    CASE_NUM_43,
    CASE_NUM_44,
    CASE_NUM_45,
    CASE_NUM_46,
    CASE_NUM_47,
    CASE_NUM_48,
    CASE_NUM_49,
    CASE_NUM_50,
    CASE_NUM_51,
    CASE_NUM_52,
    CASE_NUM_53,
    CASE_NUM_54,
    CASE_NUM_55,
    CASE_NUM_56,
    CASE_NUM_57,
    CASE_NUM_58,
    CASE_NUM_59,
    CASE_NUM_60,
    CASE_NUM_61,
    CASE_NUM_62,
    CASE_NUM_63,
    CASE_NUM_64,
    CASE_NUM_65,
    CASE_NUM_66,
    CASE_NUM_67,
    CASE_NUM_68,
    CASE_NUM_69,
    CASE_NUM_70,
    CASE_NUM_71,
    CASE_NUM_72,
    CASE_NUM_73,
    CASE_NUM_74,
    CASE_NUM_75,
    CASE_NUM_76,
    CASE_NUM_77,
    CASE_NUM_78,
    CASE_NUM_79,
    CASE_NUM_80,
    CASE_NUM_81,
    CASE_NUM_82,
    CASE_NUM_83,
    CASE_NUM_84,
    CASE_NUM_85,
    CASE_NUM_86,
    CASE_NUM_87,
    CASE_NUM_88,
    CASE_NUM_89,
    CASE_NUM_90,
};


// OHDrawingCopyTextStyle functions
static napi_value OHDrawingCopyTextStyle(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::OHDrawingCopyTextStyle001();
                break;
            case CASE_NUM_1:
                result = OHOS::OHDrawingCopyTextStyle002();
                break;
            case CASE_NUM_2:
                result = OHOS::OHDrawingCopyTextStyle003();
                break;
            case CASE_NUM_3:
                result = OHOS::OHDrawingCopyTextStyle004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingCopyTextShadow functions
static napi_value OHDrawingCopyTextShadow(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::OHDrawingCopyTextShadow001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingCopyTypographyStyle functions
static napi_value OHDrawingCopyTypographyStyle(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::OHDrawingCopyTypographyStyle001();
                break;
            case CASE_NUM_1:
                result = OHOS::OHDrawingCopyTypographyStyle002();
                break;
            case CASE_NUM_2:
                result = OHOS::OHDrawingCopyTypographyStyle003();
                break;
            case CASE_NUM_3:
                result = OHOS::OHDrawingCopyTypographyStyle004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingFontMgrTest functions
static napi_value OHDrawingFontMgrTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest005();
                break;
            case CASE_NUM_5:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest006();
                break;
            case CASE_NUM_6:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest007();
                break;
            case CASE_NUM_7:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest008();
                break;
            case CASE_NUM_8:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest009();
                break;
            case CASE_NUM_9:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest010();
                break;
            case CASE_NUM_10:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest011();
                break;
            case CASE_NUM_11:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest012();
                break;
            case CASE_NUM_12:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontMgrTest013();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingFontMgrMatchFamilyStyleCharacter functions
static napi_value OHDrawingFontMgrMatchFamilyStyleCharacter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight900();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight100();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWidth1();
                break;
            case CASE_NUM_5:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWidth9();
                break;
            case CASE_NUM_6:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique();
                break;
            case CASE_NUM_7:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull();
                break;
            case CASE_NUM_8:
                result =
                    OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue();
                break;
            case CASE_NUM_9:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue();
                break;
            case CASE_NUM_10:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200();
                break;
            case CASE_NUM_11:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300();
                break;
            case CASE_NUM_12:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight400();
                break;
            case CASE_NUM_13:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight500();
                break;
            case CASE_NUM_14:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight600();
                break;
            case CASE_NUM_15:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight700();
                break;
            case CASE_NUM_16:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight800();
                break;
            case CASE_NUM_17:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1();
                break;
            case CASE_NUM_18:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWidth2();
                break;
            case CASE_NUM_19:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWidth3();
                break;
            case CASE_NUM_20:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWidth4();
                break;
            case CASE_NUM_21:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWidth6();
                break;
            case CASE_NUM_22:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWidth7();
                break;
            case CASE_NUM_23:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWidth8();
                break;
            case CASE_NUM_24:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9();
                break;
            case CASE_NUM_25:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterStyle0();
                break;
            case CASE_NUM_26:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterStyle1();
                break;
            case CASE_NUM_27:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterStyle2();
                break;
            case CASE_NUM_28:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0();
                break;
            case CASE_NUM_29:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1();
                break;
            case CASE_NUM_30:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2();
                break;
            case CASE_NUM_31:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0();
                break;
            case CASE_NUM_32:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1();
                break;
            case CASE_NUM_33:
                result = OHOS::Rosen::Drawing::testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// NativeFontTest_FontMeasureText functions
static napi_value NativeFontTest_FontMeasureText(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::NativeFontTest_FontMeasureText015();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::NativeFontTest_FontMeasureText016();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::NativeFontTest_FontMeasureText017();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// NativeDrawingRegisterFontTest functions
static napi_value NativeDrawingRegisterFontTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::NativeDrawingRegisterFontTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::NativeDrawingRegisterFontTest002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OH_Drawing_FontCollectionTest functions
static napi_value OH_Drawing_FontCollectionTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OH_Drawing_FontCollectionTest001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingTypographyLargeValueTest functions
static napi_value OHDrawingTypographyLargeValueTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTest016();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTest026();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTest027();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTest042();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyLargeValueTestWithIndent();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingCreateTextTab functions
static napi_value OHDrawingCreateTextTab(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingCreateTextTab001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingCreateTextTab002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingCreateTextTab003();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// TypographyTest functions
static napi_value TypographyTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::TypographyTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::TypographyTest002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::TypographyTest003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::TypographyTest004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::TypographyTest005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// FontGetTextPath functions
static napi_value FontGetTextPath(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::FontGetTextPath001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::FontGetTextPath002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::FontGetTextPath003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::FontGetTextPath004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::FontGetTextPath005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// TextLineTest functions
static napi_value TextLineTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::TextLineTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::TextLineTest002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::TextLineTest003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::TextLineTest004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::TextLineTest005();
                break;
            case CASE_NUM_5:
                result = OHOS::Rosen::Drawing::TextLineTest006();
                break;
            case CASE_NUM_6:
                result = OHOS::Rosen::Drawing::TextLineTest007();
                break;
            case CASE_NUM_7:
                result = OHOS::Rosen::Drawing::TextLineTest008();
                break;
            case CASE_NUM_8:
                result = OHOS::Rosen::Drawing::TextLineTest009();
                break;
            case CASE_NUM_9:
                result = OHOS::Rosen::Drawing::TextLineTest010();
                break;
            case CASE_NUM_10:
                result = OHOS::Rosen::Drawing::TextLineTest011();
                break;
            case CASE_NUM_11:
                result = OHOS::Rosen::Drawing::TextLineTest012();
                break;
            case CASE_NUM_12:
                result = OHOS::Rosen::Drawing::TextLineTest013();
                break;
            case CASE_NUM_13:
                result = OHOS::Rosen::Drawing::TextLineTest014();
                break;
            case CASE_NUM_14:
                result = OHOS::Rosen::Drawing::TextLineTest015();
                break;
            case CASE_NUM_15:
                result = OHOS::Rosen::Drawing::TextLineTest016();
                break;
            case CASE_NUM_16:
                result = OHOS::Rosen::Drawing::TextLineTest017();
                break;
            case CASE_NUM_17:
                result = OHOS::Rosen::Drawing::TextLineTest018();
                break;
            case CASE_NUM_18:
                result = OHOS::Rosen::Drawing::TextLineTest019();
                break;
            case CASE_NUM_19:
                result = OHOS::Rosen::Drawing::TextLineTest020();
                break;
            case CASE_NUM_20:
                result = OHOS::Rosen::Drawing::TextLineTest021();
                break;
            case CASE_NUM_21:
                result = OHOS::Rosen::Drawing::TextLineTest022();
                break;
            case CASE_NUM_22:
                result = OHOS::Rosen::Drawing::TextLineTest023();
                break;
            case CASE_NUM_23:
                result = OHOS::Rosen::Drawing::TextLineTest024();
                break;
            case CASE_NUM_24:
                result = OHOS::Rosen::Drawing::TextLineTest025();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// RunTest functions
static napi_value RunTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::RunTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::RunTest002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::RunTest003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::RunTest004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::RunTest005();
                break;
            case CASE_NUM_5:
                result = OHOS::Rosen::Drawing::RunTest006();
                break;
            case CASE_NUM_6:
                result = OHOS::Rosen::Drawing::RunTest007();
                break;
            case CASE_NUM_7:
                result = OHOS::Rosen::Drawing::RunTest008();
                break;
            case CASE_NUM_8:
                result = OHOS::Rosen::Drawing::RunTest009();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTypographyTextAutoSpaceTest functions
static napi_value OHDrawingSetTypographyTextAutoSpaceTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextAutoSpaceTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextAutoSpaceTest002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextAutoSpaceTest003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextAutoSpaceTest004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTextUndefinedGlyphDisplay functions
static napi_value OHDrawingSetTextUndefinedGlyphDisplay(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextUndefinedGlyphDisplay005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingTypographyUpdate functions
static napi_value OHDrawingTypographyUpdate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate005();
                break;
            case CASE_NUM_5:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate006();
                break;
            case CASE_NUM_6:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate007();
                break;
            case CASE_NUM_7:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate008();
                break;
            case CASE_NUM_8:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate009();
                break;
            case CASE_NUM_9:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate010();
                break;
            case CASE_NUM_10:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate011();
                break;
            case CASE_NUM_11:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate012();
                break;
            case CASE_NUM_12:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdate013();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTypographyTextTrailingSpaceOptimized functions
static napi_value OHDrawingSetTypographyTextTrailingSpaceOptimized(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyTextTrailingSpaceOptimized001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingTypographyUpdateDecorationColor functions
static napi_value OHDrawingTypographyUpdateDecorationColor(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingTypographyUpdateDecorationColor001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTypographyVerticalAlignment functions
static napi_value OHDrawingSetTypographyVerticalAlignment(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTypographyVerticalAlignment001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OH_Drawing_TypographyTest functions (91 functions)
static napi_value OH_Drawing_TypographyTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest002();
                break;
            case CASE_NUM_2:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest003();
                break;
            case CASE_NUM_3:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest004();
                break;
            case CASE_NUM_4:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest005();
                break;
            case CASE_NUM_5:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest006();
                break;
            case CASE_NUM_6:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest007();
                break;
            case CASE_NUM_7:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest008();
                break;
            case CASE_NUM_8:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest009();
                break;
            case CASE_NUM_9:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest010();
                break;
            case CASE_NUM_10:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest011();
                break;
            case CASE_NUM_11:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest012();
                break;
            case CASE_NUM_12:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest013();
                break;
            case CASE_NUM_13:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest014();
                break;
            case CASE_NUM_14:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest015();
                break;
            case CASE_NUM_15:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest016();
                break;
            case CASE_NUM_16:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest017();
                break;
            case CASE_NUM_17:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest018();
                break;
            case CASE_NUM_18:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest019();
                break;
            case CASE_NUM_19:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest020();
                break;
            case CASE_NUM_20:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest021();
                break;
            case CASE_NUM_21:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest022();
                break;
            case CASE_NUM_22:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest023();
                break;
            case CASE_NUM_23:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest024();
                break;
            case CASE_NUM_24:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest025();
                break;
            case CASE_NUM_25:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest026();
                break;
            case CASE_NUM_26:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest027();
                break;
            case CASE_NUM_27:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest028();
                break;
            case CASE_NUM_28:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest029();
                break;
            case CASE_NUM_29:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest030();
                break;
            case CASE_NUM_30:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest031();
                break;
            case CASE_NUM_31:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest032();
                break;
            case CASE_NUM_32:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest033();
                break;
            case CASE_NUM_33:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest034();
                break;
            case CASE_NUM_34:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest035();
                break;
            case CASE_NUM_35:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest036();
                break;
            case CASE_NUM_36:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest037();
                break;
            case CASE_NUM_37:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest038();
                break;
            case CASE_NUM_38:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest039();
                break;
            case CASE_NUM_39:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest040();
                break;
            case CASE_NUM_40:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest041();
                break;
            case CASE_NUM_41:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest042();
                break;
            case CASE_NUM_42:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest043();
                break;
            case CASE_NUM_43:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest044();
                break;
            case CASE_NUM_44:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest045();
                break;
            case CASE_NUM_45:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest046();
                break;
            case CASE_NUM_46:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest047();
                break;
            case CASE_NUM_47:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest048();
                break;
            case CASE_NUM_48:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest049();
                break;
            case CASE_NUM_49:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest050();
                break;
            case CASE_NUM_50:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest051();
                break;
            case CASE_NUM_51:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest052();
                break;
            case CASE_NUM_52:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest053();
                break;
            case CASE_NUM_53:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest054();
                break;
            case CASE_NUM_54:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest055();
                break;
            case CASE_NUM_55:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest056();
                break;
            case CASE_NUM_56:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest057();
                break;
            case CASE_NUM_57:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest058();
                break;
            case CASE_NUM_58:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest059();
                break;
            case CASE_NUM_59:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest060();
                break;
            case CASE_NUM_60:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest061();
                break;
            case CASE_NUM_61:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest062();
                break;
            case CASE_NUM_62:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest063();
                break;
            case CASE_NUM_63:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest064();
                break;
            case CASE_NUM_64:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest065();
                break;
            case CASE_NUM_65:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest066();
                break;
            case CASE_NUM_66:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest067();
                break;
            case CASE_NUM_67:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest068();
                break;
            case CASE_NUM_68:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest069();
                break;
            case CASE_NUM_69:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest070();
                break;
            case CASE_NUM_70:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest071();
                break;
            case CASE_NUM_71:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest072();
                break;
            case CASE_NUM_72:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest073();
                break;
            case CASE_NUM_73:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest074();
                break;
            case CASE_NUM_74:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest075();
                break;
            case CASE_NUM_75:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest076();
                break;
            case CASE_NUM_76:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest077();
                break;
            case CASE_NUM_77:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest078();
                break;
            case CASE_NUM_78:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest079();
                break;
            case CASE_NUM_79:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest080();
                break;
            case CASE_NUM_80:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest081();
                break;
            case CASE_NUM_81:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest082();
                break;
            case CASE_NUM_82:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest083();
                break;
            case CASE_NUM_83:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest084();
                break;
            case CASE_NUM_84:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest085();
                break;
            case CASE_NUM_85:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest086();
                break;
            case CASE_NUM_86:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest102();
                break;
            case CASE_NUM_87:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest103();
                break;
            case CASE_NUM_88:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest104();
                break;
            case CASE_NUM_89:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTest105();
                break;
            case CASE_NUM_90:
                result = OHOS::Rosen::Drawing::OH_Drawing_TypographyTestWithIndent();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingAddTextStyleDecoration functions
static napi_value OHDrawingAddTextStyleDecoration(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingAddTextStyleDecoration001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingTextLineEnumerateCaretOffsets functions
static napi_value OHDrawingTextLineEnumerateCaretOffsets(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingTextLineEnumerateCaretOffsets001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHDrawingSetTextHighContrast functions
static napi_value OHDrawingSetTextHighContrast(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextHighContrast001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::OHDrawingSetTextHighContrast002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// testOHDrawingUnregisterFont functions
static napi_value testOHDrawingUnregisterFont(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Rosen::Drawing::testOHDrawingUnregisterFont001();
                break;
            case CASE_NUM_1:
                result = OHOS::Rosen::Drawing::testOHDrawingUnregisterFont002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

// Merge all descriptors
static const napi_property_descriptor g_graphicDescriptors[] = {
    DECL_NAPI_DESC(OHDrawingCopyTextStyle),
    DECL_NAPI_DESC(OHDrawingCopyTextShadow),
    DECL_NAPI_DESC(OHDrawingCopyTypographyStyle),
    DECL_NAPI_DESC(OHDrawingFontMgrTest),
    DECL_NAPI_DESC(OHDrawingFontMgrMatchFamilyStyleCharacter),
    DECL_NAPI_DESC(NativeFontTest_FontMeasureText),
    DECL_NAPI_DESC(NativeDrawingRegisterFontTest),
    DECL_NAPI_DESC(OH_Drawing_FontCollectionTest),
    DECL_NAPI_DESC(OHDrawingTypographyLargeValueTest),
    DECL_NAPI_DESC(OHDrawingCreateTextTab),
    DECL_NAPI_DESC(TypographyTest),
    DECL_NAPI_DESC(FontGetTextPath),
    DECL_NAPI_DESC(TextLineTest),
    DECL_NAPI_DESC(RunTest),
    DECL_NAPI_DESC(OHDrawingSetTypographyTextAutoSpaceTest),
//    DECL_NAPI_DESC(OHDrawingSetTextUndefinedGlyphDisplay),
//    DECL_NAPI_DESC(OHDrawingTypographyUpdate),
//    DECL_NAPI_DESC(OHDrawingSetTypographyTextTrailingSpaceOptimized),
//    DECL_NAPI_DESC(OHDrawingTypographyUpdateDecorationColor),
//    DECL_NAPI_DESC(OHDrawingSetTypographyVerticalAlignment),
//    DECL_NAPI_DESC(OH_Drawing_TypographyTest),
//    DECL_NAPI_DESC(OHDrawingAddTextStyleDecoration),
//    DECL_NAPI_DESC(OHDrawingTextLineEnumerateCaretOffsets),
//    DECL_NAPI_DESC(OHDrawingSetTextHighContrast),
//    DECL_NAPI_DESC(testOHDrawingUnregisterFont),
};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_graphicDescriptors) / sizeof(g_graphicDescriptors[0]), g_graphicDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module graphicdrawingModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "graphicdrawing",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&graphicdrawingModule);
}
