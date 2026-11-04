'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import bluetooth from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.bluetooth.connection';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium';
import { Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { util } from '@kit.ArkTS'

let domain: int = 0x0000;
let tag: string = 'bluetoothAdvertisingTest';
let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";
let CLOSE_BT_TEXT: string = "关闭";
let nLength: number = 0;

async function clickRequestPermission(text: string) {
  hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission start');
  let PERMISSION_TEXT: string = "允许";
  let driver = Driver.create();
  await driver.delayMs(3000);
  try {
    let button = await driver.findComponent(ON.text(text));
    await button!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission failed. ' + err);
  }
  try {
    let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
    await button1!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] click PERMISSION_TEXT end');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
  }
}

async function tryToEnableBt() {
  let sta = btAccess.getState();
  switch (sta) {
    case btAccess.BluetoothState.STATE_OFF:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await Utils.msSleep(10000);
      let sta1 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
      break;
    case btAccess.BluetoothState.STATE_TURNING_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turning on:' + JSON.stringify(sta));
      await Utils.msSleep(3000);
      break;
    case btAccess.BluetoothState.STATE_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turn on:' + JSON.stringify(sta));
      break;
    case btAccess.BluetoothState.STATE_TURNING_OFF:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await Utils.msSleep(10000);
      let sta2 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
      break;
    default:
      hilog.info(domain, tag, '[bluetooth_js] enable success');
  }
}

let manufactureValueBuffer = new Uint8Array(4);
manufactureValueBuffer[0] = 1;
manufactureValueBuffer[1] = 2;
manufactureValueBuffer[2] = 3;
manufactureValueBuffer[3] = 4;
let serviceValueBuffer = new Uint8Array(4);
serviceValueBuffer[0] = 4;
serviceValueBuffer[1] = 6;
serviceValueBuffer[2] = 7;
serviceValueBuffer[3] = 8;
let setting: bluetooth.AdvertiseSetting = {
  interval: 32,
  txPower: 1,
  connectable: true,
};
let manufactureDataUnit: bluetooth.ManufactureData = {
  manufactureId: 4567,
  manufactureValue: manufactureValueBuffer.buffer
};
let serviceDataUnit: bluetooth.ServiceData = {
  serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
  serviceValue: serviceValueBuffer.buffer
};
let advData: bluetooth.AdvertiseData = {
  serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
  manufactureData: [manufactureDataUnit],
  serviceData: [serviceDataUnit],
  includeDeviceName: false,
  includeTxPower: false
};
let advResponse: bluetooth.AdvertiseData = {
  serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
  manufactureData: [manufactureDataUnit],
  serviceData: [serviceDataUnit],
};

