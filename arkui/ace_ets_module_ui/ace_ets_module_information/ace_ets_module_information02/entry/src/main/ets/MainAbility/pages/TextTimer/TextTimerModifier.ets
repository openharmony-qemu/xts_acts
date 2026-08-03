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

class MyTextTimerModifierTest1 implements AttributeModifier<TextTimerAttribute> {
  public isBold: boolean = false
  public applyFontColor: ResourceColor = '#FFFFC0CB'
  public applyFontSize: Length = 20

  applyNormalAttribute(instance: TextTimerAttribute): void {
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
struct TextTimerModifierPage {
  modifier: MyTextTimerModifierTest1 = new MyTextTimerModifierTest1()
  @State myModifier: MyTextTimerModifierTest1 = this.modifier

  build() {
    Column({ space: 20 }) {
      Text('TextTimer AttributeModifier Test')
        .height('5%')
        .margin({ bottom: 10 })
      Row({ space: 10 }) {
        Button('Change FontColor')
          .id('btn_change_texttimer_color')
          .onClick(() => {
            this.myModifier.applyFontColor = '#FFFF0000'
          })
          .width('25%')

        Button('Toggle Bold')
          .id('btn_toggle_texttimer_bold')
          .onClick(() => {
            this.myModifier.isBold = !this.myModifier.isBold
          })
          .width('25%')

        Button('Get')
          .id('btn_get_texttimer_attr')
          .onClick(() => {
            let strJson: string = getInspectorByKey('texttimer_modifier_countdown');
            let obj: Record<string, ESObject> = JSON.parse(strJson);
            AppStorage.setOrCreate('texttimer_fontColor', obj.$attrs.fontColor as string);
            AppStorage.setOrCreate('texttimer_fontSize', obj.$attrs.fontSize as string);
            AppStorage.setOrCreate('texttimer_fontWeight', obj.$attrs.fontWeight as string);
          })
          .width('25%')
      }.height('5%')
      TextTimer({ isCountDown: true, count: 10000 })
        .id('texttimer_modifier_countdown')
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
