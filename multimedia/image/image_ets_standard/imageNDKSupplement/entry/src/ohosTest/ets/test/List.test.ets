/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import ImageEffectFilterRenderSuppTest from './ImageEffectFilterRenderSupp.test';
import ImageEffectFilterSuppTest from './ImageEffectFilterSupp.test';
import ImageEffectSuppTest from './ImageEffectSupp.test';
import imageFrameworkPixelMapNativeCreateSuppTest from './ImageFrameworkPixelMapNativeCreateSupp.test';
import imageFrameworkImageSourceNativeCreateSuppTest from './ImageSourceNativeCreateTest.test';
import OHEffectBufferInfoGetTextureIdTest from './OHEffectBufferInfoGetTextureIdTest.test';
import OHEffectBufferInfoGetTimestampTest from './OHEffectBufferInfoGetTimestampTest.test';
import OHEffectBufferInfoSetTextureIdTest from './OHEffectBufferInfoSetTextureIdTest.test';
import OHEffectBufferInfoSetTimestampTest from './OHEffectBufferInfoSetTimestampTest.test';
import ImageErrorSuppTest from './ImageErrorSupp.test';
import ImageEffectInfoSupplementTest from './OHEffectFilterInfoSupplement.test';
import OHImagePixelMapCreateTest from './ImagePixelMapCreateTest.test';
import OHImagePackerCreateTest from './OHImagePackerCreateTest.test';
import PixelMapInitNativePixelMap from './PixelMapInitNativePixelMap.test';
import ImageEffectsSuppTest from './ImageEffectsSupp.test';
import AccessPixelsSuppTest from './AccessPixelsSupp.test';
import ImageSourceSuppTest from './ImageSourceSupp.test';
import OHPixelMapSupplementTest from './OHPixelMapSupplement.test';

export default function testsuite() {
  ImageEffectSuppTest();
  OHEffectBufferInfoSetTimestampTest();
  OHEffectBufferInfoGetTimestampTest();
  OHEffectBufferInfoSetTextureIdTest();
  OHEffectBufferInfoGetTextureIdTest();
  ImageEffectFilterSuppTest();
  ImageEffectFilterRenderSuppTest();
  imageFrameworkPixelMapNativeCreateSuppTest();
  imageFrameworkImageSourceNativeCreateSuppTest();
  ImageErrorSuppTest();
  ImageEffectInfoSupplementTest();
  PixelMapInitNativePixelMap();
  OHImagePackerCreateTest()
  OHImagePixelMapCreateTest();
  ImageEffectsSuppTest();
  AccessPixelsSuppTest();
  ImageSourceSuppTest();
  OHPixelMapSupplementTest();
}