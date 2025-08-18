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
  Canvas,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  Callback,
  Column,
  Row,
  Button,
  ClickEvent,
  Color,
  Text,
  Divider,
  Canvas,
  TabsController,
  TabContent,
  BarPosition,
  BarMode,
  Margin,
  Builder,
  Tabs,
  GaugeConfiguration,
  ContentModifier,
  ResourceColor,
  LinearGradient,
  Length,
  Padding,
  WrappedBuilder,
  wrapBuilder,
  Scroller,
  Scroll,
  Flex,
  Gauge,
  ColumnOptions,
  Alignment,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';












































































@Entry
@Component
struct GaugeContentModifier {
  private scroller: Scroller = new Scroller()
  build(){
    Scroll(this.scroller) {
      Column() {
        Flex() {
          Column({ space: 20 } as ColumnOptions) {
            Gauge({
              value: 0,
              min: 0,
              max: 0
            })
            
          }.width('100%')
        }.align(Alignment.Top)
      }
    }
    .scrollable(ScrollDirection.Vertical) 
    .scrollBar(BarState.On) 
    .scrollBarColor(Color.Gray) 
    .scrollBarWidth(10) 
    .friction(0.6)
    .edgeEffect(EdgeEffect.Fade)
  }
}