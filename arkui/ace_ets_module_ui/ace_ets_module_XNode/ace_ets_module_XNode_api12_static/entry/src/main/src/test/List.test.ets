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

import borderRadiuses from './GraphicsTest/borderRadiuses.test';
import borderStyles from './GraphicsTest/borderStyles.test';
import edgeColors from './GraphicsTest/edgeColors.test';
import edgeWidths from './GraphicsTest/edgeWidths.test';
import graphicGetInterfaceTest from './GraphicsTest/graphicGetInterface.test';
import renderNodeGetInterfaceTest from './renderNode/renderNodeTestInterface.test';
import disposeTest from './FrameNodeTest/dispose.test';
import getAttrsTest from './FrameNodeTest/getAttrs.test';
import getPosition from './FrameNodeTest/getPosition.test';
import setLayout from './FrameNodeTest/setLayout.test';
import RenderNodeAttributeTest from './renderNode/RenderNodeAttributeTest.test';
import setRectShape from './GraphicsTest/setRectShape.test';
import LengthUnitTest from './GraphicsTest/LengthUnit.test'
import getBlendColor from './GraphicsTest/getBlendColor.test';
import resourceColor from './GraphicsTest/resourceColor.test';
import getNumeric from './GraphicsTest/getNumeric.test';
import getAlpha from './GraphicsTest/getAlpha.test';
import getBlue from './GraphicsTest/getBlue.test';
import getGreen from './GraphicsTest/getGreen.test';
import getRed from './GraphicsTest/getRed.test';
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
import setCircleShapeTest from './GraphicsTest/setCircleShape.test';
import commonEventTest1 from './FrameNodeTest/commonEventTest1.test';
import expectedUpdateInterval from './FrameNodeTest/expectedUpdateInterval.test';
import CornerTest from './GraphicsTest/GraphicsApiTest/CornerTest.test';
import LengthMetricsUnitTest from './GraphicsTest/GraphicsApiTest/LengthMetricsUnitTest.test';
import PercentReferenceTest from './GraphicsTest/GraphicsApiTest/PercentReferenceTest.test';
import typeNodeBlankTest from './typeNodeTest/Blank.test';
import typeNodeDividerTest from './typeNodeTest/Divider.test';
import typeNodeGridColTest from './typeNodeTest/GridCol.test';
import typeNodeListTest from './typeNodeTest/List.test';
import typeNodeLoadingProgressTest from './typeNodeTest/LoadingProgress.test';
import typeNodeProgressTest from './typeNodeTest/Progress.test';
import typeNodeRelativeContainerTest from './typeNodeTest/RelativeContainer.test';
import typeNodeSwiperTest from './typeNodeTest/Swiper.test';
import RELOAD from './FrameNodeTest/RELOAD.test';
import BuilderNodeApiRecycleTest from './FrameNodeTest/BuilderNodeApiRecycleTest.test';
import BuilderNodeApiReuseTest from './FrameNodeTest/BuilderNodeApiReuseTest.test';
import ComponentContentAPIRecycleTest from './FrameNodeTest/ComponentContentAPIRecycleTest.test';
import ComponentContentAPIReuseTest from './FrameNodeTest/ComponentContentAPIReuseTest.test';
import APImarkNodeGroupTest from './FrameNodeTest/APImarkNodeGroupTest.test';
import APIPanGestureisisBeginTest from './FrameNodeTest/APIPanGestureisisBeginTest.test';
import RenderNodeDemo01Test from './renderNode/RenderNodeDemo/RenderNodeDemo01Test.test';
import RenderNodeDemo02Test from './renderNode/RenderNodeDemo/RenderNodeDemo02Test.test';
import RenderNodeDemo03Test from './renderNode/RenderNodeDemo/RenderNodeDemo03Test.test';
import RenderNodeDemo04Test from './renderNode/RenderNodeDemo/RenderNodeDemo04Test.test';
import RenderNodeDemo05Test from './renderNode/RenderNodeDemo/RenderNodeDemo05Test.test';
import RenderNodeDemo06Test from './renderNode/RenderNodeDemo/RenderNodeDemo06Test.test';
import setLabelTest from './renderNode/setLabel.test';
import setMarkNodeGroupTest from './renderNode/setMarkNodeGroup.test';
import setShapeClipTest from './renderNode/setShapeClip.test';
import APIdisposeTreeTest from './FrameNodeTest/APIdisposeTreeTest.test';
import typeNodeTextInputTest from './typeNodeTest/TextInput.test';
import typeNodeListItemTest from './typeNodeTest/ListItem.test';
import typeNodechildrenMainSizeTest from './typeNodeTest/ChildrenMainSize.test';
import attachNodeAdapterTest from './FrameNodeTest/attachNodeAdapter.test';
import updateConfigurationTest1 from './BuilderNodeTest/updateConfigurationTest1';
import updateConfigurationTest2 from './ComponentContentTest/updateConfigurationTest2';
import getAttachedFrameNodeById from './FrameNodeTest/getAttachedFrameNodeById.test';
import getAfterRemove from './FrameNodeTest/getAfterRemove.test';

