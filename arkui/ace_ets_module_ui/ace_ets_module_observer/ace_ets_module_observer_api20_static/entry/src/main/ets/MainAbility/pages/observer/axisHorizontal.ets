/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, Scroller, Axis, Scroll, ForEach, ScrollDirection, Color, TextAlign} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'
import observer from '@ohos.arkui.observer';

@Entry
@Component
struct scrollAxisHorizontalIndex {
  scroller: Scroller = new Scroller();
  options: observer.ObserverOptions = { id: 'axisHorizontal' } as observer.ObserverOptions;
  private arr: Array<Double> = new Array<Double>(0, 1, 2, 3, 4, 5)
  @State Id1: string = '0'
  @State axis1: Axis | undefined = undefined

  build() {
    Column() {
      Column(){
        Text('id: ' + this.Id1).id('scroll_axisHorizontal_id')
        Text('axis: ' + this.axis1).id('scroll_axis_horizontal')
        Row() {
          Button('observer on')
            .onClick((e:ClickEvent) => {
              observer.on('scrollEvent', (info) => {
                // console.info('scrollEventInfo', JSON.stringify(info));
                // console.info('scrollEventInfo axis', JSON.stringify(info.axis));
              });
            })
          Button('observer off')
            .onClick((e:ClickEvent) => {
              observer.off('scrollEvent');
            })
        }

        Row() {
          Button('observerWithId on')
            .id('axisHorizontal_on')
            .onClick((e:ClickEvent) => {
              observer.on('scrollEvent', this.options, (info: observer.ScrollEventInfo) => {
                this.Id1 = info.id
                // this.axis1 = info.axis
                // console.info('scrollEventInfo', JSON.stringify(info));
                // console.info('scrollEventInfo axis', JSON.stringify(info.axis));
              });
            })
          Button('observerWithId off')
            .id('axisHorizontal_off')
            .onClick((e:ClickEvent) => {
              observer.off('scrollEvent', this.options);
            })
        }
      }.margin({top:5} as Margin)

      Column() {
        Scroll(this.scroller) {
          Row() {
            ForEach(this.arr, (item: Double, index:Double) => {
              Text(item.toString())
                .width('30%')
                .height('100%')
                .backgroundColor(Color.Pink)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ right: 10 } as Margin)
            }, (item: Double) => String(item))
          }.width('90%')
        }
        .id('axisHorizontal')
        .height('60%')
        .scrollable(ScrollDirection.Horizontal)
      }
      .width('100%')

    }
    .height('100%')
  }
}