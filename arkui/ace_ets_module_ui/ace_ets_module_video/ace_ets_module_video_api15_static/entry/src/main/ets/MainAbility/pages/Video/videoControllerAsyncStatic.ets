'use static';

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  $r,
  $rawfile,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  PlaybackInfo,
  PlaybackSpeed,
  PreparedInfo,
  FullscreenInfo,
  Resource,
  Row,
  Text,
  Video,
  SeekMode,
  VideoController,
  VideoControllerAsync,
  ContentTransitionEffect
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct videoControllerAsyncStatic {
  @State videoSrc: Resource = $rawfile('VID_1.mp4');
  @State showFirstFrame: boolean = false;
  @State str: string = 'hello'
  @State str1: string = 'hello'
  public controller: VideoControllerAsync = new VideoControllerAsync();

  build() {
    Column({space:2} as ColumnOptions) {
      Text(this.str).height(20).id('videoControllerAsyncText')
      Text(this.str1).height(20).id('videoControllerAsyncText1')
      Row() {
        Button('start')
          .onClick(() => {
            this.controller.start()
              .then(() => {
                console.info('jyy start succeed');
              })
          })
          .id('videoControllerAsyncStart')
          .width(65)
          .height(20)
        Button('pause')
          .onClick(() => {
            this.controller.pause()
              .then(() => {
                console.info('jyy pause succeed');
              })
          })
          .id('videoControllerAsyncPause')
          .width(65)
          .height(20)
        Button('setTime')
          .onClick(() => {
            this.controller.setCurrentTime(1,SeekMode.PreviousKeyframe)
            this.str = 'setCurrentTime'
          })
          .id('videoControllerAsyncSetTime')
          .width(65)
          .height(20)
      }
      Row(){
        Button('stop')
          .onClick(() => {
            this.controller.stop()
              .then(() => {
                console.info('jyy stop succeed');
              })
          })
          .id('videoControllerAsyncStop')
          .width(65)
          .height(20)
        Button('reset')
          .onClick(() => {
            this.controller.reset()
              .then(() => {
                this.str1 = 'reset'
                console.info('jyy reset succeed');
              })
          })
          .id('videoControllerAsyncReset')
          .width(65)
          .height(20)
        Button('requestFullscreen')
          .onClick(() => {
            this.controller.requestFullscreen(true)
            setTimeout(() => {
              this.controller.exitFullscreen()
            }, 2000);
          })
          .id('videoControllerAsyncRequestFullscreen')
          .width(65)
          .height(20)
      }
      Row(){
        Button('setNull')
          .onClick(() => {
            
          })
          .id('videoControllerAsyncSetNull')
          .width(65)
          .height(20)
        Button('setUndefined')
          .onClick(() => {

          })
          .id('videoControllerAsyncSetUndefined')
          .width(65)
          .height(20)
        Button('setFalse')
          .onClick(() => {
            this.controller.requestFullscreen(false)
          })
          .id('videoControllerAsyncSetFalse')
          .width(65)
          .height(20)
      }
      Video({
        src: this.videoSrc,
        controllerAsync: this.controller
      })
        .width(180)
        .height(60)
        .onStart(() => {
          this.str = 'onStart'
          console.info('jyy onStart');
        })
        .onPause(() => {
          this.str = 'onPause'
          console.info('jyy onPause');
        })
        .onFinish(() => {
          this.str = 'onFinish'
          console.info('jyy onFinish');
        })
        .onError(() => {
          this.str = 'onError'
          console.error('jyy onError');
        })
        .onStop(() => {
          this.str = 'onStop'
          console.info('jyy onStop');
        })
        .onPrepared((e?: PreparedInfo) => {
          if (e != undefined) {
            this.str = 'onPrepared'
            console.info(`jyy onPrepared is ${e.duration}`);
          }
        })
        .onSeeking((e?: PlaybackInfo) => {
          if (e != undefined) {
            this.str = 'onSeeking'
            console.info(`jyy onSeeking is ${e.time}`);
          }
        })
        .onSeeked((e?: PlaybackInfo) => {
          if (e != undefined) {
            this.str = 'onSeeked'
            console.info(`jyy onSeeked is ${e.time}`);
          }
        })
        .onUpdate((e?: PlaybackInfo) => {
          if (e != undefined) {
            this.str1 = 'onUpdate'
            console.info(`jyy onUpdate is ${e.time}`);
          }
        })
        .onFullscreenChange((e?: FullscreenInfo) => {
          if (e != undefined) {
            this.str = 'onFullscreenChange_' + e.fullscreen
            console.info(`jyy onFullscreenChange is ${e.fullscreen}`);
          }
        })
    }.width('100%').height('100%')
  }
}

