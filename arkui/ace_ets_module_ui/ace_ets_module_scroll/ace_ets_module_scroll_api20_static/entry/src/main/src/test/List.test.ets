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

import maintainPosition from './SwiperTest/maintainPosition.test';
import barHeightNoMinHeightLimit from './TabsTest/barHeightNoMinHeightLimit.test';
import barMarginGrid from './GridTest/barMarginGrid.test';
import barMarginList from './ListTest/barMarginList.test';
import barMarginScroll from './ScrollTest/barMarginScroll.test';
import curvesTabs from './TabsTest/curvesTabs.test';
import maxDownRefresh from './RefreshTest/maxDownRefresh.test';
import scrollBarColor from './ScrollBarTest/scrollBarColor.test';
import canOverGrid from './GridTest/canOverGrid.test';
import canOverList from './ListTest/canOverList.test';
import canOverScroll from './ScrollTest/canOverScroll.test';
export default function testsuite() {
  maintainPosition()  // 1  maintainVisibleContentPosition  API 20     2
  barMarginGrid() // 1  scrollBarMargin API 20
  barMarginList() // 1  scrollBarMargin API 20
  barMarginScroll() // 1 scrollBarMargin API 20
  curvesTabs() // 1  animationCurve  API 20
  maxDownRefresh() // 1  maxPullDownDistance  API 20
  scrollBarColor() // 1  scrollBarColor API 20
  canOverGrid() // 1  canOverScroll API 20
  canOverList() // 1  canOverScroll API 20
  canOverScroll() // 1  canOverScroll API 20
}
