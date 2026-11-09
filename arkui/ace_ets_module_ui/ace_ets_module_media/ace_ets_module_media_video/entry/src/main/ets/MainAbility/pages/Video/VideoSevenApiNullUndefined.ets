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

@Entry
@Component
struct VideoSevenApiNullUndefined {
  @State videoSrc: Resource = $rawfile('video.mp4');
  controller: VideoController = new VideoController();
  config: ImageAnalyzerConfig = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT]
  }
  private aiController: ImageAnalyzerController = new ImageAnalyzerController();
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT],
    aiController: this.aiController
  }

  build() {
    Column({space:5}) {
      Video({
        src: this.videoSrc,
        controller: this.controller,
        imageAIOptions: this.options,
      })
        .id('VideoSevenApiNull')
        .width(180)
        .height(50)
        .enableAnalyzer(null)
        .enableShortcutKey(null)
        .muted(null)
        .loop(null)
        .controls(null)
        .autoPlay(null)

      Video({
        src: this.videoSrc,
        controller: this.controller,
        imageAIOptions: this.options
      })
        .id('VideoSevenApiUndefined')
        .width(180)
        .height(50)
        .enableAnalyzer(undefined)
        .enableShortcutKey(undefined)
        .muted(undefined)
        .loop(undefined)
        .controls(undefined)
        .autoPlay(undefined)

      Button('start').onClick(() => {
        this.controller.start();
      }).id('SetVideoStart').width(65).height(15)

      Button('requestFullscreenNUll').onClick(() => {
        this.controller.requestFullscreen(null);
      }).id('SetRequestFullscreenNUll').width(150).height(15)

      Button('requestFullscreenUndefined').onClick(() => {
        this.controller.requestFullscreen(null);
      }).id('SetRequestFullscreenNUll').width(150).height(15)

    }.width('100%').height('100%')
  }
}
