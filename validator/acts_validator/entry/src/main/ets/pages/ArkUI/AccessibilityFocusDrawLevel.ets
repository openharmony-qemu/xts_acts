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

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';

const TAG = '[AccessibilityFocusDrawLevel]';

@Entry
@Component
struct AccessibilityFocusDrawLevel {
  @State name: string = 'AccessibilityFocusDrawLevel';
  @State stepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n' +
    '设备支持屏幕朗读时\n' +
    '测试目的: 验证 AccessibilityFocusDrawLevel 接口在不同入参情况下的表现，验证由于组件被遮挡的情况下无障碍绿框仍然可以正常显示\n' +
    '\n' +
    '操作步骤:\n' +
    '1、开启屏幕朗读功能\n' +
    '2、聚焦在支持按钮在侧面依次下滑，听取播报以及界面无障碍绿框显示\n' +
    '\n' +
    '预期结果:\n' +
    '2、依次播报 “文本1”,界面无绿框聚焦; “文本2”,界面有绿框聚焦在最上层文本6上; “文本3”,界面无绿框聚焦; “文本4”,界面无绿框聚焦;\n' +
    '“文本5”,界面有绿框聚焦在文本5上; “文本6”,界面有绿框聚焦在文本6上;\n';
  @State vueStatus: boolean = false;
  @State step1: boolean = false;
  @State step2: boolean = false;
  @State step3: boolean = false;
  @State step4: boolean = false;
  @State step5: boolean = false;
  @State step6: boolean = false;
  @State testResult1: boolean = false;
  @State yesEnable: boolean = false;
  @State intervalNum: number = 0;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.vueStatus) {
      Button({ stateEffect: this.vueStatus }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/ArkUI/ArkUI_index',
          params: {
            result: 'true ',
            title: this.name,
          }
        })
        promptAction.showToast({
          message: '通过',
          duration: 1000
        });
      })
    } else {
      Button({ stateEffect: this.vueStatus }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {
      })
    }
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false',
          title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败',
        duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.step1 && this.step2 && this.step3 && this.step4 && this.step5 && this.step6) {
        this.vueStatus = true;
      }
    }, 500)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
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

      Row({ space: 10 }) {
        Text(`是否设备支持屏幕朗读`)
          .fontColor(Color.Green)
          .fontSize('14fp')
          .margin({ top: 10 })
      }

      Row({ space: 10 }) {
        Column() {
          Button(`不支持`)
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width('30%')
            .enabled(!this.yesEnable)
            .opacity(!this.yesEnable ? 1 : 0.4)
            .onClick(async () => {
            })
        }

        Column() {
          Button(`支持`)
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width('30%')
            .onClick(async () => {
              this.yesEnable = true;
            })
        }
      }
      .height('6%')

      Scroll() {
        Column({ space: 8 }) {
          Column() {
            Stack() {
              Column() {
                Text('文本1')
                  .fontSize(18)
                  .fontColor('#2D2D2D')
                  .fontWeight(FontWeight.Medium)
                  .accessibilityFocusDrawLevel(FocusDrawLevel.SELF)
                  .onAccessibilityHover((isHover: boolean) => {
                    if (isHover) {
                      this.step1 = true
                    }
                  })
                Text('文本2')
                  .fontSize(18)
                  .fontColor('#2D2D2D')
                  .fontWeight(FontWeight.Medium)
                  .accessibilityFocusDrawLevel(FocusDrawLevel.TOP)
                  .onAccessibilityHover((isHover: boolean) => {
                    if (isHover) {
                      this.step2 = true
                    }
                  })
              }
              .padding({ top: 8, bottom: 8 })

              Column() {
                Text('文本3')
                  .fontSize(18)
                  .fontColor('#FFFFFF')
                  .fontWeight(FontWeight.Medium)
                  .accessibilityFocusDrawLevel(null)
                  .onAccessibilityHover((isHover: boolean) => {
                    if (isHover) {
                      this.step3 = true
                    }
                  })
                Text('文本4')
                  .fontSize(18)
                  .fontColor('#FFFFFF')
                  .fontWeight(FontWeight.Medium)
                  .accessibilityFocusDrawLevel(undefined)
                  .onAccessibilityHover((isHover: boolean) => {
                    if (isHover) {
                      this.step4 = true
                    }
                  })
              }
              .padding({ top: 8, bottom: 8 })

              Column() {
                Text('文本5')
                  .fontSize(18)
                  .fontColor('#FFFFFF')
                  .fontWeight(FontWeight.Medium)
                  .onAccessibilityHover((isHover: boolean) => {
                    if (isHover) {
                      this.step5 = true
                    }
                  })
                Text('文本6')
                  .fontSize(18)
                  .fontColor('#FFFFFF')
                  .fontWeight(FontWeight.Medium)
                  .onAccessibilityHover((isHover: boolean) => {
                    if (isHover) {
                      this.step6 = true
                    }
                  })
              }
              .backgroundColor('#4A90E2')
              .padding({
                left: 12,
                right: 12,
                top: 10,
                bottom: 10
              })
              .borderRadius(6)
            }
            .width('100%')
            .margin({ top: 10, bottom: 10 })
          }
          .width('100%')
          .height('50%')
          .margin({ top: 15 })
        }
        .width('100%')
        .padding({ left: '8vp', right: '8vp' })
      }
      .scrollBar(BarState.Auto)
      .height('60%')
      .width('100%')

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.stepTips,
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
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F7F9FC')
  }
}