/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
interface PackingOption_format {
  format: string;
}

interface PackingOption_quality {
  quality: number;
}
export const packToData: (a: image.ImagePacker, b: image.ImageSource | image.PixelMap,
  c: image.PackingOption | PackingOption_format | PackingOption_quality) => number;
export const OHImageEffectCreateSupp: (a: number) => number;
export const OHImageEffectAddFilterSupp: (a: number) => number;
export const OHImageEffectInsertFilterSupp: (a: number) => number;
export const OHImageEffectRemoveFilterSupp: (a: number) => number;
export const OHImageEffectReplaceFilterSupp: (a: number) => number;
export const OHEffectBufferInfoSetTimestampTest: (a: number) => number;
export const OHEffectBufferInfoGetTimestampTest: (a: number) => number;
export const OHEffectBufferInfoSetTextureIdTest: (a: number) => number;
export const OHEffectBufferInfoGetTextureIdTest: (a: number) => number;
export const OHEffectFilterCreateSupp: (a: number) => number;
export const OHEffectFilterLookUpFiltersSupp: (a: number) => number;
export const OHEffectFilterLookUpFiltersNullptrSupp: () => undefined;
export const OHEffectFilterSetValueSupp: (a: number) => number;
export const OHEffectFilterGetValueSupp: (a: number) => number;
export const OHEffectFilterRegisterSupp: (a: number) => number;
export const OHEffectFilterLookupFilterInfoSupp: (a: number) => number;
export const OHEffectFilterReleaseSupp: (a: number) => number;
export const OHEffectFilterRenderSupp: (a: number) => number;
export const OHEffectFilterRenderWithTextureIdSupp: (a: number) => number;
export const OHPixelmapNativeCreateScaledPixelMapSupp: (a: number) => number;
export const OHPixelmapNativeCreateScaledPixelMapWithAntiAliasingSupp: (a: number) => number;
export const OHPixelmapNativeTranslateSupp: (a: number) => number;
export const OHImageSourceNativeCreateFromUriSupp: (a: number) => number;
export const OHImageSourceNativeCreateFromFdSupp: (a: number) => number;
export const OHImageAlphaTypeSupp: (a: number) => number;
export const OHImageErrorCodeSupp: (a: number) => number;
export const OHImageScaleModeSupp: (a: number) => number;
export const OHImageAuxiliaryPictureSupp: (a: number) => number;
export const add:(a: number, b: number) => image.PixelMap;
export const transform: (a: image.PixelMap) => image.PixelMap;
export const testGetImageInfo: (a: image.PixelMap) => image.PixelMap;
export const testAccessPixels: (a: image.PixelMap) => image.PixelMap;
export const testUnAccessPixels: (a: image.PixelMap) => image.PixelMap;
export const PixelMapGetIsEditableResult: (a: number) => number;
export const ImagePackerCreateTest: (a: number) => number;
export const ImagePackerInitNativeTest: (a: number) => number;
export const ImagePackerPackToDataTest: (a: number, b: number) => number;
export const ImagePackerPackToFileTest: (a: number, b: number) => number;
export const CreatePixelMapTest: (a: number) => number;
export const CreatePixelMapWithStrideTest: (a: number) => number;
export const CreateAlphaPixelMapTest: (a: number) => number;
export const PictureNativeGetMetadataTest: (a: number, b: number) => number;
export const PixelMapGetImageInfoTest: (a: number) => number;
export const PixelMapAccessPixelsTest: (a: number) => number;
export const PixelMapUnAccessPixelsTest: (a: number) => number;
export const OHEffectFilterInfoSetFilterNameSupplementTest: (a: number) => number;
export const OHEffectFilterInfoGetFilterNameSupplementTest: (a: number) => number;
export const OHEffectFilterInfoSetSupportedBufferTypesSuppTest: (a: number) => number;
export const OHEffectFilterInfoGetSupportedBufferTypesSuppTest: (a: number) => number;
export const OHEffectFilterInfoSetSupportedFormatsSuppTest: (a: number) => number;
export const OHEffectFilterInfoGetSupportedFormatsSuppTest: (a: number) => number;
export const OHEffectFilterInfoReleaseSupplementTest: (a: number) => number;
export const OHImageEffectReplaceFilterByFilterSupp: (a: number) => number;
export const OHImageEffectAddFilterByFilterSupp: (a: number) => number;
export const OHImageEffectInsertFilterByFilterSupp: (a: number) => number;
export const OHImageEffectRemoveFilterByIndexSupp: (a: number) => number;
export const OHImageEffectGetFilterSupp: (a: number) => number;
export const OHImageEffectSetInputPictureSupp: (a: number) => number;
export const OHImageEffectSetOutputPictureSupp: (a: number) => number;
export const OHImageEffectReleaseSupp:(a: number) => number;
export const OHImageInitImageNativeSupp: () => undefined;
export const OHPictureMetadataGetPropertyWithNullSupp: (a: number) => number;
export const OHPackingOptionsCreateSupp: (a: number) => number;
export const OHPixelmapNativeGetMetadataSupp: (a: number) => number;
export const OHPixelmapNativeSetMetadataSupp: (a: number) => number;
export const OHConvertPixelmapNativeFromNapiSupp: (a: number) => number;
export const OHPictureNativeGetMetadataSupp: (a: number) => number;
export const OHAuxiliaryPictureNativeWritePixelsSupp: (a: number) => number;
export const OHAuxiliaryPictureNativeReadPixelsSupp: (a: number) => number;
export const OHAuxiliaryPictureNativeSetMetadataSupp: (a: number) => number;