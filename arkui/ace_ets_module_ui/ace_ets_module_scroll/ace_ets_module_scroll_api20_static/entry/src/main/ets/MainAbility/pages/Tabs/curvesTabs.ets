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
import curves from '@ohos.curves'
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Row,
  GridItem,
  ForEach,
  Margin,
  TextAlign,
  Scroller,
  Button,
  ClickEvent,
  Axis,
  ListItemAlign,
  Refresh,
  List,
  BarState,
  Margin,
  Stack,
  Scroll,
  Flex,
  ScrollBar,
  Builder,
  Tabs,
  TabContent,
  TabsController,
  TabContentAnimatedTransition,
  TabContentTransitionProxy,
  BarMode,
  animateTo
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

interface itemType {
  text: string,
  backgroundColor: Color
}

@Entry
@Component
struct TabsCustomAnimationExample1 {
  @State data: itemType[] = [
    {
      text: 'Red',
      backgroundColor: Color.Red
    } as itemType,
    {
      text: 'Yellow',
      backgroundColor: Color.Yellow
    } as itemType,
    {
      text: 'Blue',
      backgroundColor: Color.Blue
    } as itemType]
  private timeoutList: int[] = [] as int[]
  @State opacityListOri: number[] = [] as number[]
  @State scaleListOri: number[] = [] as number[]
  private durationListOri: number[] = [] as number[]
  private customTransitionOri: (from: int, to: int) => TabContentAnimatedTransition =
    (from: int, to: int) => {
      let tabContentAnimatedTransition = {
        timeout: this.timeoutList[from.toInt()],
        transition: (proxy: TabContentTransitionProxy): void => {
          this.scaleListOri[from.toInt()] = 1.0
          this.scaleListOri[to.toInt()] = 0.5
          this.opacityListOri[from.toInt()] = 1.0
          this.opacityListOri[to.toInt()] = 0.5
          animateTo({
            duration: this.durationListOri[from.toInt()].toInt(),
            onFinish: () => {
              proxy.finishTransition()
            }
          }, () => {
            this.scaleListOri[from.toInt()] = 0.5
            this.scaleListOri[to.toInt()] = 1.0
            this.opacityListOri[from.toInt()] = 0.5
            this.opacityListOri[to.toInt()] = 1.0
          })
        }
      } as TabContentAnimatedTransition
      return tabContentAnimatedTransition
    }
  @State currentIndexOri: int = 0
  private controllerOri: TabsController = new TabsController()
  @State noMinHeightLimit1: boolean = true;

  build() {
    Column() {
      Text('index: ' + this.currentIndexOri)
        .id('tabs_text1_curve')
        .margin({ top: 10 } as Margin)

      Tabs({ index: this.currentIndexOri, controller: this.controllerOri }) {
        ForEach(this.data, (item: itemType, index: int) => {
          TabContent() {
          }
          .tabBar(item.text)
          .backgroundColor(item.backgroundColor)
          .opacity(this.opacityListOri[index.toInt()])
          .scale({ x: this.scaleListOri[index.toInt()], y: this.scaleListOri[index.toInt()] })
        })
      }
      .id('tabs_bar_curve')
      .vertical(false)
      .barMode(BarMode.Fixed)
      .animationDuration(600)
      .barHeight('auto')
      .width('90%')
      .height('40%')
      .backgroundColor(0xf1f3f5)
      
      .customContentTransition(this.customTransitionOri)
      .onChange((index: int): void => {
        this.currentIndexOri = index
      })
    }
  }
}