export default function bluetoothAdvertisingTest(): void {
  describe('bluetoothAdvertisingTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      await clickRequestPermission(PERMISSION_TEXT);
      try {
        let deviceName = connection.getLocalName()
        let textEncoder = new util.TextEncoder();
        nLength = textEncoder.encodeInto(deviceName).length
        console.info(`deviceName.length = ${nLength}`)
      } catch (err) {
        expect(err.code).assertEqual(801)
      }
      hilog.info(domain, tag, 'beforeAll called');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      await tryToEnableBt();
      hilog.info(domain, tag, 'beforeEach called');
      done();
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called')
    })
    afterAll(() => {
      hilog.info(domain, tag, 'afterAll called')
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0100
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advStatus: Number = 0;
        let onReceiveEvent = (AdvertisingStateChangeInfo: bluetooth.AdvertisingStateChangeInfo) => {
          hilog.info(domain, tag, 'bluetooth advertising state01 = ' + JSON.stringify(AdvertisingStateChangeInfo));
          hilog.info(domain, tag, 'bluetooth advertising state01 = ' + AdvertisingStateChangeInfo.state);
          advStatus = AdvertisingStateChangeInfo.state;
          hilog.info(domain, tag, 'bluetooth advertising state01 = ' + advStatus);
        }
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 0,
        }
        let advHandle = 0xFF;
        try {
          hilog.info(domain, tag, 'lmq111');
          await bluetooth.onAdvertisingStateChange(onReceiveEvent);
          hilog.info(domain, tag, 'lmq222');
          let startAdv = (): Promise<int> => {
            return new Promise<int>((resolve, reject) => {
              bluetooth.startAdvertising(advertisingParams, (err: BusinessError | null, outAdvHandle: int | undefined) => {
                if (err) {
                  hilog.info(domain, tag, 'startAdvertising callback failed: ' + JSON.stringify(err!.code));
                  reject(new Error(JSON.stringify(err!.code)));
                } else {
                  hilog.info(domain, tag,
                    '[bluetooth_js]startAdvertising callback info01:' + JSON.stringify(outAdvHandle));
                  advHandle = outAdvHandle as int;
                  hilog.info(domain, tag,
                    '[bluetooth_js]startAdvertising callback info02:' + JSON.stringify(advHandle));
                  resolve(advHandle);
                }
              });
            });
          };

          let result01 = await startAdv();
          hilog.info(domain, tag, '[bluetooth_js] startAdv promise result01:' + JSON.stringify(result01));
          await Utils.msSleep(300);
          expect(advStatus).assertEqual(1);
          await Utils.msSleep(5000);
          let result02 = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result02: ' + JSON.stringify(result02));
          let count = 0;
          while (advStatus === 1) {
            await Utils.msSleep(100);
            count = count += 1;
          }
          hilog.info(domain, tag, '[bluetooth_js] advStatus change count promise result01: ' + count);
          expect(advStatus).assertEqual(4);
        } catch (err) {
          hilog.info(domain, tag, "01errCode:" + err.code + ",01errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        bluetooth.offAdvertisingStateChange(onReceiveEvent);
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0200
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        }
        let advHandle = 0xFF;
        try {
          bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(outAdvHandle));
            advHandle = outAdvHandle;
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(advHandle));
          }).catch((error) => {
            hilog.error(domain, tag, `case error, error -> ${JSON.stringify(error)}`);
          });
          await Utils.msSleep(500);
          await Utils.msSleep(900);
          let stopAdv = (): Promise<int> => {
            return new Promise<int>((resolve, reject) => {
              bluetooth.stopAdvertising(advHandle, (err: BusinessError | null) => {
                if (err) {
                  hilog.info(domain, tag, 'stopAdvertising callback failed' + JSON.stringify(err));
                  reject(new Error(JSON.stringify(err!.code)));
                } else {
                  hilog.info(domain, tag, '[bluetooth_js]stopAdvertising callback info02 success');
                  resolve(err!.code as int);
                }
              });
            });
          }
          stopAdv().then((data) => {
            hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result02:'+ JSON.stringify(data));
          }).catch((error) => {
            hilog.error(domain, tag, '[bluetooth_js] stopAdvertising error:'+ JSON.stringify(error));
          });
        } catch (err) {
          hilog.info(domain, tag, "02errCode:" + err.code + ",02errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0300
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 65535,
        }
        let advHandle = 0xFF;
        try {
          advHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag, '[bluetooth_js] startAdvertising promise result03:' + JSON.stringify(advHandle));
          let data = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result03:' + JSON.stringify(data));
        } catch (err) {
          hilog.info(domain, tag, "03errCode:" + err.code + ",03errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0400
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 65540,
        }
        let advHandle = 0xFF;
        try {
          bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info1:' + JSON.stringify(outAdvHandle));
            advHandle = outAdvHandle;
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info2:' + JSON.stringify(advHandle));
          }).catch((error) => {
            hilog.error(domain, tag, `case error, error -> ${JSON.stringify(error)}`);
          });
          await Utils.msSleep(655350);
          let result = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(result));
        } catch (err) {
          hilog.info(domain, tag, "04errCode:" + err.code + ",04errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0500
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: -10,
        }
        let advHandle = 0xFF;
        try {
          bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info1:' + JSON.stringify(outAdvHandle));
            advHandle = outAdvHandle;
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info2:' + JSON.stringify(advHandle));
          }).catch((error) => {
            hilog.error(domain, tag, `case error, error -> ${JSON.stringify(error)}`);
          });
          await Utils.msSleep(1000);
          let result = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(result));
        } catch (err) {
          hilog.info(domain, tag, "05errCode:" + err.code + ",05errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_0900
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
        }
        let advHandle = 0xFF;
        try {
          bluetooth.startAdvertising(advertisingParams).then((outAdvHandle) => {
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info09:' + JSON.stringify(outAdvHandle));
            advHandle = outAdvHandle;
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info09:' + JSON.stringify(advHandle));
          }).catch((error) => {
            hilog.error(domain, tag, `case error, error -> ${JSON.stringify(error)}`);
          });
          await Utils.msSleep(3000);
          let result09 = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result09:' + JSON.stringify(result09));
        } catch (err) {
          hilog.info(domain, tag, "09errCode:" + err.code + ",09errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1000
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 300,
        };
        let advHandle = 0xFF;
        try {
          let outAdvHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info10:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          await Utils.msSleep(3000);
          let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
            advertisingId: advHandle,
            duration: 0,
          };

          let enableAdv = () => {
            return new Promise<int>((resolve, reject) => {
              bluetooth.enableAdvertising(advertisingEnableParams, (err: BusinessError | null, data: int | undefined) => {
                if (err) {
                  hilog.info(domain, tag, 'enableAdvertising callback failed' + JSON.stringify(err));
                  reject(err);
                } else {
                  hilog.info(domain, tag, '[bluetooth_js]enableAdvertising callback info10:' + JSON.stringify(data));
                  if (data != undefined) {
                    resolve(data);
                  }
                }
              });
            });
          }

          let result10 = await enableAdv();
          hilog.info(domain, tag, '[bluetooth_js] enableAdvertising promise result10:' + JSON.stringify(result10));
          let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
            advertisingId: advHandle,
          };
          await bluetooth.disableAdvertising(advertisingDisableParams);
          hilog.info(domain, tag, '[bluetooth_js] disableAdvertising promise result10');
          let result11 = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result11:' + JSON.stringify(result11));
        } catch (err) {
          hilog.info(domain, tag, ":10errCode" + err.code + ",10errMessage10:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1100
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 300,
        };
        let advHandle = 0xFF;
        try {
          let outAdvHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info11:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info11:' + JSON.stringify(advHandle));
          await Utils.msSleep(3000);
          let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
            advertisingId: advHandle,
            duration: 100,
          };
          hilog.info(domain, tag, 'lmq enableAdvertising 1');
          await bluetooth.enableAdvertising(advertisingEnableParams);
          hilog.info(domain, tag, '[bluetooth_js] enableAdvertising promise result11');
          hilog.info(domain, tag, 'lmq enableAdvertising 2');
          await Utils.msSleep(2000);
          let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
            advertisingId: advHandle,
          };

          let disableAdv = () => {
            return new Promise<int>((resolve, reject) => {
              bluetooth.disableAdvertising(advertisingDisableParams, (err: BusinessError | null, data: int | undefined) => {
                if (err) {
                  hilog.info(domain, tag, 'disableAdvertising callback failed: ' + JSON.stringify(err));
                  reject(err);
                } else {
                  hilog.info(domain, tag,
                    '[bluetooth_js]disableAdvertising callback info01:' + JSON.stringify(data));
                  if (data != undefined) {
                    resolve(data);
                  }
                }
              });
            });
          };
          hilog.info(domain, tag, 'lmq disableAdv 1');
          let result11 = await disableAdv();
          hilog.info(domain, tag, '[bluetooth_js] disableAdvertising promise result11:' + JSON.stringify(result11));
          hilog.info(domain, tag, 'lmq disableAdv 2');
          hilog.info(domain, tag, 'lmq stopAdvertising 2');
          let result12 = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result11:' + JSON.stringify(result12));
          hilog.info(domain, tag, 'lmq stopAdvertising 2');
        } catch (err) {
          hilog.info(domain, tag, "11errCode:" + err.code + ",11errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1200
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 300,
        };
        let advHandle = 0xFF;
        try {
          let outAdvHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info12:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info12:' + JSON.stringify(advHandle));
          await Utils.msSleep(3000);
          let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
            advertisingId: advHandle,
            duration: -100,
          };
          let result = await bluetooth.enableAdvertising(advertisingEnableParams);
          hilog.info(domain, tag, '[bluetooth_js] enableAdvertising promise result:' + JSON.stringify(result));
        } catch (err) {
          hilog.info(domain, tag, "12errCode:" + err.code + ",12errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        await bluetooth.stopAdvertising(advHandle).then((data) => {
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result:' + JSON.stringify(data));
        }).catch((error) => {
            hilog.error(domain, tag, `case error, error -> ${JSON.stringify(error)}`);
          });
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1300
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advStatus: Number = 0;
        let onReceiveEvent = (AdvertisingStateChangeInfo: bluetooth.AdvertisingStateChangeInfo) => {
          hilog.info(domain, tag, 'bluetooth advertising state13 = ' + JSON.stringify(AdvertisingStateChangeInfo));
          hilog.info(domain, tag, 'bluetooth advertising state13 = ' + AdvertisingStateChangeInfo.state);
          hilog.info(domain, tag, 'bluetooth advertising state13 = ' + AdvertisingStateChangeInfo.advertisingId);
          advStatus = AdvertisingStateChangeInfo.state;
          hilog.info(domain, tag, 'bluetooth advertising state13 = ' + advStatus);
        }

        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        };
        let advHandle = 0xFF;
        try {
          await bluetooth.onAdvertisingStateChange(onReceiveEvent);
          let outAdvHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info13:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info13:' + JSON.stringify(advHandle));
          await Utils.msSleep(500);
          expect(advStatus).assertEqual(1);
          await Utils.msSleep(1000);
          await bluetooth.offAdvertisingStateChange(onReceiveEvent);
          let result13 = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise :' + JSON.stringify(result13));
        } catch (err) {
          hilog.info(domain, tag, "13errCode:" + err.code + ",13errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1400
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advStatus: Number = 0;
        let onReceiveEvent = (AdvertisingStateChangeInfo: bluetooth.AdvertisingStateChangeInfo) => {
          hilog.info(domain, tag, 'bluetooth advertising state14 = ' + JSON.stringify(AdvertisingStateChangeInfo));
          hilog.info(domain, tag, 'bluetooth advertising state14 = ' + AdvertisingStateChangeInfo.state);
          advStatus = AdvertisingStateChangeInfo.state;
          hilog.info(domain, tag, 'bluetooth advertising state14 = ' + advStatus);
        }

        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        };
        let advHandle = 0xFF;
        try {
          let outAdvHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info14:' + JSON.stringify(outAdvHandle));
          advHandle = outAdvHandle;
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising promise info14:' + JSON.stringify(advHandle));
          await Utils.msSleep(1000);
          await bluetooth.onAdvertisingStateChange(onReceiveEvent);
          let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
            advertisingId: advHandle,
            duration: 0,
          };
          let result14 = await bluetooth.enableAdvertising(advertisingEnableParams);
          hilog.info(domain, tag, '[bluetooth_js] enableAdvertising promise result14 success result14: ' + JSON.stringify(result14));
          await Utils.msSleep(500);
          expect(true).assertEqual(advStatus === 2 || advStatus === 0);
          let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
            advertisingId: advHandle,
          };
          let result15 = await bluetooth.disableAdvertising(advertisingDisableParams);
          hilog.info(domain, tag, '[bluetooth_js] disableAdvertising promise result15 success ' + JSON.stringify(result15));
          await Utils.msSleep(500);
          expect(true).assertEqual(advStatus === 3 || advStatus === 0);
          bluetooth.offAdvertisingStateChange(onReceiveEvent);
          let result16 = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result16:' + JSON.stringify(result16));
        } catch (err) {
          hilog.info(domain, tag, "14errCode:" + err.code + ",14errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_1600
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let advHandle = 0xFF;
        try {
          let advertisingEnableParams: bluetooth.AdvertisingEnableParams = {
            advertisingId: advHandle,
            duration: 0,
          };
          bluetooth.enableAdvertising(advertisingEnableParams).then((data) => {
            hilog.info(domain, tag, '[bluetooth_js] enableAdvertising promise result16:' + JSON.stringify(data));
          }).catch((err) => {
            hilog.info(domain, tag, 'bluetooth enableAdvertising has error: ' + JSON.stringify(err));
            expect(err.code).assertEqual(2900099);
          });
          bluetooth.stopAdvertising(advHandle).then((data) => {
            hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result16:' + JSON.stringify(data));
          }).catch((error) => {
            hilog.error(domain, tag, `case error, error -> ${JSON.stringify(error)}`);
          });
        } catch (err) {
          hilog.info(domain, tag, "16errCode:" + err.code + ",16errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_2100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2100
     * @tc.desc   Test errorCode 2900010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 0,
        }
        let advHandles : int[] = [];
        try {
          for (let count = 0; count < 17; count++) {
            let outAdvHandle = await bluetooth.startAdvertising(advertisingParams);
            advHandles.push(outAdvHandle)
            hilog.info(domain, tag,
                '[bluetooth_js]startAdvertising return outAdvHandle:' + JSON.stringify(outAdvHandle));
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising count:' + count);
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising advHandles:' + advHandles);
            if (count === 16) {
              hilog.info(domain, tag, '[bluetooth_js]startAdvertising count success');
              expect().assertFail();
            }
          }
        } catch (err) {
          hilog.info(domain, tag, "startAdvertising promise errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(2900010).assertEqual(err.code);
          }
        }

        try {
          for (let i = 0; i < advHandles.length; i++){
            await bluetooth.stopAdvertising(advHandles[i]);
            hilog.info(domain, tag, '[bluetooth_js]stopAdvertising count success'+ advHandles[i]);
          }
        } catch (err) {
          hilog.info(domain, tag, "stopAdvertising errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_2200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2200
     * @tc.desc   Test errorCode 2900010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 0,
        }
        let startAdvertisingCallback = ()=> {
          return new Promise<int>((resolve, reject) => {
            bluetooth.startAdvertising(advertisingParams, (err: BusinessError | null, data: int | undefined) => {
              if (err) {
                hilog.info(domain, tag, 'startAdvertising callback failed: ' + JSON.stringify(err));
                reject(err);
              } else {
                hilog.info(domain, tag,
                  '[bluetooth_js]startAdvertising callback info01:' + JSON.stringify(data));
                if (data != undefined) {
                  resolve(data);
                }
              }
            });
          });
        };
        let advHandles : int[] = [];
        try {
          for (let count = 0; count < 17; count++) {
            let outAdvHandle = await startAdvertisingCallback()
            advHandles.push(outAdvHandle)
            hilog.info(domain, tag, '[bluetooth_js] startAdvertisingCallback result:' + outAdvHandle);
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising count:' + count);
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising advHandles:' + advHandles);
            if (count === 16) {
              hilog.info(domain, tag, '[bluetooth_js]startAdvertising count success');
              expect().assertFail();
              done();
            }
          }
        } catch (error) {
          hilog.info(domain, tag,
            "startAdvertisingCallback errCode:" + error.code + ",errMessage:" + error.message);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(2900010).assertEqual(error.code);
          }
        }

        try {
          for (let i = 0; i < advHandles.length; i++){
            await bluetooth.stopAdvertising(advHandles[i]);
            hilog.info(domain, tag, '[bluetooth_js]stopAdvertising count success'+ advHandles[i]);
          }
        } catch (err) {
          hilog.info(domain, tag, "stopAdvertising errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_2700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2700
     * @tc.desc   Test errorCode 2902055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let stopAdvertisingCallback = () => {
          return new Promise<int>((resolve, reject) => {
            bluetooth.stopAdvertising(0XFF, (err: BusinessError | null, data: int | undefined) => {
              if (err) {
                hilog.info(domain, tag, 'stopAdvertising callback failed' + JSON.stringify(err));
                reject(err);
              } else {
                hilog.info(domain, tag, '[bluetooth_js]stopAdvertising info' + JSON.stringify(data));
                if (data != undefined) {
                  resolve(data);
                }
              }
            });
          });
        }
        stopAdvertisingCallback().then((data) => {
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising result:' + JSON.stringify(data));
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising use Invalid advertising id success');
          expect().assertFail();
          done();
        }).catch((error) => {
          hilog.info(domain, tag, "disableAdvertisingCallback errCode:" + error.code + ",errMessage:" + error.message);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(2902055).assertEqual(error.code);
          }
        });
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_2800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_2800
     * @tc.desc   Test errorCode 2902055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await bluetooth.stopAdvertising(0XFF);
          hilog.info(domain, tag, '[bluetooth_js]stopAdvertising use Invalid advertising id success');
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, tag, "stopAdvertising errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(2902055).assertEqual(err.code);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISINGADD_1500
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1500"
        let setting: bluetooth.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: false,
        };
        let advData: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: true,
          includeTxPower: true
        };
        let advResponse: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: true,
          includeTxPower: true
        };
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        }
        try {
          hilog.info(domain, tag, `${caseName} test start`)
          hilog.info(domain, tag, `${caseName} deviceName.length = ${nLength}`)
          let advHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag,
            `${caseName} ` + '[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(advHandle));
          await Utils.msSleep(500);
          await Utils.msSleep(900);
          await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js] stopAdvertising promise success: ');
        } catch (err) {
          hilog.info(domain, tag, `${caseName} ` + "02errCode:" + err.code + ",02errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            if (nLength > 24) {
              expect(err.code === 2902054).assertTrue();
            } else {
              expect().assertFail();
            }
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISINGADD_1600
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1600"
        let setting: bluetooth.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: false,
        };
        let advData: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: true,
          includeTxPower: true
        };
        let advResponse: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: false,
          includeTxPower: false
        };
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        }
        try {
          hilog.info(domain, tag, `${caseName} test start`)
          hilog.info(domain, tag, `${caseName} deviceName.length = ${nLength}`)
          let advHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag,
            `${caseName} ` + '[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(advHandle));
          await Utils.msSleep(500);
          await Utils.msSleep(900);
          await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js] stopAdvertising promise success: ');
        } catch (err) {
          hilog.info(domain, tag, "02errCode:" + err.code + ",02errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            if (nLength > 24) {
              expect(err.code === 2902054).assertTrue();
            } else {
              expect().assertFail();
            }
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISINGADD_1700
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1700"
        let advStatus: Number = 0;
        let onReceiveEvent = (AdvertisingStateChangeInfo: bluetooth.AdvertisingStateChangeInfo) => {
          hilog.info(domain, tag, 'bluetooth advertising state = ' + JSON.stringify(AdvertisingStateChangeInfo));
          hilog.info(domain, tag, 'bluetooth advertising state = ' + AdvertisingStateChangeInfo.state);
          advStatus = AdvertisingStateChangeInfo.state;
          hilog.info(domain, tag, 'bluetooth advertising state = ' + advStatus);
        }
        let setting: bluetooth.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: false,
        };
        let advData: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: true,
          includeTxPower: true
        };
        let advResponse: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: true,
          includeTxPower: true
        };
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 0,
        }
        try {
          hilog.info(domain, tag, `${caseName} test start`)
          bluetooth.onAdvertisingStateChange(onReceiveEvent);
          hilog.info(domain, tag, `${caseName} deviceName.length = ${nLength}`)
          let startAdv = (): Promise<int> => {
            return new Promise<int>((resolve, reject) => {
              bluetooth.startAdvertising(advertisingParams, (err: BusinessError | null, outAdvHandle: int | undefined) => {
                if (err) {
                  hilog.info(domain, tag, 'startAdvertising callback failed: ' + JSON.stringify(err!.code));
                  reject(err);
                } else {
                  if (outAdvHandle != undefined) {
                    resolve(outAdvHandle);
                  }
                  hilog.info(domain, tag,
                    '[bluetooth_js]startAdvertising callback info01:' + JSON.stringify(outAdvHandle));
                }
              });
            });
          };

          let advHandle = await startAdv();
          hilog.info(domain, tag, `${caseName} [bluetooth_js] startAdv promise result016:` + JSON.stringify(advHandle));

          await Utils.msSleep(300);
          expect(advStatus).assertEqual(1);
          await Utils.msSleep(5000);
          await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js] stopAdvertising promise success: ');
          let count = 0;
          while (advStatus === 1) {
            await Utils.msSleep(100);
            count = count += 1;
          }
          hilog.info(domain, tag, '[bluetooth_js] advStatus change count promise result01: ' + count);
          expect(advStatus).assertEqual(4);
        } catch (err) {
          hilog.info(domain, tag, `${caseName} [bluetooth_js] errCode:` + err.code + ",01errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            if (nLength > 24) {
              expect(err.code === 2902054).assertTrue();
            } else {
              expect().assertFail();
            }
          }
        }
        bluetooth.offAdvertisingStateChange(onReceiveEvent);
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISINGADD_1800
     * @tc.desc   Test bluetoothBle api11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_ADD_static_1800"
        let advStatus: Number = 0;
        let onReceiveEvent = (AdvertisingStateChangeInfo: bluetooth.AdvertisingStateChangeInfo) => {
          hilog.info(domain, tag, 'bluetooth advertising state = ' + JSON.stringify(AdvertisingStateChangeInfo));
          hilog.info(domain, tag, 'bluetooth advertising state = ' + AdvertisingStateChangeInfo.state);
          advStatus = AdvertisingStateChangeInfo.state;
          hilog.info(domain, tag, 'bluetooth advertising state = ' + advStatus);
        }
        let setting: bluetooth.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: false,
        };
        let advData: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: false,
          includeTxPower: false
        };
        let advResponse: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: false,
          includeTxPower: false
        };
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 0,
        }

        let advHandle = 0xFF;
        try {
          hilog.info(domain, tag, `${caseName} test start`)
          bluetooth.onAdvertisingStateChange(onReceiveEvent);
          let startAdv = (): Promise<int> => {
            return new Promise<int>((resolve, reject) => {
              bluetooth.startAdvertising(advertisingParams, (err: BusinessError | null, outAdvHandle: int | undefined) => {
                if (err) {
                  hilog.info(domain, tag, 'startAdvertising callback failed: ' + JSON.stringify(err!.code));
                  reject(new Error(JSON.stringify(err!.code)));
                } else {
                  if (outAdvHandle != undefined) {
                    resolve(outAdvHandle);
                  }
                  hilog.info(domain, tag,
                    '[bluetooth_js]startAdvertising callback info01:' + JSON.stringify(outAdvHandle));
                }
              });
            });
          };
          let advHandle = await startAdv()
          hilog.info(domain, tag, '[bluetooth_js] startAdv promise result016:' + JSON.stringify(advHandle));
          
          await Utils.msSleep(300);
          expect(advStatus).assertEqual(1);
          await Utils.msSleep(5000);
          let result01 = await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, '[bluetooth_js] stopAdvertising promise result01: ' + JSON.stringify(result01));
          let count = 0;
          while (advStatus === 1) {
            await Utils.msSleep(100);
            count = count += 1;
          }
          hilog.info(domain, tag, '[bluetooth_js] advStatus change count promise result01: ' + count);
          expect(advStatus).assertEqual(4);
        } catch (err) {
          hilog.info(domain, tag, "01errCode:" + err.code + ",01errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        bluetooth.offAdvertisingStateChange(onReceiveEvent);
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISINGISEXTENDED_0100
     * @tc.desc   Test bluetoothBle api26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0100"
        let advManufactureValueBuffers = new Uint8Array(171);
        for (let count = 0; count < 171; count++) {
          advManufactureValueBuffers[count] = (count + 1);
        }
        let advManufactureDataUnits: bluetooth.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: advManufactureValueBuffers.buffer
        };
        let serviceValueBuffer = new Uint8Array(4);
        serviceValueBuffer[0] = 4;
        serviceValueBuffer[1] = 6;
        serviceValueBuffer[2] = 7;
        serviceValueBuffer[3] = 8;
        let setting: bluetooth.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: true,
          isExtended: true,
        };
        let manufactureDataUnit: bluetooth.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: manufactureValueBuffer.buffer
        };
        let serviceDataUnit: bluetooth.ServiceData = {
          serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
          serviceValue: serviceValueBuffer.buffer
        };
        let advData: bluetooth.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [advManufactureDataUnits],
          serviceData: [serviceDataUnit],
          includeDeviceName: false,
          includeTxPower: false
        };
        let advResponse: bluetooth.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
        };
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        }
        try {
          hilog.info(domain, tag, `${caseName} test start`);
          let advHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag,
            `${caseName} ` + '[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(advHandle));
          await Utils.msSleep(1500);
          await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js] stopAdvertising promise success: ');
        } catch (err) {
          hilog.info(domain, tag, "02errCode:" + err.code + ",02errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code === 2902054).assertTrue();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISINGISEXTENDED_0200
     * @tc.desc   Test bluetoothBle api26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0200"
        let advManufactureValueBuffers = new Uint8Array(191);
        for (let count = 0; count < 191; count++) {
          advManufactureValueBuffers[count] = (count + 1);
        }
        let advManufactureDataUnits: bluetooth.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: advManufactureValueBuffers.buffer
        };
        let serviceValueBuffer = new Uint8Array(4);
        serviceValueBuffer[0] = 4;
        serviceValueBuffer[1] = 6;
        serviceValueBuffer[2] = 7;
        serviceValueBuffer[3] = 8;
        let setting: bluetooth.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: false,
          isExtended: true,
        };
        let manufactureDataUnit: bluetooth.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: manufactureValueBuffer.buffer
        };
        let serviceDataUnit: bluetooth.ServiceData = {
          serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
          serviceValue: serviceValueBuffer.buffer
        };
        let advData: bluetooth.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [advManufactureDataUnits],
          serviceData: [serviceDataUnit],
          includeDeviceName: false,
          includeTxPower: false
        };
        let advResponse: bluetooth.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [manufactureDataUnit],
          serviceData: [serviceDataUnit],
        };
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        }
        try {
          hilog.info(domain, tag, `${caseName} test start`)
          let advHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag,
            `${caseName} ` + '[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(advHandle));
          await Utils.msSleep(1500);
          await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js] stopAdvertising promise success: ');
          //c06芯片走此分支

        } catch (err) {
          hilog.info(domain, tag, `${caseName} ` + "02errCode:" + err.code + ",02errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code === 2902054).assertTrue();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISINGISEXTENDED_0300
     * @tc.desc   Test bluetoothBle api26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0300"
        let advManufactureValueBuffers = new Uint8Array(170);
        for (let count = 0; count < 170; count++) {
          advManufactureValueBuffers[count] = (count + 1);
        }
        let advManufactureDataUnits: bluetooth.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: advManufactureValueBuffers.buffer
        };
        let serviceValueBuffer = new Uint8Array(4);
        serviceValueBuffer[0] = 4;
        serviceValueBuffer[1] = 6;
        serviceValueBuffer[2] = 7;
        serviceValueBuffer[3] = 8;
        let setting: bluetooth.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: false,
          isExtended: true,
        };
        let manufactureDataUnit: bluetooth.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: manufactureValueBuffer.buffer
        };
        let serviceDataUnit: bluetooth.ServiceData = {
          serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
          serviceValue: serviceValueBuffer.buffer
        };
        let advData: bluetooth.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [advManufactureDataUnits],
          serviceData: [serviceDataUnit],
          includeDeviceName: false,
          includeTxPower: false
        };
        let advResponse: bluetooth.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [manufactureDataUnit],
          serviceData: [serviceDataUnit],
        };
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        }
        try {
          hilog.info(domain, tag, `${caseName} test start`)
          let advHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag,
            `${caseName} ` + '[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(advHandle));
          await Utils.msSleep(1500);
          await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js] stopAdvertising promise success: ');
        } catch (err) {
          hilog.info(domain, tag, `${caseName} ` + "02errCode:" + err.code + ",02errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISINGISEXTENDED_0400
     * @tc.desc   Test bluetoothBle api26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_ADVERTISING_isExtended_static_0400"
        let advManufactureValueBuffers = new Uint8Array(10);
        for (let count = 0; count < 10; count++) {
          advManufactureValueBuffers[count] = (count + 1);
        }
        let advManufactureDataUnits: bluetooth.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: advManufactureValueBuffers.buffer
        };
        let serviceValueBuffer = new Uint8Array(4);
        serviceValueBuffer[0] = 4;
        serviceValueBuffer[1] = 6;
        serviceValueBuffer[2] = 7;
        serviceValueBuffer[3] = 8;
        let setting: bluetooth.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: true,
          isExtended: false,
        };
        let manufactureDataUnit: bluetooth.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: manufactureValueBuffer.buffer
        };
        let serviceDataUnit: bluetooth.ServiceData = {
          serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
          serviceValue: serviceValueBuffer.buffer
        };
        let advData: bluetooth.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [advManufactureDataUnits],
          serviceData: [serviceDataUnit],
          includeDeviceName: false,
          includeTxPower: false
        };
        let advResponse: bluetooth.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [manufactureDataUnit],
          serviceData: [serviceDataUnit],
        };
        let advertisingParams: bluetooth.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          advertisingResponse: advResponse,
          duration: 100,
        }
        try {
          hilog.info(domain, tag, `${caseName} test start`)
          let advHandle = await bluetooth.startAdvertising(advertisingParams);
          hilog.info(domain, tag,
            `${caseName} ` + '[bluetooth_js]startAdvertising promise info02:' + JSON.stringify(advHandle));
          await Utils.msSleep(1500);
          await bluetooth.stopAdvertising(advHandle);
          hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js] stopAdvertising promise success: ');
        } catch (err) {
          hilog.info(domain, tag, `${caseName} ` + "02errCode:" + err.code + ",02errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]api is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.number  SUB_COMMUNICATION_BLUETOOTHBLE_DISABLEADVERTISINGCALLBACK_0100
     * @tc.name    disableAdvertisingCallback2900003Test
     * @tc.desc    test disableAdvertisingCallback2900003Test without permission
     * @tc.size    LargeTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it("disableAdvertisingCallback2900003Test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
          advertisingId: 0XFF
        };
        let disableAdv = () => {
          return new Promise<int>((resolve, reject) => {
            bluetooth.disableAdvertising(advertisingDisableParams, (err: BusinessError | null, data: int | undefined) => {
              if (err) {
                hilog.info(domain, tag, 'disableAdvertising callback failed: ' + JSON.stringify(err));
                reject(err);
              } else {
                hilog.info(domain, tag,
                  '[bluetooth_js]disableAdvertising callback info01:' + JSON.stringify(data));
                if (data != undefined) {
                  resolve(data);
                }
              }
            });
          });
        };
        try {
          await disableAdv();
          hilog.info(domain, tag, "disableAdvertising callback successful");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "disableAdvertising callback get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else if (err.code === 2900003) {
            expect(true).assertEqual(err.code === 2900003);
          } else {
            expect(err.code).assertEqual(2902055);
          }
        }
        done();
      })

    /**
     * @tc.number  SUB_COMMUNICATION_BLUETOOTHBLE_DISABLEADVERTISINGPROMISE_0100
     * @tc.name    disableAdvertisingPromise2900003Test
     * @tc.desc    test disableAdvertisingPromise2900003Test without permission
     * @tc.size    LargeTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it("disableAdvertisingPromise2900003Test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let advertisingDisableParams: bluetooth.AdvertisingDisableParams = {
          advertisingId: 0XFF
        };
        try {
          await bluetooth.disableAdvertising(advertisingDisableParams);
          hilog.info(domain, tag, 'disableAdvertising promise success');
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "disableAdvertising promise get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else if (err.code === 2900003) {
            expect(true).assertEqual(err.code === 2900003);
          } else {
            expect(err.code).assertEqual(2902055);
          }
        }
        done();
      })
  })
}