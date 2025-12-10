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
import imageAltTest  from "./image/imageAltTest.test";
import textMinLinesTest from './textMinLines/TextMinLinesTest.test'
import HasAxisTest from './hasAxisTest/HasAxisTest.test'
import CoastingAxisTest from "./list/coastingAxisTest.test";
import snapSpeedTest from "./list/snapSpeedTest.test";
import lanesValueTest from "./list/lanesValueTest.test";
import WaterFlowFillPolicyTest from "./waterFlow/WaterFlowFillPolicyTest.test"
import imageDrawableDescriptorTest from "./image/imageDrawableDescriptorTest.test";
import imageErrorTest from "./image/imageErrorTest.test";
import textLineHeightTest from "./textLineHeight/TextLineHeightTest.test";
import textAreaBarStateTest from "./textArea/TextAreaBarStateTest.test";
import scrollBarTest from "./scrollbarTest/scrollbarTest.test";
import ShowCounterTest from "./showCounterTest/showCounterTest.test";
import NodeSwiperItemFillpolocyTest from "./swiper/NodeSwiperItemFillpolocy.test"
import finishAnimationTest from "./swiper/finishAnimationTest.test";
import imageSpanTest from "./imageSpanTest/ImageSpanTest.test";
import customKeyboardTest from "./customKeyboard/CustomKeyboardTest.test";
import animationControllerTest from "./image/animationControllerTest.test";
import ImageDrawableErrorTest from "./image/drawableDescriptorError.test";
import GridFillPolicyTest from "./grid/GridFillPolicyTest.test";
import gridAttrsTest from "./grid/GridAttrsTest.test";
import gridEventTest from './grid/GridEventTest.test'

export default function testsuite() {
  CoastingAxisTest();
  imageAltTest();
  snapSpeedTest();
  lanesValueTest();
  textMinLinesTest();
  HasAxisTest();
  WaterFlowFillPolicyTest();
  imageDrawableDescriptorTest();
  imageErrorTest();
  textLineHeightTest();
  textAreaBarStateTest();
  scrollBarTest();
  ShowCounterTest();
  NodeSwiperItemFillpolocyTest();
  finishAnimationTest();
  imageSpanTest();
  customKeyboardTest();
  animationControllerTest();
  ImageDrawableErrorTest();
  GridFillPolicyTest();
  gridAttrsTest();
  gridEventTest();
}