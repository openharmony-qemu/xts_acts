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

#ifndef IMAGE_NAPI_TEST_H
#define IMAGE_NAPI_TEST_H
#include "napi/native_api.h"

napi_value TestInitializationOptionsSetRowStrideNormal(napi_env env, napi_callback_info info);
napi_value TestCreatePixelMapWithStrideAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeScaleWithAntiAliasingAbnormal(napi_env env, napi_callback_info info);
napi_value TestScaleWithAntiAliasingAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeGetNativeBufferAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeSetMetaDataNull(napi_env env, napi_callback_info info);
napi_value TestNativeGetMetaDataNull(napi_env env, napi_callback_info info);
napi_value TestNativeSetMemoryName(napi_env env, napi_callback_info info);
napi_value TestNativeGetArgbPixels(napi_env env, napi_callback_info info);
napi_value TestNativeGetColorSpaceNative(napi_env env, napi_callback_info info);
napi_value TestNativeSetColorSpaceNative(napi_env env, napi_callback_info info);
napi_value TestNativeSetGetSrcPixelFormat(napi_env env, napi_callback_info info);
napi_value TestNativeCreateEmptyPixelmap(napi_env env, napi_callback_info info);
napi_value TestNativeConvertAlphaFormat(napi_env env, napi_callback_info info);
napi_value TestNativeReadPixelsFromArea(napi_env env, napi_callback_info info);
napi_value TestNativeWritePixelsToArea(napi_env env, napi_callback_info info);
napi_value TestNativeCreateAlphaPixelmap(napi_env env, napi_callback_info info);
napi_value TestNativeClone(napi_env env, napi_callback_info info);
napi_value TestNativeCreateCroppedAndScaledPixelMap(napi_env env, napi_callback_info info);
napi_value TestNativeCreatePixelmapFromNativeBuffer(napi_env env, napi_callback_info info);
napi_value TestNativeCreatePixelmapFromSurface(napi_env env, napi_callback_info info);
napi_value TestNativeGetUniqueId(napi_env env, napi_callback_info info);
napi_value TestNativeIsReleased(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromSurfaceWithTransformation001(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromSurfaceWithTransformation002(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromSurfaceWithTransformation003(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromSurfaceWithTransformation004(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromSurfaceWithTransformation005(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromSurfaceWithTransformation006(napi_env env, napi_callback_info info);
napi_value TestNativeSetPixelFormatAlphaU8(napi_env env, napi_callback_info info);
napi_value TestNativeSetPixelFormatAlphaF16(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityNormal(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityBoundaryMax(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityAlphaF16(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityNullPointer(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityZeroValue(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityMaxValuePlusOne(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityMinValueMinusOne(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityAfterRelease(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityUnsupportedDataFormat(napi_env env, napi_callback_info info);
napi_value TestNativeSetOpacityLockedPixelmap(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleAbnormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleNormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleAfterRelease(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleLocked(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleAllocFailed(napi_env env, napi_callback_info info);
napi_value TestNativeApplyTranslateLocked(napi_env env, napi_callback_info info);
napi_value TestNativeApplyRotateLocked(napi_env env, napi_callback_info info);
napi_value TestNativeApplyFlipLocked(napi_env env, napi_callback_info info);
napi_value TestNativeApplyCropLocked(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleWithAntiAliasingNormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleWithAntiAliasingAfterRelease(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleWithAntiAliasingLocked(napi_env env, napi_callback_info info);
napi_value TestNativeApplyScaleWithAntiAliasingAllocFailed(napi_env env, napi_callback_info info);
napi_value TestNativeApplyTranslateNormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyTranslateAfterRelease(napi_env env, napi_callback_info info);
napi_value TestNativeApplyRotateNormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyRotateAfterRelease(napi_env env, napi_callback_info info);
napi_value TestNativeApplyFlipNormal(napi_env env, napi_callback_info info);
napi_value TestNativeApplyFlipAfterRelease(napi_env env, napi_callback_info info);

#endif /* IMAGE_NAPI_TEST_H */
