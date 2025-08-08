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

import PickerCrownSensitivity from './crownSensitivity/Picker.test';
import TimePickerCrownSensitivity from './crownSensitivity/TimePicker.test';
import checkBoxGroupOnChangeModifierTest from './checkboxGroup/checkboxGroupOnChangeModifier.test';
import radioOnChangeModifierTest from './radio/radioOnChangeModifier.test';
import textPickerOnChangeModifierTest from './textPicker/textPickerOnChangeModifier.test';
import datePickerOnChangeModifierTest from './datePicker/datePickerOnChangeModifier.test';

export default function testsuite() {
  PickerCrownSensitivity();
  TimePickerCrownSensitivity();
  checkBoxGroupOnChangeModifierTest();
  radioOnChangeModifierTest();
  textPickerOnChangeModifierTest();
  datePickerOnChangeModifierTest();
}