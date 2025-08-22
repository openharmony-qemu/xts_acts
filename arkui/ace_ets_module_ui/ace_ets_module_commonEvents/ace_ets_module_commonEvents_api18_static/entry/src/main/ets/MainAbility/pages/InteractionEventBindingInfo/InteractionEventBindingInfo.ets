/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  List,
  NodeContainer,
  Radio,
  Row,
  Text,
  TouchEvent,
} from '@ohos.arkui.component';
import { AppStorage, Link, Prop, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';

const TEST_TAG: string = "FrameNode "

class MyNodeControllerBindOnClick extends NodeController {
  public node: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);


    return this.node;
  }
}

@Entry
@Component
struct InteractionEventBindingInfoExample {
  @State text: string = ''
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
  @State text5: string = ''
  @State text6: string = ''
  @State text7: string = ''
  @State text8: string = ''
  private myNodeControllerBindOnClick: MyNodeControllerBindOnClick = new MyNodeControllerBindOnClick();

  build() {
    Column() {
      Row() {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .onClick((e: ClickEvent) => {

          })
          .id("radio1")

        Radio({ value: 'Radio2', group: 'radioGroup' })
          .id("radio2")

        Column().id("column1").onClick((e: ClickEvent) => {

        })

        Column().id("column2")
      }

      NodeContainer(this.myNodeControllerBindOnClick).focusable(true)
        .width(300).height(500).borderWidth(1)

      Row() {
        Text(this.text1).key('value1')
        Text(this.text2).key('value2')
        Text(this.text3).key('value3')
        Text(this.text4).key('value4')
        Text(this.text5).key('value5')
        Text(this.text6).key('value6')
        Text(this.text7).key('value7')
        Text(this.text8).key('value8')
        Button(this.text8).id('undefined')
          .onClick((e: ClickEvent) => {


          })
      }


      Row() {
        Button(this.text1).id('baseTrue')
          .onClick((e: ClickEvent) => {


          })
        Button(this.text2).id("nodeTrue")
          .onClick((e: ClickEvent) => {


          })
        Button(this.text3).id('builtInTrue')
          .onClick((e: ClickEvent) => {


          })

      }

      Row() {
        Button(this.text4).id('baseFalse')
          .onClick((e: ClickEvent) => {


          })
        Button(this.text5).id('nodeFalse')
          .onClick((e: ClickEvent) => {


          })
        Button(this.text6).id('nativeFalse')
          .onClick((e: ClickEvent) => {


          })
        Button(this.text7).id('builtInFalse')
          .onClick((e: ClickEvent) => {


          })

      }
    }
  }
}