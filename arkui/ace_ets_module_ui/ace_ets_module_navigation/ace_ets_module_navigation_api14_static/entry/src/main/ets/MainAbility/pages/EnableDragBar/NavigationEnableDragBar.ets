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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,Optional,Scroller,BarState,animateTo,ScrollDirection,PopInfo,HorizontalAlign,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,EdgeEffect, CalendarAlign, Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavigationEnableDragBar {
  // @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  @State currentIndex: number = 0
  @State enableDrag: Optional<boolean> = false;

  @Builder
  NavigationTitle() {
    Column() {
      Text('Title')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Text('subtitle')
        .fontColor('#182431')
        .fontSize(14)
        .lineHeight(19)
        .opacity(0.4)
        .margin({ top: 2, bottom: 20 } as Margin)
    }.alignItems(HorizontalAlign.Start)
  }

  @Builder
  NavigationMenus() {
    Row() {
      Image('resources/base/media/ic_public_add.svg')
        .width(24)
        .height(24)
      Image('resources/base/media/ic_public_add.svg')
        .width(24)
        .height(24)
        .margin({ left: 24 } as Margin)
      Image('common/ic_public_more.svg')
        .width(24)
        .height(24)
        .margin({ left: 24 } as Margin)
    }
  }

  build() {
    // Navigation(this.pageInfos) {
      Column() {
        Scroll() {
          Column() {
            Column() {
              Button('拖拽条开启').id('drag_true')
                .onClick((e: ClickEvent) => {
                  this.enableDrag = true
                })
              Button('拖拽条关闭').id('drag_false')
                .onClick((e: ClickEvent) => {
                  this.enableDrag = false
                })
              Button('拖拽条undefined').id('drag_undefined')
                .onClick((e: ClickEvent) => {
                  this.enableDrag = undefined
                })
            }
          }
        }
      }
    // }
    // .enableDragBar(this.enableDrag)
    // .id('navigatinId')
    // .navBarPosition(NavBarPosition.Start)
    // .navBarWidthRange([100, 500])
    // .titleMode(NavigationTitleMode.Mini)
    // .navBarWidth(250)
    // .minContentWidth(100)
    // .title(this.NavigationTitle)
    // .menus(this.NavigationMenus)
    // .hideTitleBar(false)
    // .hideToolBar(false)
    // .onTitleModeChange((titleModel: NavigationTitleMode) => {
    //   console.info('titleMode' + titleModel)
    // })
    // .width('100%')
    // .height('100%')
    // .backgroundColor('#F1F3F5')
  }
}