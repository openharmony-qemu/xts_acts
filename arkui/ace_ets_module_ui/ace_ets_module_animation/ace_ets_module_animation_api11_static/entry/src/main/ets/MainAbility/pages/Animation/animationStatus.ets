/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter';
import {
  AnimationStatus,
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FillMode,
  ImageAnimator,
  Row
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ImageAnimatorExample {
  @State state: AnimationStatus = AnimationStatus.Initial;
  @State reverse: boolean = false;
  @State iterations: int = 1;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      ImageAnimator()
        .key('ImageAnimator')
        .images([
          {
            src: '/comment/bg.jpg',
            duration: 500,
            width: 325,
            height: 200,
            top: 0,
            left: 0
          },
          {
            src: '/comment/bg.jpg',
            duration: 500,
            width: 325,
            height: 200,
            top: 0,
            left: 0
          },
          {
            src: '/comment/bg.jpg',
            duration: 500,
            width: 325,
            height: 200,
            top: 0,
            left: 0
          },
          {
            src: '/comment/bg.jpg',
            duration: 500,
            width: 325,
            height: 200,
            top: 0,
            left: 0
          }
        ])
        .state(this.state)
        .reverse(this.reverse)
        .fixedSize(false)
        .fillMode(FillMode.None)
        .iterations(this.iterations)
        .width(325)
        .height(210)
        .onStart(() => {
          console.info('Start')
        })
        .onPause(() => {
          console.info('Pause')
        })
        .onRepeat(() => {
          console.info('Repeat')
        })
        .onCancel(() => {
          console.info('Cancel')
        })
        .onFinish(() => {
          console.info('Finish')
        })

      Row() {
        Button('start')
          .width(100)
          .padding(5)
          .onClick((e: ClickEvent) => {
            this.state = AnimationStatus.Running
          })

        Button('pause')
          .key('button2')
          .width(100)
          .padding(5)
          .onClick((e: ClickEvent) => {
            this.state = AnimationStatus.Paused
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "animationStatus": this.state,
                } as Record<string, RecordData>
              } as events_emitter.EventData
              let backEvent: events_emitter.InnerEvent = {
                eventId: 56,
                priority: events_emitter.EventPriority.LOW
              } as events_emitter.InnerEvent
              console.info("button2 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })

        Button('stop')
          .key('button3')
          .width(100)
          .padding(5)
          .onClick((e: ClickEvent) => {
            this.state = AnimationStatus.Stopped
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "animationStatus": this.state,
                } as Record<string, RecordData>
              } as events_emitter.EventData
              let backEvent: events_emitter.InnerEvent = {
                eventId: 57,
                priority: events_emitter.EventPriority.LOW
              } as events_emitter.InnerEvent
              console.info("button3 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("button3 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
      }

      Row() {
        Button('reverse')
          .width(100)
          .padding(5)
          .onClick((e: ClickEvent) => {
            this.reverse = !this.reverse
          })
        Button('once')
          .width(100)
          .padding(5)
          .onClick((e: ClickEvent) => {
            this.iterations = 1
          })
        Button('iteration')
          .width(100)
          .padding(5)
          .onClick((e: ClickEvent) => {
            this.iterations = -1
          })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
