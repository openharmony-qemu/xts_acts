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
import textAreaInputTest from './TextTest/textAreaInputTest.test';
import ContentTypeTest1 from './TextInputTest/ContentType1.test';
import ContentTypeTest2 from './TextInputTest/ContentType2.test';
import symbolGlyphFontScaleTest from './FontScaleTest/symbolGlyphFontScaleTest.test';
import monitorInvisibleAreaTest from './ImageAnimator/monitorInvisibleArea.test';
import textBackgroundStyleTest from './RichEditorTest/textBackgroundStyleTest.test';
import SearchGetTextTest from './SearchTest/SearchGetText.test';
import TextAreaGetTextTest from './TextAreaTest/TextAreaGetText.test';
import TextInputGetTextTest from './TextInputTest/TextInputGetText.test';
import ParagraphSpacingTest from './StyledStringTest/ParagraphSpacing.test';
import HapticFeedbackModeTest from './RichEditorTest/HapticFeedbackMode.test';
import RichEditorMaxLinesTest from './RichEditorTest/RichEditorMaxLinesTest.test';
import WordBreakTest from './TextAreaTest/WordBreakTest.test';
import ImageContentEmpty from './ImageContentTest/ImageContentEmpty.test';
import ImageOnError from './ImageErrorTest/ImageOnError.test';

export default function testsuite() {
  // textAreaInputTest(); // 1 pass
  // ContentTypeTest1(); // 7 pass 7
  // ContentTypeTest2(); // 7 pass 7
  // symbolGlyphFontScaleTest(); // 13 pass 6
  // monitorInvisibleAreaTest(); // 4 pass
  // textBackgroundStyleTest(); // 7 pass 1
  // SearchGetTextTest(); // 8 pass 8
  // TextAreaGetTextTest(); // 8 pass 8
  // TextInputGetTextTest(); // 8 pass 8
  // ParagraphSpacingTest(); // 4 pass 2
  HapticFeedbackModeTest(); // App died
  // RichEditorMaxLinesTest(); // App died
  // WordBreakTest(); // 4 pass 4
  // ImageContentEmpty(); // 1 pass 1
  // ImageOnError(); // 1 pass
}
