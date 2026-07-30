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
import cdsm from '@ohos.nearlink.cdsm';
import manager from '@ohos.nearlink.manager';
import { clickRequestPermission } from './ClickRequestPermission';
import { openNearLink } from './OpenNearLink';
export default function cdsmTest() {
  describe('cdsmTest', () => {
    let ADDRESS = "00:11:22:33:44:55"
    let ADDRESS_invailable_1 = "00:11:22:33:44:551"
    let ADDRESS_invailable_2 = "00:11:22:33:4455"
    let ADDRESS_invailable_3 = ""
    let cdsmClient:cdsm.CdsmClient;
    let return_boolean: boolean;
    beforeAll(async (done:Function) => {
      console.info('beforeAll start');
      await clickRequestPermission();
      return_boolean = manager.isNearLinkSupported();
      try {
        cdsmClient = cdsm.createCdsmClient(ADDRESS);
        console.info('nearLink createCdsmClient result:' + cdsmClient);
        expect(cdsmClient != null).assertTrue();
      } catch (err) {
        console.error('nearlink errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else if(err.code === 36100050) {
          console.info(`该设备不支持星闪音频--合作集`);
          expect(err.code).assertEqual(36100050);
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
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_Enum_0100
     * @tc.desc CdsmConnectionState enumvalue (by constant)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLink_Cdsm_Enum_0100';
      console.info(`${caseName} test start`);
      try{
        let DISCONNECTED: cdsm.CdsmConnectionState = cdsm.CdsmConnectionState.DISCONNECTED;
        console.info(`${caseName}DISCONNECTED result:`+ DISCONNECTED);
        expect(DISCONNECTED).assertEqual(0);
        let CONNECTED: cdsm.CdsmConnectionState = cdsm.CdsmConnectionState.CONNECTED;
        console.info(`${caseName}CONNECTED result:` + CONNECTED);
        expect(CONNECTED).assertEqual(1);
      }catch(error){
        console.info(`${caseName} CdsmConnectionState  error.code` + error.code + `,errMessage:` + error.message);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0100
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0100';
      console.info(`${caseName} test start`);
      if(cdsmClient === undefined) {
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象');
        done();
        return;
      };
      let onReceiveEvent = (result: cdsm.CdsmInfo) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        cdsmClient.onCdsmInfoChange(onReceiveEvent);
        cdsmClient.offCdsmInfoChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0200
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0200';
      console.info(`${caseName} test start`);
      if(cdsmClient === undefined) {
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象');
        done();
        return;
      };
      let onReceiveEvent = (result: cdsm.CdsmInfo) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        cdsmClient.onCdsmInfoChange(onReceiveEvent);
        cdsmClient.offCdsmInfoChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0300
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0300';
      console.info(`${caseName} test start`);
      if(cdsmClient === undefined) {
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象');
        done();
        return;
      };
      try {
        cdsmClient.onCdsmInfoChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0400
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0400';
      console.info(`${caseName} test start`);
      if(cdsmClient === undefined) {
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象');
        done();
        return;
      };
      try {
        cdsmClient.offCdsmInfoChange(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0500
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0500';
      console.info(`${caseName} test start`);
      if(cdsmClient === undefined) {
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象');
        done();
        return;
      };
      try {
        cdsmClient.onCdsmInfoChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0600
     * @tc.desc 无法触发回调仅调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0600';
      console.info(`${caseName} test start`);
      if(cdsmClient === undefined) {
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象');
        done();
        return;
      };
      try {
        cdsmClient.offCdsmInfoChange(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0100
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0100
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0100';
        console.info(`${caseName} test start`);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(ADDRESS);
          console.info('nearLink createRemoteDevice result:' + cdsmClient);
          expect(cdsmClient != null).assertTrue();
        } catch (error) {
          console.error(`${caseName}[NearLink_test] createCdsmClient error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            console.info(`${caseName} api is not support`);
              expect(return_boolean === false).assertTrue();
          } else if(error.code === 36100050) {
            console.info(`该设备不支持星闪音频--合作集`);
            expect(error.code).assertEqual(36100050);
          } else {
            expect().assertFail();
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0200
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0200
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'LOG_SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0200';
        console.info(`${caseName} test start`);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(ADDRESS_invailable_1);
          console.info('nearLink createRemoteDevice result:' + cdsmClient);
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName}[NearLink_test] createCdsmClient error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            console.info(`${caseName} api is not support`);
              expect(return_boolean === false).assertTrue();
          } else if(error.code === 36100050) {
            console.info(`该设备不支持星闪音频--合作集`);
            expect(error.code).assertEqual(36100050);
          } else {
            expect(error.code).assertEqual(36100041);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0300
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0300
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'LOG_SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0300';
        console.info(`${caseName} test start`);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(null);
          console.info('nearLink createRemoteDevice result:' + cdsmClient);
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName}[NearLink_test] createCdsmClient error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            console.info(`${caseName} api is not support`);
              expect(return_boolean === false).assertTrue();
          } else if(error.code === 36100050) {
            console.info(`该设备不支持星闪音频--合作集`);
            expect(error.code).assertEqual(36100050);
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0400
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0400
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'LOG_SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0400';
        console.info(`${caseName} test start`);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(undefined);
          console.info('nearLink createRemoteDevice result:' + cdsmClient);
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName}[NearLink_test] createCdsmClient error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            console.info(`${caseName} api is not support`);
              expect(return_boolean === false).assertTrue();
          } else if(error.code === 36100050) {
            console.info(`${caseName} 该设备不支持星闪音频`);
            expect(error.code).assertEqual(36100050);
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0500
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0500
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'LOG_SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0500';
        console.info(`${caseName} test start`);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(ADDRESS_invailable_2);
          console.info('nearLink createRemoteDevice result:' + cdsmClient);
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName}[NearLink_test] createCdsmClient error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            console.info(`${caseName} api is not support`);
            expect(return_boolean === false).assertTrue();
          } else if(error.code === 36100050) {
            console.info(`${caseName} 该设备不支持星闪音频`);
            expect(error.code).assertEqual(36100050);
          } else {
            expect(error.code).assertEqual(36100041);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0600
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0600
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'LOG_SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0200';
        console.info(`${caseName} test start`);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(ADDRESS_invailable_3);
          console.info('nearLink createRemoteDevice result:' + cdsmClient);
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName}[NearLink_test] createCdsmClient error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            console.info(`${caseName} api is not support`);
            expect(return_boolean === false).assertTrue();
          } else if(error.code === 36100050) {
            console.info(`${caseName} 该设备不支持星闪音频`);
            expect(error.code).assertEqual(36100050);
          } else {
            expect(error.code).assertEqual(36100041);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_getCdsmInfo_0100
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_getCdsmInfo_0100
     * @tc.desc getCdsmInfo
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_getCdsmInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Cdsm_getCdsmInfo_0100';
        console.info(`${caseName} test start`);
        if(cdsmClient === undefined) {
          console.info('[bluetooth_js]bluetooth 不支持 该实例对象');
          done();
          return;
        };
        try {
          let result: cdsm.CdsmInfo = cdsmClient.getCdsmInfo();
          console.info('nearLink createCdsmClient1122222 result:' + cdsmClient);
          console.info(`${caseName} getCdsmInfo result:` + result + `, type: ` + typeof result);
          if (result) {
            console.info(`${caseName} getCdsmInfo result.members:` + JSON.stringify(result.members) + `, type: ` + typeof result.members);
            expect(Array.isArray(result.members)).assertTrue();
            if(result.members.length >0){
              console.info(`${caseName} getCdsmInfo result.members[0].address:` + result.members[0].address + `, type: ` + typeof result.members[0].address);
              expect(typeof result.members[0].address === `string`).assertTrue();
              console.info(`${caseName} getCdsmInfo result.members[0].state:` + result.members[0].state + `, type: ` + typeof result.members[0].state);
              const enumvalue: number[] = [cdsm.CdsmConnectionState.DISCONNECTED, cdsm.CdsmConnectionState.CONNECTED];
              expect(enumvalue.includes(result.members[0].state)).assertTrue();
              expect(typeof result.members[0].state === 'number').assertTrue();
            }else{
              expect(result.members.length === 0).assertTrue();
            }
          }else{
            expect().assertFail();
          }
        } catch (error) {
          console.error(`${caseName}[NearLink_test] getCdsmInfo error, code is ${error.code},message is ${error.message}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}