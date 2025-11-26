'use static';
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
import {
  $$,
  $r,
  Alignment,
  BlurStyle,
  BorderStyle,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DismissSheetAction,
  Divider,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  Image,
  ItemAlign,
  ItemState,
  Length,
  Margin,
  Menu,
  NavPathStack,
  Placement,
  Rating,
  Resource,
  Row,
  RowOptions,
  Scroller,
  SheetType,
  SideBarContainer,
  SideBarContainerType,
  Stepper,
  StepperItem,
  Text,
  TextInput
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Callback, Message, MessageManager } from '../../common/MessageManager';

@Entry
@Component
struct sheetTypeSide_01 {
  @State isShowBottom: boolean = false
  @State isShowSide: boolean = false
  @State sheetHeight: number = 300;

  @Builder
  sideBuilder() {
    Column() {
      Button("change side1")
        .margin(10)
        .fontSize(20)
        .id('side')

      Button("change side2")
        .margin(10)
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column({ space: 3 } as ColumnOptions) {

      Button("半模态弹窗-Side")
        .id('sheetSide1')
        .onClick((e: ClickEvent) => {
          this.isShowSide = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$(this.isShowSide), () => {
          this.sideBuilder()
        }, {
          title: { title: "SideSheet", subtitle: "有关闭按钮" },
          backgroundColor: Color.Grey,
          // preferType: SheetType.SIDE,  //窗口宽度大于600vp时支持
          showClose: true,
          blurStyle: BlurStyle.Regular,
          enableOutsideInteractive: false,
          onHeightDidChange: (height: number) => {
            console.log("SideSheet height change:" + height)
          },
          onTypeDidChange: (data: SheetType) => {
            console.log("SideSheet type change:" + data)
          },
        })
    }
    .id('col')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}