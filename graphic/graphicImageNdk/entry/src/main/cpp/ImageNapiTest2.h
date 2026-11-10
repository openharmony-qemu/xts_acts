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

#ifndef IMAGE_NAPI_TEST2_H
#define IMAGE_NAPI_TEST2_H

#include "napi/native_api.h"

napi_value TestWritePixelsWithFmtRGBA8888(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtRGB888(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtRGB565(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtRGBAF16(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtNullPixelmap(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtNullSource(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtUnsupportedFmt(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtRGBA8888(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtRGB888(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtRGB565(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtRGBAF16(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtNullPixelmap(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtNullArea(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtUnsupportedFmt(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtLocked(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtUnsupportedConversion(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtInsufficientBuffer(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtLocked(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtUnsupportedConversion(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtInsufficientBuffer(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtCopyFailed(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtCopyFailed(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtAllocFailed(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtAllocFailed(napi_env env, napi_callback_info info);
napi_value TestWritePixelsWithFmtByFormat(napi_env env, napi_callback_info info);
napi_value TestWritePixelsToAreaWithFmtByFormat(napi_env env, napi_callback_info info);

napi_value TestNativeApplyCropNormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyCropAfterRelease(napi_env env, napi_callback_info info);
napi_value TestNativeApplyCropInvalidRegion(napi_env env, napi_callback_info info);
napi_value TestNativeConvertAlphaTypeNormal(napi_env env, napi_callback_info info);
napi_value TestNativeConvertAlphaTypeAfterRelease(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleWithAntiAliasingAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyTranslateAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyRotateAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyFlipAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyCropAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyCropNullRegion(napi_env env, napi_callback_info info);
napi_value TestNativeApplyCropBothNull(napi_env env, napi_callback_info info);
napi_value TestNativeApplyRotateInvalidAngle(napi_env env, napi_callback_info info);
napi_value TestNativeConvertAlphaTypeAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeConvertAlphaTypeUnsupportedDataFormat(napi_env env, napi_callback_info info);
napi_value TestNativeConvertAlphaTypeNullSrc(napi_env env, napi_callback_info info);
napi_value TestNativeConvertAlphaTypeNullDst(napi_env env, napi_callback_info info);
napi_value TestNativeImageDataConversionFailedErrorCode(napi_env env, napi_callback_info info);
napi_value TestGetAlphaTypeNullPtr(napi_env env, napi_callback_info info);
napi_value TestImageInfoGetWidthNullPtr(napi_env env, napi_callback_info info);
napi_value TestImageInfoGetHeightNullPtr(napi_env env, napi_callback_info info);

#endif /* IMAGE_NAPI_TEST2_H */
