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
  Image,
  Resource,
  Scroller,
  Placement,
  Menu,
  BorderStyle,
  Length,
  NavPathStack,
  $r,
  Rating,
  SheetType,
  BlurStyle,
  DismissSheetAction,
  TextInput,
  RowOptions,
  Alignment,
  Divider
} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct maskColor_01 {
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'))
  @State isShow1: boolean = false;
  @State isShow2: boolean = false;
  @State listData: Array<number> = new Array<number>(0, 0, 0, 0);

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      ForEach(this.listData, (item: number, index:int) => {
        Column() {
          Row() {
            Image($r('app.media.app_icon')).width('10%').height('40%').margin({ right: 5 } as Margin)
            Text(`Menu${index + 1}`).fontSize(20)
          }.id('close')
          .width('100%')
          .height('40%')
          .justifyContent(FlexAlign.Center)
          .align(Alignment.Center)
          .onClick((e: ClickEvent) => {
            console.info(`Menu${index + 1} Clicked!`);
          })

          if (index != this.listData.length - 1) {
            Divider().height('30%').width('80%').color('#ccc')
          }
        }.padding('1%').height('5%')
      })
    }.width('20%')
  }

  build() {
    Column() {
      Text($r('sys.string.ohos_id_menu_has_filter'))
        .id('resource')
      Text($r('sys.color.ohos_id_color_mask_thin'))
        .id('resource1')
        .backgroundColor($r('sys.color.ohos_id_color_mask_thin'))
      Row(){
        Button('5')
          .id('button5')
          .bindMenu(this.MenuBuilder, { /*mask: {color:'#809b43c9'},*/ showInSubWindow: false })
        Button('6')
          .id('button6')
          .bindMenu(this.MenuBuilder, { /*mask: {color:0xFF6495ED},*/ showInSubWindow: false})
        Button('7')
          .id('button7')
          .bindMenu(this.MenuBuilder, { /*mask: {color:Color.Blue},*/ showInSubWindow: false })
        Button('25')
          .id('button25')
          .bindMenu(this.MenuBuilder, {
            /*mask: {color:$r('app.color.start_window_background')},*/
            showInSubWindow: false })
        Button('8')
          .id('button8')
          .bindMenu(this.MenuBuilder, {/* mask: {color:undefined},*/ showInSubWindow: false})
        Button('9')
          .id('button9')
          .bindMenu(this.MenuBuilder, { /*mask: {color:null},*/ showInSubWindow: false})
      }
    }.width('100%')
  }
}
