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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,PopInfo,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavigationApi4 {
  pageInfos: NavPathStack = new NavPathStack()
  isUseInterception: boolean = false;
  @State text: string = '';

  @Builder
  PageMap(name:string){
    if (name === 'pageOne'){
      pageOne()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Text(this.text).id('NavigationApi4_text1')
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            // this.pageInfos.pushPath({name: 'pageOne', onPop: (popInfo: PopInfo)=>{
            //   this.text = popInfo.info.name ;
            // }})
            this.pageInfos.pushPath(new NavPathInfo('pageOne',undefined,(popInfo: PopInfo)=>{
              this.text = popInfo.info.name ;
            }))
          })
          .key('NavigationApi4_btn1')

      }
    }.title('NavIndex').navDestination(this.PageMap)
  }
}



@Component
export struct pageOne {
  pageInfos: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column(){
        Button('pop').onClick((e: ClickEvent) => {
          // this.pageInfos.pop({
          //   counter: 10
          // })
        }).id('NavigationApi4_btn2')
      }
    }.title('pageOne')
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
    })
  }
}
