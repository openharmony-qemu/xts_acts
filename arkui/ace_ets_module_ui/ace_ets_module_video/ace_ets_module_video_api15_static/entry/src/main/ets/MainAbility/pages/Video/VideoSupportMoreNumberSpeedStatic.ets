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

import events_emitter from '@ohos.events.emitter';
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
  Resource,
  Row,
  Text,
  Video,
  VideoController,
  ContentTransitionEffect
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct VideoSupportMoreNumberSpeedStatic {
  @State videoSrc: Resource|string = $rawfile('video.mp4');
  @State previewUri: Resource = $r('app.media.icon');
  @State curRate: number|undefined = undefined;
  @State isAutoPlay: boolean = false;
  @State showControls: boolean = true;
  @State str : string = 'hello'
  controller: VideoController = new VideoController();

  build() {
    Column({space:2} as ColumnOptions) {
      Row() {
        Button('start').onClick(() => {
          this.controller.start()
        }).width(65).height(25).id('VideoSupportMoreNumberSpeedStart')
        Text(this.str).width(65).height(25).id('VideoSupportMoreNumberSpeedText')
      }
      Row() {
        Button('n_0.25').onClick(() => {
          this.curRate = 0.025
          this.str= this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_0.025')
        Button('n_0.125').onClick(() => {
          this.curRate = 0.125
          this.str= this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_0.125')
        Button('n_0.5').onClick(() => {
          this.curRate = 0.5
          this.str= this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_0.5')
      }

      Row() {
        Button('n_1').onClick(() => {
          this.curRate = 1
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_1')
        Button('n_2').onClick(() => {
          this.curRate = 2
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_2')
        Button('n_3').onClick(() => {
          this.curRate = 3
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_3')
      }

      Row() {
        Button('n_4').onClick(() => {
          this.curRate = 4
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_4')
        Button('n_5').onClick(() => {
          this.curRate = 5
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_5')
        Button('n_6').onClick(() => {
          this.curRate = 6
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_6')
      }

      Row() {
        Button('n_7').onClick(() => {
          this.curRate = 7
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_7')
        Button('n_8').onClick(() => {
          this.curRate = 8
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_8')
        Button('n_9').onClick(() => {
          this.curRate = 9
          this.str = this.curRate!.toString()
        }).width(65).height(20).id('VideoSupportMoreNumberSpeed_n_9')
      }

      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller,
      })
        .width(180)
        .height(70)
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
        .onStart(() => {
          console.info('onStart')
        })
        .onPause(() => {
          console.info('onPause')
        })
        .onFinish(() => {
          console.info('onFinish')
        })
        .onError(() => {
          console.info('onError')
        })
        .onStop(() => {
          console.info('onStop')
        })
        .onPrepared(()=>{
          console.log('etsVideo:onPrepared')
        })
        .onAppear(() => {
          console.log('etsVideo:onAppear')
        })
    }
    .width('100%')
    .height('100%')
  }
}
