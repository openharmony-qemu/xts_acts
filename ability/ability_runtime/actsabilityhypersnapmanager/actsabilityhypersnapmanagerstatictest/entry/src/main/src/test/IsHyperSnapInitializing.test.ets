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
import hyperSnapManager from '@ohos.app.ability.hyperSnapManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

const TAG: string = 'IsHyperSnapInitializingStatic';
const ERR_SERVICE: number = 16000050;

function catchErrCode(e: Object): number {
  let be: BusinessError = e as BusinessError;
  return be.code;
}

export default function isHyperSnapInitializingTest(): void {
  describe('IsHyperSnapInitializingStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_IsInitializing_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_IsInitializing_static_0100
     * @tc.desc   isHyperSnapInitializing returns boolean true/false, or BusinessError 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_IsInitializing_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let errCode: number = -1;
        let initializing: boolean = false;
        try {
          initializing = await hyperSnapManager.isHyperSnapInitializing();
        } catch (e) {
          errCode = catchErrCode(e as Object);
        }
        if (errCode !== -1) {
          hilog.info(0x0000, TAG, 'isHyperSnapInitializing catch=%{public}d', errCode);
          expect(errCode).assertEqual(ERR_SERVICE);
          return;
        }
        hilog.info(0x0000, TAG, 'isHyperSnapInitializing=%{public}d', initializing ? 1 : 0);
        if (initializing) {
          expect(initializing).assertTrue();
        } else {
          expect(initializing).assertFalse();
        }
      });
  });
}
