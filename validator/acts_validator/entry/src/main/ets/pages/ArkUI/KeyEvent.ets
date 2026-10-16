/**

 Copyright (c) 2025 Huawei Device Co., Ltd.
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import nativeKeyEvent from "libnativeKeyEvent.so";

const TAG = '[keyEvent]';

@Entry
@Component
struct keyEventExample {
  @State text: string = ''
  @State name: string = 'KeyEvent';
  @State keyEventVue: boolean = false;
  @State intervalNum: number = 0;
  @State StepTips: string = '操作步骤：\n上方按键默认获焦，使用键盘分别点击CapsLock、NumLock键查看返回值。\n按Tab键走焦到下方按键后，再使用键盘分别点击CapsLock、NumLock键查看返回值。\n预期结果：上方按键接口返回结果随键盘指示灯亮起熄灭(若灯不亮与此接口无关为设备驱动问题)分别为true和false(下方显示ON/OFF)'
  @State dragSuccess: Boolean = false
  @State capiVue: boolean = false

  aboutToAppear(): void {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  aboutToDisappear(): void {
    clearInterval(this.intervalNum)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.dragSuccess) {
        this.keyEventVue = true
      }
      if (nativeKeyEvent.isKeyEventCompleted()) {
        this.capiVue = true
      }
    }, 500)
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.keyEventVue && this.capiVue }) {
      Image($r('app.media.ic_public_pass'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .opacity(this.keyEventVue && this.capiVue ? 1 : 0.4)
    .enabled(this.keyEventVue && this.capiVue)
    .onClick(() => {
      globalThis.arkResult = 'true ';
      globalThis.arkTitle = this.name;
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'true ', title: this.name,
        }
      })
      promptAction.showToast({
        message: '通过', duration: 1000
      });
    })
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          })
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)


      Column() {
        Text(this.text).padding(15).margin(10).key('keyInfo')
        Button('KeyEvent')
          .onKeyEvent((event?: KeyEvent) => {
            if (event) {
              this.text = '\nkeyCode:' + event.keyCode + '\nkeyText:' + event.keyText +
                '\nisNumLockOn: ' + event.isNumLockOn + '\nisCapsLockOn: ' + event.isCapsLockOn
              this.dragSuccess = true
            }
          })
          .focusable(true)
          .defaultFocus(true)

        XComponent({
          id: 'xcomponentId',
          type: "node",
          libraryname: 'nativeKeyEvent'
        })
          .onAppear(() => {
            try {
              nativeKeyEvent.createNativeNode("xcomponentId", this.getUIContext());
            } catch (e) {
              console.error('nativeKeyEvent not supported: ' + JSON.stringify(e));
            }
          })
          .focusable(true)
          .focusOnTouch(true)
          .width('100%')
          .height('30%')
      }.height('80%')
      .width('100%')
      .backgroundColor(Color.White)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .margin({ bottom: '20vp' })
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.StepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })

        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)

    }.height('100%').width('100%')
    .backgroundColor('#F1F3F5')
  }
}