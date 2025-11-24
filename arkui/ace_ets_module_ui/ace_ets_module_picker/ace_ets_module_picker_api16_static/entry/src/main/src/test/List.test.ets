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
  enableCascadeTest(); // page页面存在注释代码  代码注释导致断言失败 enableCascadeTest 的值类型不匹配
  // CheckboxNodeTest(); // page页面存在注释代码   createNode码注释导致无法获取id  let checkbox = typeNode.createCheckboxNode(uiContext)
//   checkboxGroupNodeTest(); // page页面存在注释代码 checkboxGroup.initialize 无法获取id
//   radioNodeTest(); // page页面存在注释代码  radio.initialize 无法获取id
//   ratingNodeTest(); // page页面存在注释代码  rating.initialize 无法获取id
//   sliderNodeTest(); // page页面存在注释代码  slider.initialize 无法获取id
//   toggleNodeTest(); // page页面存在注释代码  toggle.initialize 无法获取id
//   Picker(); //手表端，不用管
//   TimePicker();
//   TextPicker(); // page页面存在注释代码  TextPickerModifier SDK不支持
//   CheckboxOnChangeModifierTest(); // page页面存在注释代码 CheckboxModifier SDK不支持
//   radioOnChangeModifierTest(); // page页面存在注释代码  RadioModifier SDK不支持
//   CheckboxGroupOnChangeModifierTest(); // page页面存在注释代码  CheckboxGroupModifier SDK不支持
//   ratingOnChangeModifierTest(); // page页面存在注释代码  ratingOnChangeModifier SDK不支持
//   sliderOnChangeModifierTest(); // page页面存在注释代码  sliderOnChangeModifier SDK不支持
//   toggleOnChangeModifierTest(); // page页面存在注释代码  toggleOnChangeModifier SDK不支持
//   textPickerOnChangeModifierTest(); // page页面存在注释代码  textPickerOnChangeModifier SDK不支持
//   timePickerOnChangeModifierTest(); // page页面存在注释代码  timePickerOnChangeModifier SDK不支持
//   datePickerOnChangeModifierTest(); // page页面存在注释代码  datePickerOnChangeModifier SDK不支持
//   selectNodeTest(); // 不存在page页面 1.1也没有
}