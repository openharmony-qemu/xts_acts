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
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct SystemTransition2 {
  // @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne()
    } else if (name == 'pageTwo') {
      PageTwo()
    } else if (name == 'pageThree') {
      PageThree()
    } else if (name == 'pageFour') {
      PageFour()
    }
  }

  build() {
    // Navigation(this.pageInfos) {
      Column({space: '5vp'} as ColumnOptions) {
        Button('push pageOne').id('btnOneId').onClick((e: ClickEvent) => {
          // this.pageInfos.pushPath({name: 'pageOne'})
        }).height('10%')
        Button('push pageTwo').id('btnTwoId').onClick((e: ClickEvent) => {
          // this.pageInfos.pushPath({name: 'pageTwo'})
        }).height('10%')
        Button('push pageThree').id('btnThreeId').onClick((e: ClickEvent) => {
          // this.pageInfos.pushPath({name: 'pageThree'})
        }).height('10%')
        Button('push pageFour').id('btnFourId').onClick((e: ClickEvent) => {
          // this.pageInfos.pushPath({name: 'pageFour'})
        }).height('10%')
      }
      .width('100%')
      .height('100%')
    // }
    // .title('Title')
    // .navDestination(this.pageMap)
  }
}

@Component
struct PageOne {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('one').id('text1Id').height('10%')
      Button('pop').id('pop1Id').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageOne')
    .systemTransition(NavigationSystemTransitionType.FADE)
    .id('pageOneId')
  }
}

@Component
struct PageTwo {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('two').id('text2Id').height('10%')
      Button('pop').id('pop2Id').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageTwo')
    .systemTransition(NavigationSystemTransitionType.EXPLODE)
    .id('pageTwoId')
  }
}


@Component
struct PageThree {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('three').id('text3Id').height('10%')
      Button('pop').id('pop3Id').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageThree')
    .systemTransition(NavigationSystemTransitionType.SLIDE_RIGHT)
    .id('pageThreeId')
  }
}


@Component
struct PageFour {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('four').id('text4Id').height('10%')
    }
    .title('pageFour')
    .systemTransition(NavigationSystemTransitionType.SLIDE_BOTTOM)
    .id('pageFourId')
  }
}