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

import { BusinessError } from '@ohos.base';
import a2dp from '@ohos.bluetooth.a2dp';
import access from '@ohos.bluetooth.access';
import ble from '@ohos.bluetooth.ble';
import socket from '@ohos.bluetooth.socket';
import connection from '@ohos.bluetooth.connection';
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
} from '@ohos/hypium-static/src/main/indexStatic';
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

interface btname {
  NUM_TEST: string;
  NUM_TEST1: string;
  LETTERS_TEST: string;
  CHINESES_TEST: string;
  CHINESES_TEST2: string;
  SYMBOL_TEST: string;
  MIXES: string;
  MIXES2: string;
  MIXES3: string;
  MIXES4: string;
  MIXES5: string;
  MIXES6: string;
  MIXES7: string
}

const Btname: btname = {
  NUM_TEST: '012345678901234567890123456789012345678901234567890123' +
    '45678901234567890123456789012345678901234567890123456789012345678901234567',
  NUM_TEST1: '0123456789012345678901234567890123456789012345678901'
    + '23456789012345678901234567890123456789012345678901234567890123456789012345678012'
    + '345678901234567890123456789012345678901234567890123456789012367890123456789012345568'
    + '01234567890123456789012345678912',
  LETTERS_TEST: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
  CHINESES_TEST: '测试蓝牙名称是否正常测试蓝牙名称是否试蓝牙',
  CHINESES_TEST2: '测试蓝牙名称正常',
  SYMBOL_TEST: '*^_^* 、。·ˉˇ¨〃々—～‖·‘’“”「『』〖❂【±×'
    + '÷∶∧∨∑∏∪∩∈∷√⊥‖∠⌒⊙∫∮≡≌≈∽∝≠♂♀°℃＄¤￠￡‰§№☆★○●◎◇□■△※→←↑↓〓',
  MIXES: '测试蓝牙名称是否正试蓝牙\'名称是否[666]aaw',
  MIXES2: '——◎◇◆□■△▲测试蓝牙',
  MIXES3: '78453-、、。。◎◇◆□■△▲',
  MIXES4: 'hhhfdf-、、。。◎◇◆□■△▲',
  MIXES5: '#01-5@<?;:!@$%^&*(1[]{【+-；：‘’“”测试=》《\'[6]',
  MIXES6: '#01-567890@<>?/;:5675ASDF012345678!@'
    + '$%^&*()9012378901[]{}【】566~·67890blue',
  MIXES7: '0123456789012345678901234567890123456789012345678901'
    + '23456789012345678901234567890123456789012345678901234567890123456789012345678012'
    + '345678901234567890123456789012345678901234567890123456789012367890123456789012345568'
    + '012345678901234567890123456789123'
};

let domain: int = 0x0000;
let tag: string = 'btManagerSwitchOff003';
let gattServer: ble.GattServer | undefined;
let gattClient: ble.GattClientDevice | undefined;
let BleScanner: ble.BleScanner | undefined;
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
      access.disableBluetooth();
      await clickTheWindow(CLOSE_BT_TEXT);
      await sleep(3000);
      break;
    case access.BluetoothState.STATE_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turn on:' + JSON.stringify(sta));
      access.disableBluetooth();
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

function functionStopAdvertising(): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    ble.stopAdvertising(0, (error: BusinessError | null) => {
      if (error) {
        hilog.info(domain, tag, 'stopAdvertising failed' + error);
        reject((error));
      }
      resolve(0);
    })
  });
}

