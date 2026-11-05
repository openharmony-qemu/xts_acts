/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import wifiManager from '@ohos.wifiManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium-dynamic';
export default function wifiManagerApi26NopTest() {
  describe('wifiManagerApi26NopTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
      * @tc.name   SUB_Communication_WiFi_DisconnectFromCandidateConfig_Nop
      * @tc.number SUB_Communication_WiFi_DisconnectFromCandidateConfig_Nop
      * @tc.desc   Test disconnectFromCandidateConfig API without permission
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('SUB_Communication_WiFi_DisconnectFromCandidateConfig_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisconnectFromCandidateConfig_Nop begin');
      try {
        wifiManager.disconnectFromCandidateConfig(0, 30);
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisconnectFromCandidateConfig_Nop success');
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisconnectFromCandidateConfig_Nop failed ' + JSON.stringify(error));
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
    });

    /**
      * @tc.name   SUB_Communication_WiFi_DisconnectFromCandidateConfig_Permanent_Nop
      * @tc.number SUB_Communication_WiFi_DisconnectFromCandidateConfig_Permanent_Nop
      * @tc.desc   Test disconnectFromCandidateConfig API with permanent blockDuration without permission
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('SUB_Communication_WiFi_DisconnectFromCandidateConfig_Permanent_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisconnectFromCandidateConfig_Permanent_Nop begin');
      try {
        wifiManager.disconnectFromCandidateConfig(0, -1);
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisconnectFromCandidateConfig_Permanent_Nop success');
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisconnectFromCandidateConfig_Permanent_Nop failed ' + JSON.stringify(error));
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
    });
  })
}
