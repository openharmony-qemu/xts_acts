/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import arkuiNodeTest from "./NodeContainerTest/arkuinode/arkuinode.test";
import arkuiNodeEventTest from './NodeContainerTest/arkuinode/arkuinodeEnvent.test';
import arkuiNodeRenderTest from './NodeContainerTest/arkuinode/arkuinodeRender.test';
import appendChildTest from './RenderNodeTest/renderNode/appendChild.test';
import drawContextGetSizeTest from './RenderNodeTest/renderNode/drawContextGetSize.test';
import keyframeTest from './RenderNodeTest/renderNode/keyframe.test';
import pixelRoundTest from './RenderNodeTest/renderNode/pixelRoundTest.test';
import frame from './RenderNodeTest/RenderNodeTest_001/frame.test';
import getChildTest from './RenderNodeTest/RenderNodeTest_001/getChildTest.test';
import getClipToFrameJsunit from './RenderNodeTest/RenderNodeTest_001/getClipToFrameJsunit.test';
import getColorTest from './RenderNodeTest/RenderNodeTest_001/getColorTest.test';
import getOpacityJsunit from './RenderNodeTest/RenderNodeTest_001/getOpacityJsunit.test';
import getPosition from './RenderNodeTest/RenderNodeTest_001/getPosition.test';
import getSizeJsunit from './RenderNodeTest/RenderNodeTest_001/getSizeJsunit.test';
import pivot from './RenderNodeTest/RenderNodeTest_001/pivot.test';
import scale from './RenderNodeTest/RenderNodeTest_001/scale.test';
import SetClipToFrameJsunit from './RenderNodeTest/RenderNodeTest_001/SetClipToFrameJsunit.test';
import SetOpacityJsunit from './RenderNodeTest/RenderNodeTest_001/SetOpacityJsunit.test';
import SetPositionJsunit from './RenderNodeTest/RenderNodeTest_001/SetPositionJsunit.test';
import SetSizeJsunit from './RenderNodeTest/RenderNodeTest_001/SetSizeJsunit.test.ets';

import RenderFitJsunit from './RenderNodeTest/RenderFitJsunit.test.ets';
import RenderNodeDrawJsSuit from './RenderNodeTest/RenderNodeDrawJsSuit.test';
import RenderNodeInvalidateJsSuit from './RenderNodeTest/RenderNodeInvalidateJsSuit.test';
import RenderNodeShadowElevationJsSuit from './RenderNodeTest/RenderNodeShadowElevation.test';
import RenderNodeShadowRadiusJsSuit from './RenderNodeTest/RenderNodeShadowRadius.test';
import rotationTest from './RenderNodeTest/rotation.test'
import shadowAlphaJsunit from './RenderNodeTest/shadowAlphaJsunit.test';
import shadowColorJsunit from './RenderNodeTest/shadowColorJsunit.test';
import shadowOffsetJsunit from './RenderNodeTest/shadowOffsetJsunit.test';
import transformTest from './RenderNodeTest/transform.test';
import translationTest from './RenderNodeTest/translation.test';

import ComponentInheritFreezeOptionsTest from './ComponentContentTest/ComponentInheritFreezeOptionsTest.test';
import InvalidateAttributesTest from './InvalidateTest/InvalidateAttributesTest.test';
import BuilderNodeOneTest from './LocalStorageTest/BuilderNodeOneTest.test';
import BuilderNodeTwoTest from './LocalStorageTest/BuilderNodeTwoTest.test';
import BuilderNodeThreeTest from './LocalStorageTest/BuilderNodeThreeTest.test';
import DarkModeTest from './UIAppearance/DarkModeTest.test';


export default function testsuite() {
  arkuiNodeTest();
  arkuiNodeEventTest();
  arkuiNodeRenderTest();
  appendChildTest();
  drawContextGetSizeTest();
  keyframeTest();
  pixelRoundTest();
  frame();
  getChildTest();
  getClipToFrameJsunit();
  getColorTest();
  getOpacityJsunit();
  getPosition();
  getSizeJsunit();
  pivot();
  scale();
  SetClipToFrameJsunit();
  SetOpacityJsunit();
  SetPositionJsunit();
  SetSizeJsunit();

  RenderFitJsunit();
  RenderNodeDrawJsSuit();
  RenderNodeInvalidateJsSuit();
  RenderNodeShadowElevationJsSuit();
  RenderNodeShadowRadiusJsSuit();
  rotationTest();
  shadowAlphaJsunit();
  shadowColorJsunit();
  shadowOffsetJsunit();
  transformTest();
  translationTest();

  ComponentInheritFreezeOptionsTest();
  InvalidateAttributesTest();
  BuilderNodeOneTest();
  BuilderNodeTwoTest();
  BuilderNodeThreeTest();
  DarkModeTest();
}