export default function btManagerSwitchOff003(): void {
  describe('btManagerSwitchOff003', () => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll start');
      let PERMISSION_TEXT = "允许";
      await sleep(2000);
      await clickTheWindow(PERMISSION_TEXT);
      gattServer = ble.createGattServer();
      gattClient = ble.createGattClientDevice("11:22:33:44:55:66");
      BleScanner = ble.createBleScanner();
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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLE_S_OFF_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_S_OFF_0200
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_S_OFF_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let deviceId: string = "00:11:22:33:44:55";
            await gattServer!.readPhy(deviceId);
            hilog.info(domain, tag, '[bt_arkts]不应该成功');
            expect().assertFail();
          } catch (err) {
            hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual(2900003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLE_C_OFF_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_C_OFF_0200
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_C_OFF_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            await gattClient!.readPhy();
            hilog.info(domain, tag, '[bt_arkts]不应该成功');
            expect().assertFail();
          } catch (err) {
            hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual(2900003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLE_S_OFF_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_S_OFF_0100
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_S_OFF_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let deviceId = "00:11:22:33:44:55";
            let phyValue: ble.PhyValue = {
              txPhy: ble.BlePhy.BLE_PHY_1M,
              rxPhy: ble.BlePhy.BLE_PHY_2M,
              phyMode: ble.CodedPhyMode.BLE_PHY_CODED_S2,
            };
            await gattServer!.setPhy(deviceId, phyValue);
            hilog.info(domain, tag, '[bt_arkts]不应该成功');
            expect().assertFail();
          } catch (err) {
            hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual(2900003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLE_C_OFF_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_C_OFF_0100
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_C_OFF_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let phyValue: ble.PhyValue = {
              txPhy: ble.BlePhy.BLE_PHY_1M,
              rxPhy: ble.BlePhy.BLE_PHY_2M,
              phyMode: ble.CodedPhyMode.BLE_PHY_CODED_S2,
            };
            await gattClient!.setPhy(phyValue);
            hilog.info(domain, tag, '[bt_arkts]不应该成功');
            expect().assertFail();
          } catch (err) {
            hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual(2900003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_static_3800
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3800
     * @tc.desc   Test 2900003 - Bluetooth switch is off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            gattClient!.disconnect();
            expect(true).assertFalse();
          } catch (error) {
            hilog.error(domain, tag, `[bluetooth_js]disconnect failed, code is ${error.code},
                    message is ${error.message}`);
            expect(error.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done()
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICES_OFF_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICES_OFF_0100
     * @tc.desc   Test getServices Bluetooth is turned off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICES_OFF_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let return_list = gattServer!.getServices();
            hilog.info(domain, tag, '[bt_arkts] return_list is' + JSON.stringify(return_list));
            hilog.info(domain, tag, '[bt_arkts] return_list length is ' + return_list.length);
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(domain, tag, `getServices error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(e.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0200
     * @tc.desc   test disable bt use api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let acceptClientSocket = (error: BusinessError | null, number: int | undefined) => {
          hilog.error(domain, tag, 'bluetooth error error.code: ' + error!.code);
          let clientNumber = -1;
          if (error!.code === 0) {
            hilog.info(domain, tag, 'bluetooth clientSocket Number: ' + number);
            clientNumber = number!;
            expect(true).assertEqual(clientNumber != -1);
          }
        }

        let serverNumber = -1;
        if (!closeUnsupport) {
          try {
            socket.sppAccept(serverNumber, acceptClientSocket);
          } catch (error) {
            hilog.info(domain, tag, "sppAccept errCode:" + error.code + ",errMessage:" + error.message);
            expect(true).assertEqual(error.code === 2900003 || error.code === 401);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0500
     * @tc.desc   test disable bt use api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            ble.stopAdvertising();
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(domain, tag, `stopAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(e.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0800
     * @tc.desc   test disable bt use api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            functionStopAdvertising().then(() => {
              hilog.info(domain, tag, "[bluetooth_js]stopAdvertising success");
              expect(true).assertFalse();
              done();
            })
              .catch(e => {
                hilog.info(domain, tag, "[bluetooth_js]stopAdvertising failed" + e);
                expect(true).assertEqual(e.code === 2900003 || e.code === 401);
              })
          } catch (e) {
            hilog.error(domain, tag,
              `stopAdvertising callback error, error code is: ${e.code}, error message is: ${e.message}`);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_static_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_0900
     * @tc.desc   test disable bt use api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_BLE_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            await ble.stopAdvertising(0);
            hilog.info(domain, tag, '[bluetooth_js] stopAdvertising success');
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(domain, tag,
              `stopAdvertising promise error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(true).assertEqual(e.code === 2900003 || e.code === 401);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0100
     * @tc.desc   test disable bt use api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let serverNumber = -1;
            let serverSocket = (error: BusinessError | null, number: int | undefined) => {
              if (error) {
                hilog.error(domain, tag, 'sppListen error, error.code is ' + error!.code);
                return;
              } else {
                serverNumber = number!;
                hilog.info(domain, tag, 'sppListen success, serverNumber = ' + serverNumber);
              }
            }
            let sppOption: socket.SppOptions =
              { uuid: '00001810-0000-1000-8000-00805F9B34FB', secure: false, type: socket.SppType.SPP_RFCOMM };
            socket.sppListen('server1', sppOption, serverSocket);
          } catch (error) {
            hilog.info(domain, tag, "sppListen errCode:" + error.code + ",errMessage:" + error.message);
            expect(error.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_0300
     * @tc.desc   test disable bt use api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_DISABLED_SOCKET_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let clientSocket = (error: BusinessError | null, number: int | undefined) => {
              if (error) {
                hilog.error(domain, tag, 'sppListen error, error.code is ' + error!.code);
                return;
              } else {
                hilog.info(domain, tag, 'bluetooth serverSocket Number: ' + number);
              }
            }
            let sppOption: socket.SppOptions =
              { uuid: '00001810-0000-1000-8000-00805F9B34FB', secure: false, type: socket.SppType.SPP_RFCOMM };
            socket.sppConnect('00:11:22:33:44:55', sppOption, clientSocket);
          } catch (error) {
            hilog.info(domain, tag, "sppConnect errCode:" + error.code + ",errMessage:" + error.message);
            expect(error.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_OFF_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_OFF_0100
     * @tc.desc   Test GattServer getConnectedState Bluetooth is turned off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_OFF_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let return_status = gattServer!.getConnectedState('01:02:00:02:03:01');
            hilog.info(domain, tag, '[bt_arkts]get status is' + JSON.stringify(return_status))
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(domain, tag,
              `GattServer getConnectedState error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(e.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_GETCONNECTEDSTATE_OFF_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_GETCONNECTEDSTATE_OFF_0100
     * @tc.desc   Test GattClientDevice getConnectedState Bluetooth is turned off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_GETCONNECTEDSTATE_OFF_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let return_status = gattClient!.getConnectedState();
            hilog.info(domain, tag, '[bt_arkts]client ProfileConnectionState 0200 is' + JSON.stringify(return_status))
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(domain, tag,
              `GattClientDevice getConnectedState error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(e.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_OFF_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_OFF_0100
     * @tc.desc   Test getService Bluetooth is turned off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_OFF_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let serviceUuid = '00001888-0000-1000-8000-00805f9b34fb';
            let return_gattservice = gattServer!.getService(serviceUuid);
            hilog.info(domain, tag,
              '[bt_arkts]gattServer getService get return_values is ' + JSON.stringify(return_gattservice));
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(domain, tag, `getService error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(e.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_OFF_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_OFF_0100
     * @tc.desc   Test updateConnectionParam Bluetooth is turned off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_OFF_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            await gattClient!.updateConnectionParam(ble.ConnectionParam.LOW_POWER);
            hilog.info(domain, tag, '[bt_arkts]get device updateConnectionParam')
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(domain, tag,
              `updateConnectionParam get error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(e.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_CONNECTION_GETREMOTEDEVICETRANSPORT_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_GETREMOTEDEVICETRANSPORT_0100
     * @tc.desc   Test getRemoteDeviceTransport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_GETREMOTEDEVICETRANSPORT_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            let transport = connection.getRemoteDeviceTransport("00:11:22:33:44:55");
            hilog.info(domain, tag, '[bluetooth_js] getRemoteDeviceTransport result:' + transport);
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(domain, tag,
              `getRemoteDeviceTransport get error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(e.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_REMOVEALLSERVICES_SWITCOFF_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_REMOVEALLSERVICES_SWITCOFF_0100
     * @tc.desc   Test removeAllServices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_REMOVEALLSERVICES_SWITCOFF_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          gattServer!.removeAllServices();
          hilog.info(domain, tag, "removeAllServices success")
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "removeAllServices error, errCode:" + err.code + ",errMessage:" + err.message + typeof err.code);
          if (err.code === 801) {
            hilog.info(domain, tag,
              '[bluetooth_js]removeAllServices is not support or removeAllServices as it is out of hardware');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_static_3700
     * @tc.number SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_3700
     * @tc.desc   Test 2900003 - Bluetooth switch is off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BTMANAGER_SWITCHOFF_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if (!closeUnsupport) {
          try {
            gattClient!.connect();
            await sleep(2000);
            expect(true).assertFalse();
          } catch (error) {
            hilog.error(domain, tag, `[bluetooth_js]connect failed, code is ${error.code},
                    message is ${error.message}`);
            expect(error.code).assertEqual(2900003);
          }
        } else {
          expect(true).assertTrue();
        }
        done()
      })

  })
}