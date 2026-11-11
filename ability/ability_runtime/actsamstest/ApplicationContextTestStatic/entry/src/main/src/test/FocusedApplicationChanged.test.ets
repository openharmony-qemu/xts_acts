'use static';
/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
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
import { describe, expect, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { appManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';

const TAG: string = 'FocusedApplicationChangedStatic';
const ERR_PERMISSION: number = 201;
const ERR_INTERNAL: number = 16000050;
const ERR_OBSERVER_LIMIT: number = 16000165;
const ERR_OBSERVER_NOT_EXIST: number = 16300004;

function isFocusedOnErr(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_INTERNAL || code === ERR_OBSERVER_LIMIT;
}

function isFocusedOffErr(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_INTERNAL || code === ERR_OBSERVER_NOT_EXIST;
}

function businessErrCode(err: Object): number {
  let be: BusinessError = err as BusinessError;
  return be.code;
}

function assertFocusedInfo(info: appManager.FocusedApplicationInfo): void {
  expect(typeof info.focusedBundleName).assertEqual('string');
  // focusedUid is int in static SDK; typeof is not 'number'
  expect(info.focusedUid >= 0).assertTrue();
}

export default function focusedApplicationChangedStaticTest(): void {
  describe('FocusedApplicationChangedStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OnFocused_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OnFocused_static_0100
     * @tc.desc   onFocusedApplicationChanged returns observerId; callback asserts Info fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OnFocused_static_0100', Level.LEVEL0,
      (): void => {
        let observer: appManager.FocusedApplicationObserver = {
          onFocusedApplicationChanged(info: appManager.FocusedApplicationInfo): void {
            assertFocusedInfo(info);
          }
        };
        try {
          let observerId: Int = appManager.onFocusedApplicationChanged(observer);
          expect(observerId !== undefined).assertTrue();
          try {
            appManager.offFocusedApplicationChanged(observerId);
          } catch (eOff) {
            expect(isFocusedOffErr(businessErrCode(eOff as Object))).assertTrue();
          }
        } catch (err) {
          let code: number = businessErrCode(err as Object);
          hilog.info(0x0000, TAG, 'on err=%{public}d', code);
          expect(isFocusedOnErr(code)).assertTrue();
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OffFocused_static_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OffFocused_static_0200
     * @tc.desc   offFocusedApplicationChanged(-1) expects 16300004 or 201/16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OffFocused_static_0200', Level.LEVEL0,
      (): void => {
        try {
          appManager.offFocusedApplicationChanged(-1 as Int);
          expect().assertFail();
        } catch (err) {
          expect(isFocusedOffErr(businessErrCode(err as Object))).assertTrue();
        }
      });
  });
}
