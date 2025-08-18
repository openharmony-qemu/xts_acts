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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,Curve,PopInfo,NavigationSystemTransitionType,HorizontalAlign,AnimateParam,NavDestinationTransition,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct EnableModeChangeAnimation {
  @State navigationMode: NavigationMode = NavigationMode.Auto;
  @State hideNavBar: boolean = false;
  @State enableModeAnimationValue: boolean | undefined = false;
  build() {
    Navigation({}) {
      Scroll() {
        Column({ space: '5vp' } as ColumnOptions) {
          Button('enableModeChangeAnimation：true')
            .margin(10)
            .onClick((e: ClickEvent) => {
              this.enableModeAnimationValue = true;
            })
            .id('enableTrueId')

          Button('enableModeChangeAnimation：false')
            .margin(10)
            .onClick((e: ClickEvent) => {
              this.enableModeAnimationValue = false;
            })
            .id('enableFalseId')

          Button('NavigationMode：Split')
            .margin(10)
            .onClick((e: ClickEvent) => {
              this.navigationMode = NavigationMode.Split;
            })
            .id('splitId')

          Button('NavigationMode：Stack')
            .margin(10)
            .onClick((e: ClickEvent) => {
              this.navigationMode = NavigationMode.Stack;
            })
            .id('stackId')
        }
      }
    }
    .title('Navigation')
    .mode(this.navigationMode)
    .hideNavBar(this.hideNavBar)
    .id('navigationId')
    .enableModeChangeAnimation(this.enableModeAnimationValue)
  }
}