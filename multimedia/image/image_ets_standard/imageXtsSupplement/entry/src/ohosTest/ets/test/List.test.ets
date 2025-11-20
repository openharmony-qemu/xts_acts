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

import ImagePropertyKeyTest from './image/ImagePropertyKeyEnum.test';
import ImageCreateImageSourceBufTest from './image/ImageCreateImageSourceBuf.test';
import ImageCreateIncrementalSourceTest from './image/ImageCreateIncrementalSource.test';
import ImageCreatePixelMapTest from './image/ImageCreatePixelMap.test';
import ImageCreatePixelMapSyncTest from './image/ImageCreatePixelMapSync.test';
import ImagePropertyKeyTest2 from './image/ImagePropertyKeyEnum2.test';
import ImagePropertyKeyTest3 from './image/ImagePropertyKeyEnum3.test';
import pixelMapReadPixelsTest from './pixelMap/PixelMapReadPixels.test';
import pixelMapWritePixelsTest from './pixelMap/PixelMapWritePixels.test';
import pixelMapOpacityTest from './pixelMap/PixelMapOpacity.test';
import ImageCreateIncrementalSourceBufTest from './image/ImageCreateIncrementalSourceBuf.test';
import ImageCreateImageSourceOptionsTest from './image/ImageCreateImageSourceOptions.test';
import ImageCreateImageReceiverPackerTest from './image/ImageCreateImageReceiver.test';
import ImageCreateAuxiliaryPictureTest from './image/ImageCreateAuxiliaryPicture.test';
import ImageAuxiliaryGetTypeTest from './image/ImageGetType.test';
import GetImageSourceSupportedFormats from "./image/ImageGetImageSourceSupportedFormats.test"
import ImagePropertyKeyTest4 from "./image/ImagePropertyKeyEnum4.test"
import imageCreatePixelMapUsingAllocatorSyncSuppTest from "./image/imageCreatePixelMapUsingAllocatorSyncSuppTest.test"
import PictureGetGainmapPixelmapTest from './Picture/PictureGetGainmapPixelmap.test';
import SendableImageFlipTest from './sendableImage/SendableImageFlip.test';
import SendableImageRotateTest from './sendableImage/SendableImageRotate.test';
import SendableImageScale from './sendableImage/SendableImageScale.test';
import SendableImageTranslateTest from './sendableImage/SendableImageTranslate.test';
import ImageCreatePixelMapSyncAbnormalTest from "./image/ImageCreatePixelMapSyncAbnormal.test"
import PictureSetAuxiliaryPictureTest from './Picture/PictureSetAuxiliaryPicture.test';
import pixelMapGetBytesNumberPerRowTest from './pixelMap/PixelMapGetBytesNumberPerRow.test';
import CreateImageSourceSuppTest from "./image/CreateImageSource.test";
import ImageSourceCreatePixelMapListSupp from "./image/ImageSourceCreatePixelMapList.test";
import ImageSourceGetDelayTimeListSupp from "./image/ImageSourceGetDelayTimeList.test";
import getImagePropertySyncTest from "./image/ImageSourceGetImagePropertySync.test";
import PictureGetTypeTestSupp from './Picture/PictureGetType.test';
import ImagePropertyOptionTest from "./image/ImagePropertyOption.test";
import ImageEnumSupp from "./image/ImageEnum.test";
import PictureSetMetadataTestSupp from './Picture/PictureSetGetMetadata.test';
import ImageCreateIncrementalSourceSupp from './image/ImageCreateIncrementalSourceSupp.test';
import ImageCreatePixelMapFromSurface from './image/ImageCreatePixelMapFromSurface.test';
import ImageGetImagePropertySyncEnumFlash from './image/ImageGetImagePropertySyncEnumFlash.test';
import ImageGetImagePropertySyncEnumFlashEmpty from './image/ImageGetImagePropertySyncEnumFlashEmpty.test';
import ImageGetImagePropertySyncEnumFrontCamera from './image/ImageGetImagePropertySyncEnumFrontCamera.test';
import ImagePropertyKeySyncEnumGPS from './image/ImageGetImagePropertySyncEnumGPS.test';
import ImageGetImagePropertySyncEnumGPSStatus from './image/ImageGetImagePropertySyncEnumGPSStatus.test';
import ImageGetImagePropertySyncEnumGPSStatusEmpty from './image/ImageGetImagePropertySyncEnumGPSStatusEmpty.test';
import ImageGetImagePropertySyncEnumISO from './image/ImageGetImagePropertySyncEnumISO.test';
import ImageGetImagePropertySyncEnumLength from './image/ImageGetImagePropertySyncEnumLength.test';
import ImageGetImagePropertySyncEnumLightSource from './image/ImageGetImagePropertySyncEnumLightSource.test';
import ImageGetImagePropertySyncEnumReference from './image/ImageGetImagePropertySyncEnumReference.test';
import ImageGetImagePropertySyncEnumScenePointer from './image/ImageGetImagePropertySyncEnumScenePointer.test';
import ImageGetImagePropertySyncEnumSensitiveType from './image/ImageGetImagePropertySyncEnumSensitiveType.test';
import ImageGetImagePropertySyncEnumSensitiveTypeEmpty from './image/ImageGetImagePropertySyncEnumSensitiveTypeEmpty.test';
import ImageGetImagePropertySyncEnumSoftware from './image/ImageGetImagePropertySyncEnumSoftware.test';
import ImageGetImagePropertySyncEnumStripOffset from './image/ImageGetImagePropertySyncEnumStripOffset.test';
import ImageGetImagePropertySyncSUBFILE from './image/ImageGetImagePropertySyncSUBFILE.test';
import ImagePropertyKeySyncEnumJpgEmpty from './image/ImagePropertyKeySyncEnumJpgEmpty.test';
import ImageCreatePixelMapSync from './image/ImageCreatePixelMapSyncSupp.test';
import ImagePropertyKeySyncEnumGPSTIMESTAMP from './image/ImagePropertyKeySyncEnumGpsTimeTamp.test';
import ImagePropertyKeySyncEnumSoftWare from './image/ImagePropertyKeySyncEnumSoftWare.test';
import ImagePropertyKeySyncEnumStripOffsets from './image/ImagePropertyKeySyncEnumStripOffsets.test';
import modifyImagePropertyTest from './image/ModifyImageProperty.test';
import modifyImagePropertyTests from './image/ModifyImagePropertyKey.test';
import ImageImagePackerPackingSupp from './image/ImagePackerPackingSupp.test';
import ImageCreateImageReceiverCreator from './image/ImageCreateImageReceiverCreator.test';
import PictureGetMetadataFirstParameters from './Picture/PictureGetMetadataFirParameters.test';
import CreatePixelMapUsingAllocatorAndSync from './image/ImageCreatePixelMapUsingAllocatorSuppAb.test';
import ImagePropertyKeySyncEnumJpgEmpty from './image/ImagePropertyKeySyncEnumJpgEmpty.test';
import ImageCreatePixelMapSync from './image/ImageCreatePixelMapSyncSupp.test';
import ImagePropertyKeySyncEnumGPSTIMESTAMP from './image/ImagePropertyKeySyncEnumGpsTimeTamp.test';
import ImagePropertyKeySyncEnumSoftWare from './image/ImagePropertyKeySyncEnumSoftWare.test';
import ImagePropertyKeySyncEnumStripOffsets from './image/ImagePropertyKeySyncEnumStripOffsets.test';
import modifyImagePropertyTest from './image/ModifyImageProperty.test';
import modifyImagePropertyTests from './image/ModifyImagePropertyKey.test';
import ImageImagePackerPackingSupp from './image/ImagePackerPackingSupp.test';
import ImageSourceGetImagePropertyTest from "./image/ImageSourceGetImageProperty.test";
import ImageSourceCreatePictureGif from './image/ImageSourceCreatePictureGif.test';
import ImageSourceCreatePictureJpeg from './image/ImageSourceCreatePictureJpeg.test';
import ImageSourceCreatePictureJpg from './image/ImageSourceCreatePictureJpg.test';
import ImageSourceCreatePictureOrf from './image/ImageSourceCreatePictureOrf.test';
import createImageSourceTest from './image/ImageCreateImageSource.test';
import sendableCreatePixelMap from './sendableImage/SendAbleCreatePixelMap.test';
import sendableCreatePixelMapSyncTest from './sendableImage/SendAbleCreatePixelMapSync.test';