export default function testsuite() {
  // getNumeric();// SDK12.9 问题表格84行
  // getAlpha();// SDK12.9 问题表格84行
  // getBlue();// SDK12.9 问题表格84行
  // getGreen();// SSDK12.9 问题表格84行
  // getRed();// SDK12.9 问题表格84行
  // LengthMetricsUnitTest();// SDK12.9 pass 1
  // typeNodechildrenMainSizeTest(); //SDK12.9 pass 2
  // APIdisposeTreeTest();   //SDK12.9 0702表格18 1
  // RELOAD(); // SDK12.9 pass 1
  // ComponentContentAPIRecycleTest();// SDK12.9 pass 1
  // APIPanGestureisisBeginTest();// // SDK12.9 pass 2
  // LengthUnitTest(); // SDK12.9 表格94行
  // getBlendColor();  // SDK12.9 表格84行
  // RenderNodeDemo02Test();   // SDK12.9 表格104行
  // RenderNodeDemo01Test();   // SDK12.9 表格104行
  // RenderNodeDemo03Test();   // SDK12.9 表格104行
  // RenderNodeDemo04Test();   // SDK12.9 表格104行
  // RenderNodeDemo05Test();   // SDK12.9 表格104行
  // RenderNodeDemo06Test();   // SDK12.9 表格104行
  // updateConfigurationTest1(); // SDK12.9 表格104行
  // updateConfigurationTest2(); // SDK12.9 pass 1
  // setLabelTest();   // SDK12.9 表格104行
  // setMarkNodeGroupTest(); // SDK12.9 表格104行
  // setShapeClipTest(); // SDK12.9 表格104行
  // typeNodeSwiperTest();  //SDK12.9 pass 1
  // typeNodeRelativeContainerTest(); //SDK12.9 pass 1
  // typeNodeProgressTest(); //0702问题 吴金辉DTS2512020009099
  // typeNodeLoadingProgressTest();  //SDK12.9 pass 1
  // typeNodeListTest(); //SDK12.9 pass 1
  // typeNodeGridColTest();//SDK12.9 pass 1
  // typeNodeDividerTest();//SDK12.9 pass 1
  // typeNodeBlankTest();///SDK12.9 pass 1
  // BuilderNodeApiRecycleTest();//SDK12.9 pass 1
  // BuilderNodeApiReuseTest();//SDK12.9 pass 1
  // ComponentContentAPIReuseTest(); //SDK12.9 pass 1
  // APImarkNodeGroupTest();  // SDK12.9 表格104行
  // borderRadiuses();  // SDK12.9 表格104行
  // borderStyles();  // SDK12.9 表格104行 后面问题也类似，不测了
  // edgeColors();  //11.22 16进制转10进制不对edgeColorsValue:-16776961 equals edgeColorsValue:4278190335
  // edgeWidths();  // pass1
  // renderNodeGetInterfaceTest();  //11.22 16进制转10进制不对 Failure: 1, Error: 0, Pass: 3 expect bColor:-16711698 equals bColor:4278255598
  // disposeTest();  // pass
  // getAttrsTest();  //Failure: 6, Error: 0, Pass: 5 getAttrs.test.ets:173:0     expect {} equals {"top":{"unit":1,"value":3},"right":{"unit":1,"value":3},"bottom":{"unit":1,"value":3},"left":{"unit":1,"value":3}}
  // getPosition();  // pass
  // setLayout();  //11.22  expect 310 equals 0
  // RenderNodeAttributeTest();  // pass
  // setRectShape();  // pass
  // resourceColor();  // pass
  // onAppear();  // pass2
  // createNodeBlank();  // pass
  // createNodeColumn();  // pass
  // createNodeDivider();  // pass
  // createNodeFlex();  // pass
  // createNodeGrid();  // pass
  // createNodeImage();  // pass
  // createNodeList();  // pass
  // createNodeLoad();  // pass
  // createNodeScroll();  // pass
  // createNodeSearch();  // pass
  // createNodeStack();  // pass
  // createNodeText();  // pass
  // commonEventTest1();  // pass2
  // expectedUpdateInterval();  // pass
  // CornerTest();  //pass1
  // setCircleShapeTest();  // pass
  // typeNodeTextInputTest();  // pass
  // typeNodeListItemTest();  // pass
  // attachNodeAdapterTest();  //11.22. RangeError message: Out of bounds
  // getAttachedFrameNodeById();  // pass
  // getAfterRemove();  // pass
  // PercentReferenceTest();  // pass
  // graphicGetInterfaceTest();  //12.2 DTS2025101419802
  // setMeasureSizeTest();  // SDK11.19 setMeasureSize.test.ets:81:0 expect 0 equals 105
  // SDK11.19 run: 119, Failure: 31, Error: 16, Pass: 72, Ignore: 0 appDied 2
}