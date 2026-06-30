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
import { BaseGestureHandlingProposal, GestureHandlingResolution } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct SmartGestureSelect {
  @State value: string = ''
  @State name: string = 'SmartGestureSelect'
  @State stepTips: string = '注意:\n' + '此用例只支持在手表验证!!\n' +
    '预制条件:\n' + '手表打开智慧手势设置,手表佩戴于手腕上\n' +
    '敲一敲: 拇指与食指指尖连续快速触碰 2 下\n' +
    '划一划: 拇指从食指第二关节向指尖方向，连续快速划动 2 下\n' +
    '翻腕: 手腕自然上扬、表盘朝向面部，快速翻转 30–90°\n' +
    '操作步骤:\n' + '1.点击[request]按钮\n' +
    '2.执行[敲一敲]手势\n' + '3.点击[clear]按钮\n' +
    '4.点击[null]按钮\n' +
    '5.点击[undefined]按钮\n' +
    '预期结果：\n' + '1.在[可选可点]文本框上有选中框\n' +
    '2.下滑到日志区域内只显示一次[passThrough ->]相关日志\n' +
    '3.选中框消失\n' + '4.点击后不会选中文本框\n' +
    '5.点击后不会选中文本框'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  private readonly logger: SmartGestureLogStore = new SmartGestureLogStore();
  @State logs: Array<string> = [];
  @State clickCount: number = 0;
  @State lastClicked: string = 'none';

  private readonly passThroughCallback = (proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
    this.pushLog(`passThrough -> action=${proposal.action}` + `operateIntention=${proposal.operateIntention}`);
    return new GestureHandlingResolution(true);
  };

  @Builder
  private buildLogPanel() {
    Column({ space: 8 }) {
      Scroll() {
        Column({ space: 6 }) {
          ForEach(this.logs, (item: string) => {
            Text(item)
              .width('100%')
              .fontSize(10) // 日志字体缩小
              .fontColor('#182431')
              .textAlign(TextAlign.Start);
          }, (item: string) => item)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .height(150) // 压缩日志面板高度
      .width('100%')
      .borderRadius(12)
      .borderWidth(1)
      .padding(8) // 减少内边距
    }
    .padding(8) // 减少面板内边距
    .borderRadius(12)
    .backgroundColor('#ffffff')
  }

  private controller() {
    return this.getUIContext().getSmartGestureController();
  }

  private requestSelected(id: string): void {
    this.controller().requestSelected(id);
  }

    private requestSelected1(): void {
    this.controller().requestSelected(null);
  }

  private requestSelected2(): void {
    this.controller().requestSelected(undefined);
  }

  private clearSelected(): void {
    this.controller().clearSelected();
  }

  private pushLog(message: string): void {
    this.logs = this.logger.push(message);
  }

  private handleClick(id: string): void {
    this.clickCount += 1;
    this.lastClicked = id;
    this.pushLog(`onClick -> ${id}, clickCount=${this.clickCount}`);
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
  private buildRequestButton(label: string, id: string) {
    this.buildActionButton(label, () => this.requestSelected(id))
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
        Column() {
          Column({ space: 8 }) {
            Row({ space: 8 }) {
              Button('clear')
                .layoutWeight(1)
                .height(40)
                .fontSize(12)
                .onClick(() => this.clearSelected());
            }

            Text(`lastClicked=${this.lastClicked}, clickCount=${this.clickCount}`)
              .fontSize(12)
              .fontColor('#182431');
          }
          .padding(8)
          .borderRadius(12)
          .backgroundColor('#f4f8ff')

          Column({ space: 8 }) {
            Column({ space: 6 }) {
              Text('可选可点')
                .id('text_select_click')
                .fontSize(14)
                .padding(8)
                .width('100%')
                .borderRadius(10)
                .borderWidth(1)
                .smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true })
                .onClick(() => this.handleClick('text_select_click'));
              this.buildRequestButton('request', 'text_select_click')
              Row() {
                Button('null').width('50%').height(40).fontSize(12).onClick(() => {this.requestSelected1()})
                Button('undefined').width('50%').height(40).fontSize(12).onClick(() => {this.requestSelected2()})
              }
            }.backgroundColor('#ff161111');
          }
          .width('100%')
          .padding(8)
          .borderRadius(12)
          .backgroundColor('#ff161111');

          this.buildLogPanel()
        }
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