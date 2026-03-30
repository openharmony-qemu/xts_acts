/**
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

import { ModifierUtils } from '@kit.ArkUI';

class MyModifier implements AttributeModifier<TextAttribute | ButtonAttribute> {
  isDark: boolean = false

  constructor(dark?: boolean) {
    this.isDark = dark ?? false;
  }

  applyNormalAttribute(instance: TextAttribute | ButtonAttribute): void {
    AppStorage.setOrCreate('IsInstanceOf_aaa', ModifierUtils.isInstanceOf(instance, 'aaa'));
    AppStorage.setOrCreate('IsInstanceOf_Button', ModifierUtils.isInstanceOf(instance, 'Button'));
    AppStorage.setOrCreate('IsInstanceOf_empty_string', ModifierUtils.isInstanceOf(instance, ''));
    AppStorage.setOrCreate('IsInstanceOf_null', ModifierUtils.isInstanceOf(null, 'Button'));
    AppStorage.setOrCreate('IsInstanceOf_undefined', ModifierUtils.isInstanceOf(undefined, 'Button'));
  }
}

@Entry
@Component
struct IsInstanceOf {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Scroll() {
      Column() {
        Button('Button Component')
          .attributeModifier(this.myModifier)
          .id('IsInstanceOf_btn')
          .onClick(() => {
            this.myModifier.isDark = !this.myModifier.isDark;
          })
      }
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}
