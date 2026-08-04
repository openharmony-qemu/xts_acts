/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "common/common.h"
#include <arkui/styled_string.h>

namespace ArkUICapiTest {

static napi_value ParagraphStyleTailIndentsTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    OH_ArkUI_ParagraphStyle* paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    if (paragraphStyle == nullptr) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    float tailIndents[] = { 10.0f };
    ArkUI_ErrorCode result = OH_ArkUI_ParagraphStyle_SetTailIndents(paragraphStyle, tailIndents, PARAM_1);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(column);
}

static napi_value ParagraphStyleTailIndentsTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    OH_ArkUI_ParagraphStyle* paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    if (paragraphStyle == nullptr) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    float tailIndents[] = { 10.0f, 20.0f, 30.0f };
    ArkUI_ErrorCode result = OH_ArkUI_ParagraphStyle_SetTailIndents(paragraphStyle, tailIndents, PARAM_3);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(column);
}

static napi_value ParagraphStyleTailIndentsTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    OH_ArkUI_ParagraphStyle* paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    if (paragraphStyle == nullptr) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    float tailIndents[] = { 10.0f };
    ArkUI_ErrorCode setResult = OH_ArkUI_ParagraphStyle_SetTailIndents(paragraphStyle, tailIndents, PARAM_1);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    float  buffer[PARAM_1] = {PARAM_0};
    float *getTailIndents = buffer;
    uint32_t writeLength = PARAM_0;
    ArkUI_ErrorCode getResult =
        OH_ArkUI_ParagraphStyle_GetTailIndents(paragraphStyle, &getTailIndents, PARAM_1, &writeLength);
    ASSERT_EQ(getResult, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(static_cast<int32_t>(writeLength), PARAM_1);
    ASSERT_EQ(static_cast<int32_t>(getTailIndents[0]), PARAM_10);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(column);
}

static napi_value ParagraphStyleTailIndentsTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    OH_ArkUI_ParagraphStyle* paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    if (paragraphStyle == nullptr) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    float tailIndents[] = { 10.0f, 20.0f, 30.0f };
    ArkUI_ErrorCode setResult = OH_ArkUI_ParagraphStyle_SetTailIndents(paragraphStyle, tailIndents, PARAM_3);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    float  buffer[PARAM_3] = {PARAM_0};
    float *getTailIndents = buffer;
    uint32_t writeLength = PARAM_0;
    ArkUI_ErrorCode getResult =
        OH_ArkUI_ParagraphStyle_GetTailIndents(paragraphStyle, &getTailIndents, PARAM_3, &writeLength);
    ASSERT_EQ(getResult, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(static_cast<int32_t>(writeLength), PARAM_3);
    ASSERT_EQ(static_cast<int32_t>(getTailIndents[0]), PARAM_10);
    ASSERT_EQ(static_cast<int32_t>(getTailIndents[1]), PARAM_20);
    ASSERT_EQ(static_cast<int32_t>(getTailIndents[2]), PARAM_30);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(column);
}

static napi_value ParagraphStyleTailIndentsTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float tailIndents[] = { 10.0f };
    ArkUI_ErrorCode result = OH_ArkUI_ParagraphStyle_SetTailIndents(nullptr, tailIndents, PARAM_1);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(column);
}

static napi_value ParagraphStyleTailIndentsTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    OH_ArkUI_ParagraphStyle* paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    if (paragraphStyle == nullptr) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    ArkUI_ErrorCode result = OH_ArkUI_ParagraphStyle_SetTailIndents(paragraphStyle, nullptr, PARAM_1);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(column);
}

static napi_value ParagraphStyleTailIndentsTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float* getTailIndents = nullptr;
    uint32_t writeLength = PARAM_0;
    ArkUI_ErrorCode result = OH_ArkUI_ParagraphStyle_GetTailIndents(nullptr, &getTailIndents, PARAM_1, &writeLength);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(column);
}

static napi_value ParagraphStyleTailIndentsTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    OH_ArkUI_ParagraphStyle* paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    if (paragraphStyle == nullptr) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    float tailIndents[] = { 10.0f, 20.0f, 30.0f };
    ArkUI_ErrorCode setResult = OH_ArkUI_ParagraphStyle_SetTailIndents(paragraphStyle, tailIndents, PARAM_3);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    float  buffer[PARAM_3] = {PARAM_0};
    float *getTailIndents = buffer;
    uint32_t writeLength = PARAM_0;
    ArkUI_ErrorCode getResult =
        OH_ArkUI_ParagraphStyle_GetTailIndents(paragraphStyle, &getTailIndents, PARAM_2, &writeLength);
    ASSERT_EQ(getResult, ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(column);
}

}
