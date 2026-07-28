/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { DeviceManager } from 'iotmanagementkit';
import { AsyncCallback } from '@ohos.base';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import Logger from '../model/Logger';
import ProductDataSource from './model/BasicDataSource';
import { ProductView } from './Component/ProductView';
import IotDevice from './model/IotDevice';
import IotHelper from './model/IotHelper';
import Timers from './model/Timers';
import IotConstants, { analysisProtocol, ConnectType, InfDeviceState, PageCase } from './model/IotConstants';
import { CmdDialog } from './Component/CmdDialog';

const TAG = '[IOTSendCmd]';

@Entry
@Component
struct IOTSendCmd {
  private testPoint: string = '测试点：验证设备指令发送功能，连接设备后发送自定义数据指令并接收设备响应数据\n\n';
  private tipsWIFI: string = '操作步骤：\n1、请打开设备的wifi';
  private tipsBLE: string = '操作步骤：\n1、请打开设备的蓝牙';
  private tipsText: string = '\n2、点击<重新扫描设备>按钮开始扫描' +
    '\n3、可用设备列表显示设备信息后，点击设备项开始连接' +
    '\n4、设备连接成功后，点击<发送指令>按钮，接收到设备上报数据并打印则判定用例成功，点击Pass按钮' +
    '\n5、设备连接失败或未接收到设备上报数据则判定用例失败，点击Fail按钮';
  @State name: string = '';
  @State stepTips: string = '';
  @State isVue: boolean = false;
  @State isScanOn: boolean = false;
  @State connectType: ConnectType = ConnectType.OFFLINE;
  @State isSending: boolean = false;
  @State commandResult: string = '';
  private cmdDialogController: CustomDialogController = new CustomDialogController({
    builder: CmdDialog({
      confirmAction: (sid: string, data: string) => {
        this.sendCommand(sid, data);
      }
    }),
    autoCancel: true,
    alignment: DialogAlignment.Center
  });
  private deviceDataResource: ProductDataSource = new ProductDataSource();
  private discoveryCallBack: AsyncCallback<IotDevice, void> = (error, iotDevice) => {
    if (error != undefined) {
      Logger.info(TAG, `discovery error ${error.message}`);
      return;
    }
    if (iotDevice == undefined) {
      return;
    }
    if (!IotHelper.getInstance().filterDeviceByConfig(iotDevice)) {
      return;
    }
    this.deviceDataResource.pushData(iotDevice);
  };

  private executeScan() {
    if (this.isScanOn) {
      return;
    }
    this.isScanOn = true;
    this.deviceDataResource.reset();
    let protocol = DeviceManager.ScanProtocol.WIFI;
    if (analysisProtocol(this.name) == DeviceManager.ScanProtocol.WIFI) {
      protocol = DeviceManager.ScanProtocol.WIFI;
    } else {
      protocol = DeviceManager.ScanProtocol.BLE;
    }
    IotHelper.getInstance().deviceDiscovery(protocol, this.discoveryCallBack);
    setTimeout(async () => {
      this.isScanOn = false;
    }, IotConstants.SCAN_DURATION);
  }

  private async connectDevice(iotDevice: IotDevice) {
    Logger.info(TAG, `connectDevice ${iotDevice.getUnionCode()}`);
    if (this.isSending) {
      return;
    }
    if (this.connectType == ConnectType.CONNECTING) {
      promptAction.showToast({ message: '正在连接中...', duration: 1000 });
      return;
    }
    if (this.connectType == ConnectType.ONLINE) {
      IotHelper.getInstance().stopConnect();
      await Timers.delay(1000);
      this.connectType = ConnectType.OFFLINE;
      return;
    }
    this.connectType = ConnectType.CONNECTING;
    try {
      let res = IotHelper.getInstance().getSpekeConfig(iotDevice);
      await IotHelper.getInstance().connectDevice(iotDevice, res);
      Logger.info(TAG, `connectDevice success`);
      this.connectType = ConnectType.ONLINE;
      this.deviceDataResource.deleteData(iotDevice);
      promptAction.showToast({ message: '设备连接成功', duration: 1000 });
    } catch (error) {
      Logger.info(TAG, `connectDevice error ${error.code}`);
      this.connectType = ConnectType.OFFLINE;
      promptAction.showToast({ message: '设备连接失败', duration: 1000 });
    }
  }

  async aboutToAppear() {
    let pageCase = router.getParams() as PageCase;
    this.name = pageCase.title;
    let tips = '';
    if (analysisProtocol(this.name) == DeviceManager.ScanProtocol.WIFI) {
      tips = this.testPoint + this.tipsWIFI + this.tipsText;
    } else {
      tips = this.testPoint + this.tipsBLE + this.tipsText;
    }
    this.stepTips = tips;
    await FirstDialog.ChooseDialog(getContext(this), this.stepTips, this.name);
    setTimeout(() => {
      this.executeScan();
    }, 500);
    IotHelper.getInstance().registerMessageReceivers('IOTSendCmd', (list: InfDeviceState[]) => {
      this.commandResult = JSON.stringify(list);
    });
  }

