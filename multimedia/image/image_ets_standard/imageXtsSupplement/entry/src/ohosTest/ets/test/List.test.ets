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

import ImagePropertyKeyTest from './image/ImagePropertyKeyEnum.test.ets';
import ImageCreateImageSourceBufTest from './image/ImageCreateImageSourceBuf.test';
import ImageCreateImageSourcePathTest from './image/ImageCreateImageSourcePath.test';
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

export default function testsuite() {
  ImagePropertyKeyTest();
  ImageCreateImageSourceBufTest();
  ImageCreateIncrementalSourceTest();
  ImageCreateImageSourcePathTest();
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
}