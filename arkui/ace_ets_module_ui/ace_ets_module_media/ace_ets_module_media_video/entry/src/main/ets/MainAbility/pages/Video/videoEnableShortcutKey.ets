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

@Entry
@Component
struct videoEnableShortcutKey {
  @State videoSrc: Resource = $rawfile('video.mp4')
  @State previewUri: Resource = $r('app.media.icon')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State isLoop: boolean = false
  @State showControls: boolean = true
  @State enableShortcutKey: boolean = true
  @State content: string = 'init'
  @State content2: string = '0'
  controller: VideoController = new VideoController()

  build() {
    Column({space:3}) {
      Text(this.content).key('videoEnableShortcutKey_text').height(15)
      Text(this.content2).key('videoEnableShortcutKey_text2').height(15)
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller
      })
        .width(205)
        .height(100)
        .autoPlay(this.isAutoPlay)
        .loop(this.isLoop)
        .controls(this.showControls)
        .enableShortcutKey(this.enableShortcutKey)
        .focusable(true)
        .defaultFocus(true) 
        .key('videoEnableShortcutKey_video')
        .onStart(() => {
          this.content = 'onStart'
        })
        .onPause(() => {
          this.content = 'onPause'
        })
        .onUpdate((e?: TimeObject) => {
          if (e != undefined) {
            console.info('onUpdate is ' + e.time)
            this.content2 = e.time.toString()
          }
        })

      Row() {
        Button('reset').key('videoEnableShortcutKey_reset').onClick(() => {
          this.controller.reset()
        }).height(15)
      }

      Row() {
        Button('change_1').key('videoEnableShortcutKey_showControls').onClick(() => {
          this.showControls = !this.showControls
          this.content = 'init'
        }).height(15)
        Button('change_2').key('videoEnableShortcutKey_enableShortcutKey').onClick(() => {
          this.enableShortcutKey = !this.enableShortcutKey
          this.content = 'init'
        }).height(15)
      }
    }.width('100%').width('100%')
  }
}

interface TimeObject {
  time: number;
}
