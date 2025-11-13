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
import SelectTest from './SelectTest/Select.test';
import calendarpicker from './CalendarPickerTest/calendarpicker';
import select from './SelectTest/Select';
import SelectAttr from './SelectTest/SelectAttr.test';
import selectJsunit from './SelectTest/SelectJsunit1.test';
import menuBackgroundBlurStyle from './SelectTest/menuBackgroundBlurStyle.test';
import menuBackgroundColor from './SelectTest/menuBackgroundColor.test';
import selectOnSelectJsunit from './SelectTest/select3.test';
import selectmenuTest from './SelectTest/SelectMenu';

export default function testsuite() {
  SelectTest(); //全pass
  calendarpicker() //emitter导致8个failed 1个断言失败
  SelectAttr() //全pass
  selectJsunit() //emitter导致8个failed
  menuBackgroundBlurStyle() //全pass
  menuBackgroundColor() //全pass
  selectOnSelectJsunit() //全pass
  selectmenuTest()  //.menuAlign(fakeMenuAlignType(null)) 导致ArkUXII_Stage_Select_Menu_MenuAlign_static_1300断言失败 异常场景 忽略
  select() //emitter导致7个failed
}
