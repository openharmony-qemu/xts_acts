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
 * presentCustomDialog 错误码测试
 * 对应新接口: DialogPresenter.present(content, options?)
 * 自动化: 401(含 dispose 后 present 实测), 103302, 0(含子窗正例)
 * @manual-verify: 103301(引擎 contentNode 空才抛; dispose 落 401);
 *   100001/103306/103308/103307 见 docs+SDK；禁 FilePicker
 */
import { ComponentContent, DialogPresenter } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { TestResult, makeResult } from '../common/CommonHelper';
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
struct PresentCustomDialogErrorCodeTest {
  @State results: TestResult[] = [];

  private addResult(label: string, expectedCode: number, actualCode: number) {
    this.results.unshift(makeResult(label, expectedCode, actualCode));
  }

  private makeContent(text: string): ComponentContent<Params> | null {
    let uiContext = this.getUIContext();
    if (uiContext.getHostContext() == undefined) {
      return null;
    }
    let colorMode = uiContext.getHostContext()!!.getApplicationContext()
      .resourceManager.getConfigurationSync().colorMode;
    return new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params(text, colorMode));
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: 12 }) {
          Text('presentCustomDialog 错误码测试')
            .fontSize(20).fontWeight(FontWeight.Bold).margin({ top: 10 })

          Text('401 - 参数错误').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('content=null').id('PresentCustomDialogErrorCodeTest_btn_content_null').fontSize(12).layoutWeight(1)
              .onClick(() => this.testNull())
            Button('content=数字').id('PresentCustomDialogErrorCodeTest_btn_content_number').fontSize(12).layoutWeight(1)
              .onClick(() => this.testNumber())
          }
          Row({ space: 8 }) {
            Button('content=字符串').id('PresentCustomDialogErrorCodeTest_btn_content_string').fontSize(12).layoutWeight(1)
              .onClick(() => this.testString())
            Button('options=数字').id('PresentCustomDialogErrorCodeTest_btn_options_number').fontSize(12).layoutWeight(1)
              .onClick(() => this.testInvalidOptions())
          }

          Button('dispose 后 present')
            .id('PresentCustomDialogErrorCodeTest_btn_disposed')
            .fontSize(12).width('100%')
            .onClick(() => this.testDisposedPresent())

          Text('103302 - 弹窗内容已存在').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('同一ComponentContent重复打开').id('PresentCustomDialogErrorCodeTest_btn_duplicate')
            .fontSize(12).width('100%')
            .onClick(() => this.testDuplicate())

          Text('子窗模式 present（自动化稳妥对照）')
            .fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Column({ space: 8 }) {
            Button('子窗模式 present')
              .id('PresentCustomDialogErrorCodeTest_btn_uec')
              .width('100%')
              .fontSize(12)
              .onClick(() => { this.testUEC() })
            Button('子窗模式 customStyle present')
              .id('PresentCustomDialogErrorCodeTest_btn_uec_subwin')
              .width('100%')
              .fontSize(12)
              .onClick(() => { this.testUECSubWin() })
            Button('连续两次子窗 present')
              .id('PresentCustomDialogErrorCodeTest_btn_uec_subwin2')
              .width('100%')
              .fontSize(12)
              .onClick(() => { this.testUECSubWin2() })
          }.width('100%')


          Text('正常流程').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('正常presentCustomDialog').id('PresentCustomDialogErrorCodeTest_btn_normal').fontSize(12).width('100%')
            // PCD-E-001
            .onClick(() => this.testNormal())

          Text(this.results.length > 0 ? (this.results[0].passed ? 'PASS' : 'FAILED') : 'IDLE')
            .id('PresentCustomDialogErrorCodeTest_result_status')
            .fontSize(1).height(1).opacity(0)
          Text(this.results.length > 0 ? this.results[0].label : '')
            .id('PresentCustomDialogErrorCodeTest_result_label')
            .fontSize(1).height(1).opacity(0)
          Text(this.results.length > 0 ? String(this.results[0].actualCode) : '')
            .id('PresentCustomDialogErrorCodeTest_result_actual')
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
    .title('presentCustomDialog 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testDisposedPresent() {
    let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
    let cn: ComponentContent<Params> | null = this.makeContent('Disposed');
    try {
      cn?.dispose();
      await (dialog.present as Function)(cn as Object);
      this.addResult('dispose后present', 401, -1);
    } catch (err) {
      this.addResult('dispose后present', 401, (err as BusinessError).code);
    }
  }

  async testUEC() {
    let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
    let cn: ComponentContent<Params> | null = this.makeContent('SubWin');
    try {
      await (dialog.present as Function)(cn as Object, { customStyle: true, showInSubWindow: true });
      this.addResult('子窗present', 0, 0);
      await (dialog.dismiss as Function)(cn as Object);
    } catch (err) {
      this.addResult('子窗present', 0, (err as BusinessError).code);
    }
  }

  async testUECSubWin() {
    let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
    let cn: ComponentContent<Params> | null = this.makeContent('SubWin2');
    try {
      await (dialog.present as Function)(cn as Object, { customStyle: true, showInSubWindow: true });
      this.addResult('子窗customStyle present', 0, 0);
      await (dialog.dismiss as Function)(cn as Object);
    } catch (err) {
      this.addResult('子窗customStyle present', 0, (err as BusinessError).code);
    }
  }

  async testUECSubWin2() {
    let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
    let cn1: ComponentContent<Params> | null = this.makeContent('S1');
    let cn2: ComponentContent<Params> | null = this.makeContent('S2');
    try {
      await (dialog.present as Function)(cn1 as Object, { customStyle: true, showInSubWindow: true });
      await (dialog.present as Function)(cn2 as Object, { customStyle: true, showInSubWindow: true });
      this.addResult('连续子窗present', 0, 0);
      await (dialog.dismiss as Function)(cn2 as Object);
      await (dialog.dismiss as Function)(cn1 as Object);
    } catch (err) {
      this.addResult('连续子窗present', 0, (err as BusinessError).code);
      try {
        await (dialog.dismiss as Function)(cn2 as Object);
      } catch (_e2) {
      }
      try {
        await (dialog.dismiss as Function)(cn1 as Object);
      } catch (_e1) {
      }
    }
  }


  async testNormal() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Normal',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      let id = await dialog.present(cn);
      this.addResult('正常presentCustomDialog', 0, 0);
      await dialog.dismiss(cn);
    } catch (err) { this.addResult('正常presentCustomDialog', 0, (err as BusinessError).code); }
  }

  async testNull() {
    try {
      await (this.getUIContext().getDialogPresenter().present as Function)(null);
      this.addResult('content=null', 401, -1);
    } catch (err) { this.addResult('content=null', 401, (err as BusinessError).code); }
  }

  async testNumber() {
    try {
      await (this.getUIContext().getDialogPresenter().present as Function)(123);
      this.addResult('content=数字', 401, -1);
    } catch (err) { this.addResult('content=数字', 401, (err as BusinessError).code); }
  }

  async testString() {
    try {
      await (this.getUIContext().getDialogPresenter().present as Function)('invalid');
      this.addResult('content=字符串', 401, -1);
    } catch (err) { this.addResult('content=字符串', 401, (err as BusinessError).code); }
  }

  async testInvalidOptions() {
    let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
    let cn: ComponentContent<Params> | null = this.makeContent('T');
    try {
      await (dialog.present as Function)(cn as Object, 123);
      this.addResult('options=数字', 0, 0);
      await (dialog.dismiss as Function)(cn as Object);
    } catch (err) {
      this.addResult('options=数字', 401, (err as BusinessError).code);
    }
  }

  async testDuplicate() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Dup',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present(cn);
      this.addResult('第一次打开', 0, 0);
      try {
        await dialog.present(cn);
        this.addResult('重复打开', 103302, -1);
      } catch (innerErr) {
        this.addResult('重复打开', 103302, (innerErr as BusinessError).code);
      }
      await dialog.dismiss(cn);
    } catch (err) { this.addResult('重复打开', 103302, (err as BusinessError).code); }
  }
}