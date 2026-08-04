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

/**
 * showDialog 错误码测试
 * 对应新接口: present(options: DialogOptions)
 * 自动化: 401, 0(含 showInSubWindow 正例)
 * @manual-verify: 100001/103306/103308（SDK DialogPresenter；禁 FilePicker）
 */
import { BusinessError } from '@kit.BasicServicesKit';
import {
  TestResult, makeResult, DialogButtonBody, DialogMessageBody,
  SimpleDialogOptions
} from '../common/CommonHelper';
import { DialogPresenter } from '@kit.ArkUI';

@Entry
@Component
struct ShowDialogErrorCodeTest {
  @State results: TestResult[] = [];

  private addResult(label: string, expectedCode: number, actualCode: number) {
    this.results.unshift(makeResult(label, expectedCode, actualCode));
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: 12 }) {
          Text('showDialog 错误码测试')
            .fontSize(20).fontWeight(FontWeight.Bold).margin({ top: 10 })

          Text('401 - 参数错误').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('不传参数').id('ShowDialogErrorCodeTest_btn_no_args').fontSize(12).layoutWeight(1)
              // SDG-E-002
              .onClick(() => this.testNoArgs())
            Button('传null').id('ShowDialogErrorCodeTest_btn_null').fontSize(12).layoutWeight(1)
              // SDG-E-003
              .onClick(() => this.testNull())
          }
          Row({ space: 8 }) {
            Button('传数字').id('ShowDialogErrorCodeTest_btn_number').fontSize(12).layoutWeight(1)
              // SDG-E-004
              .onClick(() => this.testNumber())
            Button('传字符串').id('ShowDialogErrorCodeTest_btn_string').fontSize(12).layoutWeight(1)
              // SDG-E-005
              .onClick(() => this.testString())
          }

          // 系统 UEC/103306 依赖 FilePicker UIExtension，门禁会毒化 UiTest；改测子窗正例
          Text('子窗模式 present（自动化稳妥对照）')
            .fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Column({ space: 8 }) {
            Button('子窗模式 present')
              .id('ShowDialogErrorCodeTest_btn_uec')
              .width('100%')
              .fontSize(12)
              // SDG-E-007
              .onClick(() => { this.testUEC() })
            Button('子窗模式带按钮 present')
              .id('ShowDialogErrorCodeTest_btn_uec_subwin')
              .width('100%')
              .fontSize(12)
              // SDG-E-008
              .onClick(() => { this.testUECSubWin() })
            Button('连续两次子窗 present')
              .id('ShowDialogErrorCodeTest_btn_uec_subwin2')
              .width('100%')
              .fontSize(12)
              // SDG-E-009
              .onClick(() => { this.testUECSubWin2() })
          }.width('100%')

          Text('正常流程').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('正常showDialog').id('ShowDialogErrorCodeTest_btn_normal').fontSize(12).width('100%')
            // SDG-E-001
            .onClick(() => this.testNormal())

          
          Text(this.results.length > 0 ? (this.results[0].passed ? 'PASS' : 'FAILED') : 'IDLE')
            .id('ShowDialogErrorCodeTest_result_status')
            .fontSize(1).height(1).opacity(0)
          Text(this.results.length > 0 ? this.results[0].label : '')
            .id('ShowDialogErrorCodeTest_result_label')
            .fontSize(1).height(1).opacity(0)
          Text(this.results.length > 0 ? String(this.results[0].actualCode) : '')
            .id('ShowDialogErrorCodeTest_result_actual')
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
    .title('showDialog 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testUEC() {
    try {
      let okBtn = new DialogButtonBody('OK', (): void => {});
      let opts = new SimpleDialogOptions();
      opts.title = 'SubWin';
      opts.message = new DialogMessageBody('sub');
      opts.buttons = [okBtn];
      opts.showInSubWindow = true;
      await (this.getUIContext().getDialogPresenter().present as Function)(opts as Object);
      this.addResult('子窗present', 0, 0);
    } catch (err) {
      this.addResult('子窗present', 0, (err as BusinessError).code);
    }
  }

  async testUECSubWin() {
    try {
      let okBtn = new DialogButtonBody('OK', (): void => {});
      let opts = new SimpleDialogOptions();
      opts.title = 'SubWin2';
      opts.message = new DialogMessageBody('sub2');
      opts.buttons = [okBtn];
      opts.showInSubWindow = true;
      await (this.getUIContext().getDialogPresenter().present as Function)(opts as Object);
      this.addResult('子窗带按钮present', 0, 0);
    } catch (err) {
      this.addResult('子窗带按钮present', 0, (err as BusinessError).code);
    }
  }

  async testUECSubWin2() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      let ok1 = new DialogButtonBody('OK', (): void => {});
      let first = new SimpleDialogOptions();
      first.title = 'S1';
      first.message = new DialogMessageBody('a');
      first.buttons = [ok1];
      first.showInSubWindow = true;
      await (dialog.present as Function)(first as Object);
      let ok2 = new DialogButtonBody('OK', (): void => {});
      let second = new SimpleDialogOptions();
      second.title = 'S2';
      second.message = new DialogMessageBody('b');
      second.buttons = [ok2];
      second.showInSubWindow = true;
      await (dialog.present as Function)(second as Object);
      this.addResult('连续子窗present', 0, 0);
    } catch (err) {
      this.addResult('连续子窗present', 0, (err as BusinessError).code);
    }
  }

  async testNormal() {
    try {
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      let okBtn = new DialogButtonBody('OK', (): void => {});
      let opts = new SimpleDialogOptions();
      opts.title = 'T';
      opts.message = new DialogMessageBody('M');
      opts.buttons = [okBtn];
      await (dialog.present as Function)(opts as Object);
      this.addResult('正常showDialog', 0, 0);
    } catch (err) { this.addResult('正常showDialog', 0, (err as BusinessError).code); }
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

  async testString() {
    try {
      await (this.getUIContext().getDialogPresenter().present as Function)('invalid');
      this.addResult('传字符串', 401, -1);
    } catch (err) { this.addResult('传字符串', 401, (err as BusinessError).code); }
  }
}