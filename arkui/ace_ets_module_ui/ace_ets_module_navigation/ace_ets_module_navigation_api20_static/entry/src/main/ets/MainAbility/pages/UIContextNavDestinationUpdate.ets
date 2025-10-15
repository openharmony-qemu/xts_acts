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
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,CalendarAlign,ToolbarItemStatus,NavigationMenuItem,SymbolRenderingStrategy,ToolbarItem, SafeAreaType,SafeAreaEdge,Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import uiObserver from '@ohos.arkui.observer';

@Component
struct UniqueIdPageTwo {
  @Consume('stack') stack:NavPathStack;

  private text: string = '';
  private uniqueId: number  = -1;

  aboutToAppear() {
    
    let navigationUniqueId = this.queryNavigationInfo()?.navigationId;
    if(navigationUniqueId) {
      this.uniqueId = Number(navigationUniqueId.valueOf());
    }
    this.text = JSON.stringify(this.uniqueId);

    let navigationInfo: uiObserver.NavigationInfo | undefined = this.queryNavigationInfo()
    console.log('queryNavigationInfo: ' + JSON.stringify(navigationInfo))
  }

  build() {
    NavDestination() {
      Text('pageTwo')
        .height('5%')
      Text('navigationUniqueId:' + this.text)
        .height('5%')
      Button('back').onClick((e: ClickEvent) => {
        this.stack.pop();
      })
        .height('5%')
        .id('backId')
    }.title('pageTwo')
  }
}

@Component
struct UniqueIdPageOne {
  @Consume('stack') stack:NavPathStack;

  private text: string = '';
  private uniqueId: number  = -1;

  info1: (info: uiObserver.NavDestinationInfo)=>void = (info: uiObserver.NavDestinationInfo) => {
    if (info && info.state == 8) {
      console.info('NavDestination state update navigationId', JSON.stringify(info));
      AppStorage.setOrCreate<string>('navDestinationName', info.name as string);
    }
  }

  aboutToAppear() {
    
    let navigationUniqueId = this.queryNavigationInfo()?.navigationId;
    if(navigationUniqueId) {
      this.uniqueId = Number(navigationUniqueId.valueOf());
    }
    this.text = JSON.stringify(this.uniqueId);
    AppStorage.setOrCreate<string>('uniqueId', this.text);
  }

  build() {
    NavDestination() {
      Text('pageOne')
        .height('5%')
      Text('navigationUniqueId:' + this.text)
        .height('5%')
      Button('uiObserver.on')
        .onClick((e: ClickEvent) => {
          
        })
        .id('onId')
      Button('uiObserver.off')
        .onClick((e: ClickEvent) => {
          uiObserver.offNavDestinationUpdate();
          uiObserver.offNavDestinationUpdate({ navigationId: 'testId' });
          
          console.info('close getNavigationInfoByUniqueId: ', this.uniqueId);
        })
        .id('offId')
      Button('push pageTwo').onClick((e: ClickEvent) => {
        
        this.stack.pushPath(new NavPathInfo('pageTwo',null));
      })
        .id('pushTwoId')
      Button('back').onClick((e: ClickEvent) => {
        this.stack.pop();
      })
        .height('5%')
        .id('backId')
    }.title('pageOne')
  }
}

@Entry
@Component
struct UIContextNavDestinationUpdate {
  

  @Builder
  PageBuilder(name: string) {
    if (name == 'pageOne') {
      UniqueIdPageOne()
    } else if (name == 'pageTwo') {
      UniqueIdPageTwo()
    }
  }

  build() {
    Column() {
      
        Button('Push PageOne')
          .onClick((e: ClickEvent) => {
            
          })
          .id('pushOneId')
      
      
      
      
      
    }
    .width('100%')
    .height('100%')
  }
}