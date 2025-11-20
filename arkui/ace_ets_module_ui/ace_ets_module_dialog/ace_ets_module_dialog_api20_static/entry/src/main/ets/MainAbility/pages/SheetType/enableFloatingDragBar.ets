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
  Scroll,
  RowOptions,
  ShadowStyle,
  SheetMode,
  ScrollSizeMode,
  SheetKeyboardAvoidMode,
  HoverModeAreaType,
  SheetSize,
  ScrollDirection,
  $$,
  PX,
  VP,
  FP,
  LPX,
  Percentage,
  TripleLengthDetents
} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { ComponentContent } from '@kit.ArkUI';

@Entry
@Component
struct enableFloatingDragBar_01 {
  @State showSheet: boolean = false;
  @State showSheet2: boolean = false;
  // @State enableFloatingDragBar: Array<Boolean|undefined|null> = [true, false]
  @State enableFloatingDragBar: Array<Boolean> = [true, false]
  @State enableFloatingDragBarIndex: number = 0.0
  @State enableOutsideInteractive: boolean [] = [true, false]
  @State enableOutsideInteractiveIndex: number = 0.0
  // @State widthList: (PX | VP | FP | LPX | Percentage | Resource | undefined)[] = [undefined, 100.0, 200.0, '30%', '80%', '200%']
  @State widthList: Array<undefined|Double|String> = [undefined, 100.0, 200.0, '30%', '80%', '200%']
  @State widthIndex: number = 0.0
  @State showClose: boolean[] = [true, false]
  @State showCloseIndex: number = 0.0
  @State dragBar: boolean[] = [true, false]
  @State dragBarIndex: number = 0.0
  @State detents:  	TripleLengthDetents[] = [[200.0,400.0,600.0], [200.0,200.0,200.0], [SheetSize.MEDIUM, SheetSize.LARGE, SheetSize.FIT_CONTENT]] as TripleLengthDetents[]
  @State txt1: string = ''
  @State detentsIndex: number = 0
  @State paddingList: Array<undefined|Double> = [undefined, 5.0, 10.0, 15.0] as Array<undefined|Double>
  @State paddingIndex: number = 0

  private changeOrientation(isLandscape: boolean) {
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }

  @Builder
  SheetBuilder() {
    Column() {
      Text('this is Sheet')
      TextInput({ placeholder: 'input your word...' }).backgroundColor(Color.Blue)
        .margin({ top: 20 } as Margin)
      Button("close modal 1")
        .id('close')
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.showSheet = false;
        })
    }
    .backgroundColor(Color.Pink)
    .width('100%')
    .height('100%')
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Scroll() {

        Row({ space: 5 } as RowOptions) {

          Button('enableFloatingDragBar: ' + this.enableFloatingDragBar[this.enableFloatingDragBarIndex as int])
            .onClick((e: ClickEvent) => {
              this.enableFloatingDragBarIndex++
              if (this.enableFloatingDragBarIndex > this.enableFloatingDragBar.length - 1) {
                this.enableFloatingDragBarIndex = 0
              }
            })


          Button('enableOutsideInteractive： ' + this.enableOutsideInteractive[this.enableOutsideInteractiveIndex as int])
            .onClick((e: ClickEvent) => {
              this.enableOutsideInteractiveIndex++
              if (this.enableOutsideInteractiveIndex > this.enableOutsideInteractive.length - 1) {
                this.enableOutsideInteractiveIndex = 0
              }
            })
          Button("横屏").onClick((e: ClickEvent) => {
            this.changeOrientation(true)
          })
          Button("竖屏").onClick((e: ClickEvent) => {
            this.changeOrientation(false)
          })
          Column() {
            Text('detents: ' + this.detents[this.detentsIndex as int])
            Button('detents')
              .onClick((e: ClickEvent) => {
                this.detentsIndex++
                if (this.detentsIndex > this.detents.length - 1) {
                  this.detentsIndex = 0

                }
              })
          }

          Button('title padding: ' + this.paddingList[this.paddingIndex as int])
            .onClick((e: ClickEvent) => {
              this.paddingIndex++
              if (this.paddingIndex > this.paddingList.length - 1) {
                this.paddingIndex = 0
              }
            })

          Button('width: ' + this.widthList[this.widthIndex as int])
            .onClick((e: ClickEvent) => {
              this.widthIndex++
              if (this.widthIndex > this.widthList.length - 1) {
                this.widthIndex = 0
              }
            })

          Button('showClose: ' + this.showClose[this.showCloseIndex as int])
            .onClick((e: ClickEvent) => {
              this.showCloseIndex++
              if (this.showCloseIndex > this.showClose.length - 1) {
                this.showCloseIndex = 0
              }
            })

          Button('dragBar: ' + this.dragBar[this.dragBarIndex as int])
            .onClick((e: ClickEvent) => {
              this.dragBarIndex++
              if (this.dragBarIndex > this.dragBar.length - 1) {
                this.dragBarIndex = 0
              }
            })
        }
      }.scrollable(ScrollDirection.Horizontal)

      Column({ space: 10 } as ColumnOptions) {
        Button('Open Sheet').width(200).height(50)
          .id("dragbar")
          .onClick((e: ClickEvent) => {
            this.showSheet = !this.showSheet;
          })
          .bindSheet($$(this.showSheet), ()=> {
            this.SheetBuilder()
          }, {
            detents: this.detents[this.detentsIndex as int], // 设置底部样式半模态，DragBar为悬浮模式
            preferType: SheetType.BOTTOM,
            showClose: this.showClose[this.showCloseIndex as int],
            dragBar: this.dragBar[this.dragBarIndex as int],
            blurStyle: BlurStyle.Thin,
            maskColor: Color.Green,
            width: this.widthList[this.widthIndex as int],
            shadow: ShadowStyle.OUTER_DEFAULT_XS,
            uiContext: this.getUIContext(),
            mode: SheetMode.EMBEDDED,
            scrollSizeMode: ScrollSizeMode.FOLLOW_DETENT,
            keyboardAvoidMode: SheetKeyboardAvoidMode.TRANSLATE_AND_RESIZE,
            enableHoverMode: true,
            hoverModeArea: HoverModeAreaType.TOP_SCREEN,
            radius: undefined,
            detentSelection: 200,
            title: { title: "SideSheet", subtitle: "默认宽度" },
            enableOutsideInteractive: this.enableOutsideInteractive[this.enableOutsideInteractiveIndex as int],
            // enableFloatingDragBar: this.enableFloatingDragBar[this.enableFloatingDragBarIndex], //新接口
            onAppear: () => {
              console.log('BindSheep onAppear.');
            },
            onDisappear: () => {
              let arr = JSON.stringify(this.enableFloatingDragBar[this.enableFloatingDragBarIndex as int])
              if( arr == "true"){
                this.txt1 = '0'
              }else {
                this.txt1 = '1'
              }
              console.log('BindSheep onDisappear.');
            },
            onHeightDidChange: (height: number)=>{
              console.log("SideSheet height change:" + height);
            },
          })
        Text(this.txt1)
          .id('text1')
      }
      .width('100%')
      .height('100%')
    }
  }
}