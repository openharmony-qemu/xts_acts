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

import ImageAttr from './imageTest/ImageAttr.test';
import ohosMatrix4Jsunit from './imageTest/OhosMatrix4Jsunit.test';
import ShapeClippingJsunit from './imageTest/ShapeClippingJsunit.test';
import imageJsunit from './imageTest/ImageJsunit.test';
import imageOneJsunit from './imageTest/imageOneJsunit.test';
import imageTwoJsunit from './imageTest/imageTwoJsunit.test';
import imageThreeJsunit from './imageTest/imageThreeJsunit.test';
import aboutToRecycleiamge from './imageTest/aboutToRecycleiamgeJS.test'
import imageJsunit55 from './imageTest/ImageJsunit55.test';
import ImageApi from './imageTest/ImageApi.test';
import imageObscuredTest from './imageTest/imageObscuredTest.test';
import ImageAdvancedTest from './imageTest/ImageAdvancedTest.test'

export default function testsuite() {
  ImageAttr()
  ohosMatrix4Jsunit()
  ShapeClippingJsunit()
  imageJsunit()
  imageOneJsunit()
  imageTwoJsunit()
  imageThreeJsunit()
  aboutToRecycleiamge()
  imageJsunit55()
  ImageApi()
  imageObscuredTest()
  ImageAdvancedTest()
}