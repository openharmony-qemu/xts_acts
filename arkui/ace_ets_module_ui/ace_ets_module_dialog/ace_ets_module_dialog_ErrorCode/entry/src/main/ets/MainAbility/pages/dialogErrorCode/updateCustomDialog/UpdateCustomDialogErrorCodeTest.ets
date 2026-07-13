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
 * updateCustomDialog 错误码测试
 * 对应新接口: update(content: ComponentContent, options: DialogBaseOptions)
 * 错误码: 401(参数错误), 103301(内容错误), 103303(内容未找到)
 */
import { ComponentContent, dialog as dialogApi } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { TestResult, makeResult, TextParams, commonTextBuilder } from '../common/CommonHelper';
import { resourceManager } from '@kit.LocalizationKit';

class Params {
  public text: string = '';
  public colorMode: resourceManager.ColorMode = resourceManager.ColorMode.LIGHT

  constructor(text: string, colorMode: resourceManager.ColorMode) {
    this.text = text
    this.colorMode = colorMode
  }
}

@Builder
function builderDialog(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 36 })
  }.backgroundColor(params.colorMode == resourceManager.ColorMode.LIGHT ? '#D5D5D5' : '#004AAF')
}

@Entry
@Component
struct UpdateCustomDialogErrorCodeTest {
  @State results: TestResult[] = [];

  private addResult(label: string, expectedCode: number, actualCode: number) {
    this.results.unshift(makeResult(label, expectedCode, actualCode));
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: 12 }) {
          Text('updateCustomDialog 错误码测试')
            .fontSize(20).fontWeight(FontWeight.Bold).margin({ top: 10 })

          Text('401 - 参数错误').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('content=null').id('UpdateCustomDialogErrorCodeTest_btn_content_null').fontSize(12).layoutWeight(1)
              // UCD-E-002
              .onClick(() => this.testContentNull())
          }
          Row({ space: 8 }) {
            Button('options=null').id('UpdateCustomDialogErrorCodeTest_btn_options_null').fontSize(12).layoutWeight(1)
              // UCD-E-004
              .onClick(() => this.testOptionsNull())
            Button('两个参数都不传').id('UpdateCustomDialogErrorCodeTest_btn_no_args').fontSize(12).layoutWeight(1)
              // UCD-E-005
              .onClick(() => this.testNoArgs())
          }

          Text('401 - 弹窗内容释放').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('disposed ComponentContent').id('UpdateCustomDialogErrorCodeTest_btn_disposed')
            .fontSize(12).width('100%')
            // UCD-E-006
            .onClick(() => this.testDisposed())

          Text('103303 - 弹窗内容未找到').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('未打开过的content').id('UpdateCustomDialogErrorCodeTest_btn_not_opened')
              .fontSize(12).layoutWeight(1)
              // UCD-E-007
              .onClick(() => this.testNotOpened())
            Button('已关闭的content').id('UpdateCustomDialogErrorCodeTest_btn_already_closed')
              .fontSize(12).layoutWeight(1)
              // UCD-E-008
              .onClick(() => this.testAlreadyClosed())
          }

          Text('正常流程').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('正常update').id('UpdateCustomDialogErrorCodeTest_btn_normal').fontSize(12).width('100%')
            // UCD-E-001
            .onClick(() => this.testNormal())

          
          if (this.results.length > 0) {
            Text(this.results[0].passed ? 'PASS' : 'FAILED')
              .id('UpdateCustomDialogErrorCodeTest_result_status')
              .fontSize(1).height(1).opacity(0)
            Text(this.results[0].label)
              .id('UpdateCustomDialogErrorCodeTest_result_label')
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
    .title('updateCustomDialog 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testNormal() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Upd',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      console.log('hxw typeof cn: ' + typeof cn)
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present(cn);
      await dialog.update(cn, { maskColor: '#80FF69B4' });
      this.addResult('正常update', 0, 0);
      await dialog.dismiss(cn);
    } catch (err) { this.addResult('正常update', 0, (err as BusinessError).code); }
  }

  async testContentNull() {
    try {
      let dialog = this.getUIContext().getDialogPresenter();
      await (dialog.update as Function)(null, { maskColor: '#80FF69B4' });
      this.addResult('content=null', 401, -1);
    } catch (err) { this.addResult('content=null', 401, (err as BusinessError).code); }
  }

  async testOptionsNull() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('T',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present(cn);
      await dialog.update(cn, null);
      this.addResult('options=null', 0, 0);
    } catch (err) { this.addResult('options=null', 401, (err as BusinessError).code); }
  }

  async testNoArgs() {
    try {
      let dialog = this.getUIContext().getDialogPresenter();
      await (dialog.update as Function)();
      this.addResult('不传参数', 401, -1);
    } catch (err) { this.addResult('不传参数', 401, (err as BusinessError).code); }
  }

  async testDisposed() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('D',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      cn?.dispose();
      try {
        await dialog.update(cn, { maskColor: '#80FF69B4' });
        this.addResult('disposed content', 401, -1);
      } catch (innerErr) { this.addResult('disposed content', 401, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('disposed content', 401, (err as BusinessError).code); }
  }

  async testNotOpened() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('No',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      try {
        await dialog.update(cn, { maskColor: '#80FF69B4' });
        this.addResult('未打开过的content', 103303, -1);
      } catch (innerErr) { this.addResult('未打开过的content', 103303, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('未打开过的content', 103303, (err as BusinessError).code); }
  }

  async testAlreadyClosed() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Cls',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present(cn);
      await dialog.dismiss(cn);
      try {
        await dialog.update(cn, { maskColor: '#80FF69B4' });
        this.addResult('已关闭的content', 103303, -1);
      } catch (innerErr) { this.addResult('已关闭的content', 103303, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('已关闭的content', 103303, (err as BusinessError).code); }
  }
}