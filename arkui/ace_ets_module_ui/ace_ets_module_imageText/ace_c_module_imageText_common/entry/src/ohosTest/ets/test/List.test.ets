/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import TextEnumTest from "./TextCommonTest/TextCommonEnum.test"
import TextAreaEnumTest from "./TextAreaTest/TextAreaEnum.test"
import TextAreaGradientTest from "./TextAreaTest/TextAreaGradient.test"
import TextInputEnumTest from "./TextInputTest/TextInputEnum.test"
import TextInputGradientTest from "./TextInputTest/TextInputGradient.test"
import RichEditorPunctuationOverflowTest from "./RichEditorTest/RichEditorPunctuationOverflow.test"
import RichEditorScrollToVisibleTest from "./RichEditorTest/RichEditorScrollToVisible.test"
import TextPunctuationOverflowTest from "./TextCommonTest/TextPunctuationOverflow.test"
import TextInputPunctuationOverflowTest from "./TextInputTest/TextInputPunctuationOverflow.test"
import TextAreaPunctuationOverflowTest from "./TextAreaTest/TextAreaPunctuationOverflow.test"
import TextTailIndentsTest from "./TextCommonTest/TextTailIndents.test"
import ParagraphStyleTailIndentsTest from "./TextCommonTest/ParagraphStyleTailIndents.test"

export default function testsuite() {
  TextEnumTest();
  TextAreaEnumTest();
  TextAreaGradientTest();
  TextInputEnumTest();
  TextInputGradientTest();
  RichEditorPunctuationOverflowTest();
  RichEditorScrollToVisibleTest();
  TextPunctuationOverflowTest();
  TextInputPunctuationOverflowTest();
  TextAreaPunctuationOverflowTest();
  TextTailIndentsTest();
  ParagraphStyleTailIndentsTest();
}