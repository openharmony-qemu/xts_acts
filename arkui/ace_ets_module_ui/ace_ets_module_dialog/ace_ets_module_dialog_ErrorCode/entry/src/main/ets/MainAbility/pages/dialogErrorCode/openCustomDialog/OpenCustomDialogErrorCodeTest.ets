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
 * openCustomDialog 错误码测试
 * 对应新接口: present(content: ComponentContent, options?)
 * 错误码: 401(参数错误), 100001(内部错误), 103301(内容错误), 103302(内容已存在), 103306(挂载失败)
 */
import { ComponentContent, dialog as dialogApi, DialogPresenter } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  TestResult, makeResult, makeUecSubWinResult, TextParams, commonTextBuilder, DialogButtonBody,
  DialogMessageBody, DialogPresentResult, DialogSheetBody, SimpleDialogOptions
} from '../common/CommonHelper';
import { resourceManager } from '@kit.LocalizationKit';
import { common } from '@kit.AbilityKit';

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
struct OpenCustomDialogErrorCodeTest {
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
          Text('openCustomDialog 错误码测试')
            .fontSize(20).fontWeight(FontWeight.Bold).margin({ top: 10 })

          Text('401 - 参数错误').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('content=null').id('OpenCustomDialogErrorCodeTest_btn_content_null').fontSize(12).layoutWeight(1)
              .onClick(() => this.testNull())
            Button('content=数字').id('OpenCustomDialogErrorCodeTest_btn_content_number').fontSize(12).layoutWeight(1)
              .onClick(() => this.testNumber())
          }
          Row({ space: 8 }) {
            Button('content=字符串').id('OpenCustomDialogErrorCodeTest_btn_content_string').fontSize(12).layoutWeight(1)
              .onClick(() => this.testString())
            Button('options=数字').id('OpenCustomDialogErrorCodeTest_btn_options_number').fontSize(12).layoutWeight(1)
              .onClick(() => this.testInvalidOptions())
          }

          Text('103302 - 弹窗内容已存在').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('同一ComponentContent重复打开').id('OpenCustomDialogErrorCodeTest_btn_duplicate')
            .fontSize(12).width('100%')
            .onClick(() => this.testDuplicate())


          Text(' 103306 - 弹窗节点挂载失败').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Column({ space: 8 }) {
            Button('拉起UEC后拉起弹窗')
              .id('OpenCustomDialogErrorCodeTest_btn_uec')
              .width('100%')
              .fontSize(12)
              .onClick(() => { this.testUEC() })
            Button('拉起UEC后拉起子窗模式的弹窗')
              .id('OpenCustomDialogErrorCodeTest_btn_uec_subwin')
              .width('100%')
              .fontSize(12)
              .onClick(() => { this.testUECSubWin() })
            Button('子窗已创建--拉起UEC后拉起子窗模式的弹窗')
              .id('OpenCustomDialogErrorCodeTest_btn_uec_subwin2')
              .width('100%')
              .fontSize(12)
              .onClick(() => { this.testUECSubWin2() })
          }.width('100%')


          Text('正常流程').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('正常openCustomDialog').id('OpenCustomDialogErrorCodeTest_btn_normal').fontSize(12).width('100%')
            // OCD-E-001
            .onClick(() => this.testNormal())

          
          if (this.results.length > 0) {
            Text(this.results[0].passed ? 'PASS' : 'FAILED')
              .id('OpenCustomDialogErrorCodeTest_result_status')
              .fontSize(1).height(1).opacity(0)
            Text(this.results[0].label)
              .id('OpenCustomDialogErrorCodeTest_result_label')
              .fontSize(1).height(1).opacity(0)
            Text(String(this.results[0].actualCode))
              .id('OpenCustomDialogErrorCodeTest_result_actual')
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
    .title('openCustomDialog 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testUEC() {
    try {
      this.share();
      setTimeout(()=>{
        console.log('hxw present')
        let uiContext = this.getUIContext();
        let cn: ComponentContent<Params> | null = null;
        if (uiContext.getHostContext() != undefined) {
          cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Normal',
            uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
        }
        this.getUIContext().getDialogPresenter().present(cn, {customStyle: true})
          .then((res: number) => {
            console.log('hxw present ret: ' + JSON.stringify(res))
            this.addResult('UEC拦截', 103306, -1);
          })
          .catch((error: BusinessError)=>{
            console.log('hxw present error: ' + JSON.stringify(error))
            this.addResult('UEC拦截', 103306, error.code);
          })
      }, 3000)
    } catch (err) { this.addResult('UEC拦截', 103306, (err as BusinessError).code); }
  }

  async testUECSubWin() {
    try {
      this.share();
      setTimeout(()=>{
        console.log('hxw present')
        let uiContext = this.getUIContext();
        let cn: ComponentContent<Params> | null = null;
        if (uiContext.getHostContext() != undefined) {
          cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Normal',
            uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
        }
        this.getUIContext().getDialogPresenter().present(cn, {customStyle: true, showInSubWindow: true})
          .then((res: number) => {
            console.log('hxw present 111 ret: ' + JSON.stringify(res))
            this.results.unshift(makeUecSubWinResult(-1));
          })
          .catch((error: BusinessError)=>{
            console.log('hxw present error: ' + JSON.stringify(error))
            this.results.unshift(makeUecSubWinResult(error.code));
          })
      }, 5000)
    } catch (err) { this.results.unshift(makeUecSubWinResult((err as BusinessError).code)); }
  }

  async testUECSubWin2() {
    try {
      // 先拉一个正常子窗，完成子窗创建
      this.getUIContext().getDialogPresenter().present({title: 'tmp', showInSubWindow: true})
      setTimeout(()=>{
        this.share();
      }, 2000)
      setTimeout(()=>{
        console.log('hxw present')
        let uiContext = this.getUIContext();
        let cn: ComponentContent<Params> | null = null;
        if (uiContext.getHostContext() != undefined) {
          cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Normal',
            uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
        }
        this.getUIContext().getDialogPresenter().present(cn, {customStyle: true, showInSubWindow: true})
          .then((res: number) => {
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
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Normal',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      await (dialog.present as Function)(cn as Object);
      this.addResult('正常openCustomDialog', 0, 0);
      await (dialog.dismiss as Function)(cn as Object);
    } catch (err) { this.addResult('正常openCustomDialog', 0, (err as BusinessError).code); }
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
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('T',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      await (this.getUIContext().getDialogPresenter().present as Function)(cn, 123);
      this.addResult('options=数字', 0, 0);
    } catch (err) { this.addResult('options=数字', 401, (err as BusinessError).code); }
  }

  async testDuplicate() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Dup',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog: DialogPresenter = this.getUIContext().getDialogPresenter();
      await (dialog.present as Function)(cn as Object);
      this.addResult('第一次打开', 0, 0);
      try {
        await (dialog.present as Function)(cn as Object);
        this.addResult('重复打开', 103302, -1);
      } catch (innerErr) {
        this.addResult('重复打开', 103302, (innerErr as BusinessError).code);
      }
      await (dialog.dismiss as Function)(cn as Object);
    } catch (err) { this.addResult('重复打开', 103302, (err as BusinessError).code); }
  }
}