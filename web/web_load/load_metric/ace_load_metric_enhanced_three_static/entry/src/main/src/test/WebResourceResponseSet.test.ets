/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;


export default function webResourceResponseSet() {

  describe('WebResourceResponseSetTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsaceloadmetricenhancedtestthree.static")
      await Utils.msSleep(5000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEDATA_0100
    * @tc.name       : testSetResponseDataStatic001
    * @tc.desc       : test setResponseData
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetResponseDataStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseData001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseData001", true, 36010, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEENCODING_0100
    * @tc.name       : testSetResponseEncodingStatic001
    * @tc.desc       : test setResponseEncoding
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetResponseEncodingStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseEncoding001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseEncoding001", '', 36011, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEMIMETYPE_0100
    * @tc.name       : testSetResponseMimeTypeStatic001
    * @tc.desc       : test setResponseMimeType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetResponseMimeTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseMimeType001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseMimeType001", "text/html", 36012, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /*
    * @tc.number     : SUB_WEB_SETREASONMESSAGE_0100
    * @tc.name       : testSetReasonMessageStatic001
    * @tc.desc       : test setReasonMessage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetReasonMessageStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetReasonMessage001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetReasonMessage001", "OK", 36013, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSEHEADER_0100
    * @tc.name       : testSetResponseHeaderStatic001
    * @tc.desc       : test setResponseHeader
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetResponseHeaderStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseHeader001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseHeader001", true, 36014, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /*
    * @tc.number     : SUB_WEB_SETRESPONSECODE_0100
    * @tc.name       : testSetResponseCodeStatic001
    * @tc.desc       : test setResponseCode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetResponseCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseCode001", 403, 36015, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /*
* @tc.number     : SUB_WEB_SETRESPONSEISREADY_0100
* @tc.name       : testSetResponseIsReadyStatic001
* @tc.desc       : test setResponseIsReady
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 3
*/
    it('testSetResponseIsReadyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetResponseIsReady001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetResponseIsReady001", "test", 36016, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceResponseSetButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

  })
}
