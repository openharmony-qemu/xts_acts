/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import { router, ComponentContent } from '@kit.ArkUI';
import { matrix4 } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import FirstDialog from '../model/FirstDialog';
import Logger from '../model/Logger';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { uiObserver } from '@kit.ArkUI';
import window from '@ohos.window';
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonTextItem
} from '@kit.ArkUI';
@Entry
@Component
struct TabBarIndicatorPixmap {
  @State name: string = 'SegmentButtonOptions';
  @State stepTips: string = '操作步骤:\n' + '1.点击true按钮 \n' +
    '2.点击push 1 push 2 push 3 按钮.\n' +'3.分别点击上方SegmentButton 按钮\n'+
    '预期结果：\n' + '第二步的动效和第三步的动效相同\n'
  @State intervalNum: number = 0;
  @State text: string = '文本';
  @State isOk: boolean = false;
  @State barMode: BarMode = BarMode.Fixed;
  private changeOrientation(isLandscape: boolean) {
    let context = getContext(this) as common.UIAbilityContext;
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }

  @State message: string = '';
  @State widthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM;
  @State heightBreakpoint: HeightBreakpoint = HeightBreakpoint.HEIGHT_SM;
  winSizeLayoutBreakpointCallback = (info: uiObserver.WindowSizeLayoutBreakpointInfo) => {
    this.widthBreakpoint = info.widthBreakpoint;
    this.heightBreakpoint = info.heightBreakpoint;
    this.message = 'page1--widthBpt:' + this.widthBreakpoint.toString() + 'heightBpt:' + this.heightBreakpoint.toString();
    console.log('GBR page1 widthBpt：'+ this.widthBreakpoint.toString() + ' ' +'heightBpt:'+ this.heightBreakpoint.toString())
  }
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '页签按钮1' }, { text: '页签按钮2' }, { text: '页签按钮3' }
    ] as ItemRestriction<SegmentButtonTextItem>
  });

  @State tabSelected: number[] = [];
  @State tabSelected2: number[] = [];

  enableStateAnimation: (boolean | undefined)[] = [false, true, undefined];
  @State enableStateAnimationIndex: number = 0;
  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
      Image($r('app.media.ic_public_pass'))
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
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear(): void {
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
      Row() {
        Column() {
          Column({ space: 25 }) {
            SegmentButton({
              options: this.tabOptions,
              selectedIndexes: this.tabSelected
            })

            Text('enableStateAnimation: ' + this.enableStateAnimation[this.enableStateAnimationIndex]).fontSize(18).fontWeight(FontWeight.Bold)
            Row({ space: 10 }) {
              Button('false')
                .onClick(() => {
                  this.enableStateAnimationIndex = 0;
                })

              Button('true')
                .onClick(() => {
                  this.enableStateAnimationIndex = 1;
                })

              Button('undefined')
                .onClick(() => {
                  this.enableStateAnimationIndex = 2;
                })
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 10 })

            SegmentButton({
              options: this.tabOptions,
              selectedIndexes: this.tabSelected2,
              enableStateAnimation: this.enableStateAnimation[this.enableStateAnimationIndex]
            })

            Row({ space: 10 }) {
              Button('push 1')
                .onClick(() => {
                  this.tabSelected = [0];
                  this.tabSelected2 = [0];
                })

              Button('push 2')
                .onClick(() => {
                  this.tabSelected = [1];
                  this.tabSelected2 = [1];
                })

              Button('push 3')
                .onClick(() => {
                  this.tabSelected = [2];
                  this.tabSelected2 = [2];
                })
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 10 })
          }.width('90%')
        }.width('100%')
      }.height('70%')


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

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}