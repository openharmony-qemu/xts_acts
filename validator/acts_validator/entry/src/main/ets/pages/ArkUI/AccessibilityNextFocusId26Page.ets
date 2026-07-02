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

const TAG = '[AccessibilityNextFocusId26Page]';

@Entry
@Component
struct AccessibilityNextFocusId26Page {
  @State name: string = 'AccessibilityNextFocusId26Page';
  @State stepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n' +
    '设备支持屏幕朗读时\n' +
    '测试目的: 验证 accessibilityNextFocusId26+ 接口在不同入参情况下的表现\n' +
    '\n' +
    '操作步骤:\n' +
    '1、开启屏幕朗读功能\n' +
    '2、点击"支持"按钮确认设备支持屏幕朗读\n' +
    '3、依次滑动测试以下组件:\n' +
    '   - "正常入参-不传params"区域: A1获焦，无论上下滑走焦都是A1 A2循环\n' +
    '   - "正常入参-params=undefined"区域: B1获焦，无论上下滑都是B1 B2 循环\n' +
    '   - "isConsiderDescendants=false"区域: C1获焦下滑 → C4下滑 → C1，C1获焦上滑 → C4 → testC3,testC2获焦下滑→testC3 下滑→isConsiderDescendants=true文本组件。\n' +
    '   - testC3获焦上滑走焦：testC3 → testC2 → C4 → testC3\n' +
    '   - "isConsiderDescendants=true"区域: D1获焦下滑测试：D1 → testD2 → testD3 → D4 → D1;  D1获焦上滑 → D4 → testD3; \n' +
    '   - testD3获焦上滑走焦：testD3 → testD2 → D1 → D4 → testD3\n' +
    '   - "nextId=null"区域:按钮E获焦下滑 → 按钮F\n' +
    '   - "nextId=undefined"区域:按钮G获焦下滑 → 按钮H\n' +
    '   - "nextId=空字符串"区域:按钮I获焦下滑 → 按钮J\n' +
    '   - "nextId指向不存在组件"区域:按钮K获焦下滑 → 按钮L\n' +
    '4、所有测试完成后，点击"通过"按钮\n' +
    '\n' +
    '预期结果:\n' +
    '1、焦点正确跳转到指定目标组件\n'

