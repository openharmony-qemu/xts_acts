'use static';
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

import marqueeJsunit from './MarqueeJsunit.test';
import swiperJsunit from './SwiperJsunit.test';
import buttonJsunit from './ButtonJsunit.test';
import tabsFirstJsunit from './TabsFirstJsunit.test';
import columnJsunit from './ColumnJsunit.test';
import rowJsunit from './RowJsunit.test';
import imageSpanJsunit from './ImageSpanJsunit.test';
import textJsunit from './TextJsunit.test';
import navigationJsunit from './NavigationJsunit.test';
import navigatorJsunit from './NavigatorJsunit.test';
import timepickerJsunit from './TimePickerJsunit.test';
import textpickerJsunit from './TextPickerJsunit.test';
import sliderJsunit from './SliderJsunit.test';
import ratingJsunit from './RatingJsunit.test';
import alphabetIndexerJsunit from './AlphabetIndexerJsunit.test';
import formComponentJsunit from './FormComponentJsunit.test';
import panelJsunit from './PanelJsunit.test';
import menuItemJsunit from './MenuItemJsunit.test';
import checkboxJsunit from './CheckboxJsunit.test';
import loadingProgressJsunit from './LoadingProgress.test';
import checkBoxGroupJsunit from './CheckBoxGroup.test';
import datePickerJsunit from './DatePicker.test';
import radioJsunit from './Radio.test';
import hyperLinkJsunit from './HyperLink.test';
import menuJsunit from './Menu.test';
import pathJsunit from './Path.test';
import shapeJsunit from './Shape.test';
import lineJsunit from './Line.test';
import dataPanelJsunit from './DataPanelJsunit.test';
import gaugeJsunit from './GaugeJsunit.test';
import progressJsunit from './Progress.test';
import textTimerJsunit from './TextTimer.test';
import textClockJsunit from './TextClockJsunit.test';
import scrollJsunit from './Scroll.test';
import qrCodeJsunitJsunit from './QrCodeJsunit.test';
import listJsunit from './List.test';
import listItemJsunit from './ListItem.test';
import listItemGroupJsunit from './ListItemGroup.test';
import gridJsunit from './Grid.test';
import gridItemJsunit from './GridItem.test';
import toggleJsunit from './ToggleJsunit.test';
import rectJsunit from './RectJsunit.test';
import polyLineJsunit from './PolyLine.test';
import counterJsunit from './Counter.test';
import navRouterJsunit from './NavRouterJsunit.test';
import navDestinationJsunit from './NavDestination.test';
import sharedTransitionJsunit from './SharedTransitionJsunit.test';
import transitionJsunit from './TransitionJsunit.test';
import geometryTransitionJsunit from './GeometryTransitionJsunit.test';
import motionPathJsunit from './MotionPathJsunit.test';
import shortcutKeyJsunit from './ShortcutKey.test';
import common1Jsunit from './Common1.test';
import polygonJsunit from './Polygon.test';
import common9Jsunit from './Common9Jsunit.test';
import blankJsunit from './Blank.test';
import dividerJsunit from './Divider.test';
import gridColJsunit from './GridCol.test';
import gridRowJsunit from './GridRow.test';
import imageJsunit from './Image.test';
import imageAnimatorJsunit from './ImageAnimator.test';
import patternLockJsunit from './PatternLock.test';
import videoJsunit from './Video.test';
import scrollNestedScrollJsunit from './ScrollNestedScroll.test';
import stackJsunit from './StackJsunit.test';
import richEditorJsunit from './RichEditorJsunit.test';
import searchJsunit from './SearchJsunit.test';
import spanJsunit from './SpanJsunit.test';
import textAreaJsunit from './TextAreaJsunit.test';
import textInputJsunit from './TextInput.test';
import gridNestedScrollJsunit from './GridNestedScroll.test';
import listNestedScrollJsunit from './ListNestedScroll.test';
import scrollEnablePagingJsunit from "./ScrollEnablePaging.test"

