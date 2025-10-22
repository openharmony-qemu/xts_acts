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

import { uniformTypeDescriptor } from '@kit.ArkData';
@Entry
@Component
struct Five {
  @State message: string = 'Hello World 5555555555555';
  @State isShowLongEventCom: boolean = false;
  @State longClickEvent: string = 'Hello World';
  @State isShowDragEventCom: boolean = false;
  @State targetText: string = 'Drag Text';
  @State backGroundColor: Color = Color.Transparent;
  @State inSetValueOne: number = 0;
  @State inSetValueTwo: number = 40;

  build() {
    Column() {
      Row() {
        if (this.isShowLongEventCom) {
          Text('ShowLongEventText')
            .id('ShowLongEventText')
        }
        Button('longClick')
        .id('longClickBtn')
        .margin({left: 10})
        .type(ButtonType.Capsule)
        .gesture(LongPressGesture({repeat: true}).onAction((event: GestureEvent) => {
          if (event && event.repeat) {
            this.isShowLongEventCom = true;
            this.longClickEvent = 'longClickEvent'
          }
        }).onActionEnd((event: GestureEvent) => {
          this.isShowLongEventCom = false;
        }))
        Text(this.longClickEvent)
          .margin({
            left: 10
          })
          .backgroundColor(Color.Green)
          .id('longClickTextResult')
      }
      .backgroundColor(Color.Red)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      Row() {
        Column() {
          Column() {
            Text('this is abstract')
              .fontSize(20)
              .width('100%')
          }.margin({ left: 40, top: 20 })
          .width('100%')
          .height(100)
          .onDragEnd((event) => {
            this.isShowDragEventCom = false;
            this.targetText = 'drag end';
            this.backGroundColor = Color.White;
          })
          .onDragStart((event) => {
            this.isShowDragEventCom = true;
            this.backGroundColor = Color.Red;
          })
          .onPreDrag((status: PreDragStatus) => {
          })
          .backgroundColor(this.backGroundColor)
        }
        .id('dragCol')
        .width(150)
        .height(150)

        if (this.isShowDragEventCom) {
          Text('ShowDragEventText')
            .id('ShowDragEventText')
        }
        Column() {
          Text(this.targetText)
            .id('dragResultText')
            .width('100%')
            .height(100)
            .border({ color: Color.Black, width: 1 })
            .margin(15)
            .allowDrop([uniformTypeDescriptor.UniformDataType.PLAIN_TEXT])
        }
        .width(150)
        .height(150)
        .margin({ left: 20 })

      }
      .margin({top: 20})
    }
    .height('100%')
    .width('100%')
  }
}