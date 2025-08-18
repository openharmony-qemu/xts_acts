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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,Padding,Optional,Scroller,FontStyle,BarState,animateTo,ScrollDirection,PopInfo,HorizontalAlign,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,EdgeEffect, RouterPageInfo,TextInputController,CalendarAlign, Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router,UIContext } from '@ohos.arkui.UIContext';
class InnerParams {
  private data3: number[] | undefined

  constructor(tuple?:number[]) {
    this.data3 = tuple
  }
}
class RouterParams {
  private data1: string = ''
  private data2: InnerParams = new InnerParams()

  constructor(str:string, tuple:number[]) {
    this.data1 = str
    this.data2 = new InnerParams(tuple)
  }
}
@Entry
@Component
struct RouterRecoverable {
  @State message: string = 'routerPage1';

  @State text1:   string = '这里显示栈信息'
  // @State text2:   number|string = 0
  controller: TextInputController = new TextInputController()
  routerPageUpdateCallback(info: RouterPageInfo) {
    if(info){
       console.log(`testTag routerPageUpdateCallback, index: ${info.index}, name: ${info.name}, path: ${info.path}, state: ${info.state}, pageId: ${info.pageId}`);
    }
  }

  build() {
    Column({ space: '20vp' } as ColumnOptions) {
      Button('routerPage2_recoverable=true', { stateEffect: true, type: ButtonType.Capsule })
        .id('routerBtnId1')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 } as Margin)
        .onClick((e: ClickEvent)=>{
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'MainAbility/pages/Navigation/RouterPage2',
            params: new RouterParams('message' ,[123,456,789]),
            recoverable:true
          })
        })
      Button('routerPage2_recoverable=false', { stateEffect: true, type: ButtonType.Capsule })
        .id('routerBtnId2')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 } as Margin)
        .onClick((e: ClickEvent)=>{
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'MainAbility/pages/Navigation/RouterPage2',
            params: new RouterParams('message' ,[123,456,789]),
            recoverable:false
          })
        })
    }
    .height('100%')
    .width('100%')
    .margin({top: '20vp'} as Margin)
  }
}