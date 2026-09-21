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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import cdsm from '@ohos.nearlink.cdsm';
import manager from '@ohos.nearlink.manager';
import Utils from './Util.test';
import hilog from '@ohos.hilog';

export default function nearlinkswitchoffCsdmTest(): void {
  describe('nearlinkswitchoffCsdmTest', () => {
    let cdsmClient:cdsm.CdsmClient | undefined = undefined;
    let TIME_SLEEP = 2000;
    let return_boolean: boolean;
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      await Utils.msSleep(TIME_SLEEP);
      await Utils.clickRequestPermission();
      try {
        return_boolean = manager.isNearLinkSupported();
        cdsmClient = cdsm.createCdsmClient("11:11:22:33:44:55");
        hilog.info(0x0000, 'testTag', 'nearLink createCdsmClient result:%{public}s', cdsmClient);
        expect(true).assertEqual(cdsmClient !== null);
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'nearlink errCode: %{public}s, errMessage: %{public}s', err.code, err.message);
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          let return_boolean_err: boolean = manager.isNearLinkSupported();
          expect(return_boolean_err === false).assertTrue();
        } else if (err.code === 36100050) {
          hilog.info(0x0000, 'testTag', '该设备不支持星闪音频--合作集');
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
      await Utils.closeNearLink();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach end');
      done();
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach');
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach start');
      await Utils.openNearLink();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach end');
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_SwitchOff_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_SwitchOff_0100
     * @tc.desc createCdsmClient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_SwitchOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_SwitchOff_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        let cdsmClient: cdsm.CdsmClient;
        cdsmClient = cdsm.createCdsmClient("11:11:22:33:44:55");
        hilog.info(0x0000, 'testTag', 'nearLink createRemoteDevice result:%{public}s', cdsmClient);
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] getCdsmInfo error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s api is not support', caseName);
          expect(return_boolean === false).assertTrue();
        } else if (error.code === 36100050) {
          hilog.info(0x0000, 'testTag', '该设备不支持星闪音频--合作集');
          expect(error.code).assertEqual(36100050);
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SwitchOff_Csdm_static_0200
     * @tc.number SUB_Communication_XTS_NearLink_SwitchOff_Csdm_0200
     * @tc.desc getCdsmInfo 201 API24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SwitchOff_Csdm_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLink_SwitchOff_Csdm_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      if (cdsmClient === undefined) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[bluetooth_js]bluetooth 不支持 该实例对象');
        done();
        return;
      };
      try {
        let result = cdsmClient!.getCdsmInfo();
        hilog.info(0x0000, 'testTag', '%{public}s getCdsmInfo result:%{public}s, type: %{public}s', caseName, result, typeof result);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] getCdsmInfo error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        expect(error.code).assertEqual(36100003);
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
  })
}