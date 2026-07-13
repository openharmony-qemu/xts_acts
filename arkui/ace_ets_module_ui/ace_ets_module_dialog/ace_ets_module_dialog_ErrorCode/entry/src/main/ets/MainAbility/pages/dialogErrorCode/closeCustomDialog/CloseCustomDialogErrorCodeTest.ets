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
 * closeCustomDialog 错误码测试
 * 对应新接口: dismiss(target: number | ComponentContent)
 * 错误码: 401(参数错误), 100001(内部错误), 103301(内容错误), 103303(内容未找到)
 */
import { ComponentContent } from '@kit.ArkUI';
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
struct CloseCustomDialogErrorCodeTest {
  @State results: TestResult[] = [];

  private addResult(label: string, expectedCode: number, actualCode: number) {
    this.results.unshift(makeResult(label, expectedCode, actualCode));
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: 12 }) {
          Text('closeCustomDialog 错误码测试')
            .fontSize(20).fontWeight(FontWeight.Bold).margin({ top: 10 })

          Text('正常流程').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('dismiss(content)').id('CloseCustomDialogErrorCodeTest_btn_dismiss_content')
              .fontSize(12).layoutWeight(1)
              // CCD-E-001
              .onClick(() => this.testNormalByContent())
            Button('dismiss(dialogId)').id('CloseCustomDialogErrorCodeTest_btn_dismiss_id')
              .fontSize(12).layoutWeight(1)
              // CCD-E-002
              .onClick(() => this.testNormalById())
          }

          Text('401 - 参数错误').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('不传参数').id('CloseCustomDialogErrorCodeTest_btn_no_args').fontSize(12).layoutWeight(1)
              // CCD-E-003
              .onClick(() => this.testNoArgs())
            Button('target=null').id('CloseCustomDialogErrorCodeTest_btn_target_null').fontSize(12).layoutWeight(1)
              // CCD-E-004
              .onClick(() => this.testNull())
          }

          Text('103303 - 弹窗内容未找到').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('未打开过的content').id('CloseCustomDialogErrorCodeTest_btn_not_opened')
              .fontSize(12).layoutWeight(1)
              .onClick(() => this.testNotOpened())
            Button('无效dialogId(99999)').id('CloseCustomDialogErrorCodeTest_btn_invalid_id')
              .fontSize(12).layoutWeight(1)
              .onClick(() => this.testInvalidId())
          }
          Button('已关闭后再dismiss(content)')
            .fontSize(12).width('100%')
            .onClick(() => this.testAlreadyClosed())
          Button('已关闭后再dismiss(dialogId)')
            .fontSize(12).width('100%')
            .onClick(() => this.testAlreadyClosedById())

          Text('固定样式dialog，dismiss(dialogId)').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('固定样式dismiss(dialogId)')
            .fontSize(12).width('100%')
            .onClick(() => this.testStyleDialogById())

          Text('子窗测试').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Row({ space: 8 }) {
            Button('dismiss(content)').id('CloseCustomDialogErrorCodeTest_btn_dismiss_content')
              .fontSize(12).layoutWeight(1)
              .onClick(() => this.testNormalByContentSubWin())
            Button('dismiss(dialogId)').id('CloseCustomDialogErrorCodeTest_btn_dismiss_id')
              .fontSize(12).layoutWeight(1)
              .onClick(() => this.testNormalByIdSubWin())
          }
          Button('已关闭后再dismiss(content)')
            .fontSize(12).width('100%')
            .onClick(() => this.testAlreadyClosedSubWin())
          Button('已关闭后再dismiss(dialogId)')
            .fontSize(12).width('100%')
            .onClick(() => this.testAlreadyClosedByIdSubWin())
          Button('固定样式dismiss(dialogId)')
            .fontSize(12).width('100%')
            .onClick(() => this.testStyleDialogByIdSubWin())


          
          if (this.results.length > 0) {
            Text(this.results[0].passed ? 'PASS' : 'FAILED')
              .id('CloseCustomDialogErrorCodeTest_result_status')
              .fontSize(1).height(1).opacity(0)
            Text(this.results[0].label)
              .id('CloseCustomDialogErrorCodeTest_result_label')
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
    .title('closeCustomDialog 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testNormalByContent() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('CC',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present(cn,  {
        onWillDismiss: (action: DismissDialogAction) => {
          console.info('[HXW] onWillDismiss triggered, reason: ' + action.reason);
          action.dismiss();
          this.addResult('通过onWillDismiss关闭，没有自动关闭', 0, -1);
        },
      });
      setTimeout(()=>{
        dialog.dismiss(cn);
      }, 500)
      this.addResult('dismiss(content)', 0, 0);
    } catch (err) { this.addResult('dismiss(content)', 0, (err as BusinessError).code); }
  }

  async testNormalById() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('ID',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      let res = await dialog.present(cn, {
        onWillDismiss: (action: DismissDialogAction) => {
          console.info('[HXW] onWillDismiss triggered, reason: ' + action.reason);
          action.dismiss();
          this.addResult('通过onWillDismiss关闭，没有自动关闭', 0, -1);
        },
      });
      console.log('hxw dialog id ' + res)
      this.addResult('present成功', 0, 0);
      setTimeout(()=>{
        dialog.dismiss(res.dialogId);
      }, 500)
    } catch (err) { this.addResult('dismiss(dialogId)', 0, (err as BusinessError).code); }
  }

  async testNormalByContentSubWin() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('CC',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present(cn,  {
        showInSubWindow: true,
        onWillDismiss: (action: DismissDialogAction) => {
          console.info('[HXW] onWillDismiss triggered, reason: ' + action.reason);
          action.dismiss();
          this.addResult('通过onWillDismiss关闭，没有自动关闭', 0, -1);
        },
      });
      setTimeout(()=>{
        dialog.dismiss(cn)
          .then(()=>{
            this.addResult('promise testNormalByContentSubWin', 0, 0);
          })
          .catch((err: BusinessError) => {
            this.addResult('promise testNormalByContentSubWin', 0, (err as BusinessError).code);
          })
      }, 500)
      this.addResult('dismiss(content)', 0, 0);
    } catch (err) { this.addResult('dismiss(content)', 0, (err as BusinessError).code); }
  }

  async testNormalByIdSubWin() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('ID',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      let res = await dialog.present(cn, {
        showInSubWindow: true,
        onWillDismiss: (action: DismissDialogAction) => {
          console.info('[HXW] onWillDismiss triggered, reason: ' + action.reason);
          action.dismiss();
          this.addResult('通过onWillDismiss关闭，没有自动关闭', 0, -1);
        },
      });
      console.log('hxw dialog id ' + res)
      this.addResult('present成功', 0, 0);
      setTimeout(()=>{
        dialog.dismiss(res.dialogId)
          .then(()=>{
            this.addResult('promise testNormalByIdSubWin', 0, 0);
          })
          .catch((err: BusinessError) => {
            this.addResult('promise testNormalByIdSubWin', 0, (err as BusinessError).code);
          })
      }, 500)
    } catch (err) { this.addResult('dismiss(dialogId)', 0, (err as BusinessError).code); }
  }

  async testStyleDialogById() {
    try {
      let dialog = this.getUIContext().getDialogPresenter();
      let res = await dialog.present({
        title: 'Fixed Style', buttons: [
          { value: '选项1', action: () => {} },
          { value: '选项2', action: () => {} },
        ],
        onWillDismiss: (action: DismissDialogAction) => {
          console.info('[HXW] onWillDismiss triggered, reason: ' + action.reason);
          action.dismiss();
          this.addResult('通过onWillDismiss关闭，没有自动关闭', 0, -1);
        },
      });
      console.log('hxw dialog id ' + res)
      this.addResult('present成功', 0, 0);
      setTimeout(()=>{
        dialog.dismiss(res.dialogId);
      }, 500)
    } catch (err) { this.addResult('固定样式dialog dismiss(dialogId)', 0, (err as BusinessError).code); }
  }

  async testStyleDialogByIdSubWin() {
    try {
      let dialog = this.getUIContext().getDialogPresenter();
      let res = await dialog.present({
        showInSubWindow: true,
        title: 'Fixed Style', buttons: [
          { value: '选项1', action: () => {} },
          { value: '选项2', action: () => {} },
        ],
        onWillDismiss: (action: DismissDialogAction) => {
          console.info('[HXW] onWillDismiss triggered, reason: ' + action.reason);
          action.dismiss();
          this.addResult('通过onWillDismiss关闭，没有自动关闭', 0, -1);
        },
      });
      console.log('hxw dialog id ' + res)
      this.addResult('present成功', 0, 0);
      setTimeout(()=>{
        dialog.dismiss(res.dialogId)
          .then(()=>{
            this.addResult('promise testStyleDialogByIdSubWin', 0, 0);
          })
          .catch((err: BusinessError) => {
            this.addResult('promise testStyleDialogByIdSubWin', 0, (err as BusinessError).code);
          })
      }, 500)
    } catch (err) { this.addResult('固定样式dialog dismiss(dialogId)', 0, (err as BusinessError).code); }
  }

  async testNoArgs() {
    try {
      await (this.getUIContext().getDialogPresenter().dismiss as Function)();
      this.addResult('不传参数', 401, -1);
    } catch (err) { this.addResult('不传参数', 401, (err as BusinessError).code); }
  }

  async testNull() {
    try {
      await (this.getUIContext().getDialogPresenter().dismiss as Function)(null);
      this.addResult('target=null', 401, -1);
    } catch (err) { this.addResult('target=null', 401, (err as BusinessError).code); }
  }

  async testObject() {
    try {
      await (this.getUIContext().getDialogPresenter().dismiss as Function)({ foo: 'bar' });
      this.addResult('target=普通对象', 401, -1);
    } catch (err) { this.addResult('target=普通对象', 401, (err as BusinessError).code); }
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
        await dialog.dismiss(cn);
        this.addResult('disposed content', 103301, -1);
      } catch (innerErr) { this.addResult('disposed content', 103301, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('disposed content', 103301, (err as BusinessError).code); }
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
        await dialog.dismiss(cn);
        this.addResult('未打开过的content', 103303, -1);
      } catch (innerErr) { this.addResult('未打开过的content', 103303, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('未打开过的content', 103303, (err as BusinessError).code); }
  }

  async testInvalidId() {
    try {
      let dialog = this.getUIContext().getDialogPresenter();
      try {
        await dialog.dismiss(99999);
        this.addResult('无效dialogId(99999)', 103303, -1);
      } catch (innerErr) { this.addResult('无效dialogId(99999)', 103303, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('无效dialogId(99999)', 103303, (err as BusinessError).code); }
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
        dialog.dismiss(cn)
          .then(()=>{
            this.addResult('已关闭后再dismiss(content)', 103303, -1);
          })
          .catch((err: BusinessError) => {
            this.addResult('promise 已关闭后再dismiss(content)', 103303, (err as BusinessError).code);
          })
      } catch (innerErr) { this.addResult('已关闭后再dismiss(content)', -1, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('catch 已关闭后再dismiss(content)', -1, (err as BusinessError).code); }
  }

  async testAlreadyClosedById() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('ClsId',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      let res = await dialog.present(cn);
      await dialog.dismiss(res.dialogId);
      try {
        dialog.dismiss(res.dialogId)
          .then(()=>{
            this.addResult('已关闭后再dismiss(id)', 103303, -1);
          })
          .catch((err: BusinessError) => {
            this.addResult('promise 已关闭后再dismiss(id)', 103303, (err as BusinessError).code);
          })
      } catch (innerErr) { this.addResult('已关闭后再dismiss(id)', -1, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('已关闭后再dismiss(id)', -1, (err as BusinessError).code); }
  }

  async testAlreadyClosedSubWin() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('Cls',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present(cn, {
        showInSubWindow: true,
      });
      await dialog.dismiss(cn);
      try {
        await dialog.dismiss(cn);
        this.addResult('已关闭后再dismiss(content)', 103303, -1);
      } catch (innerErr) { this.addResult('已关闭后再dismiss(content)', 103303, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('catch 已关闭后再dismiss(content)', 103303, (err as BusinessError).code); }
  }

  async testAlreadyClosedByIdSubWin() {
    try {
      let uiContext = this.getUIContext();
      let cn: ComponentContent<Params> | null = null;
      if (uiContext.getHostContext() != undefined) {
        cn = new ComponentContent(uiContext, wrapBuilder(builderDialog), new Params('ClsId',
          uiContext.getHostContext()!!.getApplicationContext().resourceManager.getConfigurationSync().colorMode))
      }
      let dialog = this.getUIContext().getDialogPresenter();
      let res = await dialog.present(cn, {
        showInSubWindow: true,
      });
      await dialog.dismiss(res.dialogId);
      try {
        await dialog.dismiss(res.dialogId);
        this.addResult('已关闭后再dismiss(id)', 103303, -1);
      } catch (innerErr) { this.addResult('已关闭后再dismiss(id)', 103303, (innerErr as BusinessError).code); }
    } catch (err) { this.addResult('已关闭后再dismiss(id)', 103303, (err as BusinessError).code); }
  }
}