export default function testsuite() {
  ImagePropertyKeyTest();
  ImageCreateImageSourceBufTest();
  ImageCreateIncrementalSourceTest();
  ImageCreatePixelMapTest();
  ImageCreatePixelMapSyncTest();
  ImagePropertyKeyTest2();
  ImagePropertyKeyTest3();
  pixelMapReadPixelsTest();
  pixelMapOpacityTest();
  pixelMapWritePixelsTest();
  ImageCreateIncrementalSourceBufTest();
  ImageCreateImageSourceOptionsTest();
  ImageCreateImageReceiverPackerTest();
  ImageCreateAuxiliaryPictureTest();
  ImageAuxiliaryGetTypeTest();
  ImagePropertyKeyTest4();
  GetImageSourceSupportedFormats();
  imageCreatePixelMapUsingAllocatorSyncSuppTest();
  PictureGetGainmapPixelmapTest();
  SendableImageFlipTest();
  SendableImageRotateTest();
  SendableImageScale();
  SendableImageTranslateTest();
  ImageCreatePixelMapSyncAbnormalTest();
  PictureSetAuxiliaryPictureTest();
  pixelMapGetBytesNumberPerRowTest();
  CreateImageSourceSuppTest();
  ImageSourceCreatePixelMapListSupp();
  ImageSourceGetDelayTimeListSupp();
  getImagePropertySyncTest();
  PictureGetTypeTestSupp();
  ImagePropertyOptionTest();
  ImageGetImagePropertySyncEnumFlash();
  ImageGetImagePropertySyncEnumFlashEmpty();
  ImageGetImagePropertySyncEnumFrontCamera();
  ImagePropertyKeySyncEnumGPS();
  ImageGetImagePropertySyncEnumGPSStatus();
  ImageGetImagePropertySyncEnumGPSStatusEmpty();
  ImageGetImagePropertySyncEnumISO();
  ImageGetImagePropertySyncEnumLength();
  ImageGetImagePropertySyncEnumLightSource();
  ImageGetImagePropertySyncEnumReference();
  ImageGetImagePropertySyncEnumScenePointer();
  ImageGetImagePropertySyncEnumSensitiveType();
  ImageEnumSupp();
  PictureSetMetadataTestSupp();
  ImageCreateIncrementalSourceSupp();
  ImageCreatePixelMapFromSurface();
  ImageGetImagePropertySyncEnumSensitiveTypeEmpty();
  ImageGetImagePropertySyncEnumSoftware();
  ImageGetImagePropertySyncEnumStripOffset();
  ImageGetImagePropertySyncSUBFILE();
  ImageCreatePixelMapSync();
  ImagePropertyKeySyncEnumJpgEmpty();
  ImagePropertyKeySyncEnumGPSTIMESTAMP();
  ImagePropertyKeySyncEnumStripOffsets();
  ImagePropertyKeySyncEnumSoftWare();
  modifyImagePropertyTest();
  modifyImagePropertyTests();
  ImageImagePackerPackingSupp();
  ImageCreateImageReceiverCreator();
  PictureGetMetadataFirstParameters();
  CreatePixelMapUsingAllocatorAndSync();
  ImageCreatePixelMapSync();
  ImagePropertyKeySyncEnumJpgEmpty();
  ImagePropertyKeySyncEnumGPSTIMESTAMP();
  ImagePropertyKeySyncEnumStripOffsets();
  ImagePropertyKeySyncEnumSoftWare();
  modifyImagePropertyTest();
  modifyImagePropertyTests();
  ImageImagePackerPackingSupp();
  ImageSourceGetImagePropertyTest();
  ImageSourceCreatePictureGif();
  ImageSourceCreatePictureJpeg();
  ImageSourceCreatePictureJpg();
  ImageSourceCreatePictureOrf();
  createImageSourceTest();
  sendableCreatePixelMap();
  sendableCreatePixelMapSyncTest();
}