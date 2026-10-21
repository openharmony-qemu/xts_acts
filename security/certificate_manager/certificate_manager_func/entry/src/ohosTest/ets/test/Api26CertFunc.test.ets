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

import certManager from '@ohos.security.certManager';
import certManagerDialog from '@ohos.security.certManagerDialog';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { GlobalContext } from '../../../../src/main/ets/pages/HomePage';
import type common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import bundleManager from '@ohos.bundle.bundleManager';

function generateString(len: number): string {
  let str: string = 'a';
  return str.repeat(len);
}

function generateUint8Array(len: number): Uint8Array {
  return new Uint8Array(len);
}

async function sleep(timeout: number): Promise<void> {
  await new Promise<void> ((resolve, reject) => {
    setTimeout(() => {
      resolve(undefined);
    }, timeout)
  })
}

export default function api26CertFuncTestUnit() {
  describe('api26CertFuncTestUnit', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async() => {
      await sleep(1000);
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0010
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0010
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0010 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0010 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0010 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0020
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0020
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with null dialogInfo return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0020 start');
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(null, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0020 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0030
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0030
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with undefined dialogInfo return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0030 start');
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(undefined, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0030 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0040
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0040
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with null ukeyAuthRequest return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0040 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, null);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0040 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0050
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0050
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with undefined ukeyAuthRequest return 29700006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0050 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, undefined);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0050 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(certManagerDialog.CertificateDialogErrorCode.ERROR_PARAMETER_VALIDATION_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0070
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0070
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with AbilityType 999 return 29700006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0070 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: 999 as certManagerDialog.AbilityType,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0070 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(certManagerDialog.CertificateDialogErrorCode.ERROR_PARAMETER_VALIDATION_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0080
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0080
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with abilityName length 0 return 29700006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0080 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: '',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0080 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(29700006);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0090
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0090
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with abilityName length 256 return 29700003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0090 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: generateString(256),
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0090 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(29700003);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0100
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0100
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with abilityName length 257 return 29700006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0100 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: generateString(257),
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0100 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(29700006);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0110
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0110
     * @tc.desc   Verify AbilityType.UKEY_AUTH_EXTENSION_ABILITY equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0110 start');
      expect(certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY).assertEqual(1);
      expect(bundleManager.ExtensionAbilityType.UKEY_AUTH).assertEqual(40);
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0120
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0120
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with keyUri length 0 return 29700006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0120 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: '',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0120 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(29700006);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0130
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0130
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with keyUri length 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0130 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: generateString(255),
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0130 success');
      } catch (err) {
        if (err.code === 29700005) {
          expect(err.code).assertEqual(29700005);
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0130 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0140
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0140
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with keyUri length 256 return 29700006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0140 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: generateString(256),
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0140 error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(29700006);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0150
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0150
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with customData length 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0150 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        customData: generateUint8Array(2048),
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0150 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0150 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0160
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0160
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with customData length 2049 return 29700006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0160 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        customData: generateUint8Array(2049),
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0160 failed. code:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(29700006);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0170
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0170
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with timeoutDuration 179 return 29700003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0170 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        timeoutDuration: 179,
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0170 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0170 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0180
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0180
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with timeoutDuration 180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0180 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        timeoutDuration: 180,
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0180 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0180 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0190
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0190
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with timeoutDuration 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0190 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        timeoutDuration: 300,
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0190 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0190 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0200
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0200
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with timeoutDuration 600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0200 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        timeoutDuration: 600,
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0200 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0200 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0210
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0210
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with timeoutDuration 601 return 29700003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0210 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        timeoutDuration: 601,
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0210 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0210 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0220
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0220
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with only keyUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0220 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0220 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0220 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0230
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0230
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with keyUri and customData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0230 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        customData: generateUint8Array(100),
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0230 success');
      } catch (err) {
        if(err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005)
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0230 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0240
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0240
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with keyUri and timeoutDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0240 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        timeoutDuration: 300,
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0240 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0240 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0250
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0250
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with auto cancel dialog return 29700002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0250 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthCancelDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0250 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0250 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(29700002);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0260
     * @tc.number SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0260
     * @tc.desc   Call openAuthDialogForUkeyProvider interface with timeout dialog return 29700009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0260 start');
      let dialogInfo: certManagerDialog.UkeyAuthDialogInfo = {
        abilityType: certManagerDialog.AbilityType.UKEY_AUTH_EXTENSION_ABILITY,
        abilityName: 'UkeyAuthTimeoutDialogAbility',
      };
      let ukeyAuthRequest: certManagerDialog.UkeyAuthRequest = {
        keyUri: 'test',
        timeoutDuration: 179,
      };
      try {
        await certManagerDialog.openAuthDialogForUkeyProvider(dialogInfo, ukeyAuthRequest);
        console.info('SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0260 success');
      } catch (err) {
        if (err.code === 29700005) {
          console.info("Only the PC/2in1 device can open the dialog box of the UkeyAuthExtensionAbility type.");
          expect(err.code).assertEqual(29700005);
        } else {
          console.error(`SUB_Security_CertManager_OpenAuthDialogForUkeyProvider_Func_0260 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(29700009);
        }
      }
      done();
    });
  })
}
