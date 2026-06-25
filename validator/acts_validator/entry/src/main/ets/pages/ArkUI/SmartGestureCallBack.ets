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
import { SmartGestureLogStore } from '../common/SmartGestureCommon';
import { BaseGestureHandlingProposal, GestureHandlingResolution, TargetedGestureProposal } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct SmartGestureCallBack {
  @State value: string = ''
  @State name: string = 'SmartGestureCallBack'
  @State stepTips: string = '注意:\n' + '此用例只支持在手表验证!!\n' +
    '预制条件:\n' + '手表打开智慧手势设置,手表佩戴于手腕上\n' +
    '敲一敲: 拇指与食指指尖连续快速触碰 2 下\n' +
    '划一划: 拇指从食指第二关节向指尖方向，连续快速划动 2 下\n' +
    '翻腕: 手腕自然上扬、表盘朝向面部，快速翻转 30–90°\n' +
    '操作步骤:\n' + '1.执行[划一划]手势\n' +
    '2.执行[划一划]手势\n' + '3.执行[敲一敲]手势\n' +
    '4.反复执行[划一划]手势,使scroll组件滚动\n' +
    '5.继续执行[划一划]手势,直到页面无任何响应\n' +
    '6.执行[翻腕]手势,在搜索日志[xxx->action]\n' +
    '预期结果：\n' + '1.[页面内日志]文本变为[1]\n' +
    '2.[节点1]按钮有选中框,[页面内日志]文本变为[3node_1]\n' +
    '3.[页面内日志]文本变为[4]\n' +
    '4.页面滑动,[页面内日志]文本变为[2]\n' +
    '5.页面无响应,[页面内日志]文本变为[0]\n' +
    '6.页面返回上一级,日志返回[xxx->action=5]\n'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  private readonly logger: SmartGestureLogStore = new SmartGestureLogStore();
  private swiperController: SwiperController = new SwiperController();
  @State logs: Array<string> = [];
  @State clickCount: number = 0;
  @State lastClicked: string = 'none';
  @State isText: string = ''
  private readonly passThroughCallback = (proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    let targetProposal = proposal as TargetedGestureProposal;
    if (proposal.action == SmartGestureAction.NONE) {
      this.isText = '0';
    }
    if (proposal.action == SmartGestureAction.PAGE_FORWARD) {
      this.isText = '1';
    }
    if (proposal.action == SmartGestureAction.SCROLL_FORWARD) {
      this.isText = '2';
    }
    if (proposal.action == SmartGestureAction.SELECT) {
      this.isText = '3' + targetProposal.node.getId();
    }
    if (proposal.action == SmartGestureAction.CLICK) {
      this.isText = '4';
    }
    if (proposal.action == SmartGestureAction.BACK_PRESS) {
      this.isText = '5';
      console.info('xxx->action=5');
    }

    return new GestureHandlingResolution(true);
  };

  private controller() {
    return this.getUIContext().getSmartGestureController();
  }

  private pushLog(message: string): void {
    this.logs = this.logger.push(message);
  }

  @Builder
  private buildSectionTitle(title: string, tips: string) {
    Column({ space: 4 }) {
      Text(title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#182431');
      Text(tips)
        .fontSize(10)
        .fontColor('#5d6b7a');
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .margin({ bottom: 8 })
  }

  @Builder
  private buildLogPanel() {
    Column({ space: 8 }) {
      this.buildSectionTitle('页面内日志', '用于对照回调返回值。')
      Text(this.isText)
        .width('100%')
        .fontSize(10)
        .fontColor('#182431')
        .textAlign(TextAlign.Start)
        .borderRadius(12)
        .borderWidth(1)
        .padding(8)
    }
    .padding(8)
    .borderRadius(12)
    .backgroundColor('#ffffff')
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
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
          result: 'true ', title: this.name,
        }
      });
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
    this.controller().registerMonitor(this.passThroughCallback);
    this.getUIContext().getSmartGestureController().enableSmartTapAndSlideGestures(true);
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
        .size({ width: '10%', height: '10%' })
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

      Scroll() {
        Column({ space: 8 }) {
          Swiper(this.swiperController) {
            Column() {
              Text('page 0')
                .fontSize(16)
                .fontWeight(FontWeight.Bold);
              Button('swiper_page0')
                .id('swiper_page0_button0_noPrimary')
                .fontSize(14)
                .padding(8)
                .width('100%')
                .borderRadius(10)
                .borderWidth(1)
            }
            .height(180)
            .justifyContent(FlexAlign.Start)
            .backgroundColor(Color.Grey)
            .padding(12)

            Column() {
              Scroll() {
                Column() {
                  Text('page 1')
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold);
                  Button('节点1').onClick(() => {
                    console.info('xxx->callBack 选中节点1')
                  }).smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true })
                    .id('node_1')
                  ForEach([0, 1, 2, 3, 4, 5], (item: number) => {
                    Button(`${item}`)
                      .margin(8)
                      .width('100%')
                      .onClick(() => {
                        console.info(`xxx->callBack swiper_page1_button ${item}`)
                      })
                  }, (item: number) => item.toString())
                }
              }
              .height(180).backgroundColor(Color.Red)
            }
            .height(180)
            .justifyContent(FlexAlign.Start)
            .backgroundColor(Color.Grey)
            .padding(12)
          }
          .height('60%')
          .index(0)
          .loop(false)
          .borderRadius(12)
          .borderWidth(1)

          this.buildLogPanel()
        }
        .padding(8)
        .borderRadius(8)
        .backgroundColor('#f7f7f7')
      }
      .height('80%')
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
  }
}