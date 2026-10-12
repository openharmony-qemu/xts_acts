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

class MyImageAnimatorInterpolationModifier implements AttributeModifier<ImageAnimatorAttribute> {
  public interpolationValue: ImageInterpolation = ImageInterpolation.None;

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.interpolation(this.interpolationValue)
  }
}

@Entry
@Component
struct ImageAnimatorInterpolationModifierPage {
  @State modifier: MyImageAnimatorInterpolationModifier = new MyImageAnimatorInterpolationModifier()
  @StorageLink('imageAnimatorInterpolation') @Watch('onStorageChange') storageInterpolation: ImageInterpolation = ImageInterpolation.None;

  onStorageChange() {
    this.modifier.interpolationValue = this.storageInterpolation;
  }

  setExceptionInterpolation(value: ImageInterpolation | undefined | null | number) {
    this.modifier.interpolationValue = value;
  }

  build() {
    Column({ space: 10 }) {
      ImageAnimator()
        .images([
          {
            src: $rawfile('img1.png'),
            width: 20,
            height: 20,
            top: 20,
            left: 20
          },
          {
            src: $rawfile('img2.png'),
            width: 30,
            height: 20,
            top: 20,
            left: 20
          },
          {
            src: $rawfile('img3.png'),
            width: 20,
            height: 20,
            top: 20,
            left: 20
          }
        ])
        .attributeModifier(this.modifier)
        .width('100%')
        .height('40%')
        .key('imageAnimatorInterpolationModifier')

      Row({ space: 10 }) {
        Button('None').layoutWeight(1).onClick(() => {
          this.storageInterpolation = ImageInterpolation.None
        }).key('btn_none')
        Button('Low').layoutWeight(1).onClick(() => {
          this.storageInterpolation = ImageInterpolation.Low
        }).key('btn_low')
        Button('Medium').layoutWeight(1).onClick(() => {
          this.storageInterpolation = ImageInterpolation.Medium
        }).key('btn_medium')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row({ space: 10 }) {
        Button('High').layoutWeight(1).onClick(() => {
          this.storageInterpolation = ImageInterpolation.High
        }).key('btn_high')
        Button('InvalidEnum').layoutWeight(1).onClick(() => {
          this.setExceptionInterpolation(99)
        }).key('btn_invalidEnum')
        Button('InvalidNegative').layoutWeight(1).onClick(() => {
          this.setExceptionInterpolation(-1)
        }).key('btn_invalidNegative')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row({ space: 10 }) {
        Button('Undefined').layoutWeight(1).onClick(() => {
          this.setExceptionInterpolation(undefined)
        }).key('btn_undefined')
        Button('Null').layoutWeight(1).onClick(() => {
          this.setExceptionInterpolation(null)
        }).key('btn_null')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 12, bottom: 12 })
  }
}
