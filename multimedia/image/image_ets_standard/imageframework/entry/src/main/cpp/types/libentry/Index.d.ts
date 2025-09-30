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

import { image } from '@kit.ImageKit';

interface pixelMapPots {
  width: number,
  height: number,
  pixelFormat: number,
  editable: number,
  alphaType: number,
  scaleMode: number
}

interface imagePacker {
  code: number;
  result: image.ImagePacker;
}

interface packConfig_options {
  delayTimes: number[];
  disposalTypes: number[];
}

interface PackingOption_format {
  format: string;
}

interface PackingOption_quality {
  quality: number;
}

export const ImagePackerCreate1: () => number;

export const ImagePackerRelease: () => number;

export const PictureMetadataCreate1: () => number;

export const PictureMetadataCreate2: () => number;

export const PictureMetadataGetProperty1: () => number;

export const PictureMetadataSetProperty1: () => number;

export const PictureMetadataRelease1: () => number;

export const PictureMetadataRelease2: () => number;

export const PictureMetadataClone1: () => number;

export const CreatePixelMapWithStride: () => number;

export const CreateAlphaPixelMap: () => number;

export const GetBytesNumberPerRow: () => number;

export const GetIsEditable: () => number;

export const IsSupportAlpha: () => number;

export const SetAlphaAble: () => number;

export const GetDensity: () => number;

export const SetDensity: () => number;

export const SetOpacity: () => number;

export const PixelMapScale: () => number;

export const ScaleWithAntiAliasing: () => number;

export const PixelMapTranslate: () => number;

export const PixelMapRotate: () => number;

export const PixelMapFlip: () => number;

export const PixelMapCrop: () => number;

export const PixelMapGetImageInfo: () => number;

export const PixelMapAccessPixels: () => number;

export const PixelMapUnAccessPixels: () => number;

export const UnAccessPixels: () => number;

export const GetImageInfoParameter: () => number;

export const CreateImageReceiver: () => number;

export const GetReceivingSurfaceId: () => number;

export const ReadLatestImage: () => number;

export const ReadNextImage: () => number;

export const ReceiverOn: () => number;

export const ReceiverGetSize: () => number;

export const ReceiverGetCapacity: () => number;

export const ReceiverGetFormat: () => number;

export const ReceiverRelease: () => number;

export const ImageSourceCreate: () => number;

export const ImageSourceCreateFromUri: () => number;

export const ImageSourceCreateFromFd: () => number;

export const ImageSourceCreateFromData: () => number;

export const ImageSourceCreateFromRawFile: () => number;

export const ImageSourceCreateIncremental: () => number;

export const ImageSourceCreateIncrementalFromData: () => number;

export const ImageSourceGetSupportedFormats: () => number;

export const ImageSourceCreatePixelMap: () => number;

export const ImageSourceCreatePixelMapList: () => number;

export const ImageSource_GetDelayTime: () => number;

export const ImageSourceGetFrameCount: () => number;

export const ImageSourceGetImageInfo: () => number;

export const ImageSourceGetImageProperty: () => number;

export const ImageSourceModifyImageProperty: () => number;

export const ImageSourceUpdateData: () => number;

export const PictureNativeCreatePicture: () => number;

export const ImageSourceRelease: () => number;

export const PictureNativeGetMainPixelmap: () => number;

export const PictureNativeGetHdrComposedPixelmap: () => number;

export const PictureNativeGetGainmapPixelmap: () => number;

export const PictureNativeSetAuxiliaryPicture: () => number;

export const PictureNativeGetMetadata: () => number;

export const PictureNativeSetMetadata: () => number;

export const PictureNativeRelease: () => number;

export const AuxiliaryPictureNativeCreate: () => number;

export const AuxiliaryPictureNativeWritePixels: () => number;

export const AuxiliaryPictureNativeReadPixels: () => number;

export const AuxiliaryPictureNativeGetType: () => number;

export const AuxiliaryPictureNativeGetInfo: () => number;

export const AuxiliaryPictureNativeSetInfo: () => number;

export const AuxiliaryPictureNativeGetMetadata: () => number;

export const AuxiliaryPictureNativeSetMetadata: () => number;

export const AuxiliaryPictureNativeRelease: () => number;

export const AuxiliaryPictureInfoCreate: () => number;

export const AuxiliaryPictureInfoGetType: () => number;

export const AuxiliaryPictureInfoSetType: () => number;

export const AuxiliaryPictureInfoGetSize: () => number;

export const AuxiliaryPictureInfoSetSize: () => number;

export const AuxiliaryPictureInfoGetRowStride: () => number;

export const AuxiliaryPictureInfoSetRowStride: () => number;

export const AuxiliaryPictureInfoGetPixelFormat: () => number;

