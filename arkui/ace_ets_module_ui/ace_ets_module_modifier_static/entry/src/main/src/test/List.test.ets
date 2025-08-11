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
import swiperTest from './SwiperJsunit.test';
import alphabetIndexerTest from './AlphabetIndexerJsunit.test';
import scrollOnScrollBeginJsunit from './Scroll.test';
import scrollEnablePagingJsunit from './ScrollEnablePaging.test'
import scrollNestedScrollJsunit from './ScrollNestedScroll.test'
import Common1 from './Common1.test';
import GridCol from './GridCol.test';
import GridNestedScroll from './GridNestedScroll.test';
import Image from './Image.test';
import ListNestedScroll from './ListNestedScroll.test';
import Scroll from './Scroll.test';
import TabsFirstJsunit from './TabsFirstJsunit.test';
import TextAreaJsunit from './TextAreaJsunit.test';
import TextInput from './TextInput.test';
import TextJsunit from './TextJsunit.test';
import TextPickerJsunit from './TextPickerJsunit.test';
import Video from './Video.test';
export default function testsuite() {
  swiperTest();
  alphabetIndexerTest();
  scrollOnScrollBeginJsunit();
  scrollEnablePagingJsunit();
  scrollNestedScrollJsunit();
  Common1();
  GridCol();
  GridNestedScroll();
  Image();
  ListNestedScroll();
  Scroll();
  TabsFirstJsunit();
  TextAreaJsunit();
  TextInput();
  TextJsunit();
  TextPickerJsunit();
  Video();

}
