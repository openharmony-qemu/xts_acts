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

import CheckboxNodeTest from './checkbox/checkboxNode.test';
import checkboxGroupNodeTest from './checkboxGroup/checkboxGroupNode.test';
import enableCascadeTest from './timePicker/enableCascadeTest.test';
import radioNodeTest from './radio/radioNode.test';
import ratingNodeTest from './rating/ratingNode.test';
import sliderNodeTest  from './slider/sliderNode.test';
import toggleNodeTest from './toggle/toggleNode.test';
import Picker from './crownSensitivity/Picker.test';
import TimePicker from './crownSensitivity/TimePicker.test';
import TextPicker from './crownSensitivity/TextPicker.test';
import CheckboxOnChangeModifierTest from './checkbox/checkboxOnChangeModifier.test';
import CheckboxGroupOnChangeModifierTest from './checkboxGroup/checkboxGroupOnChangeModifier.test';
import radioOnChangeModifierTest from './radio/radioOnChangeModifier.test';
import ratingOnChangeModifierTest from './rating/ratingOnChangeModifier.test';
import sliderOnChangeModifierTest from './slider/sliderOnChangeModifier.test';
import toggleOnChangeModifierTest from './toggle/toggleOnChangeModifier.test';
import textPickerOnChangeModifierTest from './textPicker/textPickerOnChangeModifier.test';
import timePickerOnChangeModifierTest from './timePicker/timePickerOnChangeModifier.test';
import datePickerOnChangeModifierTest from './datePicker/datePickerOnChangeModifier.test';
import selectNodeTest from './select/selectNode.test'

export default function testsuite() {
  // enableCascadeTest(); //SDK11.22 Pass: 4
  // CheckboxNodeTest(); //SDK11.22 Pass: 1
  // checkboxGroupNodeTest(); // SDK11.22 Pass: 1
  // radioNodeTest(); // SDK11.22 Pass: 1
  // ratingNodeTest(); /// SDK11.22 Pass: 1
  // sliderNodeTest(); // SDK11.22 Pass: 1
  // toggleNodeTest(); // SDK11.22 Pass: 1
  // Picker(); //手表端，不用管
  // TimePicker();// SDK11.22 Pass: 7
  // TextPicker(); //  SDK11.22 Pass: 7
  // CheckboxOnChangeModifierTest(); // SDK11.22 Pass: 2
  // radioOnChangeModifierTest(); // SDK11.22 Pass: 2
  // CheckboxGroupOnChangeModifierTest(); // SDK11.22 Pass: 1
  // ratingOnChangeModifierTest(); // SDK11.22 Pass: 1
  // sliderOnChangeModifierTest(); // SDK11.22 Pass: 3
  // toggleOnChangeModifierTest(); // SDK11.22 Pass: 2
  textPickerOnChangeModifierTest(); //SDK11.22 Pass: 2  SDK12.15 pass1
  timePickerOnChangeModifierTest(); // pass 2
  // datePickerOnChangeModifierTest(); // SDK11.22 Pass: 2
  // selectNodeTest(); // 不存在page页面 1.1也没有
}