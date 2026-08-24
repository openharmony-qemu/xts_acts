/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../common/MessageManager';

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
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('ImageAnimatorAttributeModifier onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'state') {
        this.modifier.stateValue = message.value
      }
      if (message.name == 'duration') {
        this.modifier.durationValue = message.value
      }
      if (message.name == 'reverse') {
        this.modifier.reverseValue = message.value
      }
      if (message.name == 'fixedSize') {
        this.modifier.fixedSizeValue = message.value
      }
      if (message.name == 'fillMode') {
        this.modifier.fillModeValue = message.value
      }
      if (message.name == 'iterations') {
        this.modifier.iterationsValue = message.value
      }
      if (message.name == 'monitorInvisibleArea') {
        this.modifier.monitorInvisibleAreaValue = message.value
      }
    }
    this.messageManager.registerCallback(callback)
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
          this.modifier.stateValue = AnimationStatus.Running
        }).key('btn_start')
        Button('pause').layoutWeight(1).onClick(() => {
          this.modifier.stateValue = AnimationStatus.Paused
        }).key('btn_pause')
        Button('stop').layoutWeight(1).onClick(() => {
          this.modifier.stateValue = AnimationStatus.Stopped
        }).key('btn_stop')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row({ space: 10 }) {
        Button('reverse').layoutWeight(1).onClick(() => {
          this.modifier.reverseValue = !this.modifier.reverseValue
        }).key('btn_reverse')
        Button('fixedSize').layoutWeight(1).onClick(() => {
          this.modifier.fixedSizeValue = !this.modifier.fixedSizeValue
        }).key('btn_fixedSize')
        Button('infinite').layoutWeight(1).onClick(() => {
          this.modifier.iterationsValue = -1
        }).key('btn_infinite')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row({ space: 10 }) {
        Button('fillNone').layoutWeight(1).onClick(() => {
          this.modifier.fillModeValue = FillMode.None
        }).key('btn_fillNone')
        Button('duration').layoutWeight(1).onClick(() => {
          this.modifier.durationValue = 5000
        }).key('btn_duration')
        Button('monitor').layoutWeight(1).onClick(() => {
          this.modifier.monitorInvisibleAreaValue = true
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
