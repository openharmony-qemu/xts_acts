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

import Log from '../../common/Log';
import emitter from '@ohos.events.emitter';
// import mediaquery from '@ohos.mediaquery'
import { mediaquery } from '@kit.ArkUI';
import {
  Entry, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Alignment, TextAlign, TextOverflow,
  Column, ColumnOptions, Row, Builder, TouchEvent,Color, WrappedBuilder, NodeContainer,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint, CustomBuilderT
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext ,MediaQuery} from '@ohos.arkui.UIContext';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct MediaQueryOff {
  @State color: string = '#000'
  @State text: string = 'Test'
  // listener:mediaquery.MediaQueryListener = mediaquery.matchMediaSync('(orientation: landscape)')
 listener: mediaquery.MediaQueryListener | undefined = UIContext.getFocusedUIContext()?.getMediaQuery()?.matchMediaSync('(orientation: landscape)');

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear MediaQueryOff start`)
    if( this.listener != undefined){
      console.log('++++++++listener != undefined')
      try{
        this.listener!.onChange( (mediaQueryResult) => { // 11.17 sdk11.17 appDied
          if (mediaQueryResult.matches) {
            this.color = '#FFD700'
            this.text = 'Landscape'
          } else {
            this.color = '#DB7093'
            this.text = 'Portrait'
          }
        })
      }catch(err){
        console.log('+++++++++++++++listener!.onChange',err)
      }
    } else{
      console.log('++++++++listener = undefined')
    }
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear MediaQueryOff end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text("mediaQuery-Off++++++++++++++++++")
      Text("mediaQuery-Off")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("offText")
        .onClick((e:ClickEvent) => {
          this.listener!.offChange( (mediaQueryResult) => {
            console.log(JSON.stringify(mediaQueryResult))
            let result = true
            try {
              let backData: emitter.EventData = {
                data: {
                  "STATUS": result
                } as Record<String,undefined|null|Object>
              }
              let backEvent: emitter.InnerEvent = {
                eventId: 60218,
                priority: emitter.EventPriority.LOW
              }
              console.info("onSelect start to emit action state")
              emitter.emit(backEvent, backData)
            } catch (err:Error) {
              console.info("onSelect emit action state err: " + JSON.stringify(err.message))
            }
          })
        })

      Text("mediaQuery-MatchMediaSync")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("matchMediaSyncText")
        .onClick((e:ClickEvent) => {
          console.log('+++++++++++++++++++++onClick')  //没有执行这里
          console.log('mediaQuery-MatchMediaSync: ' + JSON.stringify(this.listener))
          let result = (this.listener != null)
          try {
            let backData: emitter.EventData = {
              data: {
                "STATUS": result
              } as Record<String,undefined|null|Object>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 60219,
              priority: emitter.EventPriority.LOW
            }
            console.info("onSelect start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err:Error) {
            console.info("onSelect emit action state err: " + JSON.stringify(err.message))
          }

        })

      Text(this.text)
        .fontSize(50)
        .fontColor(this.color)
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("offText")

    }.width("100%").height("100%")
  }
}

