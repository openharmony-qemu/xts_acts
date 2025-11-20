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
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  Row,
  ClickEvent,
  Margin,
  ButtonType,
  Stepper,
  StepperItem,
  ItemState,
  SideBarContainer,
  SideBarContainerType,
  ForEach,
  Color,
  ColumnOptions,
  Builder,
  $r,
  Image,
  Resource,
  Scroller,
  Placement,
  Menu,
  BorderStyle,
  Length,
  NavPathStack,
  ResourceStr,
  MenuItem,
  MenuItemOptions
} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { promptAction } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, LengthMetrics } from '@kit.ArkUI';
import { TargetInfo } from '@ohos.arkui.UIContext'

@Entry
@Component
struct selectModalMode_01 {

  pathStack: NavPathStack = new NavPathStack()
  scroller: Scroller = new Scroller()
  @State index: int[] = [0,1]
  @State isShow: boolean = false

  // setTimeOut duration
  @State duration: number = 2000

  // Menu指向的绑定节点
  @State targetInfo: TargetInfo = {
    id: 'targetComponent',
  } as TargetInfo
  // partialUpdate
  @State partialUpdate: boolean = false


  private iconStr: ResourceStr = $r("app.media.icon");
  @State txt1: string = ''
  @State txt2: string = ''
  @State txt3: string = ''
  // @State modalModeArray: Array<ModalMode|undefined|null> = [
  //   ModalMode.AUTO,
  //   ModalMode.NONE,
  //   ModalMode.TARGET_WINDOW,
  // ]
  @State modalModeIndex: int = 0
  @State isShow1: boolean  = false
  @State isShow2: boolean  = false
  @State isShow3: boolean  = false

  @Builder
  MyMenu1() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
      .id('menu1')
      MenuItem({ content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
      MenuItem({ content: "菜单选项" } as MenuItemOptions)
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项1" } as MenuItemOptions)
      .id('menu')
      MenuItem({ startIcon: this.iconStr, content: "菜单选项2" } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项3" } as MenuItemOptions)
    }
  }

  @Builder
  MyMenu2() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项01" } as MenuItemOptions)
      .id('menu2')
      MenuItem({ startIcon: this.iconStr, content: "菜单选项02" } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项03" } as MenuItemOptions)
    }
  }

  build() {
    Column() {

      Button("bindContextMenu:AUTO")
        .id("selectmode")
        .fontWeight(FontWeight.Bold)
        .onClick((e: ClickEvent) => {
          this.isShow1=true
        })
        .bindContextMenu(this.isShow1,()=> {
          this.MyMenu()
        },{
          // modalMode: this.modalModeArray[0],
          onDisappear:()=>{
            // this.txt1 = JSON.stringify(this.modalModeArray[0])
            this.isShow1=false
          }
        })
      Text(this.txt1)
        .id('text1')

      Text("-------------")

      Button("bindContextMenu:NONE")
        .id("selectmode1")
        .fontWeight(FontWeight.Bold)
        .onClick((e: ClickEvent) => {
          this.isShow2=true
        })
        .bindContextMenu(this.isShow2,()=> {
          this.MyMenu1()
        },{
          // modalMode: this.modalModeArray[1],
          onDisappear:()=>{
            // this.txt2 = JSON.stringify(this.modalModeArray[1])
            this.isShow2=false
          }
        })
      Text(this.txt2)
        .id('text2')

      Text("-------------")

      Button("bindContextMenu:TARGET_WINDOW")
        .id("selectmode2")
        .fontWeight(FontWeight.Bold)
        .onClick((e: ClickEvent) => {
          this.isShow3=true
        })
        .bindContextMenu(this.isShow3,()=> {
          this.MyMenu2()
        },{
          // modalMode: this.modalModeArray[2],
          onDisappear:()=>{
            // this.txt3 = JSON.stringify(this.modalModeArray[2])
            this.isShow3=false
          }
        })
      Text(this.txt3)
        .id('text3')

    }
    .height('100%')
    .width('100%')
  }
}
