'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import certManagerDialog from '@ohos.security.certManagerDialog';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function api26CertFuncTestUnit() {
  describe('api26CertFuncTestUnit', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_Static_0060
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_Static_0060
     * @tc.desc   Call openAuthDialogForUkeyProvider interface without permission return 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_Static_0060 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        expect(null).assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_Static_0060 error.code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(201);
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_Static_0060 end');
      done();
    });
  })
}
