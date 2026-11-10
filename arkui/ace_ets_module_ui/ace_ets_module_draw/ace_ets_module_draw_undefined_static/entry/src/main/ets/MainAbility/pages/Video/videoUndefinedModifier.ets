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
  Entry, Text, Column, Component, Button, ClickEvent, Video, Resource, $rawfile, Row, VideoController,
  SeekMode, ImageFit, AttributeModifier, VideoAttribute, ColumnOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<VideoAttribute> {
  public eventValue: string = 'value';
  public isOnUpdate: boolean = false;
  public isOnPrepared: boolean = false;
  public isOnFullscreenChange: boolean = false;
  public isOnFinish: boolean = false;
  public isOnPause: boolean = false;
  public isOnStart: boolean = false;
  public isOnStop: boolean = false;
  public isLoop: boolean = false;
  public isMuted: boolean = false;
  public isAutoPlay: boolean = false;
  public isControls: boolean = false;
  public isObjectFit: boolean = false;
  applyNormalAttribute(instance: VideoAttribute): void {
    instance
      .width(210)
      .height(80)
      .onUpdate(this.isOnUpdate ? () => {
        this.eventValue = 'onUpdateValue';
      } : undefined)
      .onPrepared(this.isOnPrepared ? () => {
        this.eventValue = 'onPreparedValue';
      } : undefined)
      .onFullscreenChange(this.isOnFullscreenChange ? () => {
        this.eventValue = 'onFullscreenChangeValue';
      } : undefined)
      .onFinish(this.isOnFinish ? () => {
        this.eventValue = 'onFinishValue';
      } : undefined)
      .onPause(this.isOnPause ? () => {
        this.eventValue = 'onPauseValue';
      } : undefined)
      .onStart(this.isOnStart ? () => {
        this.eventValue = 'onStartValue';
      } : undefined)
      .onStop(this.isOnStop ? () => {
        this.eventValue = 'onStopValue';
      } : undefined)
      .loop(this.isLoop ? true : undefined)
      .muted(this.isMuted ? true : undefined)
      .autoPlay(this.isAutoPlay ? true : undefined)
      .controls(this.isControls ? false : undefined)
      .objectFit(this.isObjectFit ? ImageFit.Contain : undefined)
  }
}

@Entry
@Component
struct VideoUndefinedModifier1 {
  @State videoSrc: Resource | string = $rawfile('videoTest.mp4');
  controller: VideoController = new VideoController();
  @State modifier: MyModifier = new MyModifier();

  build() {
    Column({space:2} as ColumnOptions) {
      Text('action Video').height(15)
      
      Row() {
        Text(this.modifier.eventValue)
          .id('eventValue_modifier')
          .height(15)
      }

      Row() {
        Button('resetValue').onClick((event: ClickEvent) => {
          this.modifier.eventValue = 'value';
        }).id('reset_modifier').height(15).width(50)
        Button('0').onClick((event: ClickEvent) => {
          this.controller.setCurrentTime(5, SeekMode.Accurate);
          this.controller.reset();
        }).id('onUpdate_modifier').height(15).width(50)
        Button('1').onClick((event: ClickEvent) => {
          if (this.videoSrc == 'videoError.mp4') {
            this.videoSrc = $rawfile('videoTest.mp4');
          } else {
            this.videoSrc = 'videoError.mp4';
          }
        }).id('onPrepared_modifier').height(15).width(50)
        Button('2').onClick((event: ClickEvent) => {
          this.controller.requestFullscreen(true);
          this.controller.exitFullscreen();
        }).id('onFullscreenChange_modifier').height(15).width(50)
      }

      Row() {
        Button('3').onClick((event: ClickEvent) => {
          this.controller.setCurrentTime(8, SeekMode.Accurate);
          this.controller.start();
        }).id('onFinish_modifier').height(15).width(50)
        Button('4').onClick((event: ClickEvent) => {
          this.controller.pause();
        }).id('onPause_modifier').height(15).width(50)
        Button('5').onClick((event: ClickEvent) => {
          this.controller.reset();
          this.controller.start();
        }).id('onStart_modifier').height(15).width(50)
        Button('6').onClick((event: ClickEvent) => {
          this.controller.stop();
        }).id('onStop_modifier').height(15).width(50)
      }

      Row() {
        Button('0' + this.modifier.isOnUpdate).onClick((event: ClickEvent) => {
          this.modifier.isOnUpdate = !this.modifier.isOnUpdate;
        }).id('onUpdate_action_modifier').height(15).width(50)
        Button('1' + this.modifier.isOnPrepared).onClick((event: ClickEvent) => {
          this.modifier.isOnPrepared = !this.modifier.isOnPrepared;
        }).id('onPrepared_action_modifier').height(15).width(50)
        Button('2' + this.modifier.isOnFullscreenChange).onClick((event: ClickEvent) => {
          this.modifier.isOnFullscreenChange = !this.modifier.isOnFullscreenChange;
        }).id('onFullscreenChange_action_modifier').height(15).width(50)
        Button('3' + this.modifier.isOnFinish).onClick((event: ClickEvent) => {
          this.modifier.isOnFinish = !this.modifier.isOnFinish;
        }).id('onFinish_action_modifier').height(15).width(50)
      }

      Row() {
        Button('4' + this.modifier.isOnPause).onClick((event: ClickEvent) => {
          this.modifier.isOnPause = !this.modifier.isOnPause;
        }).id('onPause_action_modifier').height(15).width(50)
        Button('5' + this.modifier.isOnStart).onClick((event: ClickEvent) => {
          this.modifier.isOnStart = !this.modifier.isOnStart;
        }).id('onStart_action_modifier').height(15).width(50)
        Button('6' + this.modifier.isOnStop).onClick((event: ClickEvent) => {
          this.modifier.isOnStop = !this.modifier.isOnStop;
        }).id('onStop_action_modifier').height(15).width(50)
        Button('7' + this.modifier.isLoop).onClick((event: ClickEvent) => {
          this.modifier.isLoop = !this.modifier.isLoop;
        }).id('loop_action_modifier').height(15).width(50)
      }

      Row() {
        Button('8' + this.modifier.isMuted).onClick((event: ClickEvent) => {
          this.modifier.isMuted = !this.modifier.isMuted;
        }).id('muted_action_modifier').height(15).width(50)
        Button('9' + this.modifier.isAutoPlay).onClick((event: ClickEvent) => {
          this.modifier.isAutoPlay = !this.modifier.isAutoPlay;
        }).id('autoPlay_action_modifier').height(15).width(50)
        Button('10' + this.modifier.isControls).onClick((event: ClickEvent) => {
          this.modifier.isControls = !this.modifier.isControls;
        }).id('controls_action_modifier').height(15).width(50)
        Button('11' + this.modifier.isObjectFit).onClick((event: ClickEvent) => {
          this.modifier.isObjectFit = !this.modifier.isObjectFit;
        }).id('objectFit_action_modifier').height(15).width(50)
      }

      Video({
        src: this.videoSrc,
        controller: this.controller,
      })
        .id('video_action_modifier')
        .attributeModifier(this.modifier)
    }
    .width('100%')
    .height('100%')
  }
}