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
} from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import bluetooth from '@ohos.bluetooth.socket';
import btAccess from '@ohos.bluetooth.access';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'btSocketTest';

function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay)
  });
}

let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";

async function clickRequestPermission(text: string) {
  hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission start');
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
    let button1 = await driver.findComponent(ON.text("允许"));
    await button1!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] click 允许 end');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] click 允许 failed. ' + err);
  }
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

function serverSocket(code: BusinessError | null, number: int | undefined) {
  let serverNumber = -1;
  if (code) {
    hilog.info(domain, tag, 'bluetooth error code01: ' + code);
  } else {
    hilog.info(domain, tag, 'bluetooth serverSocket Number:' + JSON.stringify(number));
    serverNumber = number!;
    expect(true).assertEqual(serverNumber != -1);
  }
}

function serverSocket3(code: BusinessError | null, number: int | undefined) {
  let serverNumber = -1;
  if (code) {
    hilog.info(domain, tag, 'bluetooth error code10: ' + JSON.stringify(code));
  } else {
    hilog.info(domain, tag, 'bluetooth serverSocket3 Number:' + JSON.stringify(number));
    serverNumber = number!;
    expect(true).assertEqual(serverNumber != null);
  }
}

function acceptClientSocket(code: BusinessError | null, number: int | undefined) {
  hilog.info(domain, tag, 'bluetooth error code: ' + code!.code);
  let clientNumber = -1;
  if (code!.code === 0) {
    hilog.info(domain, tag, 'bluetooth clientSocket Number: ' + number);
    clientNumber = number!;
    expect(true).assertEqual(clientNumber != -1);
  }
}

function dataRead(dataBuffer: ArrayBuffer) {
  let data = new Uint8Array(dataBuffer);
  hilog.info(domain, tag, 'bluetooth data is: ' + data[0]);
}

