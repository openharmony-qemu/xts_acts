'use static';
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

import backgroundEffectJsunit from './imageEffectsTest/backgroundEffect.test';
import blendMode1Jsunit from './imageEffectsTest/blendMode1.test'
import blendModeTest from './imageEffectsTest/blendModeTest.test';
import backgroundEffectJsSuit from './imageEffectsTest/backgroundEffectJsSuit.test';
import InvertOptionsJsSuit from './imageEffectsTest/InvertOptionsJsSuit.test';
import ForegroundColorJsSuit from './imageEffectsTest/ForegroundColorJsSuit.test';
import sheetSize1Jsunit from './imageEffectsTest/sheetSize1.test'
import clickeffectTest from './clickeffectTest/clickeffect'
import commonColorModeJsunit from './imageEffectsTest/common.test';
import enumsCancelJsunit from './imageEffectsTest/enums.test';
import hoverEffectJsunit from './imageEffectsTest/hoverEffect.test';
import hitTestModeJsunit from './imageEffectsTest/hitTestMode.test';
import common_ts_ets_apiStaticClearJsunit from './imageEffectsTest/common_ts_ets_api.test';
import rotateTest from './imageEffectsTest/rotateTest.test';
import shapeTest from './imageEffectsTest/shapeTest.test';
import imageEffectsJsunit from './imageEffectsTest/ImageEffectsJsunit.test';
import transformPointTest from './imageEffectsTest/transformPointTest.test';
import commonBackgroundBlurStyleJsunit from './imageEffectsTest/common.test3'

export default function testsuite() {
  clickeffectTest(); // 16 pass 16
  backgroundEffectJsunit(); // 5 pass 4 blurOptions的获取
  blendModeTest(); // 30 pass 30
  backgroundEffectJsSuit(); // 1 pass 1
  InvertOptionsJsSuit(); // 1 pass 1
  ForegroundColorJsSuit(); // 1 pass 1
  sheetSize1Jsunit() // 2 pass 1 shouldDismiss
  commonColorModeJsunit() // 10 pass 8 emitter
  hoverEffectJsunit() // 2 pass 2
  hitTestModeJsunit() // 1 pass 1
  common_ts_ets_apiStaticClearJsunit() // 3 pass 3
  rotateTest() // 1 pass 1
  shapeTest() // 1 pass 1
  imageEffectsJsunit(); // 42 pass 38 16进制
  transformPointTest() // 1 pass 1
  commonBackgroundBlurStyleJsunit() // 8 pass 8
}