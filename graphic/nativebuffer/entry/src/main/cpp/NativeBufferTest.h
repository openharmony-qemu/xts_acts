/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef NATIVEBUFFER_NATIVEBUFFER_H
#define NATIVEBUFFER_NATIVEBUFFER_H

#include "napi/native_api.h"
#include <native_buffer/native_buffer.h>

napi_value OHNativeBufferAlloc(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReference(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReferenceAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnreference(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnreferenceAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetConfig(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMap(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnmap(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnmapAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetSeqNum(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetSeqNumAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocAbormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferAllocMuch(napi_env env, napi_callback_info info);
napi_value OHNativeBufferFromNativeWindowBufferNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferFromNativeWindowBufferNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetConfigNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetConfigNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetSeqNumNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetSeqNumNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeMapNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeMapPlanesNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapPlanesAbNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapPlanesNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeReferenceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeUnreferenceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReferenceNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReferenceMax(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnreferenceNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBuffeUnmapNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferUnmapNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetColorSpaceFirst(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetColorSpaceNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetColorSpaceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetColorSpaceAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetColorSpaceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetMetadataValueFirst(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetDynamicMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetDynamicMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetDynamicMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetDynamicMetadataValue(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValueTimes(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetStaticMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetStaticMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetStaticMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetStaticMetadataValue(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetMetadataValue4(napi_env env, OH_NativeBuffer *nativeBuffer);
napi_value OHNativeBufferSetMetadataValue(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetNullMetadataValue(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValueNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetMetadataValueAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferGetMetadataValueNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferY8Y16USAGEandAlloc(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFence0ms(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFence100ms(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFence5000ms(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFenceNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapWaitFenceAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValueEnumTraversal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferSetMetadataValueREGION(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedNull01(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedNull02(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedAbnormal01(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedAbnormal02(napi_env env, napi_callback_info info);
napi_value OHNativeBufferIsSupportedMultipleCalls(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndGetConfilgNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndGetConfilgNull(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndGetConfilgMultipleCalls01(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndGetConfilgMultipleCalls02(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAll(napi_env env, napi_callback_info info);
napi_value OHNativeBufferMapAndUnmap(napi_env env, napi_callback_info info);
napi_value OHNativeBufferWriteToParcelNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferWriteToParcelNull(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReadFromParcelNormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReadFromParcelNull(napi_env env, napi_callback_info info);
napi_value OHNativeBufferReadFromParcelAbnnormal(napi_env env, napi_callback_info info);
napi_value OHNativeBufferWriteAndReadParcelMultipleCalls(napi_env env, napi_callback_info info);
#endif //NATIVEBUFFER_NATIVEBUFFER_H
