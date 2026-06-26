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
struct videoControllerAsync {
  @State videoSrc: Resource = $rawfile('VID_1.mp4');
  @State showFirstFrame: boolean = false;
  @State str: string = 'hello'
  @State str1: string = 'hello'
  public controller: VideoControllerAsync = new VideoControllerAsync();

  build() {
    Column({space:2}) {
      Text(this.str).height(15).id('videoControllerAsyncText')
      Text(this.str1).height(15).id('videoControllerAsyncText1')
      Row() {
        Button('start')
          .onClick(() => {
            this.controller.start()
              .then(() => {
                console.info('start succeed');
              })
              .catch((err: BusinessError) => {
                console.info(`start failed: ${err.message}`);
              });
          })
          .id('videoControllerAsyncStart')
          .width(65)
          .height(15)
        Button('pause')
          .onClick(() => {
            this.controller.pause()
              .then(() => {
                console.info('pause succeed');
              })
              .catch((err: BusinessError) => {
                console.info(`pause failed: ${err.message}`);
              });
          })
          .id('videoControllerAsyncPause')
          .width(65)
          .height(15)
        Button('setTime')
          .onClick(() => {
            this.controller.setCurrentTime(1,SeekMode.PreviousKeyframe)
            this.str = 'setCurrentTime'
          })
          .id('videoControllerAsyncSetTime')
          .width(65)
          .height(15)
      }
      Row(){
        Button('stop')
          .onClick(() => {
            this.controller.stop()
              .then(() => {
                console.info('stop succeed');
              })
              .catch((err: BusinessError) => {
                console.info(`stop failed: ${err.message}`);
              });
          })
          .id('videoControllerAsyncStop')
          .width(65)
          .height(15)
        Button('reset')
          .onClick(() => {
            this.controller.reset()
              .then(() => {
                this.str1 = 'reset'
                console.info('reset succeed');
              })
              .catch((err: BusinessError) => {
                console.info(`reset failed: ${err.message}`);
              });
          })
          .id('videoControllerAsyncReset')
          .width(65)
          .height(15)
        Button('requestFullscreen')
          .onClick(() => {
            this.controller.requestFullscreen(true)
            setTimeout(() => {
              this.controller.exitFullscreen()
            }, 2000);
          })
          .id('videoControllerAsyncRequestFullscreen')
          .width(65)
          .height(15)
      }
      Row(){
        Button('setNull')
          .onClick(() => {
            this.controller.setCurrentTime(null,null)
            this.controller.requestFullscreen(null)
          })
          .id('videoControllerAsyncSetNull')
          .width(65)
          .height(15)
        Button('setUndefined')
          .onClick(() => {
            this.controller.setCurrentTime(undefined,undefined)
            this.controller.requestFullscreen(undefined)
          })
          .id('videoControllerAsyncSetUndefined')
          .width(65)
          .height(15)
        Button('setFalse')
          .onClick(() => {
            this.controller.requestFullscreen(false)
          })
          .id('videoControllerAsyncSetFalse')
          .width(70)
          .height(15)
      }
      Row(){
        Button('setTime1')
          .onClick(() => {
            this.controller.setCurrentTime(1,SeekMode.NextKeyframe)
          })
          .id('videoControllerAsyncSetTime1')
          .width(70)
          .height(15)
        Button('setTime2')
          .onClick(() => {
            this.controller.setCurrentTime(1,SeekMode.ClosestKeyframe)
          })
          .id('videoControllerAsyncSetTime2')
          .width(70)
          .height(15)
        Button('setTime3')
          .onClick(() => {
            this.controller.setCurrentTime(1,SeekMode.Accurate)
          })
          .id('videoControllerAsyncSetTime3')
          .width(70)
          .height(15)
      }
      Video({
        src: this.videoSrc,
        controllerAsync: this.controller
      })
        .width(180)
        .height(60)
        .onStart(() => {
          this.str = 'onStart'
          console.info('onStart');
        })
        .onPause(() => {
          this.str = 'onPause'
          console.info('onPause');
        })
        .onFinish(() => {
          this.str = 'onFinish'
          console.info('onFinish');
        })
        .onError(() => {
          this.str = 'onError'
          console.error('onError');
        })
        .onStop(() => {
          this.str = 'onStop'
          console.info('onStop');
        })
        .onPrepared((e?: videoControllerAsyncDurationObject) => {
          if (e != undefined) {
            this.str = 'onPrepared'
            console.info(`onPrepared is ${e.duration}`);
          }
        })
        .onSeeking((e?: videoControllerAsyncTimeObject) => {
          if (e != undefined) {
            this.str = 'onSeeking'
            console.info(`onSeeking is ${e.time}`);
          }
        })
        .onSeeked((e?: videoControllerAsyncTimeObject) => {
          if (e != undefined) {
            this.str = 'onSeeked'
            console.info(`onSeeked is ${e.time}`);
          }
        })
        .onUpdate((e?: videoControllerAsyncTimeObject) => {
          if (e != undefined) {
            this.str1 = 'onUpdate'
            console.info(`onUpdate is ${e.time}`);
          }
        })
        .onFullscreenChange((e?: videoControllerAsyncFullscreenObject) => {
          if (e != undefined) {
            this.str = 'onFullscreenChange_' + e.fullscreen
            console.info(`onFullscreenChange is ${e.fullscreen}`);
          }
        })
    }.width('100%').height('100%')
  }
}

interface videoControllerAsyncDurationObject {
  duration: number;
}

interface videoControllerAsyncTimeObject {
  time: number;
}

interface videoControllerAsyncFullscreenObject {
  fullscreen: boolean;
}