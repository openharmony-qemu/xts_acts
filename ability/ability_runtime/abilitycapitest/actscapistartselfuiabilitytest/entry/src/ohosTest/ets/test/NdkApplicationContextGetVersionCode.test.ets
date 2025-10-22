/*
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityTest';

export default function NdkApplicationContextGetVersionCode() {
  describe('NdkApplicationContextGetVersionCode', () => {
    beforeAll(() => {
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0100
     * @tc.name   : SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0100
     * @tc.desc   : To verify  use ApplicationContextGetVersionCode get right VersionCode.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkApplicationContextGetVersionCode_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(applicationContext.applicationInfo.versionCode);
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0200
     * @tc.name   : SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0200
     * @tc.desc   : To verify use ApplicationContextGetVersionCode with nullptr will return 401.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkApplicationContextGetVersionCode_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
    });
  })
}