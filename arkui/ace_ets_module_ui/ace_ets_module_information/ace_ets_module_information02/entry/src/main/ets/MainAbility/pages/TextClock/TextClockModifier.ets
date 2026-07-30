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

class MyTextClockModifier1 implements AttributeModifier<TextClockAttribute> {
  public isBold: boolean = false
  public applyFontColor: ResourceColor = '#FFE65100'
  public applyFontSize: Length = 20

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.fontColor(this.applyFontColor)
    instance.fontSize(this.applyFontSize)
    if (this.isBold) {
      instance.fontWeight(FontWeight.Bold)
    } else {
      instance.fontWeight(FontWeight.Normal)
    }
  }
}

@Entry
@Component
struct TextClockModifierPage {
  modifier: MyTextClockModifier1 = new MyTextClockModifier1()
  @State myModifier: MyTextClockModifier1 = this.modifier

  build() {
    Column({ space: 20 }) {
      Text('TextClock AttributeModifier Test')
        .height('5%')
        .margin({ bottom: 10 })
      Row({ space: 10 }) {
        Button('Change FontColor')
          .id('btn_change_textclock_color')
          .onClick(() => {
            this.myModifier.applyFontColor = '#FF0000FF'
          })
          .width('25%')

        Button('Toggle Bold')
          .id('btn_toggle_textclock_bold')
          .onClick(() => {
            this.myModifier.isBold = !this.myModifier.isBold
          })
          .width('25%')

        Button('Get')
          .id('btn_get_textclock_attr')
          .onClick(() => {
            let strJson: string = getInspectorByKey('textclock_modifier_default');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            AppStorage.setOrCreate('textclock_fontColor', obj.$attrs.fontColor as string);
            AppStorage.setOrCreate('textclock_fontSize', obj.$attrs.fontSize as string);
            AppStorage.setOrCreate('textclock_fontWeight', obj.$attrs.fontWeight as string);
          })
          .width('25%')
      }.height('5%')
      TextClock({ timeZoneOffset: -8 })
        .id('textclock_modifier_default')
        .width('100%')
        .height('5%')
        .attributeModifier(this.myModifier)


    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}
