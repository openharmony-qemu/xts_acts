'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import manager from '@ohos.nearlink.manager';
import ssap from '@ohos.nearlink.ssap';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
// 公共变量定义
let UUID = "FFFFFFFF-1234-5678-ABCD-000000001234";
let UUID_test = "a1b2c3d4-e5f6-7890-abcd-ef1234567890";
let UUID_Invalid = "";
let UUID_Upp_Invailable = "37BEA880-FC70-11EA-B720-000000000001";
let UUID_LOW_Invailable = "37bea880-fc70-11ea-b720-000000000001";
let bufferDesc = new ArrayBuffer(1);
let bufferCCC = new ArrayBuffer(2);
export default function sSapTest(): void {
  describe('sSapTest', () => {
    let ssapClient :ssap.Client | undefined = undefined;
    let ssapServer :ssap.Server | undefined = undefined;
    let ADDRESS: string = "00:11:22:33:44:66";
    let TEST_ADDRESS: string = "11:22:33:44:55:66";
    let ADDRESS_invailable_1 = "00:11:22:33:44:551"
    let ADDRESS_invailable_2 = "00:11:22:33:4455"
    let ADDRESS_invailable_3 = ""
    let TIME_SLEEP = 2000;
    let return_boolean: boolean;
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      await Utils.msSleep(TIME_SLEEP);
      await Utils.clickRequestPermission();
      return_boolean = manager.isNearLinkSupported();
      try {
        await Utils.openNearLink();
        ssapClient=ssap.createClient(ADDRESS);
        hilog.info(0x0000, 'testTag', '[Nearlink Test]ssap client info: %{public}s', ssapClient);
        expect(ssapClient !== null).assertTrue();
        ssapServer=ssap.createServer();
        hilog.info(0x0000, 'testTag', '[Nearlink Test]ssap client info: %{public}s', ssapServer);
        expect(ssapServer !== null).assertTrue();
      } catch (error) {
        hilog.error(0x0000, 'testTag', 'nearLink errCode:%{public}s,errMessage:%{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.error(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll end');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach start');
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach end');
      done();
    })
    afterEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach start');
      hilog.info(0x0000, 'testTag', '%{public}s', 'sleep 500ms');
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach end');
      done();
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll start');
      ssapClient!.close();
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] ssapClient close end.');
      ssapServer!.close();
      hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] ssapServer close end.');
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll end');
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0100
     * @tc.desc ssap.Client.onPropertyChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.Property) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapClient!.onPropertyChange(onReceiveEvent);
        ssapClient!.offPropertyChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onPropertyChange/offPropertyChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0200
     * @tc.desc ssap.Client onPropertyChange with callback, offPropertyChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.Property) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapClient!.onPropertyChange(onReceiveEvent);
        ssapClient!.offPropertyChange();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onPropertyChange/offPropertyChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0600
     * @tc.desc ssap.Client.offPropertyChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0600';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapClient!.offPropertyChange(undefined);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] offPropertyChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0700
     * @tc.desc ssap.Client.onConnectionStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0700';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.ConnectionChangeState) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapClient!.onConnectionStateChange(onReceiveEvent);
        ssapClient!.offConnectionStateChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onConnectionStateChange/offConnectionStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0800
     * @tc.desc ssap.Client onConnectionStateChange with callback, offConnectionStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_0800';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.ConnectionChangeState) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapClient!.onConnectionStateChange(onReceiveEvent);
        ssapClient!.offConnectionStateChange();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onConnectionStateChange/offConnectionStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1200
     * @tc.desc ssap.Client.offConnectionStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapClient!.offConnectionStateChange(undefined);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] offConnectionStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1300
     * @tc.desc ssap.Client.onMtuChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1300';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: int) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapClient!.onMtuChange(onReceiveEvent);
        ssapClient!.offMtuChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onMtuChange/offMtuChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1400
     * @tc.desc ssap.Client onMtuChange with callback, offMtuChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1400';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: int) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapClient!.onMtuChange(onReceiveEvent);
        ssapClient!.offMtuChange();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onMtuChange/offMtuChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1800
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1800
     * @tc.desc ssap.Client.offMtuChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_static_1800';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapClient!.offMtuChange(undefined);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] offMtuChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0100
     * @tc.desc ssap.Server.onConnectionStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.ConnectionChangeState) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapServer!.onConnectionStateChange(onReceiveEvent);
        ssapServer!.offConnectionStateChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onConnectionStateChange/offConnectionStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0200
     * @tc.desc ssap.Server onConnectionStateChange with callback, offConnectionStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.ConnectionChangeState) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapServer!.onConnectionStateChange(onReceiveEvent);
        ssapServer!.offConnectionStateChange();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onConnectionStateChange/offConnectionStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0600
     * @tc.desc ssap.Server.offConnectionStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0600';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapServer!.offConnectionStateChange(undefined);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] offConnectionStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0700
     * @tc.desc ssap.Server.onPropertyRead normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0700';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.PropertyReadRequest) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapServer!.onPropertyRead(onReceiveEvent);
        ssapServer!.offPropertyRead(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onPropertyRead/offPropertyRead error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0800
     * @tc.desc ssap.Server onPropertyRead with callback, offPropertyRead without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_0800';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.PropertyReadRequest) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapServer!.onPropertyRead(onReceiveEvent);
        ssapServer!.offPropertyRead();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onPropertyRead/offPropertyRead error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1200
     * @tc.desc ssap.Server.offPropertyRead with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapServer!.offPropertyRead(undefined);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] offPropertyRead error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1300
     * @tc.desc ssap.Server.onPropertyWrite normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1300';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.PropertyWriteRequest) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapServer!.onPropertyWrite(onReceiveEvent);
        ssapServer!.offPropertyWrite(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onPropertyWrite/offPropertyWrite error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1400
     * @tc.desc ssap.Server onPropertyWrite with callback, offPropertyWrite without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1400';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: ssap.PropertyWriteRequest) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapServer!.onPropertyWrite(onReceiveEvent);
        ssapServer!.offPropertyWrite();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onPropertyWrite/offPropertyWrite error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1800
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1800
     * @tc.desc ssap.Server.offPropertyWrite with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1800';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapServer!.offPropertyWrite(undefined);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] offPropertyWrite error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1900
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1900
     * @tc.desc ssap.Server.onMtuChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_1900';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: int) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapServer!.onMtuChange(onReceiveEvent);
        ssapServer!.offMtuChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onMtuChange/offMtuChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_2000
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2000
     * @tc.desc ssap.Server onMtuChange with callback, offMtuChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_2000';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: int) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        ssapServer!.onMtuChange(onReceiveEvent);
        ssapServer!.offMtuChange();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onMtuChange/offMtuChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_2400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2400
     * @tc.desc ssap.Server.offMtuChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_static_2400';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        ssapServer!.offMtuChange(undefined);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] offMtuChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0100
     * @tc.desc ssap client connect  test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      try {
        await ssapClient!.connect()
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test] ssap client connect ');
        await ssapClient!.disconnect();
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test] ssap client disconnect ');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test]client connect fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_0200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0200
     * @tc.desc ssap client disconnect without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      try {
        let ssapClient_test :ssap.Client = ssap.createClient(TEST_ADDRESS);
        hilog.info(0x0000, 'testTag', '[nearLink_Test]ssap client info: %{public}s', ssapClient_test);
        expect(ssapClient_test !== null).assertTrue();
        await ssapClient_test.disconnect();
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test] ssap client disconnect ');
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test]client disconnect fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_0300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0300
     * @tc.desc ssap createClient and close test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      try {
        let client: ssap.Client = ssap.createClient(TEST_ADDRESS);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] ssap create client: %{public}s', client);
        expect(client !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] ssapClient close start.');
        client.close();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] ssapClient close end.');
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink Test]createClient fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_0400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0400
     * @tc.desc ssap createServer and close test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      try {
        let server = ssap.createServer();
        hilog.info(0x0000, 'testTag', '[Nearlink Test] ssap create server: %{public}s', server);
        expect(true).assertEqual(server !== null);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] ssapServer close start.');
        server.close();
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] ssapServer close end.');
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink Test]createServer fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_0500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0500
     * @tc.desc ssap client getServices test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      try {
        let ssapservices: ssap.Service[] = await ssapClient!.getServices();
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getServices successfully: %{public}s', JSON.stringify(ssapservices));
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getServices fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_0800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0800
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合1 ==========
      let propertyDescriptor1: Array<ssap.PropertyDescriptor> = [];
      let descriptor1: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: true,
      };
      propertyDescriptor1.push(descriptor1);
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient!.readProperty(property1);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_0900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0900
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合2 ==========
      let propertyDescriptor2: Array<ssap.PropertyDescriptor> = [];
      let descriptor2: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
        isWriteable: false,
      };
      propertyDescriptor2.push(descriptor2);
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient!.readProperty(property2);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_1000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1000
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3.push(descriptor3);
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      try {
        await ssapClient!.readProperty(property3);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_1100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1100
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4.push(descriptor4);
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient!.readProperty(property4);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_1200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1200
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5.push(descriptor5);
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient!.readProperty(property5);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_1300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1300
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合6 ==========
      let propertyDescriptor6: Array<ssap.PropertyDescriptor> = [];
      let descriptor6: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: false,
      };
      propertyDescriptor6.push(descriptor6);
      let property6: ssap.Property = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferCCC,
        descriptors: propertyDescriptor6,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient!.readProperty(property6);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_1400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1400
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合7 ==========
      let property7: ssap.Property = {
        serviceUuid: UUID_LOW_Invailable,
        propertyUuid: UUID_Upp_Invailable,
        value: bufferCCC,
      };
      try {
        await ssapClient!.readProperty(property7);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_1700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1700
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合1 ==========
      let propertyDescriptor1: Array<ssap.PropertyDescriptor> = [];
      let descriptor1: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: true,
      };
      propertyDescriptor1.push(descriptor1);
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient!.writeProperty(property1,ssap.PropertyWriteType.WRITE);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]writeProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_1800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1800
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合2 ==========
      let propertyDescriptor2: Array<ssap.PropertyDescriptor> = [];
      let descriptor2: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
        isWriteable: false,
      };
      propertyDescriptor2.push(descriptor2);
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient!.writeProperty(property2, ssap.PropertyWriteType.WRITE_NO_RESPONSE);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] writeProperty failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_1900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1900
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3.push(descriptor3);
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      try {
        await ssapClient!.writeProperty(property3,ssap.PropertyWriteType.WRITE);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] writeProperty failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_2000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2000
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4.push(descriptor4);
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient!.writeProperty(property4, ssap.PropertyWriteType.WRITE_NO_RESPONSE);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] writeProperty failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_2100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2100
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5.push(descriptor5);
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient!.writeProperty(property5,ssap.PropertyWriteType.WRITE);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] writeProperty failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_2800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2800
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3.push(descriptor3);
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      try {
        await ssapClient!.setPropertyNotification(property3,true);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] setPropertyNotification failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_2900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2900
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4.push(descriptor4);
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient!.setPropertyNotification(property4, false);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] setPropertyNotification failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_3000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3000
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5.push(descriptor5);
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient!.setPropertyNotification(property5,true);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] setPropertyNotification failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_3100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3100
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合6 ==========
      let propertyDescriptor6: Array<ssap.PropertyDescriptor> = [];
      let descriptor6: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: false,
      };
      propertyDescriptor6.push(descriptor6);
      let property6: ssap.Property = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferCCC,
        descriptors: propertyDescriptor6,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient!.setPropertyNotification(property6, true);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] setPropertyNotification failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_3300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3300
     * @tc.desc requestMtuSize 入参合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await ssapClient!.requestMtuSize(1024);
        hilog.info(0x0000, 'testTag', '%{public}s', "[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[Nearlink Test] StateChange error, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_3400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3400
     * @tc.desc requestMtuSize 入参合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await ssapClient!.requestMtuSize(22);
        hilog.info(0x0000, 'testTag', '%{public}s', "[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[Nearlink Test] StateChange error, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_3500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3500
     * @tc.desc requestMtuSize 入参合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await ssapClient!.requestMtuSize(500);
        hilog.info(0x0000, 'testTag', '%{public}s', "[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[Nearlink Test] StateChange error, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_3600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3600
     * @tc.desc requestMtuSize 入参不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await ssapClient!.requestMtuSize(21);
        hilog.info(0x0000, 'testTag', '%{public}s', "[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[Nearlink Test] StateChange error, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_3700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3700
     * @tc.desc requestMtuSize 入参不合�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await ssapClient!.requestMtuSize(1025);
        hilog.info(0x0000, 'testTag', '%{public}s', "[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[Nearlink Test] StateChange error, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_4200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4200
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合1 ==========
      let propertyDescriptor1: Array<ssap.PropertyDescriptor> = [];
      let properties:Array<ssap.Property>=[];
      let descriptor1: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: true,
      };
      propertyDescriptor1.push(descriptor1);
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      properties.push(property1);
      let service :ssap.Service = {
        serviceUuid:UUID,
        properties:properties,
      }
      try {
        ssapServer!.addService(service);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] addService success');
        await Utils.msSleep(100);
        ssapServer!.removeService(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] removeService success');
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] add services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_4300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4300
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合2 ==========
      let propertyDescriptor2: Array<ssap.PropertyDescriptor> = [];
      let properties:Array<ssap.Property>=[];
      let descriptor2: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
        isWriteable: false,
      };
      propertyDescriptor2.push(descriptor2);
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      properties.push(property2);
      let service :ssap.Service= {
        serviceUuid:UUID_test,
        properties:properties,
      }
      try {
        ssapServer!.addService(service);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] addService success');
        await Utils.msSleep(100);
        ssapServer!.removeService(UUID_test);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] removeService success');
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] add services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_4400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4400
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let properties:Array<ssap.Property>=[];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3.push(descriptor3);
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      properties.push(property3);
      let service :ssap.Service= {
        serviceUuid:UUID,
        properties:properties,
      }
      try {
        ssapServer!.addService(service);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] addService success');
        await Utils.msSleep(100);
        ssapServer!.removeService(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] removeService success');
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] add services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_4500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4500
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let properties:Array<ssap.Property>=[];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4.push(descriptor4);
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      properties.push(property4);
      let service :ssap.Service= {
        serviceUuid:UUID_test,
        properties:properties,
      }
      try {
        ssapServer!.addService(service);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] addService success');
        await Utils.msSleep(100);
        ssapServer!.removeService(UUID_test);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] removeService success');
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] add services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_4600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4600
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let properties:Array<ssap.Property>=[];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5.push(descriptor5);
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      properties.push(property5);
      let service :ssap.Service= {
        serviceUuid:UUID_Invalid,
        properties:properties,
      }
      try {
        ssapServer!.addService(service);
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] add services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_5100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5100
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let serverResponse:ssap.ServerResponse= {
        address:TEST_ADDRESS,
        requestId:0,
        value:bufferCCC,
      };
      try {
        ssapServer!.sendResponse(serverResponse);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] sendResponse success');
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink_test] sendResponse fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_5200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5200
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let serverResponse:ssap.ServerResponse= {
        address:ADDRESS_invailable_1,
        requestId:0,
        value:bufferCCC,
      }
      try {
        ssapServer!.sendResponse(serverResponse);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink_test] sendResponse fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_5300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5300
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let serverResponse:ssap.ServerResponse= {
        address:ADDRESS_invailable_2,
        requestId:0,
        value:bufferCCC,
      }
      try {
        ssapServer!.sendResponse(serverResponse);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink_test] sendResponse fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_5400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5400
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let serverResponse:ssap.ServerResponse= {
        address:ADDRESS_invailable_3,
        requestId:0,
        value:bufferCCC,
      }
      try {
        ssapServer!.sendResponse(serverResponse);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink_test] sendResponse fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    //
    //
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_6200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6200
     * @tc.desc ssap server notifyPropertyChanged with NearLink standard UUID not allowed test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合1 ==========
      let propertyDescriptor1: Array<ssap.PropertyDescriptor> = [];
      let descriptor1: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: true,
      };
      propertyDescriptor1.push(descriptor1);
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapServer!.notifyPropertyChanged(TEST_ADDRESS, property1);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test] notifyPropertyChanged info ');
        expect().assertFail();
      } catch (err) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] notifyPropertyChanged failed errCode: %{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_6300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6300
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合2 ==========
      let propertyDescriptor2: Array<ssap.PropertyDescriptor> = [];
      let descriptor2: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
        isWriteable: false,
      };
      propertyDescriptor2.push(descriptor2);
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapServer!.notifyPropertyChanged(TEST_ADDRESS, property2);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] notifyPropertyChanged failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_6400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6400
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3.push(descriptor3);
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      try {
        await ssapServer!.notifyPropertyChanged(TEST_ADDRESS, property3);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] notifyPropertyChanged failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_6500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6500
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4.push(descriptor4);
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapServer!.notifyPropertyChanged(TEST_ADDRESS, property4);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] notifyPropertyChanged failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_6600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6600
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5.push(descriptor5);
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapServer!.notifyPropertyChanged(TEST_ADDRESS, property5);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] notifyPropertyChanged failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_6700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6700
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合6 ==========
      let propertyDescriptor6: Array<ssap.PropertyDescriptor> = [];
      let descriptor6: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: false,
      };
      propertyDescriptor6.push(descriptor6);
      let property6: ssap.Property = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferCCC,
        descriptors: propertyDescriptor6,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapServer!.notifyPropertyChanged(TEST_ADDRESS, property6);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] notifyPropertyChanged failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_6800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6800
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合7 ==========
      let property7: ssap.Property = {
        serviceUuid: UUID_LOW_Invailable,
        propertyUuid: UUID_Upp_Invailable,
        value: bufferCCC,
      };
      try {
        await ssapServer!.notifyPropertyChanged(TEST_ADDRESS, property7);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] notifyPropertyChanged failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_6900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6900
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        ssapServer!.removeService(UUID_Upp_Invailable);
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] remove services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_7000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7000
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        ssapServer!.removeService(UUID_LOW_Invailable);
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] remove services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_7100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7100
     * @tc.desc ssap server removeService with empty string test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        ssapServer!.removeService("");
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] removeService fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_7400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7400
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        ssapServer!.removeService(UUID);
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] remove services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_7500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7500
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        ssapServer!.removeService(UUID_test);
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '[Nearlink_test] remove services fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_7600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7600
     * @tc.desc ssap createClient with empty string address test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let clients: ssap.Client = ssap.createClient(ADDRESS_invailable_3);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] ssap create client: %{public}s', clients);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test]createClient fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_7900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7900
     * @tc.desc ssap createClient with undefined address test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let clients: ssap.Client = ssap.createClient(ADDRESS_invailable_1);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] ssap create client: %{public}s', clients);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test]createClient fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_8000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8000
     * @tc.desc ssap createClient with undefined address test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let clients: ssap.Client = ssap.createClient(ADDRESS_invailable_2);
        hilog.info(0x0000, 'testTag', '[Nearlink Test] ssap create client: %{public}s', clients);
        expect().assertFail();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test]createClient fail%{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_8100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8100
     * @tc.desc ssap client notifyPropertyChanged 空数组覆�?without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合8 空数组覆�?==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapServer!.notifyPropertyChanged(TEST_ADDRESS, property8);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] notifyPropertyChanged failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_8200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8200
     * @tc.desc ssap client readProperty 空数�?without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合8 空数组覆�?==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient!.readProperty(property8);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] readDescrValue failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_8300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8300
     * @tc.desc ssap client setPropertyNotification 空数�?without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合8 空数组覆�?==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient!.setPropertyNotification(property8,true);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]setPropertyNotification success');
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'setPropertyNotification failed errCode: %{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_8400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8400
     * @tc.desc ssap client writeProperty 空数�?without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== 组合8 空数组覆�?==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient!.writeProperty(property8,ssap.PropertyWriteType.WRITE);
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink_Test]writeProperty success');
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[NearLink_Test] writeProperty failed, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_8500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8500
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合8 descriptors 空数�?==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let properties:Array<ssap.Property>=[];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      properties.push(property8);
      let service :ssap.Service= {
        serviceUuid:UUID_test,
        properties:properties,
      };
      try {
        ssapServer!.addService(service);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] addService success');
        await Utils.msSleep(100);
        ssapServer!.removeService(UUID_test);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] removeService success');
      } catch (err){
        hilog.error(0x0000, 'testTag', '[NearLink_Test] addService failed, code is %{public}s,message is %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_static_8600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8600
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_static_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合9 properties 空数�?==========
      let properties:Array<ssap.Property>=[];
      let service :ssap.Service = {
        serviceUuid:UUID,
        properties:properties,
      };
      try {
        ssapServer!.addService(service);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] addService success');
        await Utils.msSleep(100);
        ssapServer!.removeService(UUID);
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] removeService success');
      } catch (err){
        hilog.error(0x0000, 'testTag', '[NearLink_Test] addService failed, code is %{public}s,message is %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkSys_SSap_static_4700
     * @tc.number SUB_Communication_XTS_NearLinkSys_SSap_4700
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkSys_SSap_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合6 ==========
      let propertyDescriptor6: Array<ssap.PropertyDescriptor> = [];
      let properties:Array<ssap.Property>=[];
      let descriptor6: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: false,
      };
      propertyDescriptor6.push(descriptor6);
      let property6: ssap.Property = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferCCC,
        descriptors: propertyDescriptor6,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      properties.push(property6);
      let service :ssap.Service= {
        serviceUuid: UUID_LOW_Invailable,
        properties: properties,
      }
      try {
        ssapServer!.addService(service);
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] add services fail '+JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkSys_SSap_static_4800
     * @tc.number SUB_Communication_XTS_NearLinkSys_SSap_4800
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkSys_SSap_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ========== ssap.Service 入参组合7 ==========
      let properties:Array<ssap.Property>=[];
      let property7: ssap.Property = {
        serviceUuid: UUID_LOW_Invailable,
        propertyUuid: UUID_Upp_Invailable,
        value: bufferCCC,
      };
      properties.push(property7)
      let service :ssap.Service= {
        serviceUuid: UUID_LOW_Invailable,
        properties: properties
      }
      try {
        ssapServer!.addService(service);
        expect().assertFail();
      } catch (err){
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink_test] add services fail '+JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    });
  })
}