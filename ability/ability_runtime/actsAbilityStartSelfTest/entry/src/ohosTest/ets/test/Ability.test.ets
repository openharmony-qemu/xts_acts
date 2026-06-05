/*
 * Copyright (C) 2026-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll,TestType, Size, Level , it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { common} from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';

const DOMAIN = 0x0000;

export default function ActsAbilityStartSelfTest() {
  describe('ActsAbilityStartSelfTest', () => {
    let context: common.UIAbilityContext
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelf_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartSelf_0100
     * @tc.desc   Testing Capability not support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        let deviceCapability = context.resourceManager.getDeviceCapabilitySync();
        hilog.info(DOMAIN, 'testTag', 'deviceType is ' + deviceCapability.deviceType);
        if (deviceCapability.deviceType == resourceManager.DeviceType.DEVICE_TYPE_PHONE) {
          hilog.info(DOMAIN, 'testTag', 'skip deviceType is phone');
          context.startSelf().then(() => {
            hilog.info(DOMAIN, 'testTag', 'startSelf succeed');
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, 'testTag', 'startSelf error: ' + JSON.stringify(err));
            expect(err.code).assertEqual(801);
            done();
          });
        } else {
          hilog.info(DOMAIN, 'testTag', 'skip deviceType is not phone');
          done();
        }

      } catch (err){
        hilog.info(DOMAIN, 'testTag', 'startSelf err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}