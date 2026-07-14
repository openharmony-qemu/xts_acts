/**
 * showAlertDialog 错误码测试
 * 对应新接口: present(options: DialogOptions)
 * 错误码: 401, 100001, 103306
 */
import { BusinessError } from '@kit.BasicServicesKit';
import { TestResult, makeResult } from '../common/CommonHelper';

@Entry
@Component
struct ShowAlertDialogErrorCodeTest {
  @State results: TestResult[] = [];

  private addResult(label: string, expectedCode: number, actualCode: number) {
    this.results.unshift(makeResult(label, expectedCode, actualCode));
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

          Text('子窗模式 present（自动化稳妥对照）')
            .fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Column({ space: 8 }) {
            Button('子窗模式 present')
              .id('ShowAlertDialogErrorCodeTest_btn_uec')
              .width('100%')
              .fontSize(12)
              // SAD-E-007
              .onClick(() => { this.testUEC() })
            Button('子窗模式带按钮 present')
              .id('ShowAlertDialogErrorCodeTest_btn_uec_subwin')
              .width('100%')
              .fontSize(12)
              // SAD-E-008
              .onClick(() => { this.testUECSubWin() })
            Button('连续两次子窗 present')
              .id('ShowAlertDialogErrorCodeTest_btn_uec_subwin2')
              .width('100%')
              .fontSize(12)
              // SAD-E-009
              .onClick(() => { this.testUECSubWin2() })
          }.width('100%')

          Text('正常流程').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 8 })
          Button('正常showAlertDialog').id('ShowAlertDialogErrorCodeTest_btn_normal').fontSize(12).width('100%')
            // SAD-E-001
            .onClick(() => this.testNormal())

          
          Text(this.results.length > 0 ? (this.results[0].passed ? 'PASS' : 'FAILED') : 'IDLE')
            .id('ShowAlertDialogErrorCodeTest_result_status')
            .fontSize(1).height(1).opacity(0)
          Text(this.results.length > 0 ? this.results[0].label : '')
            .id('ShowAlertDialogErrorCodeTest_result_label')
            .fontSize(1).height(1).opacity(0)
          Text(this.results.length > 0 ? String(this.results[0].actualCode) : '')
            .id('ShowAlertDialogErrorCodeTest_result_actual')
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
    .title('showAlertDialog 错误码').titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }

  async testUEC() {
    try {
      await this.getUIContext().getDialogPresenter().present({
        title: 'SubWin',
        message: { content: 'sub' },
        buttons: [{ value: 'OK', action: () => {} }],
        showInSubWindow: true,
      });
      this.addResult('子窗present', 0, 0);
    } catch (err) {
      this.addResult('子窗present', 0, (err as BusinessError).code);
    }
  }

  async testUECSubWin() {
    try {
      await this.getUIContext().getDialogPresenter().present({
        title: 'SubWin2',
        message: { content: 'sub2' },
        buttons: [{ value: 'OK', action: () => {} }],
        showInSubWindow: true,
      });
      this.addResult('子窗带按钮present', 0, 0);
    } catch (err) {
      this.addResult('子窗带按钮present', 0, (err as BusinessError).code);
    }
  }

  async testUECSubWin2() {
    try {
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present({
        title: 'S1',
        message: { content: 'a' },
        buttons: [{ value: 'OK', action: () => {} }],
        showInSubWindow: true,
      });
      await dialog.present({
        title: 'S2',
        message: { content: 'b' },
        buttons: [{ value: 'OK', action: () => {} }],
        showInSubWindow: true,
      });
      this.addResult('连续子窗present', 0, 0);
    } catch (err) {
      this.addResult('连续子窗present', 0, (err as BusinessError).code);
    }
  }

  async testNormal() {
    try {
      let dialog = this.getUIContext().getDialogPresenter();
      await dialog.present({
        title: 'Alert',
        message: { content: 'AlertMsg' },
        buttons: [{ value: 'OK', action: () => {} }],
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