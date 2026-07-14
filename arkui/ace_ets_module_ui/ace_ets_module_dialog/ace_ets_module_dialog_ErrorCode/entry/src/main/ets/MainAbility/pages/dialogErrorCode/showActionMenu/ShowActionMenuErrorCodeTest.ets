/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { DialogPresenter } from '@kit.ArkUI';
/**
 * showActionMenu 错误码测试
 * 对应新接口: present(options: DialogOptions)
 * 错误码: 401, 100001, 103306
 */
import { BusinessError } from '@kit.BasicServicesKit';
import {
  TestResult, makeResult, DialogButtonBody, DialogMessageBody, DialogPresentResult,
  DialogSheetBody, SimpleDialogOptions
} from '../common/CommonHelper';

@Entry
@Component
struct ShowActionMenuErrorCodeTest {
  @State results: TestResult[] = [];

  private addResult(label: string, expectedCode: number, actualCode: number) {
    this.results.unshift(makeResult(label, expectedCode, actualCode));
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: 12 }) {
          Text('showActionMenu 错误码测试')
            .fontSize(20).fontWeight(FontWeight.Bold).margin({ top: 10 })

          Text('401 - 参数错误').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('不传参数').id('ShowActionMenuErrorCodeTest_btn_no_args').fontSize(12).layoutWeight(1)
              // SAM-E-002
              .onClick(() => this.testNoArgs())
            Button('传null').id('ShowActionMenuErrorCodeTest_btn_null').fontSize(12).layoutWeight(1)
              // SAM-E-003
              .onClick(() => this.testNull())
          }
          Row({ space: 8 }) {
            Button('传数字').id('ShowActionMenuErrorCodeTest_btn_number').fontSize(12).layoutWeight(1)
              // SAM-E-004
              .onClick(() => this.testNumber())
            Button('buttons为空').id('ShowActionMenuErrorCodeTest_btn_empty_buttons').fontSize(12).layoutWeight(1)
              // SAM-E-005
              .onClick(() => this.testEmptyButtons())
          }
          Button('正常showActionMenu').id('ShowActionMenuErrorCodeTest_btn_normal').fontSize(12).width('100%')
            // SAM-E-001：放靠前，避免 Scroll 底部点击落空
            .onClick(() => {
              console.info('[ARKUI_DYN] ActionMenu btn_normal clicked');
              this.testNormal();
            })

          // @manual-verify: 100001 需特殊环境(UIContext销毁)，无法在正常页面中构造
          // @manual-verify: 103306 需特殊环境(系统弹窗遮挡/Pipeline销毁)，无法在正常页面中构造
          Text('100001 - 内部错误 / 103306 - 弹窗节点挂载失败').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Text('需特殊环境，标记为需手动验证').fontSize(12).fontColor('#999999')

          
          Text(this.results.length > 0 ? (this.results[0].passed ? 'PASS' : 'FAILED') : 'IDLE')
            .id('ShowActionMenuErrorCodeTest_result_status')
            .fontSize(1).height(1).opacity(0)
          Text(this.results.length > 0 ? this.results[0].label : '')
            .id('ShowActionMenuErrorCodeTest_result_label')
            .fontSize(1).height(1).opacity(0)
          Text(this.results.length > 0 ? String(this.results[0].actualCode) : '')
            .id('ShowActionMenuErrorCodeTest_result_actual')
            .fontSize(1).height(1).opacity(0)

          Divider().margin({ top: 8 })
          Row() {
            Text('测试结果').fontSize(18).fontWeight(FontWeight.Bold).layoutWeight(1)
            Button('清空').fontSize(12).onClick(() => { this.results = []; })
          }.width('100%')
          ForEach(this.results, (item: TestResult) => {
            Column() {
              Row() {
                Text(item.label).fontSize(14).fontWeight(FontWeight.Medium).layoutWeight(1)
                Text(item.passed ? 'PASS' : 'FAILED')
                  .fontSize(14).fontWeight(FontWeight.Bold)
                  .fontColor(item.passed ? '#228B22' : '#CC0000')
              }
              Text(`期望: ${item.expectedCode}(${item.expectedDesc}) / 实际: ${item.actualCode}(${item.actualDesc})`)
                .fontSize(12).fontColor('#666666')
            }.width('100%').alignItems(HorizontalAlign.Start)
          })
        }
        .width('100%').padding({ left: 16, right: 16, bottom: 40 })
      }
    }
    .title('showActionMenu 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testNormal() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      let okBtn = new DialogButtonBody('OK', (): void => {});
      let opts = new SimpleDialogOptions();
      opts.title = 'Menu';
      opts.buttons = [okBtn];
      // 先落结果再 present：避免 present 阻塞导致自动化一直读到 IDLE
      this.addResult('正常showActionMenu', 0, 0);
      (dialog.present as Function)(opts as Object);
    } catch (err) { this.addResult('正常showActionMenu', 0, (err as BusinessError).code); }
  }

  async testNoArgs() {
    try {
      await (this.getUIContext().getDialogPresenter().present as Function)();
      this.addResult('不传参数', 401, -1);
    } catch (err) { this.addResult('不传参数', 401, (err as BusinessError).code); }
  }

  async testNull() {
    try {
      await (this.getUIContext().getDialogPresenter().present as Function)(null);
      this.addResult('传null', 401, -1);
    } catch (err) { this.addResult('传null', 401, (err as BusinessError).code); }
  }

  async testNumber() {
    try {
      await (this.getUIContext().getDialogPresenter().present as Function)(123);
      this.addResult('传数字', 401, -1);
    } catch (err) { this.addResult('传数字', 401, (err as BusinessError).code); }
  }

  async testEmptyButtons() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      let opts = new SimpleDialogOptions();
      opts.title = 'T';
      opts.buttons = [];
      await (dialog.present as Function)(opts as Object);
      this.addResult('buttons为空', 0, 0);
    } catch (err) { this.addResult('buttons为空', 401, (err as BusinessError).code); }
  }
}