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

class MyImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  public stateValue: AnimationStatus = AnimationStatus.Initial;
  public durationValue: number = 1000;
  public reverseValue: boolean = false;
  public fixedSizeValue: boolean = true;
  public fillModeValue: FillMode = FillMode.Forwards;
  public iterationsValue: number = 1;
  public monitorInvisibleAreaValue: boolean = false;

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.state(this.stateValue)
      .duration(this.durationValue)
      .reverse(this.reverseValue)
      .fixedSize(this.fixedSizeValue)
      .fillMode(this.fillModeValue)
      .iterations(this.iterationsValue)
      .monitorInvisibleArea(this.monitorInvisibleAreaValue)
  }
}

@Entry
@Component
struct ImageAnimatorAttributeModifierPage {
  @State modifier: MyImageAnimatorModifier = new MyImageAnimatorModifier()
  @StorageLink('imageAnimatorState') @Watch('onStorageChange') storageState: AnimationStatus = AnimationStatus.Initial;
  @StorageLink('imageAnimatorDuration') @Watch('onStorageChange') storageDuration: number = 1000;
  @StorageLink('imageAnimatorReverse') @Watch('onStorageChange') storageReverse: boolean = false;
  @StorageLink('imageAnimatorFixedSize') @Watch('onStorageChange') storageFixedSize: boolean = true;
  @StorageLink('imageAnimatorFillMode') @Watch('onStorageChange') storageFillMode: FillMode = FillMode.Forwards;
  @StorageLink('imageAnimatorIterations') @Watch('onStorageChange') storageIterations: number = 1;
  @StorageLink('imageAnimatorMonitorInvisibleArea') @Watch('onStorageChange') storageMonitor: boolean = false;

  onStorageChange() {
    this.modifier.stateValue = this.storageState;
    this.modifier.durationValue = this.storageDuration;
    this.modifier.reverseValue = this.storageReverse;
    this.modifier.fixedSizeValue = this.storageFixedSize;
    this.modifier.fillModeValue = this.storageFillMode;
    this.modifier.iterationsValue = this.storageIterations;
    this.modifier.monitorInvisibleAreaValue = this.storageMonitor;
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
        .key('imageAnimatorModifier')

      Row({ space: 10 }) {
        Button('start').layoutWeight(1).onClick(() => {
          this.storageState = AnimationStatus.Running
        }).key('btn_start')
        Button('pause').layoutWeight(1).onClick(() => {
          this.storageState = AnimationStatus.Paused
        }).key('btn_pause')
        Button('stop').layoutWeight(1).onClick(() => {
          this.storageState = AnimationStatus.Stopped
        }).key('btn_stop')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row({ space: 10 }) {
        Button('reverse').layoutWeight(1).onClick(() => {
          this.storageReverse = !this.storageReverse
        }).key('btn_reverse')
        Button('fixedSize').layoutWeight(1).onClick(() => {
          this.storageFixedSize = !this.storageFixedSize
        }).key('btn_fixedSize')
        Button('infinite').layoutWeight(1).onClick(() => {
          this.storageIterations = -1
        }).key('btn_infinite')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row({ space: 10 }) {
        Button('fillNone').layoutWeight(1).onClick(() => {
          this.storageFillMode = FillMode.None
        }).key('btn_fillNone')
        Button('duration').layoutWeight(1).onClick(() => {
          this.storageDuration = 5000
        }).key('btn_duration')
        Button('monitor').layoutWeight(1).onClick(() => {
          this.storageMonitor = true
        }).key('btn_monitor')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 12, bottom: 12 })
  }
}
