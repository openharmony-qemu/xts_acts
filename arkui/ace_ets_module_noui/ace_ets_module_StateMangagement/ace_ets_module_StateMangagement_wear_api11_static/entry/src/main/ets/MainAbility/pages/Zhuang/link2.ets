'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Row,
  Scroll,
  ButtonType
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';


@Entry
@Component
struct Link1 {
  @State type1: ButtonType | undefined = ButtonType.Circle
  @State type2: ButtonType | undefined = ButtonType.Circle
  @State number1: number | undefined = 10
  @State number2: number | undefined = 10

  aboutToAppear(){
    let uiContext = this.getUIContext();
    let link2 = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("link2",  link2);
  }

  build() {
    Row() {
      Scroll() {
        Row() {

          Column() {

            Row(){
              Column(){
                Text("Link:type->undefined")
                Button('button')
                  .type(this.type1)
                  .onClick((e: ClickEvent) => {
                    this.type1 = undefined
                  })
                  .key('liBtn1')
              }
              Column(){
                Text("Link:type-->null")
                Button('button')
                  .type(this.type2)
                  .onClick((e: ClickEvent) => {
                    this.type2 = undefined
                  })
                  .key('liBtn2')
              }

            }

            Row(){
              Column(){
                Text("Link文本10-->undefined")
                Button('button')
                  .fontSize(this.number1)
                  .onClick((e: ClickEvent) => {
                    this.number1 = undefined
                  })
                  .key('liBtn3')
              }

              Column(){

                Text("Link文本10-->null")
                Button('button')
                  .fontSize(this.number2)
                  .onClick((e: ClickEvent) => {
                    this.number2 = undefined
                  })
                  .key('liBtn4')
              }

            }

          }.width('100%')
        }
      }
    }
  }
}