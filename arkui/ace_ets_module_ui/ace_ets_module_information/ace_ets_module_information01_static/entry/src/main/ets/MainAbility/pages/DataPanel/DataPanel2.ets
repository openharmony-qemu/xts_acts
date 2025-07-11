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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView,Image,ImageFit, Scroller,
  Scroll,FontWeight,TextArea,CopyOptions,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,DataPanelType,
  EdgeEffect,HorizontalAlign,FlexAlign ,Flex,FlexDirection,ItemAlign,FlexAlign,$r,DataPanel} from '@ohos.arkui.component';
import {
  State,
  MutableState,
  stateOf,
  observableProxy,
  AppStorage
} from '@ohos.arkui.stateManagement'
// import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
@Entry
@Component
struct dataPanel_testcase {
  @State myWidth: string = "200"
  @State myHeight: string = "100"
  @State active: boolean = false
  private content: string = "DataPanel Page"

  onPageShow() {
    console.info('Blank page show called');
  }

  onBuildDone() {
    console.info('Blank page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
      DataPanel({ values: [20, 40, 20], max: 100, type: DataPanelType.Line })
        .width(this.myWidth)
        .height(this.myHeight)
        .key('DataPanel')
        .onClick((e:ClickEvent) => {
          router.back()
        })
        .closeEffect(false)

      DataPanel({ values: [20, 40, 20], max: 100, type: DataPanelType.Circle })
        .width(this.myWidth)
        .height(this.myHeight)
        .key('DataPanel2')
        .onClick((e:ClickEvent) => {
          router.back()
        })
        .closeEffect(true)
      DataPanel({ values: [20, 40, 20], max: 100 })
        .width(this.myWidth)
        .height(this.myHeight)
        .key('DataPanel3')
        .onClick((e:ClickEvent) => {
          router.back()
        })
        .closeEffect(false)
    }
    .key('flex')
    .width('100%')
    .height('100%')

  }
}
