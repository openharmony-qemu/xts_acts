'use static';
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

import uiObserver from '@ohos.arkui.observer';
import {
Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,Curve,PopInfo,HorizontalAlign,AnimateParam,NavDestinationTransition,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,CalendarAlign,ToolbarItemStatus,NavigationMenuItem,SymbolRenderingStrategy,ToolbarItem, SafeAreaType,SafeAreaEdge,Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack,ItemState,Stepper,StepperItem} from '@ohos.arkui.component';
import {StepperModifier} from '@ohos.arkui.modifier'
import {
State,
Link,
Prop,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';


@Entry
@Component
struct StepperModifierPage {
  @State currentIndex: int = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @State thirdState: ItemState = ItemState.Normal

  private stepperModifier: StepperModifier = new StepperModifier()
    .onFinish(() => {
      this.currentIndex = 0;
      AppStorage.setOrCreate('currentIndex', this.currentIndex);
      console.info('testTag onFinish')
    })
    .onSkip(() => {
      this.currentIndex = 3;
      AppStorage.setOrCreate('currentIndex', this.currentIndex);
      console.info('testTag onSkip')
    })
    .onChange((prevIndex?: number, index?: number) => {
      console.info('testTag onChange')
      AppStorage.setOrCreate('currentIndex', index);
      if (index) {
        this.currentIndex = index as int
      }
    })
    .onNext((index?: number, pendingIndex?: number) => {
      console.info('testTag onNext')
      console.info('testTag onNext index: ' + index + 'onNext pendingIndex: ' + pendingIndex)
      AppStorage.setOrCreate('pendingIndex', pendingIndex);
      if (pendingIndex) {
        this.currentIndex = pendingIndex as int
      }
    })
    .onPrevious((index?: number, pendingIndex?: number) => {
      console.info('testTag onPreview')
      console.info('testTag onPreview index: ' + index + 'onNext pendingIndex: ' + pendingIndex)
      AppStorage.setOrCreate('pendingIndex', pendingIndex);
      if (pendingIndex) {
        this.currentIndex = pendingIndex as int
      }
    })

  build() {
    
    NavDestination(){
      Stepper({
        index: this.currentIndex
      }) {
        
        StepperItem() {
          Column() {
            Text('Page One')
            Button('change status:' + this.firstState)
              .backgroundColor('#007dFF')
              .onClick((e: ClickEvent) =>{
                this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
              })
              .id('changeId1')
          }
        }
        .nextLabel('StepperNext1')
        .status(this.firstState)
        
        StepperItem() {
          Column() {
            Text('Page Two')
            Button('change status:' + this.secondState)
              .backgroundColor('#007dFF')
              .onClick((e: ClickEvent) =>{
                this.secondState = this.secondState === ItemState.Disabled ? ItemState.Normal : ItemState.Disabled
              })
          }
        }
        .nextLabel('Next')
        .prevLabel('StepperPrevious')
        .status(this.secondState)
        
        StepperItem() {
          Column() {
            Text('Page Three')
            Button('change status:' + this.thirdState)
              .backgroundColor('#007dFF')
              .onClick((e: ClickEvent) =>{
                this.thirdState = this.thirdState === ItemState.Waiting ? ItemState.Normal : ItemState.Waiting
              })
          }
        }
        .status(this.thirdState)
        
        StepperItem() {
          Column() {
            Text('Page Four')
          }
        }
        .nextLabel('fourFinish')
        .prevLabel('fourPrevious')
      }
      .backgroundColor('#F1F3F5')
      .attributeModifier(this.stepperModifier)
    }
  }
}