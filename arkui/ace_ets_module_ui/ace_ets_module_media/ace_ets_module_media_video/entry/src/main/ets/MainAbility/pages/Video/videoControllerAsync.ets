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
      Text(this.str).height(20).id('videoControllerAsyncText')
      Text(this.str1).height(20).id('videoControllerAsyncText1')
      Row() {
        Button('start')
          .onClick(() => {
            this.controller.start()
              .then(() => {
                console.info('jyy start succeed');
              })
              .catch((err: BusinessError) => {
                console.info(`jyy start failed: ${err.message}`);
              });
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
              .catch((err: BusinessError) => {
                console.info(`jyy pause failed: ${err.message}`);
              });
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
              .catch((err: BusinessError) => {
                console.info(`jyy stop failed: ${err.message}`);
              });
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
              .catch((err: BusinessError) => {
                console.info(`jyy reset failed: ${err.message}`);
              });
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
            this.controller.setCurrentTime(null,null)
            this.controller.requestFullscreen(null)
          })
          .id('videoControllerAsyncSetNull')
          .width(65)
          .height(20)
        Button('setUndefined')
          .onClick(() => {
            this.controller.setCurrentTime(undefined,undefined)
            this.controller.requestFullscreen(undefined)
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
        .onPrepared((e?: videoControllerAsyncDurationObject) => {
          if (e != undefined) {
            this.str = 'onPrepared'
            console.info(`jyy onPrepared is ${e.duration}`);
          }
        })
        .onSeeking((e?: videoControllerAsyncTimeObject) => {
          if (e != undefined) {
            this.str = 'onSeeking'
            console.info(`jyy onSeeking is ${e.time}`);
          }
        })
        .onSeeked((e?: videoControllerAsyncTimeObject) => {
          if (e != undefined) {
            this.str = 'onSeeked'
            console.info(`jyy onSeeked is ${e.time}`);
          }
        })
        .onUpdate((e?: videoControllerAsyncTimeObject) => {
          if (e != undefined) {
            this.str1 = 'onUpdate'
            console.info(`jyy onUpdate is ${e.time}`);
          }
        })
        .onFullscreenChange((e?: videoControllerAsyncFullscreenObject) => {
          if (e != undefined) {
            this.str = 'onFullscreenChange_' + e.fullscreen
            console.info(`jyy onFullscreenChange is ${e.fullscreen}`);
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