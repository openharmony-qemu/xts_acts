import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { DeviceManager } from 'iotmanagementkit';
import IotConstants, {
  DeviceConfig,
  ExecutionData,
  ExecutionStepResult,
  filterTestCases,
  InfDeviceState
} from './model/IotConstants';
import IotHelper from './model/IotHelper';
import IotDevice from './model/IotDevice';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';

const iotPath: string = globalThis.dir + '/IOT';
const configTxtPath = iotPath + '/IOTConfigReport.txt';
const CONFIG_COLOR_BACK_PATH = globalThis.dir + '/IOTConfigColorBack.txt';
const TAG = '[IOTExecution]';
type StepType = 'discovery' | 'connect' | 'query' | 'control' | 'netcfg';

interface StepState {
  index: number;
  name: string;
  title: string;
  type: StepType;
  status: 'pending' | 'running' | 'pass' | 'fail';
  reason?: string;
  detail?: string;
}

@Entry
@Component
struct IOTExecution {
  @State steps: StepState[] = [];
  @State isRunning: boolean = false;
  @State statusText: string = '点击开始执行';
  @State configSummary: string = '';
  @State executionDone: boolean = false;
  private executionResults: ExecutionStepResult[] = [];
  private config: DeviceConfig | null = null;
  private discoveredDevice: IotDevice | null = null;
  private stepTitles: string[] = [];

  aboutToAppear() {
    this.config = IotHelper.getInstance().getDeviceConfig();
    if (!this.config) {
      promptAction.showToast({ message: '未检测到配置信息，请先配置', duration: 2000 });
      this.statusText = '请先配置参数';
      return;
    }
    this.configSummary =
      `接入:${this.config.accessMode}  名称:${this.config.deviceName}  PID:${this.config.pid} SN:${this.config.sn}`;
    let filtered = filterTestCases(this.config);
    let stepList: StepState[] = [];
    let idx = 1;
    for (let tc of filtered) {
      let stepType = this.getStepTypeFromTitle(tc.title);
      if (stepType) {
        this.stepTitles.push(tc.title);
        stepList.push({
          index: idx++,
          name: this.getStepName(stepType),
          title: tc.title,
          type: stepType,
          status: 'pending'
        });
      }
    }
    this.steps = stepList;
  }

  aboutToDisappear(): void {
    IotHelper.getInstance().stopConnect();
  }

  private getStepTypeFromTitle(title: string): StepType | null {
    if (title.indexOf('DISCOVERY') >= 0) {
      return 'discovery';
    }
    if (title.indexOf('CONNECT') >= 0) {
      return 'connect';
    }
    if (title.indexOf('QUERY_SERVICE') >= 0) {
      return 'query';
    }
    if (title.indexOf('SEND_CMD') >= 0) {
      return 'control';
    }
    if (title.indexOf('NETCFG') >= 0) {
      return 'netcfg';
    }
    return null;
  }

  private getStepName(type: StepType): string {
    const map: Record<string, string> = {
      'discovery': '设备发现',
      'connect': '设备连接',
      'query': '服务查询',
      'control': '下发指令',
      'netcfg': '配网'
    };
    return map[type] || type;
  }

  private writeResultFile(filePath: string, title: string, result: string): void {
    try {
      let fd = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let buf = new ArrayBuffer(40960);
      let bytesRead = fs.readSync(fd.fd, buf);
      let content = bytesRead > 0 ? String.fromCharCode(...new Uint8Array(buf, 0, bytesRead)) : '';
      fs.closeSync(fd);

      let logEntry = `${title};${result};`;
      let idx = content.indexOf(title);
      let newContent: string;

      if (idx >= 0) {
        let oldEntryLen = title.length + result.length + 2;
        let oldEntry = content.substring(idx, idx + oldEntryLen);
        newContent = content.replace(oldEntry, logEntry);
      } else {
        newContent = content + logEntry;
      }

      fd = fs.openSync(filePath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      fs.writeSync(fd.fd, newContent);
      fs.closeSync(fd);
    } catch (e) {
      Logger.error(TAG, `writeResultFile error: ${JSON.stringify(e)}`);
    }
  }


  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' });
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => router.back());