export const AuxiliaryPictureInfoSetPixelFormat: () => number;

export const AuxiliaryPictureInfoRelease: () => number;

export const AuxiliaryPictureInfoSetTypeSuccess: () => number;

export const AuxiliaryPictureInfoCreateSuccess: () => number;

export const AuxiliaryPictureNativeCreateSuccess: () => number;

export const AuxiliaryPictureInfoGetSizeSucces: () => number;

export const AuxiliaryPictureInfoSetSizeSuccess: () => number;

export const AuxiliaryPictureInfoGetRowStrideSuccess: () => number;

export const AuxiliaryPictureInfoSetRowStrideSuccess: () => number;

export const AuxiliaryPictureInfoGetPixelFormatSuccess: () => number;

export const AuxiliaryPictureInfoSetPixelFormatSuccess: () => number;

export const AuxiliaryPictureInfoReleaseSuccess: () => number;

export const AuxiliaryPictureInfoGetTypeSucess: () => number;

export const AuxiliaryPictureNativeReleaseSuccess: () => number;

export const PixelmapInitializationOptionsCreate: () => number;

export const PixelmapInitializationOptionsGetWidthSuccess: () => number;

export const PixelmapInitializationOptionsGetWidth: () => number;

export const PixelmapInitializationOptionsSetWidth: () => number;

export const PixelmapInitializationOptionsGetHeight: () => number;

export const PixelmapInitializationOptionsSetHeight: () => number;

export const PixelmapInitializationOptionsSetWidthSuccess: () => number;

export const PixelmapInitializationOptionsGetHeightSuccess: () => number;

export const PixelmapInitializationOptionsSetHeightSuccess: () => number;

export const PixelmapInitializationOptionsCreateSuccess: () => number;

export const PixelmapInitializationOptionsGetPixelFormat: () => number;

export const PixelmapInitializationOptionsSetPixelFormat: () => number;

export const PixelmapInitializationOptionsGetSrcPixelFormat: () => number;

export const PixelmapInitializationOptionsSetSrcPixelFormat: () => number;

export const PixelmapInitializationOptionsGetPixelFormatSuccess: () => number;

export const PixelmapInitializationOptionsSetPixelFormatSuccess: () => number;

export const PixelmapInitializationOptionsGetSrcPixelFormatSuccess: () => number;

export const PixelmapInitializationOptionsSetSrcPixelFormatSuccess: () => number;

export const PixelmapInitializationOptionsGetRowStrideSuccess: () => number;

export const PixelmapInitializationOptionsGetRowStride: () => number;

export const PixelmapInitializationOptionsSetRowStride: () => number;

export const PixelmapInitializationOptionsGetAlphaType: () => number;

export const PixelmapInitializationOptionsSetAlphaType: () => number;

export const PixelmapInitializationOptionsGetEditable: () => number;

export const PixelmapInitializationOptionsSetEditable: () => number;

export const PixelmapInitializationOptionsRelease: () => number;

export const PixelmapImageInfoCreate: () => number;

export const PixelmapImageInfoGetWidth: () => number;

export const PixelmapImageInfoGetHeight: () => number;

export const PixelmapInitializationOptionsSetRowStrideSuccess: () => number;

export const PixelmapInitializationOptionsGetAlphaTypeSuccess: () => number;

export const PixelmapInitializationOptionsSetAlphaTypeSuccess: () => number;

export const PixelmapInitializationOptionsGetEditableSuccess: () => number;

export const PixelmapInitializationOptionsSetEditableSuccess: () => number;

export const PixelmapInitializationOptionsReleaseSuccess: () => number;

export const PixelmapImageInfoCreateSuccess: () => number;

export const PixelmapImageInfoGetWidthSuccess: () => number;

export const PixelmapImageInfoGetHeightSuccess: () => number;

export const PixelmapImageInfoGetAlphaModeSuccess: () => number;

export const PixelmapImageInfoGetAlphaMode: () => number;

export const PixelmapImageInfoGetRowStrideSuccess: () => number;

export const PixelmapImageInfoGetRowStride: () => number;

export const PixelmapImageInfoGetPixelFormatSuccess: () => number;

export const PixelmapImageInfoGetPixelFormat: () => number;

export const PixelmapImageInfoGetAlphaTypeSuccess: () => number;

export const PixelmapImageInfoGetAlphaType: () => number;

export const PixelmapImageInfoGetDynamicRangeSuccess: () => number;

export const PixelmapImageInfoGetDynamicRange: () => number;

export const PixelmapImageInfoReleaseSuccess: () => number;

export const PixelmapImageInfoRelease: () => number;

export const PixelmapNativeCreatePixelmapSuccess: () => number;

