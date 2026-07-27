import { promptAction, router } from '@kit.ArkUI';
import { DeviceConfig } from './model/IotConstants';
import IotHelper from './model/IotHelper';
import Logger from '../model/Logger';
import data_preferences from '@ohos.data.preferences';

const TAG = '[IOTConfiguration]';

class AccessModeOption {
  public value: string = '';
}

@Entry
@Component
struct IOT_configuration {
  @State prefix: string = '';
  @State deviceName: string = '';
  @State pid: string = '';
  @State sn: string = '';
  @State accessModeIndex: number = 0;
  @State enablePinCode: boolean = false;
  @State pinCode: string = '';
  @State enableWiFiConfig: boolean = false;
  @State wifiSsid: string = '';
  @State wifiPassword: string = '';
  @State reportConfig: boolean = true;
  @State enableControlConfig: boolean = false;
  @State controlSid: string = '';
  @State controlParamName: string = '';
  @State controlParamValue: string = '';
  @State accessModeOptions: AccessModeOption[] = [];

  aboutToAppear() {
    let modes = ['BLE', 'SLE', 'COAP', 'SoftAP'];
    this.accessModeOptions = modes.map(m => {
      let opt = new AccessModeOption();
      opt.value = m;
      return opt;
    });
    this.loadSavedConfig();
  }

  aboutToDisappear(): void {
    Logger.debug(TAG, 'IOT_configuration aboutToDisappear');
    IotHelper.getInstance().clearDeviceConfig();
  }

