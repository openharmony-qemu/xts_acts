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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium-static/src/main/indexStatic';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest';
import bluetooth from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'btBleServiceTest';
let gattServer: bluetooth.GattServer | undefined;
let gattClient: bluetooth.GattClientDevice | undefined;
let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";

function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay)
  });
}

async function tryToEnableBt() {
  let sta = btAccess.getState();
  switch (sta) {
    case btAccess.BluetoothState.STATE_OFF:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta1 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
      break;
    case btAccess.BluetoothState.STATE_TURNING_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turning on:' + JSON.stringify(sta));
      await sleep(3000);
      break;
    case btAccess.BluetoothState.STATE_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turn on:' + JSON.stringify(sta));
      break;
    case btAccess.BluetoothState.STATE_TURNING_OFF:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta2 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
      break;
    default:
      hilog.info(domain, tag, '[bluetooth_js] enable success');
  }
}

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

function Connected(BLEConnectionChangeState: bluetooth.BLEConnectionChangeState) {
  let deviceId: string = BLEConnectionChangeState.deviceId;
  let status: bluetooth.ProfileConnectionState = BLEConnectionChangeState.state;
  hilog.info(domain, tag, "[bluetooth_js] connectionChange jsondata:"
    + 'deviceId:' + deviceId + 'status:' + status);
  expect(true).assertEqual(BLEConnectionChangeState != null);
}

export default function btBleServiceTest(): void {
  describe('btBleServiceTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      await clickRequestPermission(PERMISSION_TEXT);
      await tryToEnableBt()
      gattServer = bluetooth.createGattServer();
      hilog.info(domain, tag, 'bluetooth ble create gattserver result:' + gattServer);
      gattClient = bluetooth.createGattClientDevice('04:30:02:01:00:00');
      hilog.info(domain, tag, 'bluetooth ble create gattclientdevice result:' + gattClient);
      hilog.info(domain, tag, 'beforeAll called')
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach called')
      await tryToEnableBt()
      done();
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called')
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterAll called')
      gattServer!.close();
      hilog.info(domain, tag, 'bluetooth gattServer close success');
      gattClient!.close();
      hilog.info(domain, tag, 'bluetooth gattClient close success');
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_0100
     * @tc.desc   test gattserver on blemtuchange api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattServer!.onBLEMtuChange((mtu: int) => {
            hilog.info(domain, tag, 'BLEMtuChange on value' + JSON.stringify(mtu));
          })
        } catch (err) {
          hilog.error(domain, tag,
            "bluetooth mtu changed on errCode:" + err.code + ",bluetooth mtu changed on errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLEMtuChange is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        gattServer!.offBLEMtuChange((mtu: int) => {
          hilog.info(domain, tag, 'BLEMtuChange on value' + JSON.stringify(mtu));
        });
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_0200
     * @tc.desc   test gattserver off blemtuchange api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        gattServer!.onBLEMtuChange((mtu: int) => {
          hilog.info(domain, tag, 'BLEMtuChange on value' + JSON.stringify(mtu));
        })
        try {
          gattServer!.offBLEMtuChange((mtu: int) => {
            hilog.info(domain, tag, 'BLEMtuChange on value' + JSON.stringify(mtu));
          });
        } catch (err) {
          hilog.error(domain, tag,
            "bluetooth mtu changed off errCode:" + err.code + ",bluetooth mtu changed off errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLEMtuChange is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_OFFNOPARAM_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGEOFFNOPARAM_0100
     * @tc.desc   test gattserver off blemtuchange without param api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLES_MTUCHANGE_OFFNOPARAM_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattServer!.onBLEMtuChange((mtu: int) => {
            hilog.info(domain, tag, 'BLEMtuChange on value' + JSON.stringify(mtu));
          })
          gattServer!.offBLEMtuChange();
          hilog.info(domain, tag, "bluetooth mtu changed off without param is success");
        } catch (err) {
          hilog.error(domain, tag,
            "bluetooth mtu changed off without param errCode:" + err.code +
            ",bluetooth mtu changed off without param errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLEMtuChange is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_0100
     * @tc.desc   Test on and off api10 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattServer!.onConnectionStateChange(Connected);
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]connectionStateChange failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]connectionStateChange is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        gattServer!.offConnectionStateChange(Connected);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_0200
     * @tc.desc   Test on and off api10 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        gattServer!.onConnectionStateChange(Connected);
        try {
          gattServer!.offConnectionStateChange(Connected);
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]connectionStateChange failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]connectionStateChange is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_OFFNOPARAM_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECTOFFNOPARAM_0100
     * @tc.desc   Test offConnectionStateChange without param api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERCONNECT_OFFNOPARAM_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattServer!.onConnectionStateChange(Connected);
          gattServer!.offConnectionStateChange();
          hilog.info(domain, tag, "connectionStateChangeOff without param is success");
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]connectionStateChange off without param failed, code is ${error.code},
            message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]connectionStateChange is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })
  })
}