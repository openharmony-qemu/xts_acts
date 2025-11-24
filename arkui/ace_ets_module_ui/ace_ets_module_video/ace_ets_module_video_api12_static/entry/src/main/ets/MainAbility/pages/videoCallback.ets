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
import emitter from '@ohos.events.emitter';
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,ClickEvent,$rawfile,
  Text,Video,Row,Button,
  Color,PlaybackSpeed,Resource,VideoController,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,
} from '@ohos.arkui.stateManagement';
// xxx.ets
@Entry
@Component
struct videoCallbackTest {
  @State videoSrc: Resource = $rawfile('video.mp4')
  @State previewUri: Resource = $r('app.media.icon')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  controller: VideoController = new VideoController()

  build() {
    Column() {
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller
      })
        .width('100%')
        .height('50%')
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
        .onStart((): void => {
          let eventData: emitter.EventData = {
            data: {
              "action": 'onStart'
            } as Record<String,undefined|null|Object>
          } as emitter.EventData
          let event: emitter.InnerEvent = {
            eventId: 50101,
            priority: emitter.EventPriority.LOW
          } as emitter.InnerEvent
          emitter.emit(event, eventData)
        })
        .onPause((): void => {
        })
        .onFinish((): void => {
          console.info(' onFinish')
        })
        .onError((): void => {
          console.info(' onError')
        })
        .onStop((): void => {
          console.info(' ETS  onStop')
          let eventData2: emitter.EventData = {
            data: {
              "action": 'onStop'
            } as Record<String,undefined|null|Object>
          } as emitter.EventData
          let event2: emitter.InnerEvent = {
            eventId: 50102,
            priority: emitter.EventPriority.LOW
          } as emitter.InnerEvent
          emitter.emit(event2, eventData2)
        })
        .onPrepared((e?: DurationObject): void => {
          if (e != undefined) {
            console.info(' onPrepared is ' + e.duration)
          }
        })
        .onSeeking((e?: TimeObject): void => {
          if (e != undefined) {
            console.info(' onSeeking is ' + e.time)
          }
        })
        .onSeeked((e?: TimeObject): void => {
          if (e != undefined) {
            console.info(' onSeeked is ' + e.time)
          }
        })
        .onUpdate((e?: TimeObject): void => {
          if (e != undefined) {
            console.info(' onUpdate is ' + e.time)
          }
        })

      Row() {
        Button('start').id('start').onClick((e: ClickEvent) => {
          this.controller.start() // 开始播放
        }).margin(5)
        Button('pause').id('pause').onClick((e: ClickEvent) => {
          this.controller.pause() // 暂停播放
        }).margin(5)
        Button('stop').id('stop').onClick((e: ClickEvent) => {
          this.controller.stop() // 结束播放
        }).margin(5)
      }
    }
  }
}

interface DurationObject {
  duration: number;
}

interface TimeObject {
  time: number;
}