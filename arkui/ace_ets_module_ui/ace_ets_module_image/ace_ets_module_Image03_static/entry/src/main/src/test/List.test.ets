/**
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
import ImageOrientationTest from './ImageOrientation/ImageOrientation.test';
import ObjectFitTest from './ImageAttachmentTest/ObjectFit.test';
import PixelMapColorFilterTest from './ImageAttachmentTest/PixelMapColorFilter.test';
import ResourceDefaultTest from './ImageAttachmentTest/ResourceDefault.test';
import VerticalAlignTest from './ImageAttachmentTest/VerticalAlign.test';
import imageMatrix from './imageMatrix/imageMatrix.test';
import ImageSvgFillColorTest from './ImageSvgFillColorTest/ImageSvgFillColor.test';
import ImageContentEmpty from './ImageContentTest/ImageContentEmpty.test';
import ImageOnError from './ImageErrorTest/ImageOnError.test';
import monitorInvisibleArea from './ImageAnimator/monitorInvisibleArea.test';
import ImageTest from './Image/Image.test'
import ImageAnimator from './ImageAnimator/ImageAnimator.test';
export default function testsuite() {
  ImageOrientationTest();
  ObjectFitTest();
  PixelMapColorFilterTest();
  ResourceDefaultTest();
  VerticalAlignTest();
  imageMatrix();
  ImageSvgFillColorTest();
  ImageContentEmpty();
  ImageOnError();
  monitorInvisibleArea();
  ImageTest();
  ImageAnimator()
}
