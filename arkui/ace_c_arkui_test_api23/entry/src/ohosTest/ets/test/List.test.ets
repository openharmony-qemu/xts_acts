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
import ContainerPickerCanLoop from './containerPicker/ContainerPickerCanLoopTest.test'
import ContainerPickerEnableHapticFeedback from './containerPicker/ContainerPickerEnableHapticFeedbackTest.test'
import ContainerPickerOnChangeTest from './containerPicker/ContainerPickerOnChangeTest.test'
import ContainerPickerOnScrollStopTest from './containerPicker/ContainerPickerOnScrollStopTest.test'
import ContainerPickerSelectedIndex from './containerPicker/ContainerPickerSelectedIndexTest.test'
import ContainerPickerSelectionIndicator from './containerPicker/ContainerPickerSelectionIndicatorTest.test'
import ContainerPickerSubComponent from './containerPicker/ContainerPickerSubComponentTest.test'

export default function testsuite() {
  ContainerPickerCanLoop();
  ContainerPickerEnableHapticFeedback();
  ContainerPickerOnChangeTest();
  ContainerPickerOnScrollStopTest();
  ContainerPickerSelectedIndex();
  ContainerPickerSelectionIndicator();
  ContainerPickerSubComponent();
}