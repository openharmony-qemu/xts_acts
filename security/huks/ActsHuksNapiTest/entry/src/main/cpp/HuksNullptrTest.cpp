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

#include "include/HuksNullptrTest.h"
#include <huks/native_huks_api.h>
#include  <huks/native_huks_param.h>
#include <huks/native_huks_type.h>

namespace Acts {
namespace Huks {

static struct OH_Huks_ParamSet *paramSetNullptr = nullptr;
static struct OH_Huks_Param *paramNullptr = nullptr;
static struct OH_Huks_Blob *blobNullptr = nullptr;
static struct OH_Huks_CertChain *certChainNullptr = nullptr;

/**
 * @tc.name   SecurityHuksNapiNullptr0100
 * @tc.number Security_HUKS_NAPI_nullptr_0100
 * @tc.desc   use nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiNullptr0100()
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSetNullptr);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_AddParams(paramSetNullptr, paramNullptr, 0);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_BuildParamSet(&paramSetNullptr);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_CopyParamSet(paramSetNullptr, 0, &paramSetNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_GetParam(paramSetNullptr, 0, &paramNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_FreshParamSet(paramSetNullptr, 0);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_IsParamSetTagValid(paramSetNullptr);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_IsParamSetValid(paramSetNullptr, 0);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    struct OH_Huks_Param baseParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1};
    struct OH_Huks_Param otherParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)2};
    ret = OH_Huks_CheckParamMatch(&baseParam, &otherParam);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_GetSdkVersion(blobNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_GenerateKeyItem(blobNullptr, paramSetNullptr, paramSetNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_ImportWrappedKeyItem(blobNullptr, blobNullptr, paramSetNullptr, blobNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_ExportPublicKeyItem(blobNullptr, paramSetNullptr, blobNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_DeleteKeyItem(blobNullptr, paramSetNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_GetKeyItemParamSet(blobNullptr, paramSetNullptr, paramSetNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_IsKeyItemExist(blobNullptr, paramSetNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_AttestKeyItem(blobNullptr, paramSetNullptr, certChainNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_InitSession(blobNullptr, paramSetNullptr, blobNullptr, blobNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_UpdateSession(blobNullptr, paramSetNullptr, blobNullptr, blobNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_FinishSession(blobNullptr, paramSetNullptr, blobNullptr, blobNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_AbortSession(blobNullptr, paramSetNullptr);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

} // namespace Huks
} // namespace Acts
