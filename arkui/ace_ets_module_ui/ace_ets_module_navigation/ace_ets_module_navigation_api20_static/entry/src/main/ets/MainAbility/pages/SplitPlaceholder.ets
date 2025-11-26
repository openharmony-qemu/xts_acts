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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,Curve,PopInfo,HorizontalAlign,AnimateParam,NavDestinationTransition,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,CalendarAlign,ToolbarItemStatus,NavigationMenuItem,wrapBuilder,SymbolRenderingStrategy,ToolbarItem, SafeAreaType,SafeAreaEdge,Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { SymbolGlyphModifier } from "@ohos.arkui.modifier";
import { ComponentContent } from '@ohos.arkui.node';
@Builder
function PlaceholderPage(){
  Column({space:10} as ColumnOptions) {
    Text('分栏模式占位页面').id('text1Id')
      .fontSize(28)
  }.width('100%')
  .height('100%')
  .backgroundColor(Color.Green)

}


@Builder
function PlaceholderPage2(){
  Column({space:10} as ColumnOptions) {
    Text('分栏模式占位页面').id('text2Id')
      .fontSize(28)
  }.width('100%')
  .height("100%")
  .backgroundColor(Color.Pink)
  .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.START])
}

@Builder
function PlaceholderPage3() {
}

@Entry
@Component
struct SplitPlaceholder {
  @Provide({alias:'navPathStack'}) navPathStack: NavPathStack = new NavPathStack();
  placeholder:ComponentContent = new ComponentContent(this.getUIContext(),wrapBuilder(PlaceholderPage))
  placeholder2:ComponentContent = new ComponentContent(this.getUIContext(),wrapBuilder(PlaceholderPage2))
  placeholder3:ComponentContent = new ComponentContent(this.getUIContext(),wrapBuilder(PlaceholderPage3))

  @State menuItems: Array<NavigationMenuItem> = [
    {
      value: 'menuItem2',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')).fontColor([Color.Red, Color.Green])
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR),
    },
    {
      value: 'menuItem3',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_lungs')),
    },
  ] as Array<NavigationMenuItem>
  @State toolItems: Array<ToolbarItem> = [
    {
      value: 'toolItem1',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_lungs')),
      status: ToolbarItemStatus.ACTIVE,
      activeSymbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')).fontColor([Color.Red,
        Color.Green]).renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR),
      action: () => {
      }
    },
    {
      value: 'toolItem2',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_star')),
      status: ToolbarItemStatus.ACTIVE,
      action: () => {
      }
    },
    {
      value: 'toolItem3',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_star')),
      status: ToolbarItemStatus.ACTIVE,
      activeSymbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_lungs')),
      action: () => {
      }
    }
  ] as Array<ToolbarItem>
  @State message :string = ''
  @State splitPlaceholder:(ComponentContent<undefined>) [] = [this.placeholder, this.placeholder2, this.placeholder3]
  @State splitPlaceholderIndex:number = 0
  @State navBarPosition:NavBarPosition[] =[NavBarPosition.Start,NavBarPosition.End]
  @State NavBarPositionString:string[] =['Start','End']
  @State navBarPositionIndex:Int = 0
  @State hideNavBar:boolean[] =[false, true]
  @State hideNavBarIndex:Int = 0
  @State SafeAreaEdgeType: (SafeAreaType) [] = [SafeAreaType.SYSTEM]
  @State SafeAreaEdge: Array<Array<SafeAreaEdge|undefined>>|Array<Array<undefined>|Array<SafeAreaEdge>> = [[undefined],[SafeAreaEdge.TOP], [SafeAreaEdge.BOTTOM],[SafeAreaEdge.START],[SafeAreaEdge.END]]
  @State SafeAreaEdgeIndex:number =0
  @State SafeAreaEdgeString:string[] =['undefined', 'TOP', 'BOTTOM','START','END']
  @State enableDragBar:boolean[]=[true, false]
  @State enableDragBarIndex:Int =0
  @State enableMode:boolean []=[false, true]
  @State enableModeIndex:Int = 0

  build() {
    Navigation(this.navPathStack) {
      Scroll() {
        Column({ space: 10 } as ColumnOptions) {
          Button('splitPlaceholder', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height('10%')
            .id('btn1')
            .backgroundColor(Color.Blue)
            .onClick((e: ClickEvent) => {
              this.splitPlaceholderIndex = 0
            })

          Button('splitPlaceholder2', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height('10%')
            .id('btn2')
            .backgroundColor(Color.Blue)
            .onClick((e: ClickEvent) => {
              this.splitPlaceholderIndex = 1
            })

          Button('splitPlaceholder空节点', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height('10%')
            .id('btn3')
            .backgroundColor(Color.Blue)
            .onClick((e: ClickEvent) => {
              this.splitPlaceholderIndex = 2
            })

          Button('null splitPlaceholder', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height('10%')
            .id('btn4')
            .backgroundColor(Color.Blue)
            .onClick((e: ClickEvent) => {
              this.splitPlaceholderIndex = 3
            })

          Button('undefined splitPlaceholder', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height('10%')
            .id('btn5')
            .backgroundColor(Color.Blue)
            .onClick((e: ClickEvent) => {
              this.splitPlaceholderIndex = 4
            })

        }
      }
    }
    .enableModeChangeAnimation(this.enableMode[this.enableModeIndex])
    .enableDragBar(this.enableDragBar[this.enableDragBarIndex])
    .hideNavBar(this.hideNavBar[this.hideNavBarIndex])
    .navBarPosition(this.navBarPosition[this.navBarPositionIndex])
    .backButtonIcon(new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')), undefined)
    .titleMode(NavigationTitleMode.Mini)
    .menus(this.menuItems, undefined)
    .toolbarConfiguration(this.toolItems)
    .title('一级页面')
    // .splitPlaceholder(this.splitPlaceholder[this.splitPlaceholderIndex])
    .mode(NavigationMode.Split)
    .navBarWidthRange(['50%','100%'])//第二个undefined
  }
}