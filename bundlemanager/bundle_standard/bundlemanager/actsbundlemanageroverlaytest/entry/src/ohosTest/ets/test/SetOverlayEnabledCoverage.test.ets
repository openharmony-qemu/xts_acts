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

import overlay from '@ohos.bundle.overlay';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

const MODULE_NAME = 'entry_test';
const ERROR_CODE = 401;

export default function setOverlayEnabledCoverage() {
  describe('SetOverlayEnabledCoverageTest', () => {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_Status_OverlayEnable_1000
     * @tc.number SUB_BMS_FRAMEWORK_Status_OverlayEnable_1000
     * @tc.desc   Failed to set when the isEnabled parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_Status_OverlayEnable_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          await overlay.setOverlayEnabled(MODULE_NAME, null).then(data => {
            console.info('SUB_BMS_FRAMEWORK_Status_OverlayEnable_1000 result' + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((e: BusinessError) => {
            console.info('SUB_BMS_FRAMEWORK_Status_OverlayEnable_1000 catch' + JSON.stringify(e));
            expect(e.code).assertEqual(ERROR_CODE);
            done();
          });
        } catch (e) {
          console.info('SUB_BMS_FRAMEWORK_Status_OverlayEnable_1000 catch' + JSON.stringify(e));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_Status_OverlayEnable_1100
     * @tc.number SUB_BMS_FRAMEWORK_Status_OverlayEnable_1100
     * @tc.desc   Failed to set when the isEnabled parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_Status_OverlayEnable_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          await overlay.setOverlayEnabled(MODULE_NAME, undefined).then(data => {
            console.info('SUB_BMS_FRAMEWORK_Status_OverlayEnable_1100 result' + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((e: BusinessError) => {
            console.info('SUB_BMS_FRAMEWORK_Status_OverlayEnable_1100 catch' + JSON.stringify(e));
            expect(e.code).assertEqual(ERROR_CODE);
            done();
          });
        } catch (e) {
          console.info('SUB_BMS_FRAMEWORK_Status_OverlayEnable_1100 catch' + JSON.stringify(e));
          expect().assertFail();
          done();
        }
      });

  });
}
