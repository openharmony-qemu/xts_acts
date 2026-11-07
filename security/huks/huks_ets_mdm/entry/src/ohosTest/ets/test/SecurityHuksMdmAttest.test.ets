/*
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import huks from '@ohos.security.huks';
import { Logger } from './utils/common/Logger';

export default function SecurityHuksMdmAttestTest(): void {
  describe('SecurityHuksMdmAttestTest', () => {
    /**
     * @tc.name   SUB_Security_HUKS_EnterpriseAttestKey_API26_Func_0100
     * @tc.number SUB_Security_HUKS_EnterpriseAttestKey_API26_Func_0100
     * @tc.desc   TC-002: attest an ECC/256 key with ENTERPRISE_ATTEST_KEY and check a 4-item certificate chain.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_EnterpriseAttestKey_API26_Func_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const testNumber: string = 'SUB_Security_HUKS_EnterpriseAttestKey_API26_Func_0100';
        const keyAlias: string = 'tc002-huks-attest-key';
        const genKeyProperties: Array<huks.HuksParam> = [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_ECC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 256
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN |
              huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
          }
        ];
        const genKeyOptions: huks.HuksOptions = {
          properties: genKeyProperties
        };
        const attestOptions: huks.HuksOptions = {
          properties: [
            {
              tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
              value: new Uint8Array([
                0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
                0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff
              ])
            },
            {
              tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
              value: new Uint8Array(Array.from(keyAlias, (ch: string) => ch.charCodeAt(0)))
            }
          ]
        };

        let keyGenerated: boolean = false;
        const cleanupKey: () => Promise<void> = async () => {
          if (keyGenerated) {
            try {
              await huks.deleteKeyItem(keyAlias, genKeyOptions);
              expect(await huks.hasKeyItem(keyAlias, genKeyOptions)).assertFalse();
              keyGenerated = false;
            } catch (err) {
              Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
              expect(null).assertFail();
            }
          }
        };
        try {
          await huks.generateKeyItem(keyAlias, genKeyOptions);
          keyGenerated = true;
          expect(await huks.hasKeyItem(keyAlias, genKeyOptions)).assertTrue();

          const attestResult: huks.HuksReturnResult = await huks.attestKeyItem(keyAlias, attestOptions);
          const certChains: Array<string> = attestResult.certChains as Array<string>;
          expect(certChains !== null && certChains !== undefined).assertTrue();
          expect(certChains.length).assertEqual(4);
          await cleanupKey();
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
          await cleanupKey();
        }
      });
  });
}
