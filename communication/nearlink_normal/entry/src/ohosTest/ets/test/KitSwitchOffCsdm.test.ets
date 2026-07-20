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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import cdsm from '@ohos.nearlink.cdsm';
import manager from '@ohos.nearlink.manager';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';

import {clickCloseNearLinkSwitch,clickOpenNearLinkSwitch} from './Tools';

export default function nearlinkswitchoffCsdmTest() {
  describe('nearlinkswitchoffCsdmTest', () => {
    let cdsmClient:cdsm.CdsmClient;
    let TIME_SLEEP = 2000;
    let return_boolean: boolean;
    beforeAll(async (done: Function) => {
      console.info('beforeAll start');
      await sleep(TIME_SLEEP);
      await clickRequestPermission();
      try {
        return_boolean = manager.isNearLinkSupported();
        cdsmClient = cdsm.createCdsmClient("11:11:22:33:44:55");
        console.info('nearLink createCdsmClient result:' + cdsmClient);
        expect(true).assertEqual(cdsmClient != null);
      } catch (err) {
        console.error('nearlink errCode: ' + err.code + ', errMessage: ' + err.message);
        if (err.code === 801) {
          console.info('api is not support');
          let return_boolean: boolean = manager.isNearLinkSupported();
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
    beforeEach(async (done: Function) => {
      console.info('beforeEach start');
      await clickCloseNearLinkSwitch();
      console.info('beforeEach end');
      done();
    })
    afterEach(() => {
      console.info('afterEach');
    })
    afterAll(async (done: Function) => {
      console.info('beforeEach start');
      await clickOpenNearLinkSwitch();
      console.info('beforeEach end');
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Cdsm_SwitchOff_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Cdsm_SwitchOff_0100
     * @tc.desc createCdsmClient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Cdsm_SwitchOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Cdsm_SwitchOff_0100';
      console.info(`${caseName} test start`);
      try {
        let cdsmClient: cdsm.CdsmClient;
        cdsmClient = cdsm.createCdsmClient("11:11:22:33:44:55");
        console.info('nearLink createRemoteDevice result:' + cdsmClient);
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] getCdsmInfo error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(return_boolean === false).assertTrue();
        } else if(error.code === 36100050) {
          console.info(`该设备不支持星闪音频--合作集`);
          expect(error.code).assertEqual(36100050);
        } else {
          expect(error.code).assertEqual(36100003);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_SwitchOff_Csdm_0200
     * @tc.number SUB_Communication_XTS_NearLink_SwitchOff_Csdm_0200
     * @tc.desc getCdsmInfo 201 API24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_SwitchOff_Csdm_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLink_SwitchOff_Csdm_0200';
      console.info(`${caseName} test start`);
      if(cdsmClient === undefined) {
        console.info('[bluetooth_js]bluetooth 不支持 该实例对象');
        done();
        return;
      };
      try {
        let result = cdsmClient.getCdsmInfo();
        console.info(`${caseName} getCdsmInfo result:` + result + `, type: ` + typeof result);
        expect(true).assertFalse();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] getCdsmInfo error, code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(36100003);
      }
      console.info(`${caseName} test end`);
      done();
    });
  })
}