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
import {
  BackPressActionProposal,
  BaseGestureHandlingProposal,
  ClickActionProposal,
  GestureHandlingResolution,
  NoneActionProposal,
  PageSwitchActionProposal,
  ScrollActionProposal,
  SelectActionProposal
} from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct SmartGestureMonitor001 {
  @State value: string = ''
  @State name: string = 'SmartGestureMonitor001'
  @State stepTips: string = '注意:\n' + '此用例只支持在手表验证!!\n' +
    '预制条件:\n' + '手表打开智慧手势设置,手表佩戴于手腕上\n' +
    '敲一敲: 拇指与食指指尖连续快速触碰 2 下\n' +
    '划一划: 拇指从食指第二关节向指尖方向，连续快速划动 2 下\n' +
    '翻腕: 手腕自然上扬、表盘朝向面部，快速翻转 30–90°\n' +
    '操作步骤:\n' + '1.点击[开启none]按钮\n' +
    '2.滑动页面到节点操场,执行[敲一敲]手势\n' + '3.点击[关闭none]按钮,点击[开启select]按钮\n' +
    '4.滑动页面到节点操场,执行[划一划]手势\n' +
    '5.点击[关闭select]按钮,点击[开启click]按钮\n' +
    '6.滑动页面到节点操场,执行两次[划一划]手势\n' +
    '预期结果：\n' + '2.节点操场页面内无任何响应\n' +
    '4.[monitor text]文本框被选中\n' +
    '6.第一次执行[划一划],[Count=0]按钮被选中,再次执行按钮文本变为[Count=1]'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  private readonly logger: SmartGestureLogStore = new SmartGestureLogStore();
  @State logs: Array<string> = [];
  @State clickCount: number = 0;
  @State lastClicked: string = 'none';
  @State enable: boolean = true;
  @State passThroughOn: boolean = true;
  @State consumeNoneOn: boolean = false;
  @State consumeSelectOn: boolean = false;
  @State consumeClickOn: boolean = false;
  @State consumeScrollOn: boolean = false;
  @State consumeBackOn: boolean = false;
  @State consumeSwitchOn: boolean = false;
  private swiperController: SwiperController = new SwiperController();
  private readonly consumeNoneCallback = (_proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    const resolution = new GestureHandlingResolution(true);
    if (_proposal.operateIntention == OperateIntention.TAP) {
      resolution.selectedProposal = new NoneActionProposal();
      this.pushLog('consumeNone -> NONE');
    }
    return resolution;
  };
  private readonly consumeSelectCallback = (_proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    const resolution = new GestureHandlingResolution(true);
    const node = this.getUIContext().getFrameNodeById('monitor_target_text');
    if (_proposal.operateIntention == OperateIntention.SLIDE_FORWARD) {
      if (node) {
        resolution.selectedProposal = new SelectActionProposal(node);
        this.pushLog('consumeSelect -> monitor_target_text');
      }
    }
    return resolution;

  };
  private readonly consumeClickCallback = (_proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    const resolution = new GestureHandlingResolution(true);
    const node = this.getUIContext().getFrameNodeById('monitor_target_button');
    if (_proposal.operateIntention == OperateIntention.SLIDE_FORWARD) {
      if (node) {
        resolution.selectedProposal = new ClickActionProposal(node);
        this.pushLog('consumeClick -> monitor_target_button');
      }
    }
    return resolution;
  };
  private readonly consumeScrollCallback = (_proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    const resolution = new GestureHandlingResolution(true);
    const node = this.getUIContext().getFrameNodeById('monitor_scroll_area');
    if (_proposal.operateIntention == OperateIntention.BACK_PRESS) {
      if (node) {
        resolution.selectedProposal = new ScrollActionProposal(node, 120);
        this.pushLog('consumeScroll -> monitor_scroll_area');
      }
    }
    return resolution;
  };
  private readonly consumeBackCallback = (_proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    const resolution = new GestureHandlingResolution(true);
    if (_proposal.operateIntention == OperateIntention.TAP) {
      resolution.selectedProposal = new BackPressActionProposal();
      this.pushLog('consumeBack -> BACK_PRESS');
    }
    return resolution;
  };
  private readonly consumePageSwitchCallback = (_proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    const resolution = new GestureHandlingResolution(true);
    const node = this.getUIContext().getFrameNodeById('monitor_switch_area');
    if (_proposal.operateIntention == OperateIntention.TAP) {
      if (node) {
        resolution.selectedProposal = new PageSwitchActionProposal(node, 1);
        this.pushLog('consumeScroll -> monitor_switch_area');
      }
    }
    return resolution;
  };
  private readonly passThroughCallback = (proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    this.pushLog(`passThrough -> action=${proposal.action}` + `operateIntention=${proposal.operateIntention}`);
    return new GestureHandlingResolution(true);
  };

  private syncEnabled(isOn: boolean): void {
    this.enable = isOn;
    this.controller().enableSmartTapAndSlideGestures(isOn);
    this.pushLog(`enableSmartTapAndSlideGestures(${isOn})`);
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

  private clearMonitors(): void {
    this.controller().clearMonitors();
    this.pushLog('clearMonitors()');
  }

  private setRegistered(name: string, isOn: boolean): void {
    let callback = this.passThroughCallback;
    switch (name) {
      case 'pass':
        callback = this.passThroughCallback;
        this.passThroughOn = isOn;
        break;
      case 'none':
        callback = this.consumeNoneCallback;
        this.consumeNoneOn = isOn;
        break;
      case 'select':
        callback = this.consumeSelectCallback;
        this.consumeSelectOn = isOn;
        break;
      case 'click':
        callback = this.consumeClickCallback;
        this.consumeClickOn = isOn;
        break;
      case 'scroll':
        callback = this.consumeScrollCallback;
        this.consumeScrollOn = isOn;
        break;
      case 'back':
        callback = this.consumeBackCallback;
        this.consumeBackOn = isOn;
        break;
      case 'switch':
        callback = this.consumePageSwitchCallback;
        this.consumeSwitchOn = isOn;
        break;
      default:
        return;
    }
    if (isOn) {
      this.controller().registerMonitor(callback);
      this.pushLog(`registerMonitor(${name})`);
    } else {
      this.controller().unregisterMonitor(callback);
      this.pushLog(`unregisterMonitor(${name})`);
    }
  }

  private controller() {
    return this.getUIContext().getSmartGestureController();
  }

  private pushLog(message: string): void {
    this.logs = this.logger.push(message);
  }

  @Builder
  private buildActionButton(label: string, onClick: () => void) {
    Button(label)
      .width('100%')
      .height(40)
      .fontSize(12)
      .onClick(() => onClick());
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
    this.controller().registerMonitor(this.passThroughCallback);
    this.controller().registerMonitor(this.passThroughCallback);
    this.controller().unregisterMonitor(this.passThroughCallback);
    this.getUIContext().getSmartGestureController().enableSmartTapAndSlideGestures(true);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
    this.controller().clearSelected();
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
          Column({ space: 6 }) {
            Column({ space: 6 }) {
              Button(this.consumeNoneOn ? '关闭 none' : '开启 none')
                .width('100%')
                .height(28)
                .fontSize(12)
                .onClick(() => this.setRegistered('none', !this.consumeNoneOn));
              Button(this.consumeSelectOn ? '关闭 select' : '开启 select')
                .width('100%')
                .height(28)
                .fontSize(12)
                .onClick(() => this.setRegistered('select', !this.consumeSelectOn));
              Button(this.consumeClickOn ? '关闭 click' : '开启 click')
                .width('100%')
                .height(28)
                .fontSize(12)
                .onClick(() => this.setRegistered('click', !this.consumeClickOn));
            }
          }
          .padding(8)
          .borderRadius(8)
          .backgroundColor(Color.Gray)

          Column({ space: 6 }) {
            this.buildSectionTitle('节点操场', '')
            Swiper(this.swiperController) {
              Column() {
                Text('monitor text')
                  .id('monitor_target_text')
                  .fontSize(16)
                  .padding(8)
                  .width('100%')
                  .borderRadius(8)
                  .borderWidth(1)
                  .smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true });

                Button(`Count=${this.clickCount}`)
                  .id('monitor_target_button')
                  .width('100%')
                  .smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true })
                  .onClick(() => {
                    this.clickCount += 1;
                    this.pushLog(`onClick -> monitor_target_button, clickCount=${this.clickCount}`);
                  });

                Scroll() {
                  Column({ space: 4 }) {
                    ForEach([0, 1, 2, 3, 4, 5, 6, 7], (item: number) => {
                      Text(`scroll content ${item}`)
                        .width('100%')
                        .padding(8)
                        .borderRadius(6)
                        .backgroundColor(Color.Black);
                    })
                  }
                  .backgroundColor(Color.Black)
                  .width('100%')
                }
                .id('monitor_scroll_area')
                .height(120)
                .width('100%')
                .borderRadius(8)
                .borderWidth(1)
                .padding(8)
              }

              Column() {
                Text('Page 1').fontSize(16)
              }.backgroundColor('#ff21c4ab')

              Column() {
                Text('Page 2').fontSize(16)
              }.backgroundColor('#ffade9b5')

              Column() {
                Text('Page 3').fontSize(16)
              }.backgroundColor('#ff66b1cf')
            }
            .id('monitor_switch_area')
            .index(0)
            .loop(false)
            .width('100%')
            .height(150)
            .borderRadius(8)
            .borderWidth(1)
          }
          .padding(8)
          .borderRadius(8)
          .backgroundColor(Color.Gray)
        }
        .width('100%')
        .padding(8)
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