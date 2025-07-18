/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import systemDateTime from "@ohos.systemDateTime";
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function SystemDateTimeJsunitStaticTest() {

    describe("SystemDateTimeJsunitStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'SystemDateTimeJsunitStaticTest start');
        
    /**
     * @tc.number    SUB_systemDateTime_getTimezone_JS_API_Static_0100
     * @tc.name      SUB_systemDateTime_getTimezone_JS_API_Static_0100
     * @tc.desc      Test systemTimeDate_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemDateTime_getTimezone_JS_API_Static_0100', Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0100 start");
      await systemDateTime.getTimezone().then( (data: string) : Promise<string> => {
        hilog.info(domain, tag, "SUB_systemDateTime_getTimezone_JS_API_Static_0100 data = " + data);
        expect(data != null).assertTrue();
        done();
      }).catch((error: BusinessError): Promise<string> => {
        expect().assertFail();
        done();
      });
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0100 end");
    });

    /**
     * @tc.number    SUB_systemDateTime_getTime_sync_Static_0010
     * @tc.name      SUB_systemDateTime_getTime_sync_Static_0010
     * @tc.desc      Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemDateTime_getTime_sync_Static_0010", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0010 start----------------");
      let currentTime = systemDateTime.getTime(true);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTime_sync_Static_0010 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'number').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0010 end-----------------");
    });

    /**
     * @tc.number    SUB_systemDateTime_getTimezone_JS_API_Static_0200
     * @tc.name      SUB_systemDateTime_getTimezone_JS_API_Static_0200
     * @tc.desc      Test systemTimeDate_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemDateTime_getTimezone_JS_API_Static_0200', Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 start");
      systemDateTime.getTimezone((err, data) => {
        try{
          if(err != null){
            hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 getTimezone fail: " + err);
            expect().assertFail();
            done();
          }
          hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 getTimezone success: " + data);
          expect(data != null).assertTrue();
          done();
        }catch(error){
          hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 catch error " + error);
          done();
        }
      })
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 end");
    });

    /**
     * @tc.number    SUB_systemDateTime_getTime_sync_Static_0020
     * @tc.name      SUB_systemDateTime_getTime_sync_Static_0020
     * @tc.desc      Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemDateTime_getTime_sync_Static_0020", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0020 start----------------");
      let currentTime = systemDateTime.getTime(false);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTime_sync_Static_0020 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'number').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0020 end-----------------");
    });

    /**
     * @tc.number    SUB_systemDateTime_getTime_sync_Static_0030
     * @tc.name      SUB_systemDateTime_getTime_sync_Static_0030
     * @tc.desc      Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemDateTime_getTime_sync_Static_0030", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0030 start----------------");
      let currentTime = systemDateTime.getTime();
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTime_sync_Static_0030 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'number').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0030 end-----------------");
    });

    /**
     * @tc.number    SUB_systemDateTime_getTimezoneSync_sync_Static_0130
     * @tc.name      SUB_systemDateTime_getTimezoneSync_sync_Static_0130
     * @tc.desc      Test systemTimeDate_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemDateTime_getTimezoneSync_sync_Static_0130', Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTimezoneSync_sync_Static_0130 start----------------");
      let timeZone = systemDateTime.getTimezoneSync();
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezoneSync_sync_Static_0130 currentTime: " + JSON.stringify(timeZone));
      expect(typeof(timeZone) === 'string').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTimezoneSync_sync_Static_0130 end-----------------");
    });


    })

}