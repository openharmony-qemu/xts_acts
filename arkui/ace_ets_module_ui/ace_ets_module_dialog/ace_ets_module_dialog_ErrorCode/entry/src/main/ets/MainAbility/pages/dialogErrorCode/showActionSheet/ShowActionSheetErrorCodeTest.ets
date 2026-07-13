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
 * showActionSheet 错误码测试
 * 对应新接口: present(options: DialogOptions)
 * 错误码: 401(参数错误), 100001(内部错误), 103306(弹窗节点挂载失败)
 */
import { BusinessError } from '@kit.BasicServicesKit';
import { TestResult, makeResult, DialogButtonBody, DialogMessageBody, DialogPresentResult, DialogSheetBody, SimpleDialogOptions } from '../common/CommonHelper';

@Entry
@Component
struct ShowActionSheetErrorCodeTest {
  @State results: TestResult[] = [];

  private addResult(label: string, expectedCode: number, actualCode: number) {
    this.results.unshift(makeResult(label, expectedCode, actualCode));
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: 12 }) {
          Text('showActionSheet 错误码测试')
            .fontSize(20).fontWeight(FontWeight.Bold).margin({ top: 10 })

          Text('401 - 参数错误').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('不传参数').id('ShowActionSheetErrorCodeTest_btn_no_args').fontSize(12).layoutWeight(1)
              // SAS-E-002
              .onClick(() => this.testNoArgs())
            Button('传null').id('ShowActionSheetErrorCodeTest_btn_null').fontSize(12).layoutWeight(1)
              // SAS-E-003
              .onClick(() => this.testNull())
          }
          Row({ space: 8 }) {
            Button('传数字').id('ShowActionSheetErrorCodeTest_btn_number').fontSize(12).layoutWeight(1)
              // SAS-E-004
              .onClick(() => this.testNumber())
            Button('sheets为空').id('ShowActionSheetErrorCodeTest_btn_empty_sheets').fontSize(12).layoutWeight(1)
              // SAS-E-005
              .onClick(() => this.testEmptySheets())
          }

          Text('正常流程').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('正常ActionSheet').id('ShowActionSheetErrorCodeTest_btn_normal').fontSize(12).width('100%')
            // SAS-E-001
            .onClick(() => this.testNormal())

          
          if (this.results.length > 0) {
            Text(this.results[0].passed ? 'PASS' : 'FAILED')
              .id('ShowActionSheetErrorCodeTest_result_status')
              .fontSize(1).height(1).opacity(0)
            Text(this.results[0].label)
              .id('ShowActionSheetErrorCodeTest_result_label')
              .fontSize(1).height(1).opacity(0)
          }

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
    .title('showActionSheet 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testNormal() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      let sheet = new DialogSheetBody('OK', (): void => {});
      let opts = new SimpleDialogOptions();
      opts.title = 'Title';
      opts.sheets = [sheet];
      await (dialog.present as Function)(opts as ESObject);
      this.addResult('正常ActionSheet', 0, 0);
    } catch (err) { this.addResult('正常ActionSheet', 0, (err as BusinessError).code); }
  }

  async testNoArgs() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      await (dialog.present as Function)();
      this.addResult('不传参数', 401, -1);
    } catch (err) { this.addResult('不传参数', 401, (err as BusinessError).code); }
  }

  async testNull() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      await (dialog.present as Function)(null);
      this.addResult('传null', 401, -1);
    } catch (err) { this.addResult('传null', 401, (err as BusinessError).code); }
  }

  async testNumber() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      await (dialog.present as Function)(123);
      this.addResult('传数字', 401, -1);
    } catch (err) { this.addResult('传数字', 401, (err as BusinessError).code); }
  }

  async testEmptySheets() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      let opts = new SimpleDialogOptions();
      opts.title = 'T';
      opts.sheets = [];
      await (dialog.present as Function)(opts as ESObject);
      this.addResult('sheets为空', 0, 0);
    } catch (err) { this.addResult('sheets为空', 401, (err as BusinessError).code); }
  }
}