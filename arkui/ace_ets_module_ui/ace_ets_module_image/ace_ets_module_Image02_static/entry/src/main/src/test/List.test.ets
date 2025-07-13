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
import APIClipMaskShape from './ImageTest/APIClipMaskShape.test';
import imageAddApi from './ImageTest/imageAddApi.test'
import imageAddApi2 from './ImageTest/imageAddApi2.test'
import imageAddApi3 from './ImageTest/imageAddApi3.test'

import ImageResizable from './ImageTest/ImageResizable.test';
import onComplete from './ImageTest/onComplete.test'
import fillModeJsunit from './ImageAnimator/FillModeJsunit.test';
import imageAnimatorJsunit from './ImageAnimator/imageAnimatorJsunit.test';
import imageAnimatorJsunitt from './ImageAnimator/ImageAnimatorJsunit2.test.ets'
import ImageAnimatorAdvancedTest from './ImageAnimator/imageAnimatorAdvancedTest.test.ets'

export default function testsuite() {
  APIClipMaskShape();
  imageAddApi();
  imageAddApi2();
  imageAddApi3();
  ImageResizable();
  onComplete();
  fillModeJsunit();
  imageAnimatorJsunit();
  imageAnimatorJsunitt();
  ImageAnimatorAdvancedTest();
}
