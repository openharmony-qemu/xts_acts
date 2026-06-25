'use static';
/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import GridScrollBarWidthTest from './Grid/GridScrollBarWidth.test'
import ListScrollBarWidthTest from './List/ListScrollBarWidth.test'
import ListSpaceWidthTest from './List/ListSpaceWidth.test'
import RefreshMaxPullDownDistanceTest from './Refresh/RefreshMaxPullDownDistance.test'
import RefreshRefreshOffsetTest from './Refresh/RefreshRefreshOffset.test'
import ScrollScrollBarWidthTest from './Scroll/ScrollScrollBarWidth.test'
import WaterFlowScrollBarWidthTest from './WaterFlow/WaterFlowScrollBarWidth.test'
import backPressBehaviorList from './List/backPressBehaviorList.test'
import stickyFooterGroup from './ListItemGroup/stickyFooterGroup.test'
import headerFooterStyle from './ListItemGroup/headerFooterStyle.test'
import ArcAlphabetIndexer from './ArcAlpTest/ArcAlp.test'
import arcSwiperDotIndicator from './ArcSwiperTest/arcSwiperDotIndicator.test'
import arcSwiperContent from './ArcSwiperTest/arcSwiperContent.test'
import arcSwiperEvent from './ArcSwiperTest/arcSwiperEvent.test'
import arcSwiperShow from './ArcSwiperTest/arcSwiperShow.test'
import arcSwiperBoolean from './ArcSwiperTest/arcSwiperBoolean.test'
import arcSwiperEffectMode from './ArcSwiperTest/arcSwiperEffectMode.test'
import gridEnableEditMode from './Grid/gridEnableEditMode.test'
import gridEditModeChange from './Grid/gridEditModeChange.test'
import listEnableEditMode from './List/listEnableEditMode.test'
import listEditModeChange from './List/listEditModeChange.test'
import LazyColumnLayoutProperties from './LazyColumnLayout/LazyColumnLayoutProperties.test'
import LazyVWaterFlowLayoutProperties from './LazyVWaterFlowLayout/LazyVWaterFlowLayoutProperties.test'
import headerFooterStickyGrid from './LazyVGridLayout/headerFooterStickyGrid.test'
import headerFooterStickyFlow from './LazyVWaterFlowLayout/headerFooterStickyFlow.test'
import headerFooterStickyColumn from './LazyColumnLayout/headerFooterStickyColumn.test'

export default function testsuite() {
  GridScrollBarWidthTest();
  ListScrollBarWidthTest();
  ListSpaceWidthTest();
  RefreshMaxPullDownDistanceTest();
  RefreshRefreshOffsetTest();
  ScrollScrollBarWidthTest();
  WaterFlowScrollBarWidthTest();
  backPressBehaviorList();
  stickyFooterGroup();
  headerFooterStyle();
  ArcAlphabetIndexer();
  arcSwiperDotIndicator();
  arcSwiperEvent();
  arcSwiperShow();
  arcSwiperContent();
  arcSwiperBoolean();
  arcSwiperEffectMode();
  gridEnableEditMode();
  gridEditModeChange();
  listEnableEditMode();
  listEditModeChange();
  headerFooterStickyGrid();
}