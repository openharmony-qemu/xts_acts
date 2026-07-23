'use static';

/*
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
  Text,
  Button,
  Callback,
  ClickEvent,
  Column,
  Component,
  Entry,
  PreparedInfo,
  PlaybackInfo,
  PlaybackSpeed,
  PosterOptions,
  FullscreenInfo,
  Row,
  ColumnOptions,
  Resource,
  SeekMode,
  State,
  Video,
  VideoController,
  VideoOptions,
  VoidCallback,
  $r,
  $rawfile,
  Image,
  ImageFit,
  ImageAIOptions,
  ImageAnalyzerType,
  ImageAnalyzerConfig,
  CanvasRenderingContext2D,
  Canvas,
  RenderingContextSettings,
  ImageBitmap
} from '@kit.ArkUI';

@Entry
@Component
struct VideoTest1 {
  @State videoSrc: Resource = $rawfile('test2.mp4')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = false
  @State isShortcutKeyEnabled: boolean = false
  @State showFirstFrame: boolean = false
  @State text: string = '0'
  private controller: VideoController = new VideoController()
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT],
  } as ImageAIOptions
  private config: ImageAnalyzerConfig = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT]
  } as ImageAnalyzerConfig

  build() {
    Column({space:3} as ColumnOptions) {
      Text(this.text).height(20).id('VideoTest1_text')
      Video({
        src: this.videoSrc,
        currentProgressRate: this.curRate,
        controller: this.controller,
        posterOptions: { showFirstFrame: this.showFirstFrame } as PosterOptions,
        imageAIOptions: this.options
      } as VideoOptions)
        .width(180)
        .height(100)
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
        .enableAnalyzer(true)
        .analyzerConfig(this.config as ImageAnalyzerConfig)
        .onStart(() => {
          console.info('onStart')
        })
        .onStop(() => {
          this.text = 'onStop'
        })
        .onPause(() => {
          this.text = 'onStop'
        })

      Row() {
        Button('start').onClick((e: ClickEvent) => {
          this.controller.start()
        })
          .height(20)
          .id('VideoTest1_start')

        Button('pause').onClick((e: ClickEvent) => {
          this.controller.pause()
        })
          .height(20)
          .id('VideoTest1_stop')
      }
    }.width('100%').height('100%')
  }
}