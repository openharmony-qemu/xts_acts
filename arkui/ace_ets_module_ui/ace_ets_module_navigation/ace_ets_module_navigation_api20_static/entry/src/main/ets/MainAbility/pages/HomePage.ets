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
  $r,
  Scroll,
  Builder,
  List,
  ListItem,
  Resource,
  animateTo,
  Curve,
  PopInfo,
  HorizontalAlign,
  AnimateParam,
  NavDestinationTransition,
  Search,
  TextAlign,
  Axis,
  NavBarPosition,
  FlexAlign,
  NavPathInfo,
  NavDestinationContext,
  NavigationTitleMode,
  Image,
  NavigationMode,
  Column,
  Navigation,
  ButtonType,
  NavDestination,
  Stack,
  ColumnOptions,
  TextInput,
  SearchController,
  NavigationOperation,
  PanGesture,
  Position,
  EffectType,
  EffectComponent,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  NavDestinationMode,
  Dimension,
  TextOverflow,
  GestureEvent,
  FontWeight,
  Axis,
  Margin,
  Swiper,
  ForEach,
  PickerTextStyle,
  CalendarAlign,
  ToolbarItemStatus,
  NavigationMenuItem,
  SymbolRenderingStrategy,
  ToolbarItem,
  SafeAreaType,
  SafeAreaEdge,
  Visibility,
  Date,
  NavigationCommonTitle,
  NavDestinationCommonTitle,
  Alignment,
  BarStyle,
  LaunchMode,
  NavPathStack
} from '@ohos.arkui.component';
import { State, Link, PropRef, Provide, Consume } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import uiObserver from '@ohos.arkui.observer';

@Component
struct PageOne {
  private stack: NavPathStack | undefined = undefined;

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Center }) {
        Button('push PageOne').onClick((e: ClickEvent) => {
          this.stack?.pushPath(new NavPathInfo('PageOne', null));
        })
      }.width('100%').height('100%')
    }.title('PageOne')
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
      console.log('HomePageInfo name: ', JSON.stringify(ctx.pathInfo.name))
      AppStorage.setOrCreate('name', ctx.pathInfo.name);
      console.log('HomePageInfo param: ', JSON.stringify(ctx.pathInfo.param))
      AppStorage.setOrCreate('param', JSON.stringify(ctx.pathInfo.param));
    })
  }
}


@Entry
@Component
struct HomePage {
  private stack: NavPathStack = new NavPathStack();


  @Builder
  PageOneBuilder() {
    PageOne()
  }

  build() {
    
    
    Column() {
      Navigation(this.stack) {

      }
      .width('100%')
      .height('100%')
      .navDestination(this.PageOneBuilder)
      .title('Navigation')
    }
  }
}