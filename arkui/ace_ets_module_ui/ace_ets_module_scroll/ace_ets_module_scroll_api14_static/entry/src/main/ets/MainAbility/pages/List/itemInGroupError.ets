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
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  Column,
  Row,
  Text,
  Button,
  NodeContainer,
  ClickEvent,
  BarState,
  ListItem,
  ListScroller,
  ColumnOptions,
  Padding,
  Builder,
  Margin,
  List,
  ListItemGroup,
  ListItemAlign,
  EdgeEffect
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct getItemRectInGroupError {
  listScroller: ListScroller = new ListScroller()
  listScroller2: ListScroller = new ListScroller()
  private arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
  @State textResult: string = 'Hello world'
  @State textResult2: string = 'Hello world'

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '个')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('getItemRectInGroup: ' + this.textResult)
        .id('getItemRectInGroup_err_text')
        .margin({ top: 5 } as Margin)
      Row() {
        Button('error: 401')
          .id('getItemRectInGroup_401')
          .height('5%')
          .onClick((e: ClickEvent) => {
            try {
              
            } catch (error) {
              this.textResult = (error as BusinessError).code + '';
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
            }
          })
        Button('error: 100004')
          .id('getItemRectInGroup_100004')
          .height('5%')
          .onClick((e: ClickEvent) => {
            try {
              this.listScroller2.getItemRectInGroup(10, 10)
            } catch (error) {
              this.textResult = (error as BusinessError).code + '';
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
            }
          })
      }

      Text('scrollToItemInGroup: ' + this.textResult2)
        .id('scrollToItemInGroup_err_text')
      Row() {
        Button('error: 401')
          .id('scrollToItemInGroup_401')
          .height('5%')
          .onClick((e: ClickEvent) => {
            try {
              
            } catch (error) {
              this.textResult2 = (error as BusinessError).code + '';
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
            }
          })
        Button('error: 100004')
          .id('scrollToItemInGroup_100004')
          .height('5%')
          .onClick((e: ClickEvent) => {
            try {
              this.listScroller2.scrollToItemInGroup(1, 3)
            } catch (error) {
              this.textResult2 = (error as BusinessError).code + '';
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
            }
          })
      }


      List({ initialIndex: 0, scroller: this.listScroller }) {
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      }
      .alignListItem(ListItemAlign.Center)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Fade)
      .scrollBar(BarState.On)
      .width('90%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}