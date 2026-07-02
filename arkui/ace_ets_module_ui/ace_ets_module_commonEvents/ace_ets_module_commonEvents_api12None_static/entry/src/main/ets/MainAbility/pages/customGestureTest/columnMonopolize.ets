'use static';
/*
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

import {
  Entry,
  Component,
  State,
  Column,
  Text,
  Button,
  Color,
  TouchEvent,
  TouchType,
} from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'set monopolizeEvents false';
  @State messageOut: string = ' ';
  @State messageInner: string = ' ';
  @State monopolize: boolean = false;

  build() {
    Column() {
      Text(this.message)
        .fontSize(22)
        .id('textTrue')
        .margin(10)
      Text(this.messageOut)
        .fontSize(22)
        .margin(10)
        .id('text1True')
      Text(this.messageInner)
        .fontSize(22)
        .margin(10)
        .id('text2True')
      Button('clean')
        .fontSize(22)
        .margin(10)
        .id('button1True')
        .onClick(()=>{
          this.messageOut = " "
          this.messageInner = " "
        })
      Button('change monopolizeEvents')
        .fontSize(22)
        .margin(10)
        .id('button2True')
        .onClick(()=>{
          this.monopolize = !this.monopolize
          if (!this.monopolize) {
            this.message = "set monopolizeEvents false"
          } else {
            this.message = "set monopolizeEvents true"
          }
        })
      Column() {
        Column(){}
        .monopolizeEvents(this.monopolize)
        .width('100%')
        .height('40%')
        .backgroundColor(Color.Blue)
        .id('column1True')
        .onTouch((event:TouchEvent)=>{
          if (event.type == TouchType.Down) {
            console.info("inner column touch down")
            this.messageInner = "inner column touch down"
          }
        })
      }
      .backgroundColor(Color.Gray)
      .height('100%')
      .width('100%')
      .onTouch((event)=>{
        if (event.type == TouchType.Down) {
          console.info("outside column touch down")
          this.messageOut = "inner column touch down"
        }
      })
    }
    .height('100%')
  }
}