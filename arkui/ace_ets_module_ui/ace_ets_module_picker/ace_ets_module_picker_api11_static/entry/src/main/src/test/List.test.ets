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
import checkBoxGroupPartJsunit from './CheckboxTest/checkBoxGroup.test';
import ratingTest from './RatingTest/RatingJsunit.test';
import SliderInterfaceTest from './SliderTest/sliderInterfaceTest.test';
import SliderTest from './SliderTest/SliderJsunit.test';
import sliderJsunitSliderTest from './SliderTestC/sliderJsunit.test';
import textpicker from './TextPicker/TextPicker';
import textpickermultiTest from './TextPicker/TextPickerMulti';
import TextPickerSec from './TextPicker/TextPickerSec';
import toggleTest from './Toggle/ToggleJsunit.test';
export default function testsuite() {
  ratingTest();
  SliderTest();
  toggleTest();
  checkBoxGroupPartJsunit();
  SliderInterfaceTest();
  sliderJsunitSliderTest();
  textpicker();
  textpickermultiTest();
  TextPickerSec();

}