        Text('执行模式')
          .fontColor(Color.White)
          .fontSize('22fp');
        Text('')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden);
      }
      .width('100%')
      .height('10%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.SpaceBetween);

      Scroll() {
        Column() {
          if (this.config) {
            Text(this.configSummary)
              .fontSize(13)
              .fontColor('#999999')
              .width('100%')
              .margin({ top: 16, bottom: 8 });
          }

          Column() {
            ForEach(this.steps, (step: StepState) => {
              Row() {
                Text(`${step.index}.`)
                  .fontSize(16)
                  .fontColor('#333333')
                  .fontWeight(FontWeight.Bold)
                  .width(28);
                Column() {
                  Text(step.name)
                    .fontSize(16)
                    .fontColor('#333333');
                  if (step.detail) {
                    Text(step.detail.length > 40 ? step.detail.substring(0, 40) + '...' : step.detail)
                      .fontSize(12)
                      .fontColor('#999999')
                      .margin({ top: 2 })
                      .onClick(() => {
                        AlertDialog.show({
                          title: step.name + ' - 详情',
                          message: step.detail,
                          confirm: {
                            value: '关闭', action: () => {
                            }
                          }
                        });
                      });
                  }
                  if (step.status === 'fail' && step.reason) {
                    Text(`→ ${step.reason}`)
                      .fontSize(12)
                      .fontColor('#d60a0a')
                      .margin({ top: 4 });
                  }
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start);

                Blank();
                if (step.status === 'running') {
                  LoadingProgress()
                    .width(24)
                    .height(24)
                    .color('#007DFF');
                } else {
                  Text(this.getStatusLabel(step.status))
                    .fontSize(14)
                    .fontColor(this.getStatusColor(step.status))
                    .fontWeight(FontWeight.Bold);
                }
              }
              .width('100%')
              .padding({
                top: 14,
                bottom: 14,
                left: 12,
                right: 12
              });
            }, (step: StepState, index: number) => index + JSON.stringify(step));
          }
          .backgroundColor(Color.White)
          .borderRadius(12)
          .width('100%')
          .shadow({
            radius: 2,
            offsetX: 0,
            offsetY: 1,
            color: '#1A000000'
          });

          Text(this.statusText)
            .fontSize(13)
            .fontColor('#999999')
            .margin({ top: 20 })
            .width('100%')
            .textAlign(TextAlign.Center);

          if (this.executionDone) {
            Button('查看报告')
              .width('100%')
              .height(44)
              .fontColor(Color.White)
              .backgroundColor('#007DFF')
              .borderRadius(22)
              .fontSize(16)
              .margin({ top: 12, bottom: 32 })
              .onClick(() => {
                router.replaceUrl({
                  url: 'pages/IOT/IOT_execution_report',
                  params: {
                    results: JSON.stringify(this.executionResults),
                    allPass: this.executionResults.every(r => r.status === 'pass'),
                    title: '执行模式'
                  }
                });
              });
          } else {
            Button(this.isRunning ? '执行中...' : '开始执行')
              .width('100%')
              .height(44)
              .fontColor('#007DFF')
              .backgroundColor('#e1e5e8')
              .borderRadius(22)
              .fontSize(16)
              .margin({ top: 12, bottom: 32 })
              .enabled(!this.isRunning && this.config != null)
              .onClick(() => this.startExecution());
          }
        }
        .padding({ left: 16, right: 16 });
      }
      .layoutWeight(1)
      .align(Alignment.Top)
      .backgroundColor(Color.White);
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White);
  }

  private updateStepStatus(step: StepState, status: 'pending' | 'running' | 'pass' | 'fail',
    reason?: string, detail?: string): StepState {
    return {
      index: step.index,
      name: step.name,
      title: step.title,
      type: step.type,
      status: status,
      reason: reason ?? step.reason,
      detail: detail ?? step.detail
    };
  }

  private async startExecution() {
    if (this.isRunning || !this.config) {
      return;
    }
    this.isRunning = true;

    for (let i = 0; i < this.steps.length; i++) {
      this.steps = this.steps.map((s, idx) => idx === i ? this.updateStepStatus(s, 'running') : s);
      this.statusText = `正在${this.steps[i].name}...`;

      let data: ExecutionData = await this.executeStep(i);
      if (data.success) {
        this.steps =
          this.steps.map((s, idx) => idx === i ? this.updateStepStatus(s, 'pass', undefined, data.detail) : s);
        if (this.steps[i].type === 'netcfg') {
          await this.showResetPrompt();
        }
      } else {
        this.isRunning = false;
        this.statusText = '执行失败';
        break;
      }
    }
    this.isRunning = false;
    this.executionResults = this.steps.map(s => ({
      stepName: s.name,
      status: s.status === 'pass' ? 'pass' : 'fail',
      reason: s.reason,
      detail: s.detail
    } as ExecutionStepResult));
    let hasFail = this.executionResults.some(r => r.status === 'fail');
    this.statusText = hasFail ? '执行失败' : '全部执行通过';
    let fd = fs.openSync(configTxtPath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    for (let i = 0; i < this.steps.length; i++) {
      let result = this.steps[i].status === 'pass' ? 'true ' : 'false';
      let logStr = `${this.stepTitles[i]};${result};`;
      this.writeResultFile(CONFIG_COLOR_BACK_PATH, this.steps[i].title, result);
      fs.writeSync(fd.fd, logStr);
    }
    fs.closeSync(fd);
    this.executionDone = true;
  }

  private showResetPrompt(): Promise<void> {
    return new Promise((resolve) => {
      AlertDialog.show({
        title: '配网完成',
        message: '若要进行下一轮的测试，请把设备恢复出厂设置后再开机',
        confirm: {
          value: '确定',
          action: () => resolve()
        },
        cancel: () => resolve()
      });
    });
  }

  private async executeStep(index: number): Promise<ExecutionData> {
    try {
      let step = this.steps[index];
      let detail = '';
      switch (step.type) {
        case 'discovery':
          detail = await this.doDiscovery();
          break;
        case 'connect':
          detail = await this.doConnect();
          break;
        case 'netcfg':
          detail = await this.doNetCfg();
          break;
        case 'query':
          detail = await this.doQuery();
          break;
        case 'control':
          detail = await this.doControl();
          break;
      }
      return { success: true, detail };
    } catch (e) {
      let errMsg = (e as Error).message || '未知错误';
      this.steps = this.steps.map((s, idx) => idx === index ? this.updateStepStatus(s, 'fail', errMsg, '') : s);
      return { success: false, detail: errMsg };
    }
  }

  private async doDiscovery(): Promise<string> {
    return new Promise((resolve, reject) => {
      if (!this.config) {
        reject(new Error('配置为空'));
        return;
      }
      let protocol =
        this.config.accessMode === 'SoftAP' ? DeviceManager.ScanProtocol.WIFI : DeviceManager.ScanProtocol.BLE;
      let foundDevice: IotDevice | null = null;

      IotHelper.getInstance().deviceDiscovery(protocol, (error, device) => {
        if (error || !device || foundDevice) {
          return;
        }
        if (IotHelper.getInstance().filterDeviceByConfig(device)) {
          foundDevice = device;
          Logger.debug(TAG, `doDiscovery found device: ${JSON.stringify(device)}`);
        }
      });

      setTimeout(() => {
        if (foundDevice) {
          this.discoveredDevice = foundDevice;
          resolve('发现设备: ' + foundDevice.getName());
        } else {
          reject(new Error('请检查设备是否发送广播'));
        }
      }, IotConstants.SCAN_DURATION + 1000);
    });
  }

  private async doConnect(): Promise<string> {
    if (!this.discoveredDevice) {
      throw new Error('请先完成设备发现');
    }
    let device = this.discoveredDevice;
    let useSpeke = IotHelper.getInstance().getSpekeConfig(device);
    try {
      await IotHelper.getInstance().connectDevice(device, useSpeke);
      return '设备连接成功: ' + device.getName();
    } catch (e) {
      throw new Error('设备连接失败，请检查设备是否在线或PIN码是否正确');
    }
  }

  private async doNetCfg(): Promise<string> {
    if (!this.config?.enableWiFiConfig || !this.config.wifiSsid) {
      return '配网已跳过';
    }

    let confirmed = await new Promise<boolean>((resolve) => {
      let key = 'IOTExecution_netcfg';
      let timeout = setTimeout(() => {
        IotHelper.getInstance().unRegisterStatusCodeReceiver(key);
        resolve(false);
      }, 30000);

      IotHelper.getInstance().registerStatusCodeReceiver(key, (status: number) => {
        if (status === 100) {
          clearTimeout(timeout);
          IotHelper.getInstance().unRegisterStatusCodeReceiver(key);
          resolve(true);
        }
      });

      IotHelper.getInstance().configureNetwork(this.config!.wifiSsid, this.config!.wifiPassword || '')
        .catch(() => {
          clearTimeout(timeout);
          IotHelper.getInstance().unRegisterStatusCodeReceiver(key);
          resolve(false);
        });
    });

    if (!confirmed) {
      throw new Error('配网失败，请检查WiFi参数是否正确，或路由器是否上电');
    }
    return '设备配网成功: SSID=' + this.config.wifiSsid;
  }

  private async doQuery(): Promise<string> {
    if (!this.config?.reportConfig) {
      return '上报信息已跳过';
    }
    let result = await IotHelper.getInstance().queryDeviceState([IotConstants.SID_ALL_SERVICES]);
    Logger.debug(TAG, `doReport result: ${JSON.stringify(result)}`);
    if (!result || result.length === 0) {
      throw new Error('上报信息查询失败');
    }
    return '上报数据: ' + JSON.stringify(result);
  }

  private async doControl(): Promise<string> {
    if (!this.config?.enableControlConfig || !this.config.controlSid) {
      return '控制命令已跳过';
    }
    let data = `"${this.config.controlParamName}":${this.config.controlParamValue}`;

    let responseData = await new Promise<string>((resolve, reject) => {
      let key = 'IOTExecution_control_resp';
      let timeout = setTimeout(() => {
        IotHelper.getInstance().unRegisterMessageReceivers(key);
        reject(new Error('控制命令响应超时'));
      }, IotConstants.RESPONSE_TIMERS);

      IotHelper.getInstance().registerMessageReceivers(key, (list: InfDeviceState[]) => {
        clearTimeout(timeout);
        IotHelper.getInstance().unRegisterMessageReceivers(key);
        resolve(JSON.stringify(list));
      });

      IotHelper.getInstance().sendDeviceCommand(this.config!.controlSid, data)
        .catch(() => {
          clearTimeout(timeout);
          IotHelper.getInstance().unRegisterMessageReceivers(key);
          reject(new Error('控制命令发送失败，请检查SID及参数是否正确'));
        });
    });
    Logger.debug(TAG, `doControl responseData: ${responseData}`);

    return '控制命令响应: ' + responseData;
  }

  private getStatusLabel(status: string): string {
    switch (status) {
      case 'pass':
        return '通过';
      case 'fail':
        return '失败';
      case 'running':
        return '执行中';
      default:
        return '等待执行';
    }
  }

  private getStatusColor(status: string): string {
    switch (status) {
      case 'pass':
        return '#0CB60C';
      case 'fail':
        return '#d60a0a';
      case 'running':
        return '#007DFF';
      default:
        return '#999999';
    }
  }
}
