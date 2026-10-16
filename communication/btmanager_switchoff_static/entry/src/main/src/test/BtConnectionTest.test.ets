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

import access from '@ohos.bluetooth.access';
import connection from '@ohos.bluetooth.connection';
import bluetoothBle from '@ohos.bluetooth.ble';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../hypium';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  UiDirection,
  MouseButton,
  WindowMode,
  PointerMatrix,
  UIElementInfo,
  UIEventObserver
} from '@ohos.UiTest'
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'btConnectionSwitchOffTest';
let closeUnsupport = false;

function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay)
  });
}

async function tryToDisableBt() {
  let sta = access.getState();
  switch (sta) {
    case access.BluetoothState.STATE_OFF:
      hilog.info(domain, tag, '[bluetooth_js] bt turn off:' + JSON.stringify(sta));
      break;
    case access.BluetoothState.STATE_TURNING_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turning on:' + JSON.stringify(sta));
      access.disableBluetooth()
      await clickTheWindow(CLOSE_BT_TEXT);
      await sleep(3000);
      break;
    case access.BluetoothState.STATE_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turn on:' + JSON.stringify(sta));
      access.disableBluetooth()
      await clickTheWindow(CLOSE_BT_TEXT);
      await sleep(3000);
      break;
    case access.BluetoothState.STATE_TURNING_OFF:
      hilog.info(domain, tag, '[bluetooth_js] bt turning off:' + JSON.stringify(sta));
      await sleep(3000);
      break;
    default:
      hilog.info(domain, tag, '[bluetooth_js] enable success');
  }
}

async function tryToEnableBt() {
  let sta = access.getState();
  switch (sta) {
    case access.BluetoothState.STATE_OFF:
      access.enableBluetooth();
      await clickTheWindow(OPEN_BT_TEXT);
      let sta1 = access.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turn off and enableBt:' + JSON.stringify(sta1));
      break;
    case access.BluetoothState.STATE_TURNING_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turning on and sleep 3s:' + JSON.stringify(sta));
      await sleep(3000);
      break;
    case access.BluetoothState.STATE_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turn on:' + JSON.stringify(sta));
      break;
    case access.BluetoothState.STATE_TURNING_OFF:
      access.enableBluetooth();
      await clickTheWindow(OPEN_BT_TEXT);
      let sta2 = access.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turning off and enableBt:' + JSON.stringify(sta2));
      break;
    default:
      hilog.info(domain, tag, '[bluetooth_js] state undefined');
  }
}

let CLOSE_BT_TEXT = "关闭";
let OPEN_BT_TEXT = "开启";

async function clickTheWindow(text: string) {
  hilog.info(domain, tag, '[bluetooth_js] clickTheWindow start');
  let driver = Driver.create();
  await driver.delayMs(3000);
  try {
    let button = await driver.findComponent(ON.text(text));
    await button!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] click sucess');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] click failed. ' + JSON.stringify(err));
  }
}

export default function btConnectionSwitchOffTest(): void {
  describe('btConnectionSwitchOffTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll start');
      let PERMISSION_TEXT = "允许";
      await sleep(2000);
      await clickTheWindow(PERMISSION_TEXT);
      hilog.info(domain, tag, 'beforeAll end');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach start');
      try {
        await tryToDisableBt();
      } catch (error) {
        hilog.error(domain, tag, '[bluetooth_js]tryToDisableBt get error:' + JSON.stringify(error) + 'error.code = :' +
          JSON.stringify(error.code));
        if (error.code === 801) {
          closeUnsupport = true;
        }
      }
      hilog.info(domain, tag, 'beforeEach end');
      done();
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterAll start')
      try {
        await tryToEnableBt();
      } catch (error) {
        hilog.error(domain, tag, '[bluetooth_js]tryToEnableBt get error:' + JSON.stringify(error) + 'error.code = :' +
          JSON.stringify(error.code));
      }
      hilog.info(domain, tag, 'afterAll end')
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100
     * @tc.desc   Test setLocalName when bluetooth is disabled (error code 2900003)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            connection.setLocalName('TestName');
            hilog.info(domain, tag, '[bluetooth_js] setLocalName should fail when bluetooth is disabled');
            expect(true).assertFalse();
            done()
          } catch (error) {
            hilog.error(domain, tag, '[bluetooth_js]setLocalName error.code:' + JSON.stringify(error.code) +
              'error.message:' + JSON.stringify(error.message));
            let errorCode = error.code;
            if (errorCode === 801) {
              hilog.info(domain, tag, '[bluetooth_js] setLocalName is not support');
              expect(errorCode).assertEqual(801);
            } else if (errorCode === 2900003 || errorCode === 2900099) {
              hilog.info(domain, tag, '[bluetooth_js] bluetooth is disabled or not enabled');
              expect(errorCode === 2900003 || errorCode === 2900099).assertTrue();
            } else {
              hilog.error(domain, tag, '[bluetooth_js] unexpected error code: ' + error.code);
              expect().assertFail();
            }
            done()
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_HASH_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_HASH_0100
     * @tc.desc   Test pairDevice when bluetooth is disabled (error code 2900003)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_HASH_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          let hashValue = "c10b57deb2e1aafd255596e0d4fd6789";
          try {
            connection.getVirtualAddressByHash(connection.HashAlgorithmType.HASH_ALGORITHM_SHA256, hashValue)
            expect().assertFail();
          } catch (err) {
            hilog.error(domain, tag, `getVirtualAddressByHash errCode: ${err.code}, errMessage: ${err.message}`);
            if (err.code === 801) {
              hilog.info(domain, tag, '[bluetooth_js] RK板 is not support');
              expect(err.code === 801).assertTrue();
            } else {
              hilog.info(domain, tag, '[bluetooth_js] getVirtualAddressByHash fail 201');
              expect(err.code).assertEqual(2900003);
            }
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

  })
}