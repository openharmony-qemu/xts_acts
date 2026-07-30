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

import pickerIndicatorTest from './picker/pickerIndicator.test';
import pickerIndicatorModifierTest from './picker/pickerIndicatorModifier.test';
import pickerCanLoopTest from './picker/pickerCanLoop.test';
import pickerCanLoopModifierTest from './picker/pickerCanLoopModifier.test';
import pickerEnableHapticFeedbackTest from './picker/pickerEnableHapticFeedback.test';
import pickerEnableHapticFeedbackModifierTest from './picker/pickerEnableHapticFeedbackModifier.test';
import pickerOnChangeTest from './picker/pickerOnChangeTest.test';
import pickerOnChangeModifierTest from './picker/pickerOnChangeModifierTest.test';
import pickerOnScrollStopTest from './picker/pickerOnScrollStopTest.test';
import pickerOnScrollStopModifierTest from './picker/pickerOnScrollStopModifierTest.test';
import UIPickerComponentItemHeightTest from './picker/UIPickerComponentItemHeightTest.test';
import UIPickerComponentDisplayedItemCountTest from './picker/UIPickerComponentDisplayedItemCountTest.test';
import calendarPickerDialogSystemMaterialTest from './SystemMaterial/calendarPickerDialogSystemMaterial.test';
import datePickerDialogSystemMaterialTest from './SystemMaterial/datePickerDialogSystemMaterial.test';
import textPickerDialogSystemMaterialTest from './SystemMaterial/textPickerDialogSystemMaterial.test';
import timePickerDialogSystemMaterialTest from './SystemMaterial/timePickerDialogSystemMaterial.test';

export default function testsuite() {
    pickerIndicatorTest();
    pickerIndicatorModifierTest();
    pickerCanLoopTest();
    pickerCanLoopModifierTest();
    pickerEnableHapticFeedbackTest();
    pickerEnableHapticFeedbackModifierTest();
    pickerOnChangeTest();
    pickerOnChangeModifierTest();
    pickerOnScrollStopTest();
    pickerOnScrollStopModifierTest();
    UIPickerComponentItemHeightTest();
    UIPickerComponentDisplayedItemCountTest();
    calendarPickerDialogSystemMaterialTest();
    datePickerDialogSystemMaterialTest();
    textPickerDialogSystemMaterialTest();
    timePickerDialogSystemMaterialTest();
}