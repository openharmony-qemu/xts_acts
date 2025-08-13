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
import Utils from './Util.test';
import { BusinessError } from '@ohos.base'
import { ShortcutInfo } from 'bundleManager.ShortcutInfo';
import i18n from '@ohos.i18n';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import launcherBundleManager from '@ohos.bundle.launcherBundleManager';
import { LauncherAbilityInfo } from 'bundleManager.LauncherAbilityInfo';

let domain: int = 0x0000;
let tag: string = 'testtag';
const BUNDLE_NAME2 = 'ohos.acts.bms.getlauncherabilityinfo.test.static';
const TEST_SUITE_NAME = 'launcherBundleManagerTest'

export default function actsGetLauncherAbilityInfoTest() {

  describe("ActsGetLauncherAbilityInfoTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /*
     * @tc.number: Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100
     * @tc.name: Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100
     * @tc.desc: Test getLauncherAbilityInfoSync with valid value.
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100';
      try {
        hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
        let data = launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME2, 100);
        // hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+' getLauncherAbilityInfoSync success, result is: %{public}s', JSON.stringify(data));
        console.log('getLauncherAbilityInfoSync success');
        expect(data[0].labelId).assertLarger(0.0);
        expect(data[0].iconId).assertLarger(0.0);
        expect(data[0].userId).assertEqual(100);
        expect(data[0].installTime).assertLarger(0.0);
        expect(data[0].elementName.deviceId).assertEqual("");
        expect(data[0].elementName.bundleName).assertEqual(BUNDLE_NAME2);
        expect(data[0].elementName.moduleName).assertEqual("entry");
        expect(data[0].elementName.abilityName).assertEqual('EntryAbility');
        expect(data[0].elementName.shortName).assertEqual('');
        expect(data[0].elementName.uri).assertEqual('/ohos.acts.bms.getlauncherabilityinfo.test.static/entry/EntryAbility');
        done();
        hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
      } catch (errData) {
        // hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+' getLauncherAbilityInfoSync failed, result is: %{public}s', JSON.stringify(err));
        console.log('getLauncherAbilityInfoSync failed');
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
      }
    });

    /*
     * @tc.number: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200
     * @tc.name: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200
     * @tc.desc: Test getLauncherAbilityInfoSync with bundle name is not found return errcode 17700001.
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200';
        try {
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
          let data = launcherBundleManager.getLauncherAbilityInfoSync('ohos.acts.bms.getlauncherabilityinfo.test.static.test200', 100);
          expect().assertFail();
          done();
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.info(0x0000, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200",
            `errData is errCode:${code} message:${errMsg}`);
          if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect(code).assertEqual(17700001);
            done();
          }
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        }
      });

    /*
     * @tc.number: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300
     * @tc.name: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300
     * @tc.desc: Test getLauncherAbilityInfoSync with user ID is not found return errcode 17700004.
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300';
        try {
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
          let data = launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME2, 111);
          expect().assertFail();
          done();
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.info(0x0000, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300",
            `errData is errCode:${code} message:${errMsg}`);
          if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect(code).assertEqual(17700004);
            done();
          }
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        }
      });
  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');
}