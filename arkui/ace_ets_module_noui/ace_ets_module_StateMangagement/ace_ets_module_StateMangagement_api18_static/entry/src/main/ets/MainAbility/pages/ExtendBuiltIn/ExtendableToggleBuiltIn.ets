'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { ExtendableToggle, ToggleOptions, Length, Toggle, Entry, Component, ResourceColor, ToggleType } from '@kit.ArkUI';

class MyToggle extends ExtendableToggle {
  setToggleOptions(options: ToggleOptions): this {
    super.setToggleOptions(options);
    console.info('MyToggle: setToggleOptions');
    return this;
  }

  width(): this {
    super.width('60%');
    return this;
  }

  newAttribute(): this {
    super.height('10%');
    super.width('20%');
    return this;
  }
}

@Entry
@Component
struct ExtendableToggleBuiltIn {
  build() {
    MyToggle({ type: ToggleType.Switch, isOn: false } as ToggleOptions)
      .selectedColor('#007DFF')
      .newAttribute()
      .id('ExtendableToggle_001')
      .onChange((isOn: boolean) => {
        console.info('Component status:' + isOn);
      })
  }
}