  aboutToDisappear(): void {
    IotHelper.getInstance().stopConnect();
    IotHelper.getInstance().unRegisterMessageReceivers('IOTSendCmd');
  }

  private async sendCommand(sid: string, data: string) {
    this.isSending = true;
    try {
      let result = await IotHelper.getInstance().sendDeviceCommand(sid, data);
      this.isVue = true;
      promptAction.showToast({ message: '指令发送成功，已收到设备上报数据', duration: 2000 });
    } catch (error) {
      Logger.info(TAG, `sendCommand error ${JSON.stringify(error)}`);
      promptAction.showToast({ message: '指令发送失败或设备未响应', duration: 2000 });
    } finally {
      this.isSending = false;
    }
  }

  @Builder
  PassBtn() {
    if (this.isVue == false) {
      Button({ stateEffect: false }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp');
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4);
    } else {
      Button({ stateEffect: true }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp');
      }
      .width('30%')
      .height('30vp')
      .key('passBtn')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/IOT/IOT_index',
          params: {
            result: 'true ', title: this.name,
          }
        });
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      });
    }
  }

  @Builder
  FailBtn() {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp');
    }
    .width('30%')
    .height('30vp')
    .key('failBtn')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/IOT/IOT_index',
        params: {
          result: 'false', title: this.name,
        }
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    });
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
        .onClick(() => {
          router.back({
            url: 'pages/IOT/IOT_index',
            params: { result: 'None', }
          });
        });

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' });
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden);
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween);

      if (this.connectType != ConnectType.OFFLINE) {
        Column() {
          Row() {
            Text('已连接设备')
              .fontSize(22)
              .fontColor('#007DFF');
            if (this.connectType == ConnectType.CONNECTING) {
              LoadingProgress().width(40).height(40);
            }
          }
          .width('100%')
          .height(50)
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center);

          if (this.connectType == ConnectType.ONLINE) {
            ProductView({ iotDevice: IotHelper.getInstance().getConnectDevice(), connectType: 1 })
              .onClick(async () => {
                let connectDevice = IotHelper.getInstance().getConnectDevice();
                IotHelper.getInstance().stopConnect();
                await Timers.delay(500);
                this.connectType = ConnectType.OFFLINE;
                if (connectDevice != undefined) {
                  this.deviceDataResource.pushData(connectDevice);
                }
              });

            Button('发送指令')
              .fontColor('#007DFF')
              .backgroundColor('#e1e5e8')
              .width('100%')
              .margin({ top: 12 })
              .onClick(() => {
                let config = IotHelper.getInstance().getDeviceConfig();
                if (config && config.enableControlConfig && config.controlSid && config.controlParamName) {
                  let data = `"${config.controlParamName}":${config.controlParamValue}`;
                  this.sendCommand(config.controlSid, data);
                  return;
                }
                this.cmdDialogController.open();
              });

            if (this.commandResult) {
              Text(this.commandResult)
                .fontSize(14)
                .fontColor('#666666')
                .margin({ top: 8 });
            }
          }
        }
        .width('100%')
        .padding({ left: 16, right: 16 });
      }

      List() {
        ListItem() {
          Row() {
            Text('可用设备')
              .fontSize(22)
              .fontColor('#007DFF');
            if (this.isScanOn) {
              LoadingProgress().width(40).height(40);
            }
          }
          .width('100%')
          .height(50)
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center);
        };

        LazyForEach(this.deviceDataResource, (item: IotDevice) => {
          ListItem() {
            ProductView({ iotDevice: item, connectType: 0 });
          }
          .onClick(() => {
            this.connectDevice(item);
          });
        }, (item: DeviceManager.DeviceInfo) => JSON.stringify(item));
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
      .layoutWeight(1)
      .divider({
        strokeWidth: 1,
        color: Color.Gray,
        startMargin: 10,
        endMargin: 10
      })
      .margin({ top: 10 });

      if (this.isScanOn) {
        Blank().margin({ top: '20vp' }).height('20vp');
      } else {
        Button(
          '重新扫描设备',
          { type: ButtonType.Capsule, stateEffect: true }
        )
          .onClick(() => {
            this.executeScan();
          })
          .fontColor('#007DFF')
          .fontSize('14fp')
          .padding({
            left: 30,
            right: 30,
            top: 10,
            bottom: 10
          })
          .backgroundColor('#e1e5e8')
          .margin({ top: 20, bottom: 20 });
      }

      Row() {
        this.PassBtn();
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp');
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.stepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          );
        });

        this.FailBtn();
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black);
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White);
  }
}
