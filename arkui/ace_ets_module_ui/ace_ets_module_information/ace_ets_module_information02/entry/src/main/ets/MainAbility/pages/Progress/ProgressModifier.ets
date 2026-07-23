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

class MyProgressModifier1 implements AttributeModifier<ProgressAttribute> {
  public applyColor: Color = Color.Red
  public applyBackgroundColor: ResourceColor = '#FFFF0000'

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance.backgroundColor(this.applyBackgroundColor)
  }
}

@Entry
@Component
struct ProgressModifierPage {
  @State progressValue: number = 2
  modifier: MyProgressModifier1 = new MyProgressModifier1()
  @State myModifier: MyProgressModifier1 = this.modifier

  build() {
    Column({ space: 20 }) {
      Text('Progress AttributeModifier Test')
        .height('5%')
        .margin({ bottom: 10 })
      Row({ space: 10 }) {
        Button('Change Color')
          .id('btn_change_progress_color')
          .onClick(() => {
            this.myModifier.applyBackgroundColor = '#FF0000FF'
          })
          .width('30%')

        Button('Reset Color')
          .id('btn_reset_progress_color')
          .onClick(() => {
            this.myModifier.applyBackgroundColor = '#FFFF0000'
          })
          .width('30%')

        Button('Get')
          .id('btn_get_progress_attr')
          .onClick(() => {
            let strJsonLinear: string = getInspectorByKey('progress_modifier_linear');
            let objLinear: Record<string, ESObject> = JSON.parse(strJsonLinear);
            AppStorage.setOrCreate('progress_linear_bgColor', objLinear.$attrs.backgroundColor as string);

            let strJsonRing: string = getInspectorByKey('progress_modifier_ring');
            let objRing: Record<string, ESObject> = JSON.parse(strJsonRing);
            AppStorage.setOrCreate('progress_ring_bgColor', objRing.$attrs.backgroundColor as string);
          })
          .width('30%')
      }.height('5%')
      Progress({ value: this.progressValue, total: 5, type: ProgressType.Linear })
        .id('progress_modifier_linear')
        .width('80%')
        .attributeModifier(this.myModifier)

      Progress({ value: this.progressValue, total: 5, type: ProgressType.Ring })
        .id('progress_modifier_ring')
        .width(200)
        .height(200)
        .attributeModifier(this.myModifier)


    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}
