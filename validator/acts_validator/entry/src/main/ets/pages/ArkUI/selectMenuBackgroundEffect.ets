/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct selectMenuBackgroundEffectDemo {
  @State name: string = 'selectMenuBackgroundEffect';
  @State stepTips: string = '操作步骤:\n' + '1.点击最上方select组件打开下拉菜单\n' +
    '2.点击按钮"空"，再点击最上方select组件\n' +
    '3.点击按钮"紫"，再点击最上方select组件\n' +
    '4.点击按钮"绿"，再点击最上方select组件\n' +
    '预期结果：\n' + '1.弹出的菜单背景颜色为透明色\n' + '2.弹出的菜单背景颜色为透明色\n' +
    '3.弹出的菜单背景颜色为带透明度和模糊度的紫色\n' + '4.弹出的菜单背景颜色为不透明绿色\n' +
    '注：手机和手表的系统颜色有差异，测试手表时，颜色偏黑为正常现象,点击“空”按钮操作，若上一次操作为设置不带透明度的纯色，' +
    '会继承上一次的背景色，若上一次操作为设置带透明度的，点击“空”按钮，组件背景色会回到透明状态\n'
  @State radiusNum: number | undefined | null = undefined
  @State saturationNum: number | undefined | null = undefined
  @State brightnessNum: number | undefined | null = undefined
  @State colorNum: ResourceColor | undefined | null = undefined
  @State adaptiveColorNum: AdaptiveColor | undefined | null = undefined
  @State blurOptionsNum: BlurOptions | undefined | null = undefined
  @State policyNum: BlurStyleActivePolicy | undefined | null = undefined
  @State inactiveColorNum: ResourceColor | undefined | null = undefined
  @State isOk: boolean = false;
  @State intervalNum: number = 0;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
      Image($r('app.media.ic_public_pass'))
        .width('20vp')
        .height('20vp')
    }.width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
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
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
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
          });
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
        Scroll() {
          Column({ space: 5 }) {
          Select([{ value: 'aaa'}])
            .background(Color.Pink)
            .menuBackgroundEffect({
              radius: this.radiusNum,
              saturation: this.saturationNum,
              brightness: this.brightnessNum,
              color: this.colorNum,
              adaptiveColor: this.adaptiveColorNum,
              blurOptions: this.blurOptionsNum,
              policy: this.policyNum,
              inactiveColor: this.inactiveColorNum,
            })

            Row() {
              Button('空')
                .onClick(() => {
                  this.radiusNum = null;
                  this.saturationNum = null;
                  this.brightnessNum = null;
                  this.colorNum = null;
                  this.adaptiveColorNum = null;
                  this.blurOptionsNum = null;
                  this.policyNum = null;
                  this.inactiveColorNum = null;
                })

              Button('紫')
                .onClick(() => {
                  this.radiusNum = 2;
                  this.saturationNum = undefined;
                  this.brightnessNum = undefined;
                  this.colorNum = 'rgba(255, 100, 255, 0.2)';
                  this.adaptiveColorNum = AdaptiveColor.DEFAULT;
                  this.blurOptionsNum = { grayscale: [500, 500] };
                  this.policyNum = BlurStyleActivePolicy.ALWAYS_ACTIVE;
                  this.inactiveColorNum = Color.Blue;
                })

              Button('绿')
                .onClick(() => {
                  this.radiusNum = 2;
                  this.saturationNum = 1;
                  this.brightnessNum = 1;
                  this.colorNum = 'rgba(255, 100, 255, 0.2)';
                  this.adaptiveColorNum = AdaptiveColor.DEFAULT;
                  this.blurOptionsNum = { grayscale: [500, 500] };
                  this.policyNum = BlurStyleActivePolicy.ALWAYS_INACTIVE;
                  this.inactiveColorNum = Color.Green;
                })
            }.margin({top:'40vp'})
          }.width('100%')
        }
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
    .backgroundColor('#F1F3F5')
  }
}