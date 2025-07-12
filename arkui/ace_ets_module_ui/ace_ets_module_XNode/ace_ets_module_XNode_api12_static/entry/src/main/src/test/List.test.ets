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
import disposeTest from './FrameNodeTest/dispose.test';
import getAttrsTest from './FrameNodeTest/getAttrs.test';
import getPosition from './FrameNodeTest/getPosition.test';
import setLayout from './FrameNodeTest/setLayout.test';
import onAppear from './FrameNodeTest/onAppear.test';
import setMeasureSizeTest from './FrameNodeTest/setMeasureSize.test';
import createNodeBlank from './FrameNodeTest/createNodeBlank.test';
import createNodeColumn from './FrameNodeTest/createNodeColumn.test';
import createNodeDivider from './FrameNodeTest/createNodeDivider.test';
import createNodeFlex from './FrameNodeTest/createNodeFlex.test';
import createNodeGrid from './FrameNodeTest/createNodeGrid.test';
import createNodeImage from './FrameNodeTest/createNodeImage.test';
import createNodeList from './FrameNodeTest/createNodeList.test';
import createNodeLoad from './FrameNodeTest/createNodeLoad.test';
import createNodeScroll from './FrameNodeTest/createNodeScroll.test';
import createNodeSearch from './FrameNodeTest/createNodeSearch.test';
import createNodeStack from './FrameNodeTest/createNodeStack.test';
import createNodeText from './FrameNodeTest/createNodeText.test';
import commonEventTest1 from './FrameNodeTest/commonEventTest1.test';
import expectedUpdateInterval from './FrameNodeTest/expectedUpdateInterval.test';
import RELOAD from './FrameNodeTest/RELOAD.test';
import BuilderNodeApiRecycleTest from './FrameNodeTest/BuilderNodeApiRecycleTest.test';
import BuilderNodeApiReuseTest from './FrameNodeTest/BuilderNodeApiReuseTest.test';
import ComponentContentAPIRecycleTest from './FrameNodeTest/ComponentContentAPIRecycleTest.test';
import ComponentContentAPIReuseTest from './FrameNodeTest/ComponentContentAPIReuseTest.test';
import APImarkNodeGroupTest from './FrameNodeTest/APImarkNodeGroupTest.test';
import APIPanGestureisisBeginTest from './FrameNodeTest/APIPanGestureisisBeginTest.test';
import APIdisposeTreeTest from './FrameNodeTest/APIdisposeTreeTest.test';
import attachNodeAdapterTest from './FrameNodeTest/attachNodeAdapter.test';
import getAttachedFrameNodeById from './FrameNodeTest/getAttachedFrameNodeById.test';
import getAfterRemove from './FrameNodeTest/getAfterRemove.test';
export default function testsuite() {
  disposeTest()
  getAttrsTest()
  getPosition()
  setLayout()
  onAppear()
  setMeasureSizeTest()
  createNodeBlank()
  createNodeColumn()
  createNodeDivider()
  createNodeFlex()
  createNodeGrid()
  createNodeImage()
  createNodeList()
  createNodeLoad()
  createNodeScroll()
  createNodeSearch()
  createNodeStack()
  createNodeText()
  commonEventTest1()
  expectedUpdateInterval()
  RELOAD()
  BuilderNodeApiRecycleTest()
  BuilderNodeApiReuseTest()
  ComponentContentAPIRecycleTest()
  ComponentContentAPIReuseTest()
  APImarkNodeGroupTest()
  APIPanGestureisisBeginTest()
  APIdisposeTreeTest()
  attachNodeAdapterTest()
  getAttachedFrameNodeById()
  getAfterRemove()

}
