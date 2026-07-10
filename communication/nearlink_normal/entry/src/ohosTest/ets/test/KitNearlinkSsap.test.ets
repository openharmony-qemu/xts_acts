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
import ssap from '@ohos.nearlink.ssap';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import { openNearLink } from './OpenNearLink';
// 公共变量定义
let UUID = "FFFFFFFF-1234-5678-ABCD-000000001234";
let UUID_test = "a1b2c3d4-e5f6-7890-abcd-ef1234567890";
let UUID_Invalid = "";
let UUID_Upp_Invailable = "37BEA880-FC70-11EA-B720-000000000001";
let UUID_LOW_Invailable = "37bea880-fc70-11ea-b720-000000000001";
let bufferDesc = new ArrayBuffer(1);
let bufferCCC = new ArrayBuffer(2);
export default function sSapTest() {
  describe('sSapTest', () => {
    let ssapClient :ssap.Client;
    let ssapServer :ssap.Server;
    let ADDRESS: string = '00:11:22:33:44:66';
    let TEST_ADDRESS: string = "11:22:33:44:55:66";
    let ADDRESS_invailable_1 = "00:11:22:33:44:551"
    let ADDRESS_invailable_2 = "00:11:22:33:4455"
    let ADDRESS_invailable_3 = ""
    let TIME_SLEEP = 2000;
    let return_boolean: boolean;
    beforeAll(async (done:Function) => {
      console.info('beforeAll start');
      await sleep(TIME_SLEEP);
      await clickRequestPermission();
      return_boolean = manager.isNearLinkSupported();
      try {
        ssapClient=ssap.createClient(ADDRESS);
        console.info('[Nearlink Test]ssap client info: '+ ssapClient);
        expect(ssapClient != null).assertTrue();
        ssapServer=ssap.createServer();
        console.info('[Nearlink Test]ssap client info: '+ssapServer);
        expect(ssapServer != null).assertTrue();
      } catch (error) {
        console.error("nearLink errCode:" + error.code + ",errMessage:" + error.message);
        if (error.code === 801) {
          console.error('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info('beforeAll end');
      done();
    });
    beforeEach(async (done:Function) => {
      console.info('beforeEach start');
      await openNearLink();
      console.info('beforeEach end');
      done();
    })
    afterEach(async(done: Function) => {
      console.info('afterEach start');
      console.info('sleep 500ms');
      // await sleep(TIME_SLEEP_AFTER);
      console.info('afterEach end');
      done();
    })
    afterAll(async (done:Function) => {
      console.info('afterAll start');
      ssapClient.close();
      console.info('[Nearlink Test] ssapClient close end.');
      ssapServer.close();
      console.info('[Nearlink Test] ssapServer close end.');
      console.info('afterAll end');
      done();
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLink_Ssap_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLink_Ssap_Enum_0100
     * @tc.desc PropertyDescriptorType enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Ssap_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Ssap_Enum_0100';
        console.info(`${caseName} test start`);
        try {
          let PROPERTY: ssap.PropertyDescriptorType = ssap.PropertyDescriptorType.PROPERTY;
          console.info(`${caseName} PROPERTY result:` + PROPERTY);
          expect(PROPERTY).assertEqual(1);
          let CLIENT_PROPERTY_CONFIG: ssap.PropertyDescriptorType = ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG;
          console.info(`${caseName} CLIENT_PROPERTY_CONFIG result:` + CLIENT_PROPERTY_CONFIG);
          expect(CLIENT_PROPERTY_CONFIG).assertEqual(2);
          let SERVER_PROPERTY_CONFIG: ssap.PropertyDescriptorType = ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG;
          console.info(`${caseName} SERVER_PROPERTY_CONFIG result:` + SERVER_PROPERTY_CONFIG);
          expect(SERVER_PROPERTY_CONFIG).assertEqual(3);
          let PROPERTY_FORMAT: ssap.PropertyDescriptorType = ssap.PropertyDescriptorType.PROPERTY_FORMAT;
          console.info(`${caseName} PROPERTY_FORMAT result:` + PROPERTY_FORMAT);
          expect(PROPERTY_FORMAT).assertEqual(4);
          let TYPE_VENDOR: ssap.PropertyDescriptorType = ssap.PropertyDescriptorType.TYPE_VENDOR;
          console.info(`${caseName} TYPE_VENDOR result:` + TYPE_VENDOR);
          expect(TYPE_VENDOR).assertEqual(255);
        } catch (error) {
          console.info(`${caseName} PropertyDescriptorType error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_Ssap_Enum_0200
     * @tc.name SUB_Communication_XTS_NearLink_Ssap_Enum_0200
     * @tc.desc Operation enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Ssap_Enum_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Ssap_Enum_0200';
        console.info(`${caseName} test start`);
        try {
          let READABLE: ssap.Operation = ssap.Operation.READABLE;
          console.info(`${caseName} READABLE result:` + READABLE);
          expect(READABLE).assertEqual(0x01);
          let WRITE_NO_RESPONSE: ssap.Operation = ssap.Operation.WRITE_NO_RESPONSE;
          console.info(`${caseName} WRITE_NO_RESPONSE result:` + WRITE_NO_RESPONSE);
          expect(WRITE_NO_RESPONSE).assertEqual(0x02);
          let WRITE_WITH_RESPONSE: ssap.Operation = ssap.Operation.WRITE_WITH_RESPONSE;
          console.info(`${caseName} WRITE_WITH_RESPONSE result:` + WRITE_WITH_RESPONSE);
          expect(WRITE_WITH_RESPONSE).assertEqual(0x04);
          let NOTIFY: ssap.Operation = ssap.Operation.NOTIFY;
          console.info(`${caseName} NOTIFY result:` + NOTIFY);
          expect(NOTIFY).assertEqual(0x08);
        } catch (error) {
          console.info(`${caseName} Operation error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number SUB_Communication_XTS_NearLink_Ssap_Enum_0300
     * @tc.name SUB_Communication_XTS_NearLink_Ssap_Enum_0300
     * @tc.desc PropertyWriteType enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Ssap_Enum_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Ssap_Enum_0300';
        console.info(`${caseName} test start`);
        try {
          let WRITE: ssap.PropertyWriteType = ssap.PropertyWriteType.WRITE;
          console.info(`${caseName} WRITE result:` + WRITE);
          expect(WRITE).assertEqual(1);
          let WRITE_NO_RESPONSE: ssap.PropertyWriteType = ssap.PropertyWriteType.WRITE_NO_RESPONSE;
          console.info(`${caseName} WRITE_NO_RESPONSE result:` + WRITE_NO_RESPONSE);
          expect(WRITE_NO_RESPONSE).assertEqual(2);
        } catch (error) {
          console.info(`${caseName} PropertyWriteType error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0100
     * @tc.desc ssap.Client.onPropertyChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0100';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.Property) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapClient.onPropertyChange(onReceiveEvent);
        ssapClient.offPropertyChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyChange/offPropertyChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0200
     * @tc.desc ssap.Client onPropertyChange with callback, offPropertyChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0200';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.Property) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapClient.onPropertyChange(onReceiveEvent);
        ssapClient.offPropertyChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyChange/offPropertyChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0300
     * @tc.desc ssap.Client.onPropertyChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0300';
      console.info(`${caseName} test start`);
      try {
        ssapClient.onPropertyChange(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0400
     * @tc.desc ssap.Client.offPropertyChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0400';
      console.info(`${caseName} test start`);
      try {
        ssapClient.offPropertyChange(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offPropertyChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0500
     * @tc.desc ssap.Client.onPropertyChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0500';
      console.info(`${caseName} test start`);
      try {
        ssapClient.onPropertyChange(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0600
     * @tc.desc ssap.Client.offPropertyChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0600';
      console.info(`${caseName} test start`);
      try {
        ssapClient.offPropertyChange(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offPropertyChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0700
     * @tc.desc ssap.Client.onConnectionStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0700';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.ConnectionChangeState) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapClient.onConnectionStateChange(onReceiveEvent);
        ssapClient.offConnectionStateChange(onReceiveEvent);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0800
     * @tc.desc ssap.Client onConnectionStateChange with callback, offConnectionStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0800';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.ConnectionChangeState) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapClient.onConnectionStateChange(onReceiveEvent);
        ssapClient.offConnectionStateChange();
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0900
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0900
     * @tc.desc ssap.Client.onConnectionStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_0900';
      console.info(`${caseName} test start`);
      try {
        ssapClient.onConnectionStateChange(null);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1000
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1000
     * @tc.desc ssap.Client.offConnectionStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1000';
      console.info(`${caseName} test start`);
      try {
        ssapClient.offConnectionStateChange(null);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1100
     * @tc.desc ssap.Client.onConnectionStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1100';
      console.info(`${caseName} test start`);
      try {
        ssapClient.onConnectionStateChange(undefined);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1200
     * @tc.desc ssap.Client.offConnectionStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1200';
      console.info(`${caseName} test start`);
      try {
        ssapClient.offConnectionStateChange(undefined);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1300
     * @tc.desc ssap.Client.onMtuChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1300';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: number) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapClient.onMtuChange(onReceiveEvent);
        ssapClient.offMtuChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onMtuChange/offMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1400
     * @tc.desc ssap.Client onMtuChange with callback, offMtuChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1400';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: number) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapClient.onMtuChange(onReceiveEvent);
        ssapClient.offMtuChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onMtuChange/offMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1500
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1500
     * @tc.desc ssap.Client.onMtuChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1500';
      console.info(`${caseName} test start`);
      try {
        ssapClient.onMtuChange(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1600
     * @tc.desc ssap.Client.offMtuChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1600';
      console.info(`${caseName} test start`);
      try {
        ssapClient.offMtuChange(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1700
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1700
     * @tc.desc ssap.Client.onMtuChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1700';
      console.info(`${caseName} test start`);
      try {
        ssapClient.onMtuChange(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1800
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1800
     * @tc.desc ssap.Client.offMtuChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Client_On_1800';
      console.info(`${caseName} test start`);
      try {
        ssapClient.offMtuChange(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0100
     * @tc.desc ssap.Server.onConnectionStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0100';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.ConnectionChangeState) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapServer.onConnectionStateChange(onReceiveEvent);
        ssapServer.offConnectionStateChange(onReceiveEvent);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0200
     * @tc.desc ssap.Server onConnectionStateChange with callback, offConnectionStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0200';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.ConnectionChangeState) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapServer.onConnectionStateChange(onReceiveEvent);
        ssapServer.offConnectionStateChange();
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0300
     * @tc.desc ssap.Server.onConnectionStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0300';
      console.info(`${caseName} test start`);
      try {
        ssapServer.onConnectionStateChange(null);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0400
     * @tc.desc ssap.Server.offConnectionStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0400';
      console.info(`${caseName} test start`);
      try {
        ssapServer.offConnectionStateChange(null);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0500
     * @tc.desc ssap.Server.onConnectionStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0500';
      console.info(`${caseName} test start`);
      try {
        ssapServer.onConnectionStateChange(undefined);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0600
     * @tc.desc ssap.Server.offConnectionStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0600';
      console.info(`${caseName} test start`);
      try {
        ssapServer.offConnectionStateChange(undefined);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0700
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0700
     * @tc.desc ssap.Server.onPropertyRead normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0700';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.PropertyReadRequest) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapServer.onPropertyRead(onReceiveEvent);
        ssapServer.offPropertyRead(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyRead/offPropertyRead error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0800
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0800
     * @tc.desc ssap.Server onPropertyRead with callback, offPropertyRead without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0800';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.PropertyReadRequest) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapServer.onPropertyRead(onReceiveEvent);
        ssapServer.offPropertyRead();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyRead/offPropertyRead error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0900
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0900
     * @tc.desc ssap.Server.onPropertyRead with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_0900';
      console.info(`${caseName} test start`);
      try {
        ssapServer.onPropertyRead(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyRead error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1000
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1000
     * @tc.desc ssap.Server.offPropertyRead with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1000';
      console.info(`${caseName} test start`);
      try {
        ssapServer.offPropertyRead(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offPropertyRead error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1100
     * @tc.desc ssap.Server.onPropertyRead with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1100';
      console.info(`${caseName} test start`);
      try {
        ssapServer.onPropertyRead(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyRead error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1200
     * @tc.desc ssap.Server.offPropertyRead with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1200';
      console.info(`${caseName} test start`);
      try {
        ssapServer.offPropertyRead(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offPropertyRead error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1300
     * @tc.desc ssap.Server.onPropertyWrite normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1300';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.PropertyWriteRequest) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapServer.onPropertyWrite(onReceiveEvent);
        ssapServer.offPropertyWrite(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyWrite/offPropertyWrite error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1400
     * @tc.desc ssap.Server onPropertyWrite with callback, offPropertyWrite without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1400';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: ssap.PropertyWriteRequest) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapServer.onPropertyWrite(onReceiveEvent);
        ssapServer.offPropertyWrite();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyWrite/offPropertyWrite error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1500
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1500
     * @tc.desc ssap.Server.onPropertyWrite with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1500';
      console.info(`${caseName} test start`);
      try {
        ssapServer.onPropertyWrite(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyWrite error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1600
     * @tc.desc ssap.Server.offPropertyWrite with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1600';
      console.info(`${caseName} test start`);
      try {
        ssapServer.offPropertyWrite(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offPropertyWrite error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1700
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1700
     * @tc.desc ssap.Server.onPropertyWrite with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1700';
      console.info(`${caseName} test start`);
      try {
        ssapServer.onPropertyWrite(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onPropertyWrite error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1800
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1800
     * @tc.desc ssap.Server.offPropertyWrite with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1800';
      console.info(`${caseName} test start`);
      try {
        ssapServer.offPropertyWrite(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offPropertyWrite error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1900
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1900
     * @tc.desc ssap.Server.onMtuChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_1900';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: number) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapServer.onMtuChange(onReceiveEvent);
        ssapServer.offMtuChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onMtuChange/offMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2000
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2000
     * @tc.desc ssap.Server onMtuChange with callback, offMtuChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2000';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: number) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        ssapServer.onMtuChange(onReceiveEvent);
        ssapServer.offMtuChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onMtuChange/offMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2100
     * @tc.desc ssap.Server.onMtuChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2100';
      console.info(`${caseName} test start`);
      try {
        ssapServer.onMtuChange(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2200
     * @tc.desc ssap.Server.offMtuChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2200';
      console.info(`${caseName} test start`);
      try {
        ssapServer.offMtuChange(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2300
     * @tc.desc ssap.Server.onMtuChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2300';
      console.info(`${caseName} test start`);
      try {
        ssapServer.onMtuChange(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2400
     * @tc.desc ssap.Server.offMtuChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Ssap_Server_On_2400';
      console.info(`${caseName} test start`);
      try {
        ssapServer.offMtuChange(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offMtuChange error, code is ${error.code},message is ${error.message}`);
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
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0100
     * @tc.desc ssap client connect  test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      try {
        await ssapClient.connect()
        console.info('[nearLink_test] ssap client connect ');
        await ssapClient.disconnect();
        console.info('[nearLink_test] ssap client disconnect ');
      }catch (err) {
        console.info('[Nearlink Test]client connect fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0200
     * @tc.desc ssap client disconnect without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      try {
        let ssapClient_test :ssap.Client;
        ssapClient_test = ssap.createClient(TEST_ADDRESS);
        console.info('[nearLink_Test]ssap client info: '+ ssapClient_test);
        expect(ssapClient_test != null).assertTrue();
        await ssapClient_test.disconnect();
        console.info('[nearLink_test] ssap client disconnect ');
        expect().assertFail();
      }catch (err) {
        console.info('[Nearlink Test]client disconnect fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0300
     * @tc.desc ssap createClient and close test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_SSap_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      try{
        let client: ssap.Client = ssap.createClient(TEST_ADDRESS);
        console.info('[Nearlink Test] ssap create client: '+ client);
        expect(client != null).assertTrue();
        console.info('[Nearlink Test] ssapClient close start.');
        client.close();
        console.info('[Nearlink Test] ssapClient close end.');
      }catch (err){
        console.info('[Nearlink Test]createClient fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0400
     * @tc.desc ssap createServer and close test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_SSap_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  () => {
      try{
        let server = ssap.createServer();
        console.info('[Nearlink Test] ssap create server: '+ server);
        expect(true).assertEqual(server != null);
        console.info('[Nearlink Test] ssapServer close start.');
        server.close();
        console.info('[Nearlink Test] ssapServer close end.');
      }catch (err){
        console.info('[Nearlink Test]createServer fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0500
     * @tc.desc ssap client getServices test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done:Function) => {
      try {
        let ssapservices: ssap.Service[] = await ssapClient.getServices();
        console.info('[Nearlink Test] getServices successfully: '+JSON.stringify(ssapservices));
        expect().assertFail();
      }catch (err){
        console.info('[Nearlink Test] getServices fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0600
     * @tc.desc ssap client readProperty with undefined and null parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapClient.readProperty(undefined);
        console.info('[NearLink_Test]readProperty undefined info :');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0700
     * @tc.desc ssap client readProperty with undefined and null parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapClient.readProperty(null);
        console.info('[NearLink_Test]readProperty undefined info :');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0800
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合1 ==========
      let propertyDescriptor1: Array<ssap.PropertyDescriptor> = [];
      let descriptor1: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: true,
      };
      propertyDescriptor1[0] = descriptor1;
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient.readProperty(property1);
        console.info('[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_0900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_0900
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合2 ==========
      let propertyDescriptor2: Array<ssap.PropertyDescriptor> = [];
      let descriptor2: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
        isWriteable: false,
      };
      propertyDescriptor2[0] = descriptor2;
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient.readProperty(property2);
        console.info('[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1000
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3[0] = descriptor3;
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      try {
        await ssapClient.readProperty(property3);
        console.info('[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1100
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4[0] = descriptor4;
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient.readProperty(property4);
        console.info('[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1200
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5[0] = descriptor5;
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient.readProperty(property5);
        console.info('[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1300
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合6 ==========
      let propertyDescriptor6: Array<ssap.PropertyDescriptor> = [];
      let descriptor6: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: false,
      };
      propertyDescriptor6[0] = descriptor6;
      let property6: ssap.Property = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferCCC,
        descriptors: propertyDescriptor6,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient.readProperty(property6);
        console.info('[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1400
     * @tc.desc ssap client readProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合7 ==========
      let property7: ssap.Property = {
        serviceUuid: UUID_LOW_Invailable,
        propertyUuid: UUID_Upp_Invailable,
        value: bufferCCC,
      };
      try {
        await ssapClient.readProperty(property7);
        console.info('[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1500
     * @tc.desc ssap client writeProperty with undefined parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapClient.writeProperty(undefined, ssap.PropertyWriteType.WRITE_NO_RESPONSE);
        console.info('[NearLink_Test]writeProperty undefined info :');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty undefined failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1600
     * @tc.desc ssap client writeProperty with undefined and WRITE_NO_RESPONSE type test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapClient.writeProperty(null, ssap.PropertyWriteType.WRITE);
        console.info('[NearLink_Test]writeProperty undefined info :');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty null failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1700
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合1 ==========
      let propertyDescriptor1: Array<ssap.PropertyDescriptor> = [];
      let descriptor1: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: true,
      };
      propertyDescriptor1[0] = descriptor1;
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient.writeProperty(property1,ssap.PropertyWriteType.WRITE);
        console.info('[NearLink_Test]writeProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1800
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合2 ==========
      let propertyDescriptor2: Array<ssap.PropertyDescriptor> = [];
      let descriptor2: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
        isWriteable: false,
      };
      propertyDescriptor2[0] = descriptor2;
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient.writeProperty(property2, ssap.PropertyWriteType.WRITE_NO_RESPONSE);
        console.info('[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_1900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_1900
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3[0] = descriptor3;
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      try {
        await ssapClient.writeProperty(property3,ssap.PropertyWriteType.WRITE);
        console.info('[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2000
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4[0] = descriptor4;
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient.writeProperty(property4, ssap.PropertyWriteType.WRITE_NO_RESPONSE);
        console.info('[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2100
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5[0] = descriptor5;
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient.writeProperty(property5,ssap.PropertyWriteType.WRITE);
        console.info('[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2200
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合6 ==========
      let propertyDescriptor6: Array<ssap.PropertyDescriptor> = [];
      let descriptor6: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: false,
      };
      propertyDescriptor6[0] = descriptor6;
      let property6: ssap.Property = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferCCC,
        descriptors: propertyDescriptor6,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient.writeProperty(property6, null);
        console.info('[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2300
     * @tc.desc ssap client writeProperty without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合7 ==========
      let property7: ssap.Property = {
        serviceUuid: UUID_LOW_Invailable,
        propertyUuid: UUID_Upp_Invailable,
        value: bufferCCC,
      };
      try {
        await ssapClient.writeProperty(property7, undefined);
        console.info('[NearLink_Test] writeProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2400
     * @tc.desc ssap client setPropertyNotification with undefined parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapClient.setPropertyNotification(undefined, false);
        console.info('[NearLink_Test]setPropertyNotification undefined info success');
        expect().assertFail();
      } catch (err) {
        console.error('setPropertyNotification undefined failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2500
     * @tc.desc ssap client setPropertyNotification with null parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapClient.setPropertyNotification(null, false);
        console.info('[NearLink_Test]setPropertyNotification null info success');
        expect().assertFail();
      } catch (err) {
        console.error('setPropertyNotification null failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2600
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合1 ==========
      let propertyDescriptor1: Array<ssap.PropertyDescriptor> = [];
      let descriptor1: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: true,
      };
      propertyDescriptor1[0] = descriptor1;
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient.setPropertyNotification(property1,true);
        console.info('[NearLink_Test]setPropertyNotification success');
      } catch (err) {
        console.error('setPropertyNotification failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2700
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合2 ==========
      let propertyDescriptor2: Array<ssap.PropertyDescriptor> = [];
      let descriptor2: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
        isWriteable: false,
      };
      propertyDescriptor2[0] = descriptor2;
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient.setPropertyNotification(property2, false);
        console.info('[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] setPropertyNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2800
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3[0] = descriptor3;
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      try {
        await ssapClient.setPropertyNotification(property3,true);
        console.info('[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] setPropertyNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_2900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_2900
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4[0] = descriptor4;
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient.setPropertyNotification(property4, false);
        console.info('[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] setPropertyNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3000
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5[0] = descriptor5;
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapClient.setPropertyNotification(property5,true);
        console.info('[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] setPropertyNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3100
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合6 ==========
      let propertyDescriptor6: Array<ssap.PropertyDescriptor> = [];
      let descriptor6: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: false,
      };
      propertyDescriptor6[0] = descriptor6;
      let property6: ssap.Property = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferCCC,
        descriptors: propertyDescriptor6,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapClient.setPropertyNotification(property6, true);
        console.info('[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] setPropertyNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3200
     * @tc.desc ssap client setPropertyNotification without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合7 ==========
      let property7: ssap.Property = {
        serviceUuid: UUID_LOW_Invailable,
        propertyUuid: UUID_Upp_Invailable,
        value: bufferCCC,
      };
      try {
        await ssapClient.setPropertyNotification(property7, undefined);
        console.info('[NearLink_Test] setPropertyNotification success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] setPropertyNotification failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3300
     * @tc.desc requestMtuSize 入参合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapClient.requestMtuSize(1024);
        console.info("[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        console.error(`[Nearlink Test] StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3400
     * @tc.desc requestMtuSize 入参合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)  => {
      try {
        await ssapClient.requestMtuSize(22);
        console.info("[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        console.error(`[Nearlink Test] StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3500
     * @tc.desc requestMtuSize 入参合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)  => {
      try {
        await ssapClient.requestMtuSize(500);
        console.info("[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        console.error(`[Nearlink Test] StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3600
     * @tc.desc requestMtuSize 入参不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)  => {
      try {
        await ssapClient.requestMtuSize(21);
        console.info("[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        console.error(`[Nearlink Test] StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3700
     * @tc.desc requestMtuSize 入参不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)  => {
      try {
        await ssapClient.requestMtuSize(1025);
        console.info("[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        console.error(`[Nearlink Test] StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3800
     * @tc.desc requestMtuSize 入参不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)  => {
      try {
        await ssapClient.requestMtuSize(undefined);
        console.info("[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        console.error(`[Nearlink Test] StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_3900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_3900
     * @tc.desc requestMtuSize 入参不合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Communication_XTS_NearLink_SSap_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)  => {
      try {
        await ssapClient.requestMtuSize(null);
        console.info("[nearlink_TEST] requestMtusize result");
        expect().assertFail();
      } catch (error) {
        console.error(`[Nearlink Test] StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_4000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4000
     * @tc.desc ssap server addService with undefined parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.addService(undefined);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] addService undefined fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_4100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4100
     * @tc.desc ssap server addService with null parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.addService(null);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] addService null fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_4200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4200
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
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
      propertyDescriptor1[0] = descriptor1;
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      properties[0]=property1;
      let service :ssap.Service = {
        serviceUuid:UUID,
        properties:properties,
      }
      try {
        ssapServer.addService(service);
        console.info('[Nearlink_test] addService success');
        await sleep(100);
        ssapServer.removeService(UUID);
        console.info('[Nearlink_test] removeService success');
      }catch(err){
        console.info('[Nearlink_test] add services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_4300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4300
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
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
      propertyDescriptor2[0] = descriptor2;
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      properties[0]=property2;
      let service :ssap.Service={
        serviceUuid:UUID_test,
        properties:properties,
      }
      try {
        ssapServer.addService(service);
        console.info('[Nearlink_test] addService success');
        await sleep(100);
        ssapServer.removeService(UUID_test);
        console.info('[Nearlink_test] removeService success');
      }catch(err){
        console.info('[Nearlink_test] add services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_4400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4400
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
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
      propertyDescriptor3[0] = descriptor3;
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      properties[0]=property3;
      let service :ssap.Service={
        serviceUuid:UUID,
        properties:properties,
      }
      try {
        ssapServer.addService(service);
        console.info('[Nearlink_test] addService success');
        await sleep(100);
        ssapServer.removeService(UUID);
        console.info('[Nearlink_test] removeService success');
      }catch(err){
        console.info('[Nearlink_test] add services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_4500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4500
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
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
      propertyDescriptor4[0] = descriptor4;
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      properties[0]=property4;
      let service :ssap.Service={
        serviceUuid:UUID_test,
        properties:properties,
      }
      try {
        ssapServer.addService(service);
        console.info('[Nearlink_test] addService success');
        await sleep(100);
        ssapServer.removeService(UUID_test);
        console.info('[Nearlink_test] removeService success');
      }catch(err){
        console.info('[Nearlink_test] add services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_4600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4600
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
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
      propertyDescriptor5[0] = descriptor5;
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      properties[0]=property5;
      let service :ssap.Service={
        serviceUuid:UUID_Invalid,
        properties:properties,
      }
      try {
        ssapServer.addService(service);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] add services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })
    // SUB_Communication_XTS_NearLink_SSap_4700     // ========== ssap.Service 入参组合6 ========== 涉及到系统参数 故上库hits仓
    // SUB_Communication_XTS_NearLink_SSap_4800     // ========== ssap.Service 入参组合7 ========== 涉及到系统参数 故上库hits仓
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_4900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_4900
     * @tc.desc ssap server sendResponse with undefined parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.sendResponse(undefined);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink_test] sendResponse fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5000
     * @tc.desc ssap server sendResponse with null parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.sendResponse(null);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink_test] sendResponse fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5100
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      let serverResponse:ssap.ServerResponse={
        address:TEST_ADDRESS,
        requestId:0,
        value:bufferCCC,
      };
      try {
        ssapServer.sendResponse(serverResponse);
        console.info('[Nearlink_test] sendResponse success');
      } catch (err) {
        console.info('[Nearlink_test] sendResponse fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5200
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      let serverResponse:ssap.ServerResponse={
        address:ADDRESS_invailable_1,
        requestId:0,
        value:bufferCCC,
      }
      try {
        ssapServer.sendResponse(serverResponse);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink_test] sendResponse fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5300
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      let serverResponse:ssap.ServerResponse={
        address:ADDRESS_invailable_2,
        requestId:0,
        value:bufferCCC,
      }
      try {
        ssapServer.sendResponse(serverResponse);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink_test] sendResponse fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5400
     * @tc.desc ssap server sendResponse test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      let serverResponse:ssap.ServerResponse={
        address:ADDRESS_invailable_3,
        requestId:0,
        value:bufferCCC,
      }
      try {
        ssapServer.sendResponse(serverResponse);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink_test] sendResponse fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5500
     * @tc.desc ssap server notifyPropertyChanged with empty address and undefined property test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapServer.notifyPropertyChanged(undefined, undefined);
        console.info('[NearLink_Test]notifyPropertyChanged info success');
        expect().assertFail();
      } catch (err) {
        console.error('notifyPropertyChanged failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5600
     * @tc.desc ssap server notifyPropertyChanged with empty address and null property test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapServer.notifyPropertyChanged(null, null);
        console.info('[NearLink_Test]notifyPropertyChanged info success');
        expect().assertFail();
      } catch (err) {
        console.error('notifyPropertyChanged failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5700
     * @tc.desc ssap server notifyPropertyChanged with empty address and undefined property test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, undefined);
        console.info('[NearLink_Test]notifyPropertyChanged info success');
        expect().assertFail();
      } catch (err) {
        console.error('notifyPropertyChanged failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5800
     * @tc.desc ssap server notifyPropertyChanged with empty address and null property test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, null);
        console.info('[NearLink_Test]notifyPropertyChanged info success');
        expect().assertFail();
      } catch (err) {
        console.error('notifyPropertyChanged failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_5900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_5900
     * @tc.desc ssap server notifyPropertyChanged with empty address and null property test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapServer.notifyPropertyChanged(ADDRESS_invailable_1, null);
        console.info('[NearLink_Test]notifyPropertyChanged info success');
        expect().assertFail();
      } catch (err) {
        console.error('notifyPropertyChanged failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6000
     * @tc.desc ssap server notifyPropertyChanged with empty address and null property test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapServer.notifyPropertyChanged(ADDRESS_invailable_2, null);
        console.info('[NearLink_Test]notifyPropertyChanged info success');
        expect().assertFail();
      } catch (err) {
        console.error('notifyPropertyChanged failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6100
     * @tc.desc ssap server notifyPropertyChanged with empty address and null property test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        await ssapServer.notifyPropertyChanged(ADDRESS_invailable_3, null);
        console.info('[NearLink_Test]notifyPropertyChanged info success');
        expect().assertFail();
      } catch (err) {
        console.error('notifyPropertyChanged failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6200
     * @tc.desc ssap server notifyPropertyChanged with NearLink standard UUID not allowed test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合1 ==========
      let propertyDescriptor1: Array<ssap.PropertyDescriptor> = [];
      let descriptor1: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: true,
      };
      propertyDescriptor1[0] = descriptor1;
      let property1: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor1,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, property1);
        console.info('[NearLink_Test] notifyPropertyChanged info ');
        expect().assertFail();
      } catch (err) {
        console.error('[NearLink_Test] notifyPropertyChanged failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6300
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合2 ==========
      let propertyDescriptor2: Array<ssap.PropertyDescriptor> = [];
      let descriptor2: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
        isWriteable: false,
      };
      propertyDescriptor2[0] = descriptor2;
      let property2: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor2,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, property2);
        console.info('[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] notifyPropertyChanged failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6400
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合3 ==========
      let propertyDescriptor3: Array<ssap.PropertyDescriptor> = [];
      let descriptor3: ssap.PropertyDescriptor = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.SERVER_PROPERTY_CONFIG,
        isWriteable: true,
      };
      propertyDescriptor3[0] = descriptor3;
      let property3: ssap.Property = {
        serviceUuid: UUID,
        propertyUuid: UUID_test,
        value: bufferCCC,
        descriptors: propertyDescriptor3,
        operation: ssap.Operation.WRITE_WITH_RESPONSE,
      };
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, property3);
        console.info('[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] notifyPropertyChanged failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6500
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合4 ==========
      let propertyDescriptor4: Array<ssap.PropertyDescriptor> = [];
      let descriptor4: ssap.PropertyDescriptor = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY_FORMAT,
        isWriteable: false,
      };
      propertyDescriptor4[0] = descriptor4;
      let property4: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor4,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, property4);
        console.info('[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] notifyPropertyChanged failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6600
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合5 ==========
      let propertyDescriptor5: Array<ssap.PropertyDescriptor> = [];
      let descriptor5: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.TYPE_VENDOR,
        isWriteable: true,
      };
      propertyDescriptor5[0] = descriptor5;
      let property5: ssap.Property = {
        serviceUuid: UUID_Invalid,
        propertyUuid: UUID_Invalid,
        value: bufferCCC,
        descriptors: propertyDescriptor5,
        operation: ssap.Operation.READABLE,
      };
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, property5);
        console.info('[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] notifyPropertyChanged failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100043);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6700
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合6 ==========
      let propertyDescriptor6: Array<ssap.PropertyDescriptor> = [];
      let descriptor6: ssap.PropertyDescriptor = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferDesc,
        descriptorType: ssap.PropertyDescriptorType.PROPERTY,
        isWriteable: false,
      };
      propertyDescriptor6[0] = descriptor6;
      let property6: ssap.Property = {
        serviceUuid: UUID_Upp_Invailable,
        propertyUuid: UUID_LOW_Invailable,
        value: bufferCCC,
        descriptors: propertyDescriptor6,
        operation: ssap.Operation.WRITE_NO_RESPONSE,
      };
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, property6);
        console.info('[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] notifyPropertyChanged failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6800
     * @tc.desc ssap client notifyPropertyChanged without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合7 ==========
      let property7: ssap.Property = {
        serviceUuid: UUID_LOW_Invailable,
        propertyUuid: UUID_Upp_Invailable,
        value: bufferCCC,
      };
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, property7);
        console.info('[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] notifyPropertyChanged failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_6900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_6900
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.removeService(UUID_Upp_Invailable);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] remove services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7000
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.removeService(UUID_LOW_Invailable);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] remove services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100044);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7100
     * @tc.desc ssap server removeService with empty string test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.removeService("");
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] removeService fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100043);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7200
     * @tc.desc ssap server removeService with null parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.removeService(null);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] removeService fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7300
     * @tc.desc ssap server removeService with undefined parameter test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.removeService(undefined);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] removeService fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7400
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.removeService(UUID);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] remove services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7500
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        ssapServer.removeService(UUID_test);
        expect().assertFail();
      }catch(err){
        console.info('[Nearlink_test] remove services fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7600
     * @tc.desc ssap createClient with empty string address test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        let clients: ssap.Client = ssap.createClient(ADDRESS_invailable_3);
        console.info('[Nearlink Test] ssap create client: '+ clients);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink Test]createClient fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7700
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7700
     * @tc.desc ssap createClient with null address test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        let clients: ssap.Client = ssap.createClient(null);
        console.info('[Nearlink Test] ssap create client: '+ clients);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink Test]createClient fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7800
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7800
     * @tc.desc ssap createClient with undefined address test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        let clients: ssap.Client = ssap.createClient(undefined);
        console.info('[Nearlink Test] ssap create client: '+ clients);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink Test]createClient fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_7900
     * @tc.number SUB_Communication_XTS_NearLink_SSap_7900
     * @tc.desc ssap createClient with undefined address test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        let clients: ssap.Client = ssap.createClient(ADDRESS_invailable_1);
        console.info('[Nearlink Test] ssap create client: '+ clients);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink Test]createClient fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_8000
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8000
     * @tc.desc ssap createClient with undefined address test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      try {
        let clients: ssap.Client = ssap.createClient(ADDRESS_invailable_2);
        console.info('[Nearlink Test] ssap create client: '+ clients);
        expect().assertFail();
      } catch (err) {
        console.info('[Nearlink Test]createClient fail' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100041);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_8100
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8100
     * @tc.desc ssap client notifyPropertyChanged 空数组覆盖 without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合8 空数组覆盖 ==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapServer.notifyPropertyChanged(TEST_ADDRESS, property8);
        console.info('[NearLink_Test]notifyPropertyChanged success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] notifyPropertyChanged failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_8200
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8200
     * @tc.desc ssap client readProperty 空数组 without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合8 空数组覆盖 ==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient.readProperty(property8);
        console.info('[NearLink_Test]readProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] readDescrValue failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_8300
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8300
     * @tc.desc ssap client setPropertyNotification 空数组 without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合8 空数组覆盖 ==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient.setPropertyNotification(property8,true);
        console.info('[NearLink_Test]setPropertyNotification success');
      } catch (err) {
        console.error('setPropertyNotification failed errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(err.code).assertEqual(36100099);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_8400
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8400
     * @tc.desc ssap client writeProperty 空数组 without connect test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== 组合8 空数组覆盖 ==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      try {
        await ssapClient.writeProperty(property8,ssap.PropertyWriteType.WRITE);
        console.info('[NearLink_Test]writeProperty success');
        expect().assertFail();
      } catch (error) {
        console.error(`[NearLink_Test] writeProperty failed, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(36100099);
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_8500
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8500
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== ssap.Service 入参组合8 descriptors 空数组 ==========
      let propertyDescriptor8: Array<ssap.PropertyDescriptor> = [];
      let properties:Array<ssap.Property>=[];
      let property8: ssap.Property = {
        serviceUuid: UUID_test,
        propertyUuid: UUID,
        value: bufferCCC,
        descriptors: propertyDescriptor8,
        operation: ssap.Operation.NOTIFY,
      };
      properties[0]=property8;
      let service :ssap.Service={
        serviceUuid:UUID_test,
        properties:properties,
      };
      try {
        ssapServer.addService(service);
        console.info('[Nearlink_test] addService success');
        await sleep(100);
        ssapServer.removeService(UUID_test);
        console.info('[Nearlink_test] removeService success');
      }catch(err){
        console.error(`[NearLink_Test] addService failed, code is ${err.code},message is ${err.message}`);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SSap_8600
     * @tc.number SUB_Communication_XTS_NearLink_SSap_8600
     * @tc.desc ssap server addService and removeService test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SSap_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)  => {
      // ========== ssap.Service 入参组合9 properties 空数组 ==========
      let properties:Array<ssap.Property>=[];
      let service :ssap.Service = {
        serviceUuid:UUID,
        properties:properties,
      };
      try {
        ssapServer.addService(service);
        console.info('[Nearlink_test] addService success');
        await sleep(100);
        ssapServer.removeService(UUID);
        console.info('[Nearlink_test] removeService success');
      }catch(err){
        console.error(`[NearLink_Test] addService failed, code is ${err.code},message is ${err.message}`);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
  })
}