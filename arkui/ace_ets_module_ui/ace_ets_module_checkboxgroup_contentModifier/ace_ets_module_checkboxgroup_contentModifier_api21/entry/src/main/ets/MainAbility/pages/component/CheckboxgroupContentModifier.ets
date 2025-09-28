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
import events_emitter from '@ohos.events.emitter';

class MyCheckboxGroupStyle implements ContentModifier<CheckBoxGroupConfiguration> {
  public selectedColor: Color = Color.White;

  constructor(selectedColor: Color) {
    this.selectedColor = selectedColor;
  }

  applyContent(): WrappedBuilder<[CheckBoxGroupConfiguration]> {
    return wrapBuilder(buildCheckboxGroup);
  }
}

@Builder
function buildCheckboxGroup(config: CheckBoxGroupConfiguration) {
  Column({ space: 10 }) {
    Text(`selectedColor:${(config.contentModifier as MyCheckboxGroupStyle).selectedColor}`).id('CheckboxgroupContentModifier01')
    Shape() {
      // 五边形复选框样式
      Path()
        .key('pentagon')
        .width(200)
        .height(60)
        .commands('M100 0 L0 100 L50 200 L150 200 L200 100 Z')
        .fillOpacity(0)
      // 红色三角图案样式
      Path()
        .key('triangle1')
        .width(10)
        .height(10)
        .commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.status == SelectStatus.All ? Visibility.Visible : Visibility.Hidden)
        .fill(Color.Red)
        .stroke((config.contentModifier as MyCheckboxGroupStyle).selectedColor)
        .margin({ left: 20, top: 20 })
      // 黄色三角图案样式
      Path()
        .key('triangle2')
        .width(10)
        .height(10)
        .commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.status == SelectStatus.Part ? Visibility.Visible : Visibility.Hidden)
        .fill(Color.Yellow)
        .stroke((config.contentModifier as MyCheckboxGroupStyle).selectedColor)
        .margin({ left: 11, top: 10 })
    }
    .width(300)
    .height(200)
    .viewPort({
      x: 0,
      y: 0,
      width: 310,
      height: 310
    })
    .strokeLineJoin(LineJoinStyle.Miter)
    .strokeMiterLimit(5)
    .onClick(() => {
      // 点击后，触发复选框点击状态变化
      if (config.status == 0 || config.status == 1) {
        config.triggerChange(false);
      } else {
        config.triggerChange(true);
      }
    })
  }
}

@Entry
@Component
struct CheckboxgroupContentModifier {
  @State myCheckboxGroupStyle: MyCheckboxGroupStyle | null | undefined = new MyCheckboxGroupStyle(Color.Red)
  @State colorValue: Color = Color.Red;
  @State select1: boolean = false;
  @State select2: boolean = false;
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('CheckboxgroupContentModifier page state change called:' + JSON.stringify(eventData));
      if (eventData.data?.colorValue != null) {
        this.colorValue = eventData.data?.colorValue;
        this.myCheckboxGroupStyle = new MyCheckboxGroupStyle(this.colorValue)
      }
      if (eventData.data?.CheckboxGroupStyle == 'undefined') {
        this.myCheckboxGroupStyle = undefined
      }
      if (eventData.data?.CheckboxGroupStyle == 'null') {
        this.myCheckboxGroupStyle = null
      }
      if (eventData.data?.selectState != null) {
        if (eventData.data?.selectState == 1) {
          this.select1 = true;
          this.select2 = true;
        } else if (eventData.data?.selectState == 2) {
          this.select1 = false;
          this.select2 = true;
        } else if (eventData.data?.selectState == 3) {
          this.select1 = true;
          this.select2 = false;
        } else {
          this.select1 = false;
          this.select2 = false;
        }
      }
    }
  }

  onPageShow() {
    console.info('Badge page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 66,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 67,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack);
    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 68,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack);
    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 69,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack);
  }

  build() {
    Row() {
      Column() {
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          CheckboxGroup({ group: 'checkboxGroup' })
            .selectedColor(Color.Orange)
            .key('CheckboxGroup')
            .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
            .contentModifier(this.myCheckboxGroupStyle)
            .onChange((itemName: CheckboxGroupResult) => {
              console.info('checkboxGroup content' + JSON.stringify(itemName));
            })
            .mark({
              strokeColor:Color.Black,
              size: 40,
              strokeWidth: 5
            })
            .unselectedColor(Color.Red)
            .width(30)
            .height(30)
          Text('Select All').fontSize(30).margin({ left: 40, top: 50 })
        }.margin({left:50})
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .selectedColor(0x39a2db)
            .select(this.select1)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((value: boolean) => {
              console.info('Checkbox1 change is'+ value);
            })
            .mark({
              strokeColor:Color.Black,
              size: 50,
              strokeWidth: 5
            })
            .unselectedColor(Color.Red)
            .width(30)
            .height(30)
            .margin({ top: 50 })
          Text('Checkbox1').fontSize(20).margin({ top: 25 })
        }
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
            .selectedColor(0x39a2db)
            .select(this.select2)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((value: boolean) => {
              console.info('Checkbox2 change is' + value);
            })
            .width(30)
            .height(30)
          Text('Checkbox2').fontSize(20)
        }

      }
      .width('100%')

    }
    .height('100%')
  }
}