  @State vueStatus: boolean = false;
  @State yesEnable: boolean = false;

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
              this.yesEnable = true
              this.vueStatus = true
            })
        }
      }
      .height('6%')

      Scroll() {
        Column({ space: 8 }) {
          Text('正常入参-不传params')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Row({ space: 10 }) {
            Button('按钮A1')
              .id('btnA1')
              .width('45%')
              .height(40)
              .accessibilityNextFocusId('btnA2')
            Button('按钮A2')
              .id('btnA2')
              .width('45%')
              .height(40)
              .accessibilityNextFocusId('btnA1')
          }
          .width('90%')
          .padding('8vp')
          .margin({ top: '4vp', bottom: '4vp' })
          .borderRadius(8)
          .backgroundColor(0xF1F3F5)
          .justifyContent(FlexAlign.Center)

          Divider()
            .margin({ top: '8vp', bottom: '8vp' })

          Text('正常入参-params=undefined')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Row({ space: 10 }) {
            Button('按钮B1')
              .id('btnB1')
              .width('45%')
              .height(40)
              .accessibilityNextFocusId('btnB2', undefined)
            Button('按钮B2')
              .id('btnB2')
              .width('45%')
              .height(40)
              .accessibilityNextFocusId('btnB1', undefined)
          }
          .width('90%')
          .padding('8vp')
          .margin({ top: '4vp', bottom: '4vp' })
          .borderRadius(8)
          .backgroundColor(0xF1F3F5)
          .justifyContent(FlexAlign.Center)

          Divider()
            .margin({ top: '8vp', bottom: '8vp' })

          Text('isConsiderDescendants=false')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Column({ space: 8 }) {
            Row({ space: 5 }) {
              Button('按钮C1')
                .id('btnC1')
                .width('40%')
                .height(40)
                .accessibilityNextFocusId('rowC2', { isConsiderDescendants: false })
              Button('按钮C4')
                .id('btnC4')
                .width('40%')
                .height(40)
                .accessibilityNextFocusId('btnC1', { isConsiderDescendants: false })
            }
            .width('90%')
            .backgroundColor(Color.Pink)
            .padding('4vp')
            .justifyContent(FlexAlign.Center)

            Row({ space: 5 }) {
              Button('testC2')
                .width('40%')
                .height(35)
              Button('testC3')
                .width('40%')
                .height(35)
            }
            .id('rowC2')
            .width('90%')
            .backgroundColor(Color.Brown)
            .padding('4vp')
            .justifyContent(FlexAlign.Center)
            .accessibilityNextFocusId('btnC4', { isConsiderDescendants: false })
          }
          .width('90%')
          .padding('8vp')
          .margin({ top: '4vp', bottom: '4vp' })
          .borderRadius(8)
          .backgroundColor(0xF1F3F5)

          Divider()
            .margin({ top: '8vp', bottom: '8vp' })

          Text('isConsiderDescendants=true')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Column({ space: 8 }) {
            Row({ space: 5 }) {
              Button('按钮D1')
                .id('btnD1')
                .width('40%')
                .height(40)
                .accessibilityNextFocusId('rowD2', { isConsiderDescendants: true })
              Button('按钮D4')
                .id('btnD4')
                .width('40%')
                .height(40)
                .accessibilityNextFocusId('btnD1', { isConsiderDescendants: true })
            }
            .width('90%')
            .backgroundColor(Color.Pink)
            .padding('4vp')
            .justifyContent(FlexAlign.Center)

            Row({ space: 5 }) {
              Button('testD2')
                .width('40%')
                .height(35)
              Button('testD3')
                .width('40%')
                .height(35)
            }
            .id('rowD2')
            .width('90%')
            .backgroundColor(Color.Brown)
            .padding('4vp')
            .justifyContent(FlexAlign.Center)
            .accessibilityNextFocusId('btnD4', { isConsiderDescendants: true })
          }
          .width('90%')
          .padding('8vp')
          .margin({ top: '4vp', bottom: '4vp' })
          .borderRadius(8)
          .backgroundColor(0xF1F3F5)

          Divider()
            .margin({ top: '8vp', bottom: '8vp' })

          Text('nextId=null')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Row({ space: 10 }) {
            Button('按钮E')
              .id('btnE')
              .width('45%')
              .height(40)
              .accessibilityNextFocusId(null, { isConsiderDescendants: true })
            Button('按钮F')
              .id('btnF')
              .width('45%')
              .height(40)
          }
          .width('90%')
          .padding('8vp')
          .margin({ top: '4vp', bottom: '4vp' })
          .borderRadius(8)
          .backgroundColor(0xF1F3F5)
          .justifyContent(FlexAlign.Center)

          Divider()
            .margin({ top: '8vp', bottom: '8vp' })

          Text('nextId=undefined')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Row({ space: 10 }) {
            Button('按钮G')
              .id('btnG')
              .width('45%')
              .height(40)
              .accessibilityNextFocusId(undefined, { isConsiderDescendants: true })
            Button('按钮H')
              .id('btnH')
              .width('45%')
              .height(40)
          }
          .width('90%')
          .padding('8vp')
          .margin({ top: '4vp', bottom: '4vp' })
          .borderRadius(8)
          .backgroundColor(0xF1F3F5)
          .justifyContent(FlexAlign.Center)

          Divider()
            .margin({ top: '8vp', bottom: '8vp' })

          Text('nextId=空字符串')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Row({ space: 10 }) {
            Button('按钮I')
              .id('btnI')
              .width('45%')
              .height(40)
              .accessibilityNextFocusId('', { isConsiderDescendants: true })
            Button('按钮J')
              .id('btnJ')
              .width('45%')
              .height(40)
          }
          .width('90%')
          .padding('8vp')
          .margin({ top: '4vp', bottom: '4vp' })
          .borderRadius(8)
          .backgroundColor(0xF1F3F5)
          .justifyContent(FlexAlign.Center)

          Divider()
            .margin({ top: '8vp', bottom: '8vp' })

          Text('nextId指向不存在组件')
            .fontSize('14fp')
            .fontColor(Color.Black)
            .margin({ top: '8vp' })

          Row({ space: 10 }) {
            Button('按钮K')
              .id('btnK')
              .width('45%')
              .height(40)
              .accessibilityNextFocusId('NotExistId', { isConsiderDescendants: true })
            Button('按钮L')
              .id('btnL')
              .width('45%')
              .height(40)
          }
          .width('90%')
          .padding('8vp')
          .margin({ top: '4vp', bottom: '4vp' })
          .borderRadius(8)
          .backgroundColor(0xF1F3F5)
          .justifyContent(FlexAlign.Center)
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