export const PixelmapNativeCreatePixelmap: () => number;

export const CreatePixelmapUsingAllocator: () => number;

export const ConvertPixelmapNativeToNapi: () => number;

export const ConvertPixelmapNativeToNapiSuccess: () => number;

export const ConvertPixelmapNativeFromNapi: () => number;

export const PixelmapNativeReadPixels: () => number;

export const PixelmapNativeWritePixels: () => number;

export const PixelmapNativeGetArgbPixelsSuccess: () => number;

export const PixelmapNativeGetArgbPixels: () => number;

export const PixelmapNativeToSdr: () => number;

export const PixelmapNativeGetImageInfo: () => number;

export const PixelmapNativeOpacitySuccess: () => number;

export const PixelmapNativeOpacity: () => number;

export const packToData: (a: image.ImagePacker, b: image.ImageSource | image.PixelMap,
  c: image.PackingOption | PackingOption_format | PackingOption_quality) => number;

export const create: () => imagePacker;

export const packToFile: (a: image.ImagePacker, b: image.ImageSource | image.PixelMap, c: number,
  d: image.PackingOption | PackingOption_format | PackingOption_quality) => number;

export const release: (a: image.ImagePacker) => number;

export const JsCreateImageReceiver: (a: number) => image.ImageReceiver;

export const JsCreateImageReceiverOptions: (a: number, b: number, c: number) => number;

export const PixelmapNativeScaleSuccess: () => number;

export const PixelmapNativeScale: () => number;

export const PixelmapNativeScaleWithAntiAliasing: () => number;

export const CreateScaledPixelMap: () => number;

// export const TranslateSuccess: () => number;
export const Translate: () => number;

export const PixelmapNativeRotateSuccess: () => number;

export const PixelmapNativeRotate: () => number;

export const PixelmapNativeFlipSuccess: () => number;

export const PixelmapNativeFlip: () => number;

// export const PixelmapNativeCropSuccess: () => number;
export const PixelmapNativeCrop: () => number;

export const PixelmapNativeReleaseSuccess: () => number;

export const PixelmapNativeRelease: () => number;

export const CreateScaledPixelMapWithAntiAliasing: () => number;

export const PixelmapNativeDestroySuccess: () => number;

export const PixelmapNativeDestroy: () => number;

export const PixelmapNativeConvertAlphaFormat: () => number;

export const PixelmapNativeCreateEmptyPixelmapSuccess: () => number;

export const PixelmapNativeCreateEmptyPixelmap: () => number;

export const PixelmapNativeCreateEmptyPixelmapUsingAllocator: () => number;

export const PixelmapNativeGetMetadata: () => number;

export const PixelmapNativeSetMetadata: () => number;

export const PixelmapNativeGetNativeBuffer: () => number;

export const PixelmapNativeGetColorSpaceNative: () => number;

export const PixelmapNativeSetColorSpaceNative: () => number;

export const PixelmapNativeSetMemoryName: () => number;

export const PixelmapNativeGetByteCountSuccess: () => number;

export const PixelmapNativeGetByteCount: () => number;

export const PixelmapNativeGetAllocationByteCountSuccess: () => number;

export const PixelmapNativeGetAllocationByteCount: () => number;

export const PixelmapNativeAccessPixelsSuccess: () => number;

export const PixelmapNativeAccessPixels: () => number;

export const PixelmapNativeUnaccessPixelsSuccess: () => number;

export const PixelmapNativeUnaccessPixels: () => number;

export const ImageProcessingCreateSuccess: () => number;

export const ImageProcessingDestroySuccess: () => number;

export const ImageProcessingDestroy: () => number;

export const ImageProcessingSetParameterSuccess: () => number;

export const ImageProcessingSetParameter: () => number;

export const ImageProcessingGetParameterSuccess: () => number;

export const ImageProcessingGetParameter: () => number;

export const ImageProcessingConvertColorSpaceValue: () => number;

export const ImageProcessingConvertColorSpace: () => number;

export const ImageProcessingComposeValue: () => number;

export const ImageProcessingCompose: () => number;

export const ImageProcessingDecomposeValue: () => number;

export const ImageProcessingDecompose: () => number;

export const ImageProcessingGenerateMetadataValue: () => number;

export const ImageProcessingGenerateMetadata: () => number;

export const ImageProcessingEnhanceDetailValue: () => number;

export const ImageProcessingEnhanceDetail: () => number;

export const ImageProcessingCreateInstance: () => number;

export const ImageProcessingDeinitializeEnvironment: () => number;

export const PixelMapScaleWithAntiAliasingNone: () => number;

export const PixelMapScaleWithAntiAliasingLow: () => number;

export const PixelMapScaleWithAntiAliasingMedium: () => number;



































