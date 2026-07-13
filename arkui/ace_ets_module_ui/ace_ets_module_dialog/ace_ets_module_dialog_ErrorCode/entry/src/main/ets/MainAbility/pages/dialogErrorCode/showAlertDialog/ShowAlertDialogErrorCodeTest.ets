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
 * showAlertDialog 错误码测试
 * 对应新接口: present(options: DialogOptions)
 * 错误码: 401, 100001, 103306
 */
import { BusinessError } from '@kit.BasicServicesKit';
import { TestResult, makeResult } from '../common/CommonHelper';
import { dialog as dialogApi } from '@kit.ArkUI';

@Entry
@Component
struct ShowAlertDialogErrorCodeTest {
  @State results: TestResult[] = [];

  private addResult(label: string, expectedCode: number, actualCode: number) {
    this.results.unshift(makeResult(label, expectedCode, actualCode));
  }

  private async share(): Promise<void> {
    const helper = await import('../common/ShareKitHelper');
    try {
      await helper.showSystemShare(this.getUIContext());
      console.info('ShareController show success.');
    } catch (error) {
      helper.logShareError(error as BusinessError);
    }
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: 12 }) {
          Text('showAlertDialog 错误码测试')
            .fontSize(20).fontWeight(FontWeight.Bold).margin({ top: 10 })

          Text('401 - 参数错误').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('不传参数').id('ShowAlertDialogErrorCodeTest_btn_no_args').fontSize(12).layoutWeight(1)
              // SAD-E-002
              .onClick(() => this.testNoArgs())
            Button('传null').id('ShowAlertDialogErrorCodeTest_btn_null').fontSize(12).layoutWeight(1)
              // SAD-E-003
              .onClick(() => this.testNull())
          }
          Row({ space: 8 }) {
            Button('传数字').id('ShowAlertDialogErrorCodeTest_btn_number').fontSize(12).layoutWeight(1)
              // SAD-E-004
              .onClick(() => this.testNumber())
            Button('传字符串').id('ShowAlertDialogErrorCodeTest_btn_string').fontSize(12).layoutWeight(1)
              // SAD-E-005
              .onClick(() => this.testString())
          }

          Text(' 103306 - 弹窗节点挂载失败').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('拉起UEC后拉起弹窗')
              .width('30%')
              .fontSize(12)
              // SAD-E-007
              .onClick(() => { this.testUEC() })

            Button('拉起UEC后拉起子窗模式的弹窗')
              .width('30%')
              .fontSize(12)
              // SAD-E-008
              .onClick(() => { this.testUECSubWin() })

            Button('子窗已创建--拉起UEC后拉起子窗模式的弹窗')
              .width('30%')
              .fontSize(12)
              // SAD-E-009
              .onClick(() => { this.testUECSubWin2() })
          }

          Text('正常流程').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('正常showAlertDialog').id('ShowAlertDialogErrorCodeTest_btn_normal').fontSize(12).width('100%')
            // SAD-E-001
            .onClick(() => this.testNormal())

          
          if (this.results.length > 0) {
            Text(this.results[0].passed ? 'PASS' : 'FAILED')
              .id('ShowAlertDialogErrorCodeTest_result_status')
              .fontSize(1).height(1).opacity(0)
            Text(this.results[0].label)
              .id('ShowAlertDialogErrorCodeTest_result_label')
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
    .title('showAlertDialog 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testUEC() {
    try {
      this.share();
      setTimeout(()=>{
        console.log('hxw present')
        this.getUIContext().getDialogPresenter().present({title: 'UEC'})
          .then((res) => {
            console.log('hxw present ret: ' + JSON.stringify(res))
            this.addResult('UEC拦截', 103306, -1);
          })
          .catch((error: BusinessError)=>{
            console.log('hxw present error: ' + JSON.stringify(error))
            this.addResult('UEC拦截', 103306, error.code);
          })
      }, 2000)
    } catch (err) { this.addResult('UEC拦截', 103306, (err as BusinessError).code); }
  }

  async testUECSubWin() {
    try {
      this.share();
      setTimeout(()=>{
        console.log('hxw present')
        this.getUIContext().getDialogPresenter().present({showInSubWindow: true})
          .then((res) => {
            console.log('hxw present 111 ret: ' + JSON.stringify(res))
            this.addResult('UEC拦截子窗', 103308, -1);
          })
          .catch((error: BusinessError)=>{
            console.log('hxw present error: ' + JSON.stringify(error))
            this.addResult('UEC拦截子窗', 103308, error.code);
          })
      }, 2000)
    } catch (err) { this.addResult('UEC拦截子窗', 103308, (err as BusinessError).code); }
  }

  async testUECSubWin2() {
    try {
      // 先拉一个正常子窗，完成子窗创建
      this.getUIContext().getDialogPresenter().present({showInSubWindow: true})
      setTimeout(()=>{
        this.share();
      }, 2000)
      setTimeout(()=>{
        console.log('hxw present')
        this.getUIContext().getDialogPresenter().present({ showInSubWindow: true})
          .then((res) => {
            console.log('hxw present ret: ' + JSON.stringify(res))
            this.addResult('UEC拦截', 0, 0);
          })
          .catch((error: BusinessError)=>{
            console.log('hxw present error: ' + JSON.stringify(error))
            this.addResult('UEC拦截', 0, error.code);
          })
      }, 4000)
    } catch (err) { this.addResult('UEC拦截', 0, (err as BusinessError).code); }
  }

  async testNormal() {
    try {
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present({
        title: 'Alert',
        message: { content: 'AlertMsg' },
        buttons: [{ value: 'OK', action: () => {} }]
      });
      this.addResult('正常showAlertDialog', 0, 0);
    } catch (err) { this.addResult('正常showAlertDialog', 0, (err as BusinessError).code); }
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