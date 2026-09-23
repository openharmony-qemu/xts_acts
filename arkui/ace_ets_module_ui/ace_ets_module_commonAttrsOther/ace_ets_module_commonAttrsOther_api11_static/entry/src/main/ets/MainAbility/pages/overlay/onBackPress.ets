'use static'

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

import {
  Entry,
  Component,
  Builder,
  Column,
  ColumnOptions,
  Row,
  RowOptions,
  Text,
  Button,
  Divider,
  Scroll,
  NavDestination,
  FontWeight,
  FlexAlign,
  Color,
  ComponentContent,
  wrapBuilder,

  $r
} from '@kit.ArkUI';
import { UIContext, OverlayManager, OverlayManagerOptions, NodeIdentity } from '@ohos.arkui.UIContext';
import { State } from '@ohos.arkui.stateManagement';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppStorage } from '@ohos.arkui.stateManagement';

const TAG: string = '[Sample_dialogproject]';
const DOMAIN: int = 0xFF00;

export class FloatParams {
  public message: string = '';
  public onDismiss: () => void = (): void => {};

  constructor(message: string, onDismiss: () => void) {
    this.message = message;
    this.onDismiss = onDismiss;
  }
}

@Builder
function floatBuilder(params: FloatParams): void {
  Column({ space: 12 } as ColumnOptions) {
    Text(params.message)
      .fontSize(18)
      .fontWeight(FontWeight.Medium)
      .fontColor(Color.White)

    Text('侧滑被overlay拦截，按关闭可关闭overlay')
      .fontSize(12)
      .fontColor('#FFFFFFAA')

    Button('关闭')
      .height(32)
      .fontSize(13)
      .fontColor(Color.White)
      .onClick((): void => {
        params.onDismiss();
      })
  }
  .width('70%')
  .height(200)
  .justifyContent(FlexAlign.Center)
  .borderRadius(16)
  .backgroundColor('#333333')
  .shadow({ radius: 20, color: '#66000000', offsetX: 0, offsetY: 6 })
}

@Entry
@Component
export struct OverlayManagerOnBackPress {
  @State s1: NodeIdentity = '111';
  @State s2: NodeIdentity = 3333;
  @State showStatus: string = '无浮层';
  @State logText: string = '';
  private floatContent: ComponentContent<FloatParams> | null = null;
  private optionsSet: boolean = false;

  addLog(msg: string): void {
    let now: Date = new Date();
    let ts: string = `${now.getHours()}:${now.getMinutes()}:${now.getSeconds()}`;
    this.logText = `[${ts}] ${msg}\n` + this.logText;
  }

  ensureOptions(): void {
    if (this.optionsSet) {
      return;
    }
    let ctx: UIContext = this.getUIContext();

    let ret: boolean = ctx.setOverlayManagerOptions({
      enableBackPressedEvent: true,

      onBackPress : (): boolean => {
        if (this.floatContent !== null) {
          this.addLog('onBackPress → 有浮层, return TRUE (拦截)');
          try {
            this.getUIContext().getPromptAction().showToast({
              message: 'backPress事件被overlay拦截',
              duration: 2000
            });
          } catch (error) {
            hilog.error(DOMAIN, TAG, '%{public}s', 'showToast args error: %{public}s', error);
          }
          return true;
        }
        this.addLog('onBackPress → 无浮层, return FALSE (透传)');
        return false;
      }
    } as OverlayManagerOptions);
    this.optionsSet = ret;
    this.addLog(`setOverlayManagerOptions: ${ret}`);
  }

  showFloat(): void {
    if (this.floatContent !== null) {
      this.addLog('浮层已存在');
      return;
    }
    this.ensureOptions();
    let ctx: UIContext = this.getUIContext();
    let om: OverlayManager = ctx.getOverlayManager();
    let params: FloatParams = new FloatParams('我是浮层', (): void => { this.dismissFloat(); });
    let content: ComponentContent<FloatParams> =
      new ComponentContent<FloatParams>(ctx, wrapBuilder(floatBuilder), params);
    this.floatContent = content;
    om.addComponentContent(content);
    this.showStatus = '浮层显示中';
    this.addLog('打开浮层');
  }

  dismissFloat(): void {
    if (this.floatContent === null) {
      return;
    }
    let content: ComponentContent<FloatParams> = this.floatContent as ComponentContent<FloatParams>;
    let ctx: UIContext = this.getUIContext();
    let om: OverlayManager = ctx.getOverlayManager();
    om.removeComponentContent(content);
    this.floatContent = null;
    this.showStatus = '无浮层';
    this.addLog('关闭浮层');
  }

  aboutToDisappear(): void {
    this.dismissFloat();
  }

  onpageshow(): void {
    AppStorage.setOrCreate<NodeIdentity>("NodeIdentity_sring", typeof this.s1)
    AppStorage.setOrCreate<NodeIdentity>("NodeIdentity_number", typeof this.s2)
  }

  build(): void {
    NavDestination() {
      Column({ space: 16 } as ColumnOptions) {
        Text('overlayManager 侧滑拦截')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)

        Text('• 点击按钮添加浮层\n• 有浮层时侧滑/返回 → onBackPress return true 拦截\n• 无浮层时侧滑/返回 → onBackPress return false 透传')
          .fontSize(13)
          .fontColor('#666666')
          .lineHeight(20)

        Row({ space: 12 } as RowOptions) {
          Button('显示浮层')
            .fontSize(15)
            .height(40)
            .onClick((): void => {
              this.showFloat();
            })

          Button('关闭浮层')
            .fontSize(15)
            .height(40)
            .onClick((): void => {
              this.dismissFloat();
            })
        }

        Divider().margin({ top: 4, bottom: 4 })

        Text(`状态: ${this.showStatus}`)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)

        Scroll() {
          Text(this.logText)
            .fontSize(10)
            .fontColor('#333333')
            .width('100%')
        }
        .height(120)
        .width('100%')
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .padding(8)
      }
      .width('100%')
      .height('100%')
      .padding(24)
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.EntryAbility_label'));
  }
}
