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
import uiObserver from '@ohos.arkui.observer';
import { Entry, Component, Scroller, Axis, Column, Text, Row, Button, ClickEvent, Margin, Scroll, ForEach, Color,
  TextAlign, ScrollDirection ,
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct scrollAxisHorizontalIndex {
  scroller: Scroller = new Scroller();
  options: uiObserver.ObserverOptions = { id: 'axisHorizontal' } as uiObserver.ObserverOptions; //造成create Page Fail
  private arr: Array<int> = new Array<int>(0, 1, 2, 3, 4, 5)
  @State Id1: string = '0'
  @State axis1: Axis | undefined = undefined

  aboutToAppear(){
      console.log('wj+++++++++++++++++++++++++++++++' );
  }

  build() {
    Column() {
      Column(){
        Text('id: ' + this.Id1).id('scroll_axisHorizontal_id')
        Text('axis: ' + this.axis1).id('scroll_axis_horizontal')
        Row() {
          Button('observer on')
            .onClick((e: ClickEvent) => {
              console.log("========================== observer on click")
              uiObserver.onScrollEvent((info: uiObserver.ScrollEventInfo) => {
                console.info('scrollEventInfo', JSON.stringify(info));
                // console.info('scrollEventInfo axis', JSON.stringify(info.axis));
              });
            })
          Button('observer off')
            .onClick((e: ClickEvent) => {
              console.log("========================== observer off click")
              uiObserver.offScrollEvent();
            })
        }

        Row() {
          Button('observerWithId on')
            .id('axisHorizontal_on')
            .onClick((e: ClickEvent) => {
              console.log('++++++++++++++++++++++++++1')
              uiObserver.onScrollEvent( this.options as uiObserver.ObserverOptions, (info: uiObserver.ScrollEventInfo) => {
                this.Id1 = info!.id as string
                // this.axis1 = info!.axis as Axis//Property 'axis' does not exist on type 'ScrollEventInfo'  //SDK11.13 暂时不支持，以后会支持
                console.info('scrollEventInfo');
                // console.info('scrollEventInfo axis', JSON.stringify(info.axis));
              });
              console.log('++++++++++++++++++++++++++2')
            })
          Button('observerWithId off')
            .id('axisHorizontal_off')
            .onClick((e: ClickEvent) => {
              uiObserver.offScrollEvent( this.options);
            })
        }
      }.margin({top:5} as Margin)

      Column() {
        Scroll(this.scroller) {
          Row() {
            ForEach(this.arr, (item: int) => {
              Text(item.toString())
                .width('30%')
                .height('100%')
                .backgroundColor(Color.Pink)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ right: 10 } as Margin)
            })
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