export default function testsuite() {

  gridNestedScrollJsunit(); // pass 1
  common9Jsunit(); // pass 50 fail 2
  common1Jsunit(); //pass 36 fail 6
  shortcutKeyJsunit(); // pass 1
  geometryTransitionJsunit(); // pass 1
  motionPathJsunit(); // pass 1
  sharedTransitionJsunit(); // pass 1
  transitionJsunit(); // pass 1
  columnJsunit(); // pass 3
  rowJsunit(); // pass 2 fail 1(onchange 未修改)
  blankJsunit(); // pass 1 fail 1(onchange 未修改)
  dividerJsunit(); // pass 4 fail 1(onchange 未修改)
  gridColJsunit(); // pass 4 fail 1(onchange 未修改)
  gridRowJsunit(); // pass 2
  navDestinationJsunit(); // pass 2
  navigationJsunit() // pass 12 fail 1 (onchange 未修改)
  // // navigatorJsunit(); //  fail 5 废弃
  // // navRouterJsunit(); // fail 2 废弃
  stackJsunit(); // pass 1 fail 1(onchange 未修改)
  // // tabsFirstJsunit(); // fail 5 编译失败  Cannot find imported element 'TabsModifier'
  gridJsunit(); // pass 18 fail 1(onchange 未修改)
  //
  gridItemJsunit(); // pass 6 fail 1(onchange 未修改)
  listJsunit(); // pass 17 fail 1// .editMode属性 废弃
  listNestedScrollJsunit();  // pass 1
  listItemJsunit();  // pass 2 fail 1(onchange 未修改)
  listItemGroupJsunit(); // pass 1 fail 1(onchange 未修改)
  scrollNestedScrollJsunit(); // pass 1
  scrollJsunit(); // pass 10
  swiperJsunit(); // pass 18
  buttonJsunit();// pass 16 fail 1(onchange 未修改)
  checkboxJsunit(); // pass 4 fail 1 (onchange 未修改)
  checkBoxGroupJsunit(); // pass 4 fail 1 (onchange 未修改)
  counterJsunit(); // pass 3
  datePickerJsunit(); // pass 4 fail 1 (onchange 未修改)
  radioJsunit(); // pass 2 fail 1 (onchange 未修改)
  ratingJsunit(); // pass 3 fail 1 (onchange 未修改)
  sliderJsunit(); // pass 13 fail 1 (onchange 未修改)
  textpickerJsunit(); // pass 6 fail 1 (onchange 未修改)
  timepickerJsunit(); // pass 4 fail 1 (onchange 未修改)
  toggleJsunit();  // pass 3
  imageSpanJsunit();// pass 2 fail 1 (onchange 未修改)
  patternLockJsunit(); // pass 9
  // // richEditorJsunit(); //fail 2 Cannot find imported element 'RichEditorModifier'
  searchJsunit();// pass 12 fail 1 (onchange 未修改)
  spanJsunit(); //pass 11，
  textJsunit(); // pass 22 fail 1 (onchange 未修改)
  textAreaJsunit(); //pass 17 fail 1 (onchange 未修改)
  textInputJsunit();//pass 25  fail 1 (onchange 未修改)
  //
  imageJsunit();  // pass 15
  imageAnimatorJsunit(); // pass 8
  videoJsunit(); // pass 6
  dataPanelJsunit(); // pass 5 fail 1(onchange 未修改)
  gaugeJsunit();  //pass 9
  loadingProgressJsunit(); // pass 3
  marqueeJsunit(); // pass 5 fail 1 (onchange 未修改)
  progressJsunit(); // pass 3 fail 1 (onchange 未修改)
  qrCodeJsunitJsunit(); // pass 3 fail 1(onchange 未修改)
  textClockJsunit(); // pass 7
  textTimerJsunit(); // pass 6 fail 1(onchange 未修改)

  lineJsunit(); // pass 3
  pathJsunit(); // pass 2
  polygonJsunit(); // pass 2
  polyLineJsunit(); // pass 2

  rectJsunit(); // pass 4
  shapeJsunit(); // pass 14
  // alphabetIndexerJsunit(); //fail 18  Cannot find imported element 'AlphabetIndexerModifier'
  // formComponentJsunit(); //fail 6 Cannot find imported element 'FormComponentModifier' 废弃
  hyperLinkJsunit(); // pass 1 fail 1(onchange 未修改)
  menuItemJsunit(); // pass 6 fail 1(onchange 未修改)
  menuJsunit(); // pass 3 fail 1(onchange 未修改)
  // panelJsunit(); // fail 11 废弃
  scrollEnablePagingJsunit() // pass 1
}