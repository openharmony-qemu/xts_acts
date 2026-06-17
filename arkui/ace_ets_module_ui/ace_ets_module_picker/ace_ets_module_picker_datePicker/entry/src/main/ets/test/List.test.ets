/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import DatePickerCanLoopTest from './datePickerTest/datePickerCanLoop.test';
import datePickerMode from './datePickerTest/DatePickerMode.test';
import EnableHapticFeedbackTest from './datePickerTest/datePickerEnableHapticFeedback.test';
import EnableHapticFeedbackModifierTest from './datePickerTest/datePickerEnableHapticFeedbackModifier.test';
import datePickerOnChangeModifierTest from './datePickerTest/datePickerOnChangeModifier.test';
import datePickerTextStyleTest from './datePickerTest/DatePickerTextStyle.test';
import datePickerLunarJsunit from './datePickerTest/datePicker3.test';
import datePickerJsunit from './datePickerTest/DatePickerJsunit.test';
import datePickerUIJsunit from './datePickerTest/datePickerUIJsunit.test';
import datePickerPropertiesModifierTest from './datePickerTest/datePickerPropertiesModifier.test';

import DatePickerCanLoopNullUndefinedTest from './datePickerNullUndefined/DatePickerCanLoopNullUndefined.test';
import DatePickerDisappearTextStyleNullUndefinedTest from './datePickerNullUndefined/DatePickerDisappearTextStyleNullUndefined.test';
import DatePickerLunarNullUndefinedTest from './datePickerNullUndefined/DatePickerLunarNullUndefined.test';
import DatePickerSelectedTextStyleNullUndefinedTest from './datePickerNullUndefined/DatePickerSelectedTextStyleNullUndefined.test';
import DatePickerTextStyleNullUndefinedTest from './datePickerNullUndefined/DatePickerTextStyleNullUndefined.test';

import DatePickerComponentConstructorTest from './datePickerComponent/DatePickerComponentConstructor.test';
import DatePickerComponentDisplayModeTest from './datePickerComponent/DatePickerComponentDisplayMode.test';
import DatePickerComponentDateModeTest from './datePickerComponent/DatePickerComponentDateMode.test';
import DatePickerComponentLunarTest from './datePickerComponent/DatePickerComponentLunar.test';
import DatePickerComponentLoopTest from './datePickerComponent/DatePickerComponentLoop.test';
import DatePickerComponentEnableHapticFeedbackTest from './datePickerComponent/DatePickerComponentEnableHapticFeedback.test';
import DatePickerComponentTimeFormatTest from './datePickerComponent/DatePickerComponentTimeFormat.test';
import DatePickerComponentUseMilitaryTimeTest from './datePickerComponent/DatePickerComponentUseMilitaryTime.test';
import DatePickerComponentOnChangeTest from './datePickerComponent/DatePickerComponentOnChange.test';
import DatePickerComponentOnScrollStopTest from './datePickerComponent/DatePickerComponentOnScrollStop.test';

export default function testsuite() {
  DatePickerCanLoopTest();
  datePickerMode();
  EnableHapticFeedbackTest();
  EnableHapticFeedbackModifierTest();
  datePickerOnChangeModifierTest();
  datePickerTextStyleTest();
  datePickerLunarJsunit();
  datePickerJsunit();
  datePickerUIJsunit();
  datePickerPropertiesModifierTest();
  DatePickerCanLoopNullUndefinedTest();
  DatePickerDisappearTextStyleNullUndefinedTest();
  DatePickerLunarNullUndefinedTest();
  DatePickerSelectedTextStyleNullUndefinedTest();
  DatePickerTextStyleNullUndefinedTest();
  DatePickerComponentConstructorTest();
  DatePickerComponentDisplayModeTest();
  DatePickerComponentDateModeTest();
  DatePickerComponentLunarTest();
  DatePickerComponentLoopTest();
  DatePickerComponentEnableHapticFeedbackTest();
  DatePickerComponentTimeFormatTest();
  DatePickerComponentUseMilitaryTimeTest();
  DatePickerComponentOnChangeTest();
  DatePickerComponentOnScrollStopTest();
}