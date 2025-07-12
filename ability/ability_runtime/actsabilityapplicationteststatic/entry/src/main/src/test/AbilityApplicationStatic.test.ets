/**
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

import { describe, it, expect, Level } from '../../../hypium/index';
import application from '@ohos.app.ability.application';
import hilog from '@ohos.hilog';

const domain: number = 0x0000;
const tag: string = 'AbilityApplicationStaticTest';

export default function AbilityApplicationStaticTest() {


  describe('AbilityApplicationStaticTest', () => {

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_application_getApplicationContext_Static_0100
     * @tc.name : SUB_Ability_AbilityRuntime_application_getApplicationContext_Static_0100
     * @tc.desc : applicationContext obtained by application calls the processName property
     */
    it('SUB_Ability_AbilityRuntime_application_getApplicationContext_Static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const PROCESS_NAME = 'com.example.actsabilityapplicationtest.static';
        let caseName = 'SUB_Ability_AbilityRuntime_application_getApplicationContext_Static_0100';
        try {
          hilog.info(domain, tag, `${caseName} start.`);
          let applicationContext = application.getApplicationContext();
          expect(applicationContext.bundleCodeDir).assertEqual('/data/storage/el1/bundle');
          expect(applicationContext.cloudFileDir).assertEqual('/data/storage/el2/cloud');
          expect(applicationContext.distributedFilesDir).assertEqual('/data/storage/el2/distributedfiles');
          expect(applicationContext.processName).assertEqual(PROCESS_NAME);
          hilog.info(domain, tag, `${caseName} end.`)
        } catch (err: Error) {
          hilog.error(domain, tag, `${caseName} fail.`);
          expect().assertFail();
        }
        done();
      });
  })
}