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
  // enableCascadeTest(); //SDK12.9 问题表格60行 4个用例
  // CheckboxNodeTest(); ////SDK12.9 Pass: 1
  // checkboxGroupNodeTest(); // SDK12.9 Pass: 1
  // radioNodeTest(); // SDK12.9 Pass: 1
  // ratingNodeTest(); /// SDK12.9 Pass: 1
  // sliderNodeTest(); // SDK12.9 Pass: 1
  // toggleNodeTest(); // SDK12.9 Pass: 1
  // Picker(); //手表端，不用管
  // TimePicker();//SDK12.9 问题表格63行 4个用例
  // TextPicker(); //SDK12.9 问题表格63行 7
  // CheckboxOnChangeModifierTest(); //SDK12.9 问题表格63行 2
  // radioOnChangeModifierTest(); //SDK12.9 问题表格63行 2
  // CheckboxGroupOnChangeModifierTest(); //SDK12.9 问题表格63行 1
  // ratingOnChangeModifierTest(); ///SDK12.9 问题表格63行 1
  // sliderOnChangeModifierTest(); //SDK12.9 问题表格63行 3
  // toggleOnChangeModifierTest(); //SDK12.9 问题表格63行 2
  // textPickerOnChangeModifierTest(); //SDK12.9 问题表格64行 2
  // timePickerOnChangeModifierTest(); //SDK12.9 问题表格64行 2
  // datePickerOnChangeModifierTest(); //SDK12.9 问题表格68行 1
  // selectNodeTest(); // 不存在page页面 1.1也没有
}