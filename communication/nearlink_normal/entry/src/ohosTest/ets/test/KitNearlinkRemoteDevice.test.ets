/**
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import manager from '@ohos.nearlink.manager';
import constant from '@ohos.nearlink.constant';
import remoteDevice from '@ohos.nearlink.remoteDevice';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import { openNearLink } from './OpenNearLink';

export default function remoteDeviceTest() {
  describe('remoteDeviceTest', () => {
    let ADDRESS = "00:11:22:33:44:55";
    let ADDRESS_SECOND = "11:22:33:44:55:66";
    let ADDRESS_Invailable1 = "11:22:33:44:55:6";
    let ADDRESS_Invailable2 = "11:22:33:44:55:666";
    let ADDRESS_Invailable3 = "";
    let RemoteD: remoteDevice.RemoteDevice;
    let TIME_SLEEP = 2000;
    let return_boolean: boolean;
    beforeAll(async (done:Function) => {
      console.info('beforeAll start');
      await sleep(TIME_SLEEP);
      await clickRequestPermission();
      return_boolean = manager.isNearLinkSupported();
      try {
        RemoteD = remoteDevice.createRemoteDevice(ADDRESS);
        console.info('nearLink createRemoteDevice result:' + RemoteD);
        expect(true).assertEqual(RemoteD != null);
      } catch (err) {
        console.error('nearlink errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info('beforeAll end');
      done();
    })
    beforeEach(async (done:Function) => {
      console.info('beforeEach start');
      await openNearLink();
      console.info('beforeEach end');
      done();
    })
    afterEach(() => {
      console.info('afterEach');
    })
    afterAll(() => {
      console.info('afterAll');
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0100
     * @tc.desc PairingReason enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0100';
        console.info(`${caseName} test start`);
        try {
          let PAIRING_REASON_SUCCESS: remoteDevice.PairingReason = remoteDevice.PairingReason.PAIRING_REASON_SUCCESS;
          console.info(`${caseName} PAIRING_REASON_SUCCESS result:` + PAIRING_REASON_SUCCESS);
          expect(PAIRING_REASON_SUCCESS).assertEqual(0);
          let PAIRING_REASON_FAILURE: remoteDevice.PairingReason = remoteDevice.PairingReason.PAIRING_REASON_FAILURE;
          console.info(`${caseName} PAIRING_REASON_FAILURE result:` + PAIRING_REASON_FAILURE);
          expect(PAIRING_REASON_FAILURE).assertEqual(1);
          let PAIRING_REASON_ACB_CONNECTION_FAIL: remoteDevice.PairingReason = remoteDevice.PairingReason.PAIRING_REASON_ACB_CONNECTION_FAIL;
          console.info(`${caseName} PAIRING_REASON_ACB_CONNECTION_FAIL result:` + PAIRING_REASON_ACB_CONNECTION_FAIL);
          expect(PAIRING_REASON_ACB_CONNECTION_FAIL).assertEqual(2);
          let PAIRING_REASON_EXCEED_ACB_MAX: remoteDevice.PairingReason = remoteDevice.PairingReason.PAIRING_REASON_EXCEED_ACB_MAX;
          console.info(`${caseName} PAIRING_REASON_EXCEED_ACB_MAX result:` + PAIRING_REASON_EXCEED_ACB_MAX);
          expect(PAIRING_REASON_EXCEED_ACB_MAX).assertEqual(3);
          let PAIRING_REASON_REMOTE_CANCELED: remoteDevice.PairingReason = remoteDevice.PairingReason.PAIRING_REASON_REMOTE_CANCELED;
          console.info(`${caseName} PAIRING_REASON_REMOTE_CANCELED result:` + PAIRING_REASON_REMOTE_CANCELED);
          expect(PAIRING_REASON_REMOTE_CANCELED).assertEqual(4);
          let PAIRING_REASON_LOCAL_CANCELED: remoteDevice.PairingReason = remoteDevice.PairingReason.PAIRING_REASON_LOCAL_CANCELED;
          console.info(`${caseName} PAIRING_REASON_LOCAL_CANCELED result:` + PAIRING_REASON_LOCAL_CANCELED);
          expect(PAIRING_REASON_LOCAL_CANCELED).assertEqual(5);
          let PAIRING_REASON_AUTH_FAIL: remoteDevice.PairingReason = remoteDevice.PairingReason.PAIRING_REASON_AUTH_FAIL;
          console.info(`${caseName} PAIRING_REASON_AUTH_FAIL result:` + PAIRING_REASON_AUTH_FAIL);
          expect(PAIRING_REASON_AUTH_FAIL).assertEqual(6);
        } catch (error) {
          console.info(`${caseName} PairingReason error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0200
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0200
     * @tc.desc PairingType enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'LSUB_Communication_XTS_NearLink_RemoteDevice_Enum_0200';
        console.info(`${caseName} test start`);
        try {
          let NO_PASSKEY_CONFIRMATION: remoteDevice.PairingType = remoteDevice.PairingType.NO_PASSKEY_CONFIRMATION;
          console.info(`${caseName} NO_PASSKEY_CONFIRMATION result:` + NO_PASSKEY_CONFIRMATION);
          expect(NO_PASSKEY_CONFIRMATION).assertEqual(0);
          let PAIRING_TYPE_PASSCODE: remoteDevice.PairingType = remoteDevice.PairingType.PAIRING_TYPE_PASSCODE;
          console.info(`${caseName} PAIRING_TYPE_PASSCODE result:` + PAIRING_TYPE_PASSCODE);
          expect(PAIRING_TYPE_PASSCODE).assertEqual(1);
          let PAIRING_TYPE_NUMBER_COMPARE: remoteDevice.PairingType = remoteDevice.PairingType.PAIRING_TYPE_NUMBER_COMPARE;
          console.info(`${caseName} PAIRING_TYPE_NUMBER_COMPARE result:` + PAIRING_TYPE_NUMBER_COMPARE);
          expect(PAIRING_TYPE_NUMBER_COMPARE).assertEqual(2);
        } catch (error) {
          console.info(`${caseName} PairingType error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0300
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0300
     * @tc.desc ConnectionReason enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_Enum_0300';
        console.info(`${caseName} test start`);
        try {
          let CONNECTION_SUCCESS: remoteDevice.ConnectionReason = remoteDevice.ConnectionReason.CONNECTION_SUCCESS;
          console.info(`${caseName} CONNECTION_SUCCESS result:` + CONNECTION_SUCCESS);
          expect(CONNECTION_SUCCESS).assertEqual(0);
          let CONNECTION_FAILURE: remoteDevice.ConnectionReason = remoteDevice.ConnectionReason.CONNECTION_FAILURE;
          console.info(`${caseName} CONNECTION_FAILURE result:` + CONNECTION_FAILURE);
          expect(CONNECTION_FAILURE).assertEqual(1);
          let CONNECTION_LOCAL_DISCONNECT: remoteDevice.ConnectionReason = remoteDevice.ConnectionReason.CONNECTION_LOCAL_DISCONNECT;
          console.info(`${caseName} CONNECTION_LOCAL_DISCONNECT result:` + CONNECTION_LOCAL_DISCONNECT);
          expect(CONNECTION_LOCAL_DISCONNECT).assertEqual(2);
          let CONNECTION_REMOTE_DISCONNECT: remoteDevice.ConnectionReason = remoteDevice.ConnectionReason.CONNECTION_REMOTE_DISCONNECT;
          console.info(`${caseName} CONNECTION_REMOTE_DISCONNECT result:` + CONNECTION_REMOTE_DISCONNECT);
          expect(CONNECTION_REMOTE_DISCONNECT).assertEqual(3);
          let CONNECTION_FAIL_ACB_CONNECTION: remoteDevice.ConnectionReason = remoteDevice.ConnectionReason.CONNECTION_FAIL_ACB_CONNECTION;
          console.info(`${caseName} CONNECTION_FAIL_ACB_CONNECTION result:` + CONNECTION_FAIL_ACB_CONNECTION);
          expect(CONNECTION_FAIL_ACB_CONNECTION).assertEqual(4);
          let CONNECTION_FAIL_SERVICE_DISCOVERY: remoteDevice.ConnectionReason = remoteDevice.ConnectionReason.CONNECTION_FAIL_SERVICE_DISCOVERY;
          console.info(`${caseName} CONNECTION_FAIL_SERVICE_DISCOVERY result:` + CONNECTION_FAIL_SERVICE_DISCOVERY);
          expect(CONNECTION_FAIL_SERVICE_DISCOVERY).assertEqual(5);
          let CONNECTION_FAIL_NO_AVAILABLE_SERVICE: remoteDevice.ConnectionReason = remoteDevice.ConnectionReason.CONNECTION_FAIL_NO_AVAILABLE_SERVICE;
          console.info(`${caseName} CONNECTION_FAIL_NO_AVAILABLE_SERVICE result:` + CONNECTION_FAIL_NO_AVAILABLE_SERVICE);
          expect(CONNECTION_FAIL_NO_AVAILABLE_SERVICE).assertEqual(6);
          let CONNECTION_FAIL_CONNECTION_NUM_LIMITED: remoteDevice.ConnectionReason = remoteDevice.ConnectionReason.CONNECTION_FAIL_CONNECTION_NUM_LIMITED;
          console.info(`${caseName} CONNECTION_FAIL_CONNECTION_NUM_LIMITED result:` + CONNECTION_FAIL_CONNECTION_NUM_LIMITED);
          expect(CONNECTION_FAIL_CONNECTION_NUM_LIMITED).assertEqual(7);
        } catch (error) {
          console.info(`${caseName} ConnectionReason error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0100
     * @tc.desc remoteDevice.onPairingStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0100';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: remoteDevice.PairingStateParam) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        remoteDevice.onPairingStateChange(onReceiveEvent);
        remoteDevice.offPairingStateChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPairingStateChange/offPairingStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0200
     * @tc.desc remoteDevice onPairingStateChange with callback, offPairingStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0200';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: remoteDevice.PairingStateParam) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        remoteDevice.onPairingStateChange(onReceiveEvent);
        remoteDevice.offPairingStateChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPairingStateChange/offPairingStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0300
     * @tc.desc remoteDevice.onPairingStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0300';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.onPairingStateChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPairingStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0400
     * @tc.desc remoteDevice.offPairingStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0400';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.offPairingStateChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offPairingStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0500
     * @tc.desc remoteDevice.onPairingStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0500';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.onPairingStateChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPairingStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0600
     * @tc.desc remoteDevice.offPairingStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0600';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.offPairingStateChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offPairingStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0700
     * @tc.desc remoteDevice.onConnectionStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0700';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: remoteDevice.ConnectionStateParam) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        remoteDevice.onConnectionStateChange(onReceiveEvent);
        remoteDevice.offConnectionStateChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onConnectionStateChange/offConnectionStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0800
     * @tc.desc remoteDevice onConnectionStateChange with callback, offConnectionStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0800';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: remoteDevice.ConnectionStateParam) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        remoteDevice.onConnectionStateChange(onReceiveEvent);
        remoteDevice.offConnectionStateChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onConnectionStateChange/offConnectionStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0900
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0900
     * @tc.desc remoteDevice.onConnectionStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_0900';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.onConnectionStateChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onConnectionStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1000
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1000
     * @tc.desc remoteDevice.offConnectionStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1000';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.offConnectionStateChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offConnectionStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1100
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1100
     * @tc.desc remoteDevice.onConnectionStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1100';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.onConnectionStateChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onConnectionStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1200
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1200
     * @tc.desc remoteDevice.offConnectionStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1200';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.offConnectionStateChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offConnectionStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1300
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1300
     * @tc.desc remoteDevice.onAcbStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1300';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: remoteDevice.AcbStateParam) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        remoteDevice.onAcbStateChange(onReceiveEvent);
        remoteDevice.offAcbStateChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onAcbStateChange/offAcbStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1400
     * @tc.desc remoteDevice onAcbStateChange with callback, offAcbStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1400';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: remoteDevice.AcbStateParam) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        remoteDevice.onAcbStateChange(onReceiveEvent);
        remoteDevice.offAcbStateChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onAcbStateChange/offAcbStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1500
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1500
     * @tc.desc remoteDevice.onAcbStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1500';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.onAcbStateChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onAcbStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1600
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1600
     * @tc.desc remoteDevice.offAcbStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1600';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.offAcbStateChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offAcbStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1700
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1700
     * @tc.desc remoteDevice.onAcbStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1700';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.onAcbStateChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onAcbStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1800
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1800
     * @tc.desc remoteDevice.offAcbStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_RemoteDevice_On_1800';
      console.info(`${caseName} test start`);
      try {
        remoteDevice.offAcbStateChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offAcbStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0100
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0100
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_0100';
      try {
        let RemoteDev: remoteDevice.RemoteDevice = remoteDevice.createRemoteDevice(ADDRESS_SECOND);
        console.info('nearLink createRemoteDevice result:' + RemoteDev);
        expect(true).assertEqual(RemoteDev != null);
      } catch (error) {
        console.info("nearLink remoteDevice 0100 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0200
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0200
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_0200';
      try {
        await RemoteD.startPairing();
        console.info('nearLink startPairing promise success');
      } catch (error) {
        console.info("nearLink startPairing 0200 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0300
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0300
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_0300';
      try {
        let state: remoteDevice.PairingState = RemoteD.getPairingState();
        console.info('nearLink getPairingState result:' + state);
        const enumvalue: number[] = [constant.PairingState.PAIRING_STATE_NONE, constant.PairingState.PAIRING_STATE_PAIRING, constant.PairingState.PAIRING_STATE_PAIRED];
        expect(enumvalue.includes(state)).assertTrue();
      } catch (error) {
        console.info("nearLink remoteDevice 0300 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0400
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0400
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_0400';
      try {
        let name: string = RemoteD.getDeviceName();
        console.info('nearLink getDeviceName result:' + name);
        expect(typeof name).assertEqual('string');
      } catch (error) {
        console.info("nearLink remoteDevice 0400 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0500
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0500
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_0500';
      try {
        let devClass: remoteDevice.DeviceClass = RemoteD.getDeviceClass();
        console.info('[Nearlink Test] getDeviceClass result:' + devClass);
        const enumvalue: number[] = [
          constant.DeviceClass.DEVICE_INVALID_CLASS,
          constant.DeviceClass.DEVICE_UNCATEGORIZED,
          constant.DeviceClass.DEVICE_PHONE,
          constant.DeviceClass.DEVICE_SMARTPHONE,
          constant.DeviceClass.DEVICE_COMPUTER,
          constant.DeviceClass.DEVICE_LAPTOP,
          constant.DeviceClass.DEVICE_TABLET,
          constant.DeviceClass.DEVICE_ALL_IN_ONE_COMPUTER,
          constant.DeviceClass.DEVICE_MINI_PC,
          constant.DeviceClass.DEVICE_WATCH,
          constant.DeviceClass.DEVICE_SMART_WATCH,
          constant.DeviceClass.DEVICE_HUMAN_INTERFACE,
          constant.DeviceClass.DEVICE_KEYBOARD,
          constant.DeviceClass.DEVICE_MOUSE,
          constant.DeviceClass.DEVICE_HANDLE,
          constant.DeviceClass.DEVICE_STYLUS,
          constant.DeviceClass.DEVICE_TOUCHPAD,
          constant.DeviceClass.DEVICE_AUDIO_PLAYBACK,
          constant.DeviceClass.DEVICE_SMART_SPEAKER,
          constant.DeviceClass.DEVICE_ECHO_WALL,
          constant.DeviceClass.DEVICE_AUDIO_CAPTURE,
          constant.DeviceClass.DEVICE_KARAOKE_MICROPHONE,
          constant.DeviceClass.DEVICE_LAPEL_MICROPHONE,
          constant.DeviceClass.DEVICE_WEARABLE_AUDIO,
          constant.DeviceClass.DEVICE_IN_EAR_EARPHONE,
          constant.DeviceClass.DEVICE_HEADSET,
          constant.DeviceClass.DEVICE_OVER_EAR_HEADPHONE,
          constant.DeviceClass.DEVICE_NECKBAND_EARPHONE,
          constant.DeviceClass.DEVICE_PERSONAL_CARE,
          constant.DeviceClass.DEVICE_INTELLIGENT_TOOTHBRUSH,
          constant.DeviceClass.DEVICE_SMART_CUP,
          constant.DeviceClass.DEVICE_INTELLIGENT_SHAVER,
          constant.DeviceClass.DEVICE_HVAC,
          constant.DeviceClass.DEVICE_AIR_PURIFIER,
          constant.DeviceClass.DEVICE_HUMIDIFIER,
          constant.DeviceClass.DEVICE_AIR_CIRCULATION_FAN,
          constant.DeviceClass.DEVICE_ELECTRIC_RIDE,
          constant.DeviceClass.DEVICE_ELECTRIC_SCOOTER,
          constant.DeviceClass.DEVICE_ELECTRIC_BICYCLE,
          constant.DeviceClass.DEVICE_LIGHT_FITTING,
          constant.DeviceClass.DEVICE_SMART_TABLE_LAMP,
          constant.DeviceClass.DEVICE_REMOTE_CONTROL,
          constant.DeviceClass.DEVICE_TV_REMOTE_CONTROL,
          constant.DeviceClass.DEVICE_IMAGING,
          constant.DeviceClass.DEVICE_SMART_TV,
          constant.DeviceClass.DEVICE_IP_CAMERA,
          constant.DeviceClass.DEVICE_SCREEN_CASTER,
          constant.DeviceClass.DEVICE_NETWORKING,
          constant.DeviceClass.DEVICE_IOT_GATEWAY,
          constant.DeviceClass.DEVICE_ACCESS_CONTROL,
          constant.DeviceClass.DEVICE_INTELLIGENT_LOCK,
          constant.DeviceClass.DEVICE_SMART_KEY,
          constant.DeviceClass.DEVICE_VEHICLE_KEY,
          constant.DeviceClass.DEVICE_VEHICLE_LOCK,
        ];
        expect(enumvalue.includes(devClass)).assertTrue();
      } catch (error) {
        console.info("[Nearlink Test] remoteDevice 0500 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0600
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0600
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_0600';
      try {
        let connState: remoteDevice.ConnectionState = RemoteD.getConnectionState();
        console.info('nearLink getConnectionState result:' + connState);
        const enumvalue: number[] = [
          constant.ConnectionState.STATE_CONNECTING,
          constant.ConnectionState.STATE_CONNECTED,
          constant.ConnectionState.STATE_DISCONNECTING,
          constant.ConnectionState.STATE_DISCONNECTED];
        expect(enumvalue.includes(connState)).assertTrue();
      } catch (error) {
        console.info("nearLink remoteDevice 0600 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0700
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0700
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_0700';
      try {
        let ACBState: constant.AcbState = RemoteD.getAcbState();
        console.info('nearLink getACBState result:' + ACBState);
        const enumvalue: number[] = [
          constant.AcbState.DISCONNECTED,
          constant.AcbState.CONNECTED,
          constant.AcbState.ENCRYPTED];
        expect(enumvalue.includes(ACBState)).assertTrue();
      } catch (error) {
        console.info("nearLink getACBState 0700 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(true).assertFalse();
        }
      }
      console.info(`${caseName} test end`);
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0800
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0800
     * @tc.desc Check return value getDeviceInformation API24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_0800';
      console.info(`${caseName} test start`);
      try {
        let result: remoteDevice.DeviceInformation = RemoteD.getDeviceInformation();
        console.info(`${caseName} getDeviceInformation:` + result);
        if (result) {
          console.info(`${caseName} getDeviceInformation manufacturerData:` + result.manufacturerData + `, type: ` + typeof result.manufacturerData);
          expect(typeof result.manufacturerData === `string`).assertTrue();
          console.info(`${caseName} getDeviceInformation modelData:` + result.modelData + `, type: ` + typeof result.modelData);
          expect(typeof result.modelData === `string`).assertTrue();
        } else {
          expect().assertFail();
        }
      } catch (error) {
        console.info(`${caseName} getDeviceInformation  error.code` + error.code + `,errMessage:` + error.message);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_0900
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_0900
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let RemoteDev: remoteDevice.RemoteDevice = remoteDevice.createRemoteDevice(ADDRESS_Invailable1);
        console.info('nearLink createRemoteDevice result:' + RemoteDev);
        expect().assertFail();
      } catch (error) {
        console.info("nearLink remoteDevice 0800 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_1000
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_1000
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let RemoteDev: remoteDevice.RemoteDevice = remoteDevice.createRemoteDevice(ADDRESS_Invailable2);
        console.info('nearLink createRemoteDevice result:' + RemoteDev);
        expect().assertFail();
      } catch (error) {
        console.info("nearLink remoteDevice 0800 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_1100
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_1100
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let RemoteDev: remoteDevice.RemoteDevice = remoteDevice.createRemoteDevice(ADDRESS_Invailable3);
        console.info('nearLink createRemoteDevice result:' + RemoteDev);
        expect().assertFail();
      } catch (error) {
        console.info("nearLink remoteDevice 0800 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_1200
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_1200
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_1200';
      try {
        let RemoteDev: remoteDevice.RemoteDevice = remoteDevice.createRemoteDevice(null);
        console.info('nearLink createRemoteDevice result:' + RemoteDev);
        expect().assertFail();
      } catch (error) {
        console.info("nearLink remoteDevice 0900 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          console.info('api is support');
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_RemoteDevice_1300
     * @tc.number SUB_Communication_XTS_NearLink_RemoteDevice_1300
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_RemoteDevice_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let caseName = 'SUB_Communication_XTS_NearLink_RemoteDevice_1300';
      try {
        let RemoteDev: remoteDevice.RemoteDevice = remoteDevice.createRemoteDevice(undefined);
        console.info('nearLink createRemoteDevice result:' + RemoteDev);
        expect().assertFail();
      } catch (error) {
        console.info("nearLink remoteDevice 1000 errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          console.info('api is support');
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    })



  })
}