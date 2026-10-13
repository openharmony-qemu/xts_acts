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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium';
import hilog from '@ohos.hilog';
import a2dp from '@ohos.bluetooth.a2dp';
import ble from '@ohos.bluetooth.ble';
import socket from '@ohos.bluetooth.socket';
import constant from '@ohos.bluetooth.constant';
import { BusinessError } from '@ohos.base';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const TAG: string = 'BtBleTestTag';
const Domain: int = 0x0000;
let a2dpSrc: a2dp.A2dpSourceProfile;
let gattServer: ble.GattServer;
let device: ble.GattClientDevice;


function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay)
  });
}

export default function btNopUiJsunitCoverageTest(): void {
  describe('btNopUiJsunitCoverageTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      a2dpSrc = a2dp.createA2dpSrcProfile();
      gattServer = ble.createGattServer();
      device = ble.createGattClientDevice('00:11:22:33:44:55');
      hilog.info(Domain, TAG,
        'beforeAll a2dp createA2dpSrcProfile and ble createGattServer and createGattClientDevice');
      done();
    });
    beforeEach(() => {
      hilog.info(Domain, TAG, 'beforeEach');
    });
    afterEach(() => {
      hilog.info(Domain, TAG, 'afterEach');
    });
    afterAll(() => {
      hilog.info(Domain, TAG, 'afterAll');
    });

    /**
     * @tc.name   testStopAdvertisingWithCallbackNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_TESTSTOPADVERTISINGWITHCALLBACKNOP_0100
     * @tc.desc   stopAdvertising with callback interface 201/2902055 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStopAdvertisingWithCallbackNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let advHandle = 0xFF;
        let functionStopAdvertising = async () => {
          return new Promise<int>((resolve, reject) => {
            ble.stopAdvertising(advHandle, (error) => {
              if (error) {
                reject(error)
              } else {
                resolve(0);
              }
            });
          })
        }
        try {
          await functionStopAdvertising();
          hilog.info(Domain, TAG, '[bt_arkts] stopAdvertising callback success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `stopAdvertising callback error, error code is: ${error.code}, error message is: ${error.message}`);
          if (error.code === 2902055) {
            hilog.info(Domain, TAG, '[bt_arkts] stopAdvertising callback returns invalid advertising id');
            expect(error.code).assertEqual(2902055);
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   testStopAdvertisingWithPromiseNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_TESTSTOPADVERTISINGWITHPROMISENOP_0100
     * @tc.desc   stopAdvertising with promise interface 201/2902055 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStopAdvertisingWithPromiseNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let advHandle = 0xFF;
        try {
          await ble.stopAdvertising(advHandle);
          hilog.info(Domain, TAG, '[bt_arkts] stopAdvertising promise success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `stopAdvertising promise error, error code is: ${error.code}, error message is: ${error.message}`);
          if (error.code === 2902055) {
            hilog.info(Domain, TAG, '[bt_arkts] stopAdvertising promise returns invalid advertising id');
            expect(error.code).assertEqual(2902055);
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   testSppConnectCallbackNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_TESTSPPCONNECTCALLBACKNOP_0100
     * @tc.desc   sppConnect callback interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSppConnectCallbackNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let deviceId = "00:11:22:33:44:55";
        let sppOptions: socket.SppOptions = {
          uuid: "00001888-0000-1000-8000-00805f9b34fb",
          secure: false,
          type: socket.SppType.SPP_RFCOMM
        };
        let functionSppConnect = async () => {
          return new Promise<int>((resolve, reject) => {
              socket.sppConnect(deviceId, sppOptions, (error: BusinessError | null, clientSocket: int | undefined) => {
              if (error) {
                reject(error);
              } else {
                resolve(clientSocket!);
              }
            });
          })
        }
        try {
          await functionSppConnect();
          hilog.info(Domain, TAG, '[bt_arkts] sppConnect callback success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `sppConnect callback error, error code is: ${error.code}, error message is: ${error.message}`);
          if (error.code === 801) {
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

  })
}