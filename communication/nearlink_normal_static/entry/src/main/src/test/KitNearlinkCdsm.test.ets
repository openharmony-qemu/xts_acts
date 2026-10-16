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
import cdsm from '@ohos.nearlink.cdsm';
import manager from '@ohos.nearlink.manager';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
export default function cdsmTest(): void {
  describe('cdsmTest', () => {
    let ADDRESS = "00:11:22:33:44:55"
    let ADDRESS_invailable_1 = "00:11:22:33:44:551"
    let ADDRESS_invailable_2 = "00:11:22:33:4455"
    let ADDRESS_invailable_3 = ""
    let cdsmClient:cdsm.CdsmClient | undefined = undefined;
    let return_boolean: boolean;
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      await Utils.clickRequestPermission();
      return_boolean = manager.isNearLinkSupported();
      try {
        await Utils.openNearLink();
        cdsmClient = cdsm.createCdsmClient(ADDRESS);
        hilog.info(0x0000, 'testTag', 'nearLink createCdsmClient result:%{public}s', cdsmClient);
        expect(cdsmClient !== null).assertTrue();
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'nearlink errCode: %{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else if (err.code === 36100050) {
          hilog.info(0x0000, 'testTag', '该设备不支持星闪音频--合作');
          expect(err.code).assertEqual(36100050);
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
    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach');
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll');
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_Enum_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_Enum_0100
     * @tc.desc CdsmConnectionState enumvalue (by constant)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_Enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Cdsm_Enum_static_0100';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let DISCONNECTED: cdsm.CdsmConnectionState = cdsm.CdsmConnectionState.DISCONNECTED;
          hilog.info(0x0000, 'testTag', '%{public}s DISCONNECTED result: %{public}d', caseName, DISCONNECTED);
          expect(DISCONNECTED).assertEqual(0);
          let CONNECTED: cdsm.CdsmConnectionState = cdsm.CdsmConnectionState.CONNECTED;
          hilog.info(0x0000, 'testTag', '%{public}s CONNECTED result: %{public}d', caseName, CONNECTED);
          expect(CONNECTED).assertEqual(1);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s CdsmConnectionState error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_ON_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0100
     * @tc.desc 无法触发回调仅调�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_ON_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_ON_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      if (cdsmClient === undefined) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[cdsmClient]cdsmClient 不支 该实例对象');
        done();
        return;
      };
      let onReceiveEvent = (result: cdsm.CdsmInfo) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        cdsmClient!.onCdsmInfoChange(onReceiveEvent);
        cdsmClient!.offCdsmInfoChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        expect().assertFail();
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_ON_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_ON_0200
     * @tc.desc 无法触发回调仅调�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_ON_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_ON_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      if (cdsmClient === undefined) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[cdsmClient]cdsmClient 不支 该实例对象');
        done();
        return;
      };
      let onReceiveEvent = (result: cdsm.CdsmInfo) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        cdsmClient!.onCdsmInfoChange(onReceiveEvent);
        cdsmClient!.offCdsmInfoChange();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onCdsmInfoChange/offCdsmInfoChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        expect().assertFail();
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0100
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0100';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(ADDRESS);
          hilog.info(0x0000, 'testTag', 'nearLink createRemoteDevice result:%{public}s', cdsmClient);
          expect(cdsmClient !== null).assertTrue();
        } catch (error) {
          hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] createCdsmClient error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
          if (error.code === 801) {
            hilog.info(0x0000, 'testTag', '%{public}s api is not support', caseName);
              expect(return_boolean === false).assertTrue();
          } else if (error.code === 36100050) {
            hilog.info(0x0000, 'testTag', '该设备不支持星闪音频--合作');
            expect(error.code).assertEqual(36100050);
          } else {
            expect().assertFail();
          }
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0200
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0200
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'LOG_SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0200';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(ADDRESS_invailable_1);
          hilog.info(0x0000, 'testTag', 'nearLink createRemoteDevice result:%{public}s', cdsmClient);
          expect().assertFail();
        } catch (error) {
          hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] createCdsmClient error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
          if (error.code === 801) {
            hilog.info(0x0000, 'testTag', '%{public}s api is not support', caseName);
              expect(return_boolean === false).assertTrue();
          } else if (error.code === 36100050) {
            hilog.info(0x0000, 'testTag', '该设备不支持星闪音频--合作');
            expect(error.code).assertEqual(36100050);
          } else {
            expect(error.code).assertEqual(36100041);
          }
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0500
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0500
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'LOG_SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0500';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(ADDRESS_invailable_2);
          hilog.info(0x0000, 'testTag', 'nearLink createRemoteDevice result:%{public}s', cdsmClient);
          expect().assertFail();
        } catch (error) {
          hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] createCdsmClient error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
          if (error.code === 801) {
            hilog.info(0x0000, 'testTag', '%{public}s api is not support', caseName);
            expect(return_boolean === false).assertTrue();
          } else if (error.code === 36100050) {
            hilog.info(0x0000, 'testTag', '%{public}s 该设备不支持星闪音频', caseName);
            expect(error.code).assertEqual(36100050);
          } else {
            expect(error.code).assertEqual(36100041);
          }
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0600
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0600
     * @tc.desc createCdsmClient
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'LOG_SUB_Communication_XTS_NearLink_Cdsm_createCdsmClient_0200';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let cdsmClient:cdsm.CdsmClient;
          cdsmClient = cdsm.createCdsmClient(ADDRESS_invailable_3);
          hilog.info(0x0000, 'testTag', 'nearLink createRemoteDevice result:%{public}s', cdsmClient);
          expect().assertFail();
        } catch (error) {
          hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] createCdsmClient error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
          if (error.code === 801) {
            hilog.info(0x0000, 'testTag', '%{public}s api is not support', caseName);
            expect(return_boolean === false).assertTrue();
          } else if (error.code === 36100050) {
            hilog.info(0x0000, 'testTag', '%{public}s 该设备不支持星闪音频', caseName);
            expect(error.code).assertEqual(36100050);
          } else {
            expect(error.code).assertEqual(36100041);
          }
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Cdsm_getCdsmInfo_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_Cdsm_getCdsmInfo_0100
     * @tc.desc getCdsmInfo
     */
    it('SUB_Communication_XTS_NearLink_Cdsm_getCdsmInfo_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Cdsm_getCdsmInfo_static_0100';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        if (cdsmClient === undefined) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[cdsmClient]cdsmClient 不支 该实例对象');
          done();
          return;
        };
        try {
          let result: cdsm.CdsmInfo = cdsmClient!.getCdsmInfo();
          hilog.info(0x0000, 'testTag', 'nearLink createCdsmClient1122222 result:%{public}s', cdsmClient!);
          hilog.info(0x0000, 'testTag', '%{public}s getCdsmInfo result:%{public}s, type: %{public}s', caseName, result, typeof result);
          if (result) {
            hilog.info(0x0000, 'testTag', '%{public}s getCdsmInfo result.members:%{public}s, type: %{public}s', caseName, JSON.stringify(result.members), typeof result.members);
            expect(Array.isArray(result.members)).assertTrue();
            if (result.members.length >0){
              hilog.info(0x0000, 'testTag', '%{public}s getCdsmInfo result.members[0].address:%{public}s, type: %{public}s', caseName, result.members[0].address, typeof result.members[0].address);
              expect(typeof result.members[0].address === `string`).assertTrue();
              hilog.info(0x0000, 'testTag', '%{public}s getCdsmInfo result.members[0].state:%{public}s, type: %{public}s', caseName, result.members[0].state, typeof result.members[0].state);
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
          hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] getCdsmInfo error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })
  })
}