  private async loadSavedConfig() {
    let preference = await data_preferences.getPreferences(getContext(this), 'iot_config_preference');
    let saved = await preference.get('cfg_full', '') as string;
    if (!saved) {
      return;
    }
    let config = JSON.parse(saved) as DeviceConfig;
    this.prefix = config.prefix;
    this.deviceName = config.deviceName;
    this.pid = config.pid;
    this.sn = config.sn;
    let idx = this.accessModeOptions.findIndex(m => m.value === config.accessMode);
    this.accessModeIndex = idx >= 0 ? idx : 0;
    this.enablePinCode = config.enablePinCode;
    this.pinCode = config.pinCode;
    this.enableWiFiConfig = config.enableWiFiConfig;
    this.wifiSsid = config.wifiSsid;
    this.wifiPassword = config.wifiPassword;
    this.reportConfig = config.reportConfig;
    this.enableControlConfig = config.enableControlConfig;
    this.controlSid = config.controlSid;
    this.controlParamName = config.controlParamName;
    this.controlParamValue = config.controlParamValue;
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
          router.back();
        });

        Text('IOT_CONFIGURATION')
          .fontColor(Color.White)
          .fontSize('22fp')
          .margin({ left: '-20vp' });
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
          Column() {
            Text('广播参数')
              .fontSize(12)
              .fontColor('#999999')
              .width('100%')
              .margin({ bottom: 5 });
            Column() {
              this.FormItemLabel('广播前缀', true);
              TextInput({ placeholder: '请输入广播前缀(Oh/Oc)', text: this.prefix })
                .height(44)
                .width('100%')
                .borderRadius(8)
                .backgroundColor('#F5F5F5')
                .padding({ left: 12 })
                .fontSize(16)
                .onChange(v => this.prefix = v);

              this.FormItemLabel('广播设备名称', true);
              TextInput({ placeholder: '请输入广播设备名称', text: this.deviceName })
                .height(44)
                .width('100%')
                .borderRadius(8)
                .backgroundColor('#F5F5F5')
                .padding({ left: 12 })
                .fontSize(16)
                .maxLength(10)
                .onChange(v => this.deviceName = v);

              this.FormItemLabel('PID', true);
              TextInput({ placeholder: '请输入 5 位 PID', text: this.pid })
                .height(44)
                .width('100%')
                .borderRadius(8)
                .backgroundColor('#F5F5F5')
                .padding({ left: 12 })
                .fontSize(16)
                .maxLength(5)
                .onChange(v => this.pid = v);

              this.FormItemLabel('SN码', true);
              TextInput({ placeholder: '请输入 4 位 SN码', text: this.sn })
                .height(44)
                .width('100%')
                .borderRadius(8)
                .backgroundColor('#F5F5F5')
                .padding({ left: 12 })
                .fontSize(16)
                .maxLength(4)
                .onChange(v => this.sn = v);
            }
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .width('100%')
            .shadow({
              radius: 4,
              offsetX: 0,
              offsetY: 2,
              color: '#1A000000'
            });
          }
          .width('100%')
          .margin({ top: 16 });

          Column() {
            Text('连接参数')
              .fontSize(12)
              .fontColor('#999999')
              .width('100%')
              .margin({ bottom: 5 });
            Column() {
              Row() {
                Text('接入模式')
                  .fontSize(14)
                  .fontColor('#666666');
                Blank();
                Select(this.accessModeOptions)
                  .value(this.accessModeOptions[this.accessModeIndex].value)
                  .selected(this.accessModeIndex)
                  .onSelect((index: number) => {
                    this.accessModeIndex = index;
                  });
              }
              .width('100%')
              .height(44)
              .alignItems(VerticalAlign.Center);
            }
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .width('100%')
            .shadow({
              radius: 4,
              offsetX: 0,
              offsetY: 2,
              color: '#1A000000'
            });
          }
          .width('100%')
          .margin({ top: 16 });

          Column() {
            Text('安全参数')
              .fontSize(12)
              .fontColor('#999999')
              .width('100%')
              .margin({ bottom: 5 });
            Column() {
              Row() {
                Text('启用Speke')
                  .fontSize(14)
                  .fontColor('#666666');
                Blank();
                Toggle({ type: ToggleType.Switch, isOn: this.enablePinCode })
                  .onChange(v => {
                    this.enablePinCode = v;
                    if (!v) {
                      this.pinCode = '';
                    }
                  });
              }
              .width('100%')
              .height(44)
              .alignItems(VerticalAlign.Center);

              if (this.enablePinCode) {
                this.FormItemLabel('PIN码', true);
                TextInput({ placeholder: '请输入PIN码', text: this.pinCode })
                  .height(44)
                  .width('100%')
                  .type(InputType.Password)
                  .borderRadius(8)
                  .backgroundColor('#F5F5F5')
                  .padding({ left: 12 })
                  .fontSize(16)
                  .onChange(v => this.pinCode = v);
              }
            }
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .width('100%')
            .shadow({
              radius: 4,
              offsetX: 0,
              offsetY: 2,
              color: '#1A000000'
            });
          }
          .width('100%')
          .margin({ top: 16 });

          Column() {
            Text('配网参数')
              .fontSize(12)
              .fontColor('#999999')
              .width('100%')
              .margin({ bottom: 5 });
            Column() {
              Row() {
                Text('启用WiFi配置')
                  .fontSize(14)
                  .fontColor('#666666');
                Blank();
                Toggle({ type: ToggleType.Switch, isOn: this.enableWiFiConfig })
                  .onChange(v => {
                    this.enableWiFiConfig = v;
                    if (!v) {
                      this.reportConfig = true;
                      this.wifiSsid = '';
                      this.wifiPassword = '';
                    }
                  });
              }
              .width('100%')
              .height(44)
              .alignItems(VerticalAlign.Center);

              if (this.enableWiFiConfig) {
                this.FormItemLabel('SSID', true);
                TextInput({ placeholder: '请输入WiFi名称', text: this.wifiSsid })
                  .height(44)
                  .width('100%')
                  .borderRadius(8)
                  .backgroundColor('#F5F5F5')
                  .padding({ left: 12 })
                  .fontSize(16)
                  .onChange(v => this.wifiSsid = v);

                this.FormItemLabel('密码', true);
                TextInput({ placeholder: '请输入WiFi密码', text: this.wifiPassword })
                  .height(44)
                  .width('100%')
                  .type(InputType.Password)
                  .borderRadius(8)
                  .backgroundColor('#F5F5F5')
                  .padding({ left: 12 })
                  .fontSize(16)
                  .onChange(v => this.wifiPassword = v);
              }
            }
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .width('100%')
            .shadow({
              radius: 4,
              offsetX: 0,
              offsetY: 2,
              color: '#1A000000'
            });
          }
          .width('100%')
          .margin({ top: 16 });

          Column() {
            Text('测试参数')
              .fontSize(12)
              .fontColor('#999999')
              .width('100%')
              .margin({ bottom: 5 });
            Column() {
              Row() {
                Text('上报信息配置').fontSize(14).fontColor('#666666');
                Blank();
                Toggle({ type: ToggleType.Switch, isOn: this.reportConfig })
                  .enabled(this.enableWiFiConfig)
                  .onChange(v => this.reportConfig = v);
              }
              .width('100%')
              .height(44)
              .alignItems(VerticalAlign.Center);
            }
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .width('100%')
            .shadow({
              radius: 4,
              offsetX: 0,
              offsetY: 2,
              color: '#1A000000'
            });
          }
          .width('100%')
          .margin({ top: 16 });

          Column() {
            Text('控制参数')
              .fontSize(12).fontColor('#999999').width('100%').margin({ bottom: 5 });
            Column() {
              Row() {
                Text('启用控制信息配置').fontSize(14).fontColor('#666666');
                Blank();
                Toggle({ type: ToggleType.Switch, isOn: this.enableControlConfig })
                  .onChange(v => {
                    this.enableControlConfig = v;
                    if (!v) {
                      this.controlSid = '';
                      this.controlParamName = '';
                      this.controlParamValue = '';
                    }
                  });
              }
              .width('100%').height(44).alignItems(VerticalAlign.Center);

              if (this.enableControlConfig) {
                this.FormItemLabel('SID', true);
                TextInput({ placeholder: '如：switch', text: this.controlSid })
                  .height(44)
                  .width('100%')
                  .borderRadius(8)
                  .backgroundColor('#F5F5F5')
                  .padding({ left: 12 })
                  .fontSize(16)
                  .onChange(v => this.controlSid = v);

                this.FormItemLabel('参数名称', true);
                TextInput({ placeholder: '如：on', text: this.controlParamName })
                  .height(44)
                  .width('100%')
                  .borderRadius(8)
                  .backgroundColor('#F5F5F5')
                  .padding({ left: 12 })
                  .fontSize(16)
                  .onChange(v => this.controlParamName = v);

                this.FormItemLabel('参数值');
                TextInput({ placeholder: '如：1', text: this.controlParamValue })
                  .height(44)
                  .width('100%')
                  .borderRadius(8)
                  .backgroundColor('#F5F5F5')
                  .padding({ left: 12 })
                  .fontSize(16)
                  .onChange(v => this.controlParamValue = v);
              }
            }
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .width('100%')
            .shadow({
              radius: 4,
              offsetX: 0,
              offsetY: 2,
              color: '#1A000000'
            });
          }
          .width('100%').margin({ top: 16 });


          Button('保存并进入用例')
            .width('100%')
            .height('48vp')
            .backgroundColor('#007DFF')
            .fontColor(Color.White)
            .borderRadius(24)
            .fontSize(16)
            .margin({ top: 24, bottom: 32 })
            .onClick(() => {
              if (!this.validate()) {
                return;
              }
              this.saveConfig();
              let config: DeviceConfig = this.buildConfig();
              IotHelper.getInstance().setDeviceConfig(config);
              router.pushUrl({
                url: 'pages/IOT/IOT_index'
              });
            });
        }
        .padding(16);
      }
      .layoutWeight(1)
      .backgroundColor('#F0F0F0');
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0');
  }

  @Builder
  FormItemLabel(label: string, required: boolean = false) {
    Row() {
      Text(label)
        .fontSize(14)
        .fontColor('#666666');
      if (required) {
        Text(' *')
          .fontSize(14)
          .fontColor(Color.Red);
      }
    }
    .margin({ top: 12, bottom: 6 })
    .width('100%');
  }

  buildConfig(): DeviceConfig {
    return {
      prefix: this.prefix,
      deviceName: this.deviceName,
      pid: this.pid,
      sn: this.sn,
      accessMode: this.accessModeOptions[this.accessModeIndex].value,
      enablePinCode: this.enablePinCode,
      pinCode: this.pinCode,
      enableWiFiConfig: this.enableWiFiConfig,
      wifiSsid: this.wifiSsid,
      wifiPassword: this.wifiPassword,
      reportConfig: this.reportConfig,
      enableControlConfig: this.enableControlConfig,
      controlSid: this.controlSid,
      controlParamName: this.controlParamName,
      controlParamValue: this.controlParamValue
    };
  }

  private async saveConfig() {
    let preference = await data_preferences.getPreferences(getContext(this), 'iot_config_preference');
    await preference.put('cfg_full', JSON.stringify(this.buildConfig()));
    await preference.flush();
    promptAction.showToast({ message: '配置已保存', duration: 1000 });
  }

  validate(): boolean {
    if (!this.deviceName.trim()) {
      promptAction.showToast({ message: '请输入广播设备名称', duration: 1500 });
      return false;
    }
    if (this.deviceName.length > 10) {
      promptAction.showToast({ message: '广播设备名称不能超过10个字符', duration: 1500 });
      return false;
    }
    if (this.pid.length !== 5) {
      promptAction.showToast({ message: 'PID必须为5位', duration: 1500 });
      return false;
    }
    if (this.sn.length !== 4) {
      promptAction.showToast({ message: 'SN码必须为4位', duration: 1500 });
      return false;
    }
    if (this.enablePinCode && !this.pinCode.trim()) {
      promptAction.showToast({ message: '请输入PIN码或关闭PIN码选项', duration: 1500 });
      return false;
    }
    if (this.enableWiFiConfig && !this.wifiSsid.trim()) {
      promptAction.showToast({ message: '请输入WiFi名称或关闭WiFi配置选项', duration: 1500 });
      return false;
    }
    if (this.enableControlConfig) {
      if (!this.controlSid.trim()) {
        promptAction.showToast({ message: '请输入控制命令SID或关闭控制信息配置', duration: 1500 });
        return false;
      }
      if (!this.controlParamName.trim()) {
        promptAction.showToast({ message: '请输入参数名称或关闭控制信息配置', duration: 1500 });
        return false;
      }
    }
    return true;
  }
}
