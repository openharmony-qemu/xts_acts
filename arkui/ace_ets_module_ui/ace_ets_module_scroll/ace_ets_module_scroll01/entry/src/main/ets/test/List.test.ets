/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import OnScrollBeginJsunit from './OnScrollBegin.test';
import ScrollAddJsunit from './ScrollAddJsunit.test';
import APIScrollflingSpeedLimitJsunit from './APIScrollflingSpeedLimitJsunit.test';
import TouchTestStrategy from './TouchTestStrategy.test';
import ScrollTest from './Scroll.test'
import ScrollTest2 from './Scroll2.test'
import ScrollFrictionTest from './ScrollFriction.test';
import ScrollAJsunit from './ScrollAJsunit.test';
import scrollCodeJsunit from './ScrollCodeJsunit.test.ets';
import IsAtEndScroll from './IsAtEndScroll.test';
import scrollOffsetJsunit from './ScrollOffsetJsunit.test';
import scrollerbarJsunit from './ScrollBar/ScrollerBarJsunit.test';
import ScrollBarJsunit from './ScrollBar/ScrollBarJsunit.test';
import scrollBarJsunitt from './ScrollBar/ScrollBarJsunitt.test';
import enableScrollJsunit from './ScrollBar/enableScrollJsunit.test';
import scrollSourceDrag from './ScrollSource/scrollSourceDrag.test';
import ScrollSourceOther from './ScrollSource/ScrollSourceOther.test';
import ScrollSource from './ScrollSource/ScrollSource.test';
import ScrollSourceBar from './ScrollSource/ScrollSourceBar.test';
import ScrollApi1 from './ScrollApi1.test'
import scrollXOffsetJsunit from './ScrollXOffsetJsunit.test';
import scrollDidJsunit from './ScrollDidJsunit.test';
import scrollReachJsunit from './ScrollReachJsunit.test';
import ScrollFlingCallback from './ScrollFlingCallback.test'
import ScrollEdgeCallbackJsunit from './ScrollEdgeCallback.test.ets';
import offsetRemainScroll from './OffsetRemainScroll.test';
import scrollAniFalse from './scrollAnimation/scrollAniFalse.test';
import scrollAniUn from './scrollAnimation/scrollAniUn.test';
import scrollAniTrue from './scrollAnimation/scrollAniTrue.test';
import getAttributeScroll from './GetAttributeScroll.test';
import ScrollEffectEdge from './ScrollEffectEdge.test'
import setScrollEvent from './SetScrollEvent.test';
import scrollBarColor from './ScrollBar/scrollBarColor.test';
import barMarginScroll from './BarMarginScroll.test';
import canOverScroll from './CanOverScroll.test';
import scrollStopDrag from './ScrollStopDrag.test';
import zoomScaleScroll from './ZoomScaleScroll.test';
import zoomScaleNull from './ZoomScaleNull.test';
import scrollScrollbarColor from './ScrollScrollbarColor.test';
import ScrollContentSize from './ScrollContentSize.test';

export default function testsuite() {
  OnScrollBeginJsunit()
  ScrollAddJsunit()
  APIScrollflingSpeedLimitJsunit()
  TouchTestStrategy()
  ScrollTest()
  ScrollTest2()
  ScrollFrictionTest()
  ScrollAJsunit()
  scrollCodeJsunit()
  IsAtEndScroll()
  scrollOffsetJsunit();
  scrollerbarJsunit()
  ScrollBarJsunit()
  scrollBarJsunitt()
  enableScrollJsunit()
  scrollSourceDrag()
  ScrollSourceOther()
  ScrollSource();
  ScrollSourceBar()
  ScrollApi1()
  scrollXOffsetJsunit();
  scrollDidJsunit()
  scrollReachJsunit()
  ScrollFlingCallback();
  ScrollEdgeCallbackJsunit()
  offsetRemainScroll()
  scrollAniFalse()
  scrollAniUn()
  scrollAniTrue()
  getAttributeScroll()
  ScrollEffectEdge()
  setScrollEvent()
  scrollBarColor()
  barMarginScroll()
  canOverScroll()
  scrollStopDrag()
  zoomScaleScroll()
  zoomScaleNull()
  scrollScrollbarColor()
  ScrollContentSize()
}