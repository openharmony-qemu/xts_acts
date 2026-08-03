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

class MyHyperlinkModifier1 implements AttributeModifier<HyperlinkAttribute> {
  public isDark: boolean = false;

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    if (this.isDark) {
      instance.color('#FF000000');
    } else {
      instance.color('#FFFF0000');
    }
  }
}

@Entry
@Component
struct HyperlinkModifierPage {
  @State modifier: MyHyperlinkModifier1 = new MyHyperlinkModifier1();

  build() {
    Column({ space: 5 }) {
      Hyperlink('https://example.com/', 'HyperlinkModifier')
        .id('hyperlink_modifier_color')
        .attributeModifier(this.modifier)
        .width('80%')
        .height('5%')

      Button('change modifier')
        .id('hyperlink_btn_change_modifier')
        .onClick(() => {
          this.modifier.isDark = !this.modifier.isDark;
        })
        .width('80%')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}
