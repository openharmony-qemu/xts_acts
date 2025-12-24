'use static';
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

import SearchKeyboardAppearanceTest from './Search/SearchKeyboardAppearance.test';
import ResourceDefaultTest from './ImageAttachmentTest/ResourceDefault.test';
import ObjectFitTest from './ImageAttachmentTest/ObjectFit.test';
import PixelMapColorFilterTest from './ImageAttachmentTest/PixelMapColorFilter.test';
import VerticalAlignTest from './ImageAttachmentTest/VerticalAlign.test';
import textAreaInputTest from './TextTest/textAreaInputTest.test';
import TextInputKeyboardAppearanceTest from './TextInputTest/TextInputKeyboardAppearance.test';
import TextAreaKeyboardAppearanceTest from './TextAreaTest/TextAreaKeyboardAppearance.test';
import RichEditorKeyboardAppearanceTest from './RichEditorTest/RichEditorKeyboardAppearance.test';
import RichEditorStopBackPressTest from './RichEditorTest/RichEditorStopBackPress.test';
import SelectionMenuOptions from './RichEditorTest/SelectionMenuOptions.test';

export default function testsuite() {
  SearchKeyboardAppearanceTest(); // 6 pass 0 The key 'keyboardAppearance' was not found in the JSON object
  ResourceDefaultTest(); // 12 pass 8
  ObjectFitTest(); // 15 pass 10
  PixelMapColorFilterTest(); // 2 pass
  VerticalAlignTest(); // 4 pass 4
  textAreaInputTest(); // 1 pass
  TextInputKeyboardAppearanceTest(); // 6 pass 0 The key 'keyboardAppearance' was not found in the JSON object
  TextAreaKeyboardAppearanceTest(); // 6 pass 0 The key 'keyboardAppearance' was not found in the JSON object
  // RichEditorKeyboardAppearanceTest(); // app died
  // RichEditorStopBackPressTest();  // app died
  // SelectionMenuOptions();
}