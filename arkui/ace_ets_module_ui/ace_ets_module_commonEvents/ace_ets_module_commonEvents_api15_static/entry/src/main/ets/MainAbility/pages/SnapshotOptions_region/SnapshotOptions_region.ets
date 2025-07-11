/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from "@ohos.multimedia.image";
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {Image,ForEach,Scroll,ButtonType,Scroller,TextInput,TextClock,TextArea,Checkbox,Alignment,Color,KeyProcessingMode,ColumnOptions,KeyType, KeyEvent,Row, Entry, Column, Text, Button, ClickEvent, Component } from '@ohos.arkui.component'
import { BusinessError } from '@ohos.base';
@Entry
@Component
struct SnapshotExample {
  private arr: number[] = new Array<number>(0)
  scroller: Scroller = new Scroller()
  @State pixmap: image.PixelMap | undefined = undefined
  @State pixmap1: image.PixelMap | undefined = undefined

build() {
    Column({space:10} as ColumnOptions) {
      Row() {
        Column() {
          Text('ABCDE12345')
          TextArea().width(150).height(60)
          Button('Button ABCDE')
          Row() {
            Checkbox()
            Text('√')
            Text( '|' )
            Checkbox()
            Text('×')
          }.align(Alignment.Start)
        }
        .align(Alignment.Start)
        .key('root')
        .width(200)
        .height(200)
        .borderRadius(6)
        .borderWidth(2)
        .borderColor(Color.Green)

        Column() {
          TextClock()
          Button('Button ABCDE').type(ButtonType.Normal)
          Row() {
            Checkbox()
            Text('√')
          }.align(Alignment.Start)

          TextInput()
        }
        .align(Alignment.Start)
        .key('root2')
        .width(200)
        .height(200)
        .borderRadius(6)
        .borderWidth(2)
        .borderColor(Color.Green)
      }

      Column({ space: 10 } as ColumnOptions) {
        Button('SnapshotRegion')
          .id('SnapshotRegion')
          .onClick((e: ClickEvent) => {
            componentSnapshot.get('root', (error: BusinessError<void>|null, pixmap: image.PixelMap|undefined) => {
              if (error) {
                console.log('error:'  + JSON.stringify(error))
                return;
              }
              this.pixmap = pixmap
            }, {
              scale: 1, waitUntilRenderFinished: true,
              region: {
                left: 100,
                right: 200,
                top: 100,
                bottom: 200
              } as componentSnapshot.SnapshotRegion
            })
          })
          Button('SnapshotRegion1')
          .id('SnapshotRegion1')
          .onClick((e: ClickEvent) => {
            componentSnapshot.get('root', (error: BusinessError<void>|null, pixmap1: image.PixelMap|undefined) => {
              if (error) {
                console.log('error:'  + JSON.stringify(error))
                return;
              }
              this.pixmap1 = pixmap1
            }, {
              scale: 1, waitUntilRenderFinished: true,
              region: {
                // left: undefined,
                right: 200,
                top: 100,
                bottom: 200
              } as componentSnapshot.SnapshotRegion
            })
          })

        Button('LocalizedSnapshotRegion')
          .id('LocalizedSnapshotRegion')
          .onClick((e: ClickEvent) => {
            componentSnapshot.get('root2', (error: BusinessError<void>|null, pixmap: image.PixelMap|undefined) => {
              if (error) {
                console.log('error:'  + JSON.stringify(error))
                return;
              }
              this.pixmap = pixmap
            }, {
              scale: 1, waitUntilRenderFinished: true,
              region: {
                start: 100,
                end: 200,
                top: 100,
                bottom: 200
              } as componentSnapshot.LocalizedSnapshotRegion
            })
          })

        Button('LocalizedSnapshotRegion1')
          .id('LocalizedSnapshotRegion1')
          .onClick((e: ClickEvent) => {
            componentSnapshot.get('root2', (error: BusinessError<void>|null, pixmap1: image.PixelMap|undefined) => {
              if (error) {
                console.log('error:'  + JSON.stringify(error))
                return;
              }
              this.pixmap1 = pixmap1
            }, {
              scale: 1, waitUntilRenderFinished: true,
              region: {
                // start: undefined,
                end: 200,
                top: 150,
                bottom: 200
              } as componentSnapshot.LocalizedSnapshotRegion
            })
          })
      }
      Scroll(this.scroller) {
        Column({space:5} as ColumnOptions) {
          ForEach(this.arr, (item: number) => {
      Image(this.pixmap as image.PixelMap ).margin(5).key('image1')
      Image(this.pixmap1 as image.PixelMap).margin(5).key('image2')
          }, (item: number) => String(item))
        }
      }.height('50%')
    }
  }

}