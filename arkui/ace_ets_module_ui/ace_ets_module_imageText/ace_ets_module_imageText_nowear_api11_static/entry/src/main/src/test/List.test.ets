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

import search_center from './SearchTest/search_center.test'
import search_gesture from './SearchTest/search_gesture.test';
import SearchJsunit from './SearchTest/SearchJsunit.test';
import textAreaInputTest from './TextAreaTest/textAreaInputTest.test';
import textinputSec from './TextInputTest/textinputSec.test'
import TextStateJsunit from './textTest/TextStateJsunit.test';
import text_drag from './textTest/text_drag.test';
import textArea_center from './TextAreaTest/textArea_center.test'
import positionSettingJsunit from './textTest/PositionSettingJsunit.test';
import textAreaBC1Jsunit from './TextAreaTest/textAreaBC1Jsunit.test';
import textAreaUIJsunit from './TextAreaTest/textAreaUIJsunit.test';
import TextInputPageJsunit from './TextInputTest/TextInputPageJsunit.test';
import OnTextSelectionChangeTest from './textTest/onTextSelectionChange.test';
import richEditorApi1 from './RichEditorTest/richEditorApi/richEditorApi1.test'
import RichEditor01 from './RichEditorTest/RichEditor01.test'
import RichEditorApi222 from './RichEditorTest/RichEditorApi222.test'
import RichTextJsunit from './RichEditorTest/RichTextJsunit.test'
import getcomponentadd from './buttonTest/getcomponentadd.test';
import segmentbutton from './SegmentButtonTest/segmentbutton.test';
import SelectJsunit from './selectTest/SelectJsunit.test';
import SelectJsunit01 from './selectTest/SelectJsunit01.test';
import richTextJsunitFOUR from './RichEditorTest/RichTextJsunitFOUR.test'

export default function testsuite() {
  // search_center();
  // search_gesture();
  // SearchJsunit(); //  Failure: 1, Error: 2, Pass: 1

  // OnTextSelectionChangeTest(); //fail 1 OnTextSelectionChangeTest_static_0020, expect start:-1,end:-1 equals start:3,end:11
  // positionSettingJsunit(); //fail 5  run: 12, Failure: 5, Error: 0, Pass: 7, Ignore: 0
  // text_drag();

  // TextStateJsunit(); // fail 7 run: 46, Failure: 7, Error: 0, Pass: 39
  // textArea_center();
  // textAreaBC1Jsunit(); //fail 6  crash 1 textAreaBC1Jsunit_static_0300
  // textAreaInputTest();
  textAreaUIJsunit();//Failure: 10, Error: 2, Pass: 1
  // TextInputPageJsunit(); //Failure: 1, Error: 1, Pass: 2

  // richEditorApi1();//fail 1  richEditorApi1_static_0100, expect 11 equals 222
  // RichEditor01();// Failure: 3, Error: 0, Pass: 3, Ignore: 0
  // RichEditorApi222();
  // RichTextJsunit();// fail 1
  // richTextJsunitFOUR();
  // getcomponentadd();
  // segmentbutton();// fail 3 @ohos.arkui.advanced.SegmentButton未交付
  // SelectJsunit()
  // SelectJsunit01();
  // textinputSec();
}