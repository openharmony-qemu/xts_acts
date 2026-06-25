'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect ,TestType ,Size ,Level } from "../../../hypium/index";
import pluginBundleManager from '@ohos.bundle.pluginBundleManager';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.name   SUB_BMS_PC_Self_Dist_Plugin_Static_0100
     * @tc.number SUB_BMS_PC_Self_Dist_Plugin_Static_0100
     * @tc.desc   Test pluginBundleManager.installLocalPlugin error code 17700012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_PC_Self_Dist_Plugin_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'SUB_BMS_PC_Self_Dist_Plugin_Static_0100';
      hilog.info(DOMAIN, TAG, `${itName} start.`);
      pluginBundleManager.installLocalPlugin([]).then(() => {
        hilog.info(DOMAIN, TAG, `${itName} installLocalPlugin success.`);
        expect().assertFail();
        done();
        hilog.info(DOMAIN, TAG, `${itName} end.`);
      }).catch((e: Error) => {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `${itName} installLocalPlugin fail. code: ${err?.code}, msg: ${err?.message}`);
        if (err?.code === 17700087) {
          expect(err?.code).assertEqual(17700087);
          expect(err?.message).assertEqual('BusinessError 17700087: Failed to install the plugin because the current device does not support plugin.');
          done();
          hilog.info(DOMAIN, TAG, `${itName} end.`);
          return;
        }
        expect(err?.code).assertEqual(17700012);
        expect(err?.message).assertEqual('BusinessError 17700012: Failed to install the hap since the path of the hap is invalid or too large size.');
        done();
        hilog.info(DOMAIN, TAG, `${itName} end.`);
      })
    })

    /**
     * @tc.name   SUB_BMS_PC_Self_Dist_Plugin_Static_0200
     * @tc.number SUB_BMS_PC_Self_Dist_Plugin_Static_0200
     * @tc.desc   Test pluginBundleManager.uninstallLocalPlugin errorcode 17700092
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_PC_Self_Dist_Plugin_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'SUB_BMS_PC_Self_Dist_Plugin_Static_0200';
      hilog.info(DOMAIN, TAG, `${itName} start.`);
      pluginBundleManager.uninstallLocalPlugin('').then(() => {
        hilog.info(DOMAIN, TAG, `${itName} uninstallLocalPlugin success.`);
        expect().assertFail();
        done();
        hilog.info(DOMAIN, TAG, `${itName} end.`);
      }).catch((e: Error) => {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `${itName} uninstallLocalPlugin fail. code: ${err?.code}, msg: ${err?.message}`);
        expect(err?.code).assertEqual(17700092);
        done();
      })
    })
  })
}