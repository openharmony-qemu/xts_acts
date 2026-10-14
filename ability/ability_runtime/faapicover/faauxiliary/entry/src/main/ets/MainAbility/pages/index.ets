import featureAbility from '@ohos.ability.featureAbility';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
const TAG = 'FAAuxiliary_Index';
const SELF_BUNDLE = 'ohos.acts.aafwk.test.faauxiliary';
const SERVICE_ABILITY = 'ServiceAbility';
const SERVICE_ABILITY2 = 'ServiceExtAbility';
 
// appCloneIndex 边界值集合
const APP_INDEX_VALUES: (number | undefined)[] = [0, -1, 1, 10000, 10001, 1001, 11001, undefined];
const APP_INDEX_LABELS: string[] = ['0', '-1', '1', '10000', '10001', '1001', '11001', 'no'];
 
@Entry
@Component
struct Index {
  @State logText: string = '';
  private connectIds: number[] = [];
 
  private timestamp(): string {
    let now = new Date();
    return `${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}:${now.getSeconds().toString().padStart(2, '0')}`;
  }
 
  private appendLog(msg: string) {
    this.logText = `[${this.timestamp()}] ${msg}\n` + this.logText;
  }
 
  doConnect(label: string, want: Want) {
    let self = this;
    this.appendLog(`${label} → call`);
    try {
      let connectId = featureAbility.connectAbility(want, {
        onConnect(elementName, remote) {
          self.appendLog(`${label} ✓ onConnect, elementName=${elementName.bundleName}/${elementName.abilityName}`);
        },
        onDisconnect(elementName) {
          self.appendLog(`${label} → onDisconnect, elementName=${elementName.bundleName}/${elementName.abilityName}`);
        },
        onFailed(code) {
          self.appendLog(`${label} ✗ onFailed code=${code}`);
        }
      });
      this.connectIds.push(connectId);
      this.appendLog(`${label} connectId=${connectId}, total=${this.connectIds.length}`);
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      this.appendLog(`${label} ✗ EXCEPTION code=${code}, msg=${message}`);
    }
  }
 
  doDisconnectLast() {
    if (this.connectIds.length === 0) {
      this.appendLog('Disconnect Last: no active connection');
      return;
    }
    let connectId = this.connectIds.pop()!;
    this.appendLog(`Disconnect Last → call, connectId=${connectId}, remaining=${this.connectIds.length}`);
    featureAbility.disconnectAbility(connectId)
      .then(() => {
        this.appendLog(`Disconnect Last ✓ SUCCEED, connectId=${connectId}`);
      })
      .catch((err: BusinessError) => {
        this.appendLog(`Disconnect Last ✗ FAILED connectId=${connectId}, code=${err.code}, msg=${err.message}`);
      });
  }
 
  async doDisconnectAll() {
    if (this.connectIds.length === 0) {
      this.appendLog('Disconnect All: no active connection');
      return;
    }
    this.appendLog(`Disconnect All start, count=${this.connectIds.length}`);
    let ids = this.connectIds.splice(0);
    for (let i = 0; i < ids.length; i++) {
      try {
        await featureAbility.disconnectAbility(ids[i]);
        this.appendLog(`Disconnect All ok: connectId=${ids[i]}`);
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        this.appendLog(`Disconnect All FAILED: connectId=${ids[i]}, code=${code}, msg=${message}`);
      }
    }
    this.appendLog(`Disconnect All done, remaining=${this.connectIds.length}`);
  }
 
  build() {
    Column() {
      // ===== Header =====
      Row() {
        Text('featureAbility.connectAbility 测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height(56)
      .backgroundColor('#FFFFFF')
 
      // ===== 固定操作区 =====
      Row() {
        Button('Clear')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .backgroundColor('#607D8B')
          .layoutWeight(1)
          .margin({ left: 4, right: 2 })
          .onClick(() => { this.logText = ''; })
        Text(`日志 (${this.logText.split('\n').length - 1})`)
          .fontSize(9)
          .fontColor('#666666')
          .layoutWeight(2)
          .textAlign(TextAlign.Center)
        Blank().layoutWeight(1)
      }
      .width('100%')
      .height(32)
      .backgroundColor('#FFF3E0')
      .alignItems(VerticalAlign.Center)
 
      // ===== 上半部分：按钮区域 =====
      Scroll() {
        Column() {
          // ==================== connectAbility → ServiceAbility ====================
          Text('--- connectAbility → ServiceAbility ---')
            .fontSize(12).fontWeight(FontWeight.Bold).backgroundColor('#E3F2FD').padding(8).width('100%')
 
          ForEach(APP_INDEX_LABELS, (label: string, index: number) => {
            Button(`Connect ServiceAbility appCloneIndex=${label}`)
              .fontSize(10).margin(10).fontWeight(FontWeight.Bold)
              .onClick(() => {
                let parameters: Record<string, Object> = {};
                let val = APP_INDEX_VALUES[index];
                if (val !== undefined) {
                  parameters['ohos.extra.param.key.appCloneIndex'] = val;
                }
                this.doConnect(`Connect SA appClone=${label}`, {
                  deviceId: '',
                  bundleName: SELF_BUNDLE,
                  abilityName: SERVICE_ABILITY,
                  parameters: parameters
                });
              })
          })
 
          // ==================== connectAbility → ServiceAbility2 ====================
          Text('--- connectAbility → ServiceAbility2 ---')
            .fontSize(12).fontWeight(FontWeight.Bold).backgroundColor('#E8F5E9').padding(8).width('100%')
 
          ForEach(APP_INDEX_LABELS, (label: string, index: number) => {
            Button(`Connect ServiceAbility2 appCloneIndex=${label}`)
              .fontSize(10).margin(10).fontWeight(FontWeight.Bold)
              .onClick(() => {
                let parameters: Record<string, Object> = {};
                let val = APP_INDEX_VALUES[index];
                if (val !== undefined) {
                  parameters['ohos.extra.param.key.appCloneIndex'] = val;
                }
                this.doConnect(`Connect SA2 appClone=${label}`, {
                  deviceId: '',
                  bundleName: 'com.acts.servicedemoservice',
                  abilityName: SERVICE_ABILITY2,
                  parameters: parameters
                });
              })
          })
 
          // ==================== 断开连接 ====================
          Text('--- 断开连接 ---')
            .fontSize(12).fontWeight(FontWeight.Bold).backgroundColor('#FFEBEE').padding(8).width('100%')
            .textAlign(TextAlign.Center)
 
          Button("Disconnect Last")
            .fontSize(10).margin(10).fontWeight(FontWeight.Bold)
            .backgroundColor('#FF5722')
            .onClick(() => { this.doDisconnectLast(); })
          Button(`Disconnect All (${this.connectIds.length})`)
            .fontSize(10).margin(10).fontWeight(FontWeight.Bold)
            .backgroundColor('#F44336')
            .onClick(() => { this.doDisconnectAll(); })
        }
        .width('100%')
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
 
      // ===== 下半部分：日志显示区 =====
      Scroll() {
        Text(this.logText)
          .fontSize(9)
          .fontColor('#1565C0')
          .fontFamily('monospace')
          .padding(6)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
      .backgroundColor('#FAFAFA')
    }
    .width('100%')
    .height('100%')
  }
}