export default function btSocketTest(): void {
  describe('btSocketTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll called')
      await clickRequestPermission(PERMISSION_TEXT);
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach called')
      await tryToEnableBt()
      done()
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called')
    })
    afterAll(() => {
      hilog.info(domain, tag, 'afterAll called')
    })

     /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_1400
     * @tc.desc   Test getL2capPsm api20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let psm = bluetooth.getL2capPsm(0);
          hilog.info(domain, tag, '[bluetooth_js]:getL2capPsm success, result:' + JSON.stringify(psm));
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, "getL2capPsm: errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0100
     * @tc.desc   Test  SppListen api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        try {
          bluetooth.sppListen('server1', SppOption, serverSocket);
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPListen error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppListen is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900004);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0200
     * @tc.desc   Test SppAccept api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        bluetooth.sppListen('server_accept', SppOption, serverSocket);
        let clientNumber = -1;
        try {
          bluetooth.sppAccept(serverNumber, acceptClientSocket);
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPAccept error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppAccept is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else if (error.code === 2900004) {
            expect(error.code).assertEqual(2900004);
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0300
     * @tc.desc   Test SppConnect api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: true, type: bluetooth.SppType.SPP_RFCOMM
        };
        try {
          bluetooth.sppConnect('00:11:22:33:44:55', sppOption,
            (code: BusinessError | null, number: int | undefined) => {
              if (code) {
                hilog.info(domain, tag, '[bluetooth_js] code is: ' + JSON.stringify(code));
              } else {
                hilog.info(domain, tag, '[bluetooth_js]sppConnect Number:'
                  + JSON.stringify(number));
                expect(true).assertEqual(number != null);
              }
            });
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPConnect error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppConnect is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900004);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0400
     * @tc.desc   Test On and Off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        let clientNumber = -1;
        try {
          bluetooth.sppListen('server04', SppOption, serverSocket);
          bluetooth.sppAccept(serverNumber, acceptClientSocket);
          bluetooth.onSppRead(clientNumber, dataRead);
          bluetooth.offSppRead(clientNumber);
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppReadOn is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(true).assertEqual(err.code === 401 || err.code === 2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0500
     * @tc.desc   Test sppCloseServerSocket api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let serverNumber = -1;

        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: true, type: bluetooth.SppType.SPP_RFCOMM
        };
        bluetooth.sppListen('server1', SppOption, serverSocket3);
        try {
          bluetooth.sppCloseServerSocket(serverNumber);
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppCloseServerSocket is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(true).assertEqual(err === null || err.code === 2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0600
     * @tc.desc   Test sppCloseClientSocket api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        let clientNumber = -1;
        try {
          bluetooth.sppListen('server06', SppOption, serverSocket);
          bluetooth.sppAccept(serverNumber, acceptClientSocket);
          bluetooth.sppCloseClientSocket(clientNumber);
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppCloseClientSocket is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(true).assertEqual(err.code === 401 || err.code === 2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0700
     * @tc.desc   Test sppWrite api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        let clientNumber = -1;
        let arrayBuffer = new ArrayBuffer(8);
        let data = new Uint8Array(arrayBuffer);
        data[0] = 123;
        try {
          bluetooth.sppListen('server07', SppOption, serverSocket);
          bluetooth.sppAccept(serverNumber, acceptClientSocket);
          bluetooth.sppWrite(clientNumber, arrayBuffer);
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppWrite is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(true).assertEqual(err.code === 401 || err.code === 2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_0800
     * @tc.desc   Test On and Off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        let clientNumber = -1;
        try {
          bluetooth.sppListen('server08', SppOption, serverSocket);
          bluetooth.sppAccept(serverNumber, acceptClientSocket);
          bluetooth.onSppRead(clientNumber, dataRead);
          bluetooth.offSppRead(clientNumber);
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppReadOn is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(true).assertEqual(err.code === 401 || err.code === 2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_1100
     * @tc.desc   Test sppWriteAsync api18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let arrayBuffer = new ArrayBuffer(8);
        try {
          await bluetooth.sppWriteAsync(0, arrayBuffer);
          hilog.info(domain, tag, '[bluetooth_js]:sppWriteAsync success');
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, "sppWriteAsync: errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppWriteAsync is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_1200
     * @tc.desc   Test sppReadAsync api18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let data = await bluetooth.sppReadAsync(0);
          hilog.info(domain, tag, '[bluetooth_js]:sppReadAsync success, result:' + JSON.stringify(data));
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, "sppReadAsync: errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppWriteAsync is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_1300
     * @tc.desc   Test getDeviceId api17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let deviceId = bluetooth.getDeviceId(0);
          hilog.info(domain, tag, '[bluetooth_js]:getDeviceId success, result:' + JSON.stringify(deviceId));
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, "getDeviceId: errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_1600
     * @tc.desc   Test psm api20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let options: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false,
          type: bluetooth.SppType.SPP_L2CAP,
          psm: 241
        };
        try {
          bluetooth.sppListen('serverTest', options, serverSocket);
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPListen error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppListen is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900004);
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_1700
     * @tc.desc   Test  SppListen api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        try {
          bluetooth.sppListen('', SppOption, serverSocket);
          hilog.info(domain, tag, '[bluetooth_js]:sppListen 1700 success');
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]SPPListen 1700 error, code is ${error.code},message is ${error.message}`);
          expect(error.code).assertEqual(801);
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_1800
     * @tc.desc   Test  SppListen api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        try {
          let str = "a".repeat(256);
          bluetooth.sppListen(str, SppOption, serverSocket);
          hilog.info(domain, tag, '[bluetooth_js]:sppListen 1800 success');
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]SPPListen error 1800, code is ${error.code},message is ${error.message}`);
          hilog.info(domain, tag, '[bluetooth_js]setLocalName is not support');
          expect(error.code).assertEqual(801);
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_1900
     * @tc.desc   Test  SppListen api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPP_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false, type: bluetooth.SppType.SPP_RFCOMM
        };
        let serverNumber = -1;
        try {
          let str = "a".repeat(257);
          bluetooth.sppListen(str, SppOption, serverSocket);
          hilog.info(domain, tag, '[bluetooth_js]:sppListen 1900 success');
          // expect().assertFail(); //李志辉 00504379，这个限制是协议栈的限制，超了的话会截断所以不报错
        } catch (error) {
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppListen 1900 is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPListen_ADD_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPLISTENADD_0100
     * @tc.desc   Test  SppListen api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPListen_ADD_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let stringMaxLen =
          "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345" +
            "6789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123" +
            "45678901234567890123456789012345678901234567890123456789012345678901234567890abcdef"
        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false,
          type: bluetooth.SppType.SPP_L2CAP
        };
        let serverNumber = -1;
        try {
          bluetooth.sppListen(stringMaxLen, SppOption, serverSocket);
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPListen error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppListen is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900004);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPListen_ADD_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPLISTENADD_0200
     * @tc.desc   Test  SppListen api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPListen_ADD_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let stringMaxLen1 =
          "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345" +
            "6789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123" +
            "45678901234567890123456789012345678901234567890123456789012345678901234567890abcdefg456789012345678901234567890123" +
            "45678901234567890123456789012345678901234567890abcdefg456789012345678901234567890123456789012345678901234567890123456" +
            "78901234567890abcdefg45678901234567890123456789012345678901234567890123456789012345678901234567890abcdefg456789012345" +
            "67890123456789012345678901234567890123456789012345678901234567890abcdefg"
        let str1 = "a".repeat(300)


        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false,
          type: bluetooth.SppType.SPP_RFCOMM,
        };
        let serverNumber = -1;
        try {
          bluetooth.sppListen(str1, SppOption, serverSocket);
          hilog.info(domain, tag, '[bluetooth_js]sppListen success');
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPListen error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppListen is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900004);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPListen_ADD_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPLISTENADD_0300
     * @tc.desc   Test  SppListen api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPListen_ADD_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let stringMaxLen =
          "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345" +
            "6789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123" +
            "45678901234567890123456789012345678901234567890123456789012345678901234567890abcdef"


        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false,
          type: bluetooth.SppType.SPP_L2CAP_BLE
        };
        let serverNumber = -1;
        try {
          bluetooth.sppListen(stringMaxLen, SppOption, serverSocket);
          hilog.info(domain, tag, '[bluetooth_js]sppListen success');
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPListen error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppListen is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900004);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPListen_ADD_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPLISTENADD_0400
     * @tc.desc   Test  SppListen api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPListen_ADD_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {


        const SppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: false,
          type: bluetooth.SppType.SPP_L2CAP_BLE
        };
        let serverNumber = -1;
        try {
          bluetooth.sppListen("", SppOption, serverSocket);
          hilog.info(domain, tag, '[bluetooth_js]sppListen success');
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPListen error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppListen is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900004);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SppConnect_ADD_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPCONNECTADD_0100
     * @tc.desc   Test SppConnect api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SppConnect_ADD_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sppOption: bluetooth.SppOptions = {
          uuid: '',
          secure: true,
          type: bluetooth.SppType.SPP_L2CAP,
          psm: 1,
        };
        try {
          bluetooth.sppConnect('00:11:22:33:44:55', sppOption, (code: BusinessError | null, number: int | undefined) => {
            if (code) {
              hilog.info(domain, tag, '[bluetooth_js] code is: ' + JSON.stringify(code));
            } else {
              hilog.info(domain, tag, '[bluetooth_js]sppConnect Number:'
                + JSON.stringify(number));
              expect(true).assertEqual(number != null);
            }
          });
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPConnect error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppConnect is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2900004);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SppConnect_ADD_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPCONNECTADD_0200
     * @tc.desc   Test SppConnect api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SppConnect_ADD_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sppOption: bluetooth.SppOptions = {
          uuid: '',
          secure: true,
          type: bluetooth.SppType.SPP_L2CAP_BLE
        };
        try {
          bluetooth.sppConnect('00:11:22:33:44:55', sppOption, (code: BusinessError | null, number: int | undefined) => {
            if (code) {
              hilog.info(domain, tag, '[bluetooth_js] code is: ' + JSON.stringify(code));
            } else {
              hilog.info(domain, tag, '[bluetooth_js]sppConnect Number:'
                + JSON.stringify(number));
              expect(true).assertEqual(number != null);
            }
          });
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPConnect error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppConnect is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else if (error.code === 2900004) {
            expect(error.code).assertEqual(2900004);
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHSOCKET_SppConnect_ADD_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHSOCKET_SPPCONNECTADD_0300
     * @tc.desc   Test SppConnect api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHSOCKET_SppConnect_ADD_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sppOption: bluetooth.SppOptions = {
          uuid: '00001810-0000-1000-8000-00805F9B34FB',
          secure: true,
          type: bluetooth.SppType.SPP_RFCOMM
        };
        try {
          bluetooth.sppConnect("", sppOption, (code: BusinessError | null, number: int | undefined) => {
            if (code) {
              hilog.info(domain, tag, '[bluetooth_js] code is: ' + JSON.stringify(code));
            } else {
              hilog.info(domain, tag, '[bluetooth_js]sppConnect Number:'
                + JSON.stringify(number));
              expect(true).assertEqual(number != null);
            }
          });
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]SPPConnect error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]sppConnect is not support or profile not support');
            expect(error.code).assertEqual(801);
          } else if (error.code === 2900004) {
            expect(error.code).assertEqual(2900004);
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_SOCKET_GETMAX_ReceiveDataSize_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SOCKETGETMAXRECEIVEDATASIZE_0100
     * @tc.desc   20251113API22用例覆盖 getMaxReceiveDataSize 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SOCKET_GETMAX_ReceiveDataSize_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let clientSocket = 0;
          let return_max_receive = bluetooth.getMaxReceiveDataSize(clientSocket);
          hilog.info(domain, tag,
            '[bluetooth_js]:getMaxReceiveDataSize success, result:' + JSON.stringify(return_max_receive));
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]getMaxReceiveDataSize is failed, code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_SOCKET_ISCONNECTED_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SOCKETISCONNECTED_0100
     * @tc.desc   20251113API22用例覆盖 isConnected 返回值为布尔值.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SOCKET_ISCONNECTED_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let clientSocket = 1;
          let return_boolean = bluetooth.isConnected(clientSocket);
          hilog.info(domain, tag,
            '[bluetooth_js]:isConnected success, result_boolean is:' + JSON.stringify(return_boolean));
          expect(return_boolean).assertFalse();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]isConnected 0100 is failed, code is ${error.code}, message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]isConnected is not support');
            expect(error.code).assertEqual(801);
          } else {
            hilog.info(domain, tag, "isConnected: errCode:" + error.code + ",errMessage:" + error.message);
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_SOCKET_GETMAX_TransmitDataSize_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_SOCKETGETMAXTRANSMITDATASIZE_0100
     * @tc.desc   20251113API22用例覆盖 getMaxTransmitDataSize 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_SOCKET_GETMAX_TransmitDataSize_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let clientSocket = 1;
          let return_max_transmit = bluetooth.getMaxTransmitDataSize(clientSocket);
          hilog.info(domain, tag,
            '[bluetooth_js]:getMaxTransmitDataSize success, result:' + JSON.stringify(return_max_transmit));
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]getMaxTransmitDataSize is failed, code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(401);
        }
        done();
      })

  })
}