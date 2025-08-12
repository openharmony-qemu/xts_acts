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


import CalendarPickerDialogBGColorTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundColor.test'
import calendarPickerDialogStartEndTest from './calendarPickerDialogTest/calendarPickerDialogStartEndTest.test'
import DatePickerDialogBGBlurStyleTest from './datePickerDialogTest/datePickerDialogBGBlurStyle.test'
import DatePickerDialogBGColorTest from './datePickerDialogTest/datePickerDialogBGColor.test'
import EnableHapticFeedback from './datePickerDialogTest/datePickerDialogEnableHapticFeedback.test'
import DatePickerDialogShadowTest from './datePickerDialogTest/datePickerDialogShadow.test'
import enableCascadeTest from './timePickerDialog/addEnableCascadeApi.test'
import timePickerDialogBGBlurStyleTest from './timePickerDialog/timePickerDialogBGBlurStyle.test';
import timePickerDialogBGColorTest from './timePickerDialog/timePickerDialogBGColor.test';
import timePickerDialogEnableHapticFeedback from './timePickerDialog/timePickerDialogEnableHapticFeedback.test'
import timePickerDialogSelectedAreaTest from './timePickerDialog/timePickerDialogSelectedArea.test';
import timePickerDialogShadowTest from './timePickerDialog/timePickerDialogShadow.test';
import textPickerDialogBGBlurStyleTest from './textPickerDialog/textPickerDialogBGBlurStyle.test';
import textPickerDialogBGColorTest from './textPickerDialog/textPickerDialogBGColor.test';
import textPickerDialogDefaultTextStyleTest from './textPickerDialog/textPickerDialogDefaultTextStyle.test';
import textPickerDialogEnableHapticFeedback from './textPickerDialog/textPickerDialogEnableHapticFeedback.test'
import textPickerDialogSelectedAreaTest from './textPickerDialog/textPickerDialogSelectedArea.test';
import textPickerDialogShadowTest from './textPickerDialog/textPickerDialogShadow.test';

export default function testsuite() {
  CalendarPickerDialogBGColorTest()
  calendarPickerDialogStartEndTest()
  DatePickerDialogBGBlurStyleTest()
  DatePickerDialogBGColorTest()
  EnableHapticFeedback()
  DatePickerDialogShadowTest()
  enableCascadeTest()
  timePickerDialogBGBlurStyleTest()
  timePickerDialogBGColorTest()
  timePickerDialogEnableHapticFeedback()
  timePickerDialogSelectedAreaTest()
  timePickerDialogShadowTest()
  textPickerDialogBGBlurStyleTest()
  textPickerDialogBGColorTest()
  textPickerDialogDefaultTextStyleTest()
  textPickerDialogEnableHapticFeedback()
  textPickerDialogSelectedAreaTest()
  textPickerDialogShadowTest()
}