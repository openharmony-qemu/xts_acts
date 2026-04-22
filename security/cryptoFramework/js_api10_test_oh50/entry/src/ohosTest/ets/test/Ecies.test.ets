/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { decToHexString } from './utils/common/commonUtils';
import { buffer } from '@kit.ArkTS';

export default function SecurityCryptoFwEciesTestUnit() {
  describe('SecurityCryptoFwEciesTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {

      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name SUB_Security_CryptoFramework_Ecies_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Ecies_Func_0100
     * @tc.desc convertKey
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it("SUB_Security_CryptoFramework_Ecies_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        try {
          let eccCommonSpec: cryptoFramework.ECCCommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec("NID_X9_62_prime192v1");
          let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = {
            algName: "ECC",
            specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC,
            params: eccCommonSpec,
            sk: BigInt("0x9ebc0975033b0330bc461613ddd59a9e42ea06efb1997dc6")
          }
          let generator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpec);
          let priKey: cryptoFramework.PriKey = await generator.generatePriKey();
          // peer
          let eccPriKeySpecPeer: cryptoFramework.ECCPriKeySpec = {
            algName: "ECC",
            specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC,
            params: eccCommonSpec,
            sk: BigInt("0x5c7d5155376ed3cef3f851314cca479187771c89edd7ad13")
          }
          let generatorPeer: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccPriKeySpecPeer);
          let priKeyPeer: cryptoFramework.PriKey = await generatorPeer.generatePriKey();
          let pubKeyPeer: cryptoFramework.PubKey = await priKeyPeer.getPubKey();

          let agreeGenerator: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement("ECC192");
          let secret: cryptoFramework.DataBlob = await agreeGenerator.generateSecret(priKey, pubKeyPeer);
          console.error("+++++++++++++ secret:" + decToHexString(secret))

          let x963Params: cryptoFramework.X963KdfSpec = {
            algName: "X963KDF",
            keySize: 16,
            key: secret.data,
            info: new Uint8Array([])
          };

          let kdfGenerator: cryptoFramework.Kdf = cryptoFramework.createKdf("X963KDF|SHA1");
          let kdfSecret: cryptoFramework.DataBlob = await kdfGenerator.generateSecret(x963Params);
          console.error("+++++++++++++ kdfSecret:" + decToHexString(kdfSecret))

          let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator("AES128");
          let symKey: cryptoFramework.SymKey = await symKeyGenerator.convertKey(kdfSecret);

          let iv: cryptoFramework.DataBlob = {data: new Uint8Array(
            [
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
          ]
          )};
          let paramSpec: cryptoFramework.GcmParamsSpec = {
            iv: iv,
            algName: "GcmParamsSpec",
            aad: {data: new Uint8Array([])},
            authTag: {data: new Uint8Array(16)}
          };

          let msg: cryptoFramework.DataBlob = {
            data: new Uint8Array( // f04e8860e6b86552cfa933c387
              // [0xf0, 0x4e, 0x88, 0x60, 0xe6, 0xb8, 0x65, 0x52, 0xcf, 0xa9, 0x33, 0xc3, 0x87]
              // [0x10, 0xed, 0xae, 0x23, 0x8e, 0xad, 0xea, 0x47, 0x5b, 0x4c, 0x4b, 0x0b, 0x3c]
              buffer.from('f04e8860e6b86552cfa933c387', 'hex').buffer
            )}
          let encCipher: cryptoFramework.Cipher = cryptoFramework.createCipher("AES128|GCM");
          await encCipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
          let cipherText: cryptoFramework.DataBlob = await encCipher.update(msg);
          // console.error("+++++++++++++ cipherText:" + decToHexString(cipherText))
          console.error("+++++++++++++ cipherText:" + buffer.from(cipherText.data).toString('hex'))
          ".di=di_SHA1,\n" +
            "    .curve=&ccec_cp_192,\n" +
            "    .mac_length = 16,\n" +
            "    .key_length = 16,\n" +
            "    // Decryption private key\n" +
            "    .dec_priv_key = \"9ebc0975033b0330bc461613ddd59a9e42ea06efb1997dc6\",\n" +
            "    //Qsx = 5f906901924c87fa6b24ec4b8f6fd22bb8b78f30f6a32738\n" +
            "    //Qsy = f00cb3613ad1ec9bb667db4167f8464749c519eb3e12acde\n" +
            "    // Ephemeral private key\n" +
            "    .eph_priv_key = \"5c7d5155376ed3cef3f851314cca479187771c89edd7ad13\",\n" +
            "    //Qex = fd2af653b5de1437ba0c4b3b301e00909aeee462a01a558a\n" +
            "    //Qey = 48d1ea67729bc3ee1a55d3e889865777c5ca99e2045ab4c9\n" +
            "    //Z = f1b9ec8da4c8a8d7ed27bfe2a798646cb64fcc37f2504cf7\n" +
            "    //KDF(Z,00000001,\"\") = 99fbfc5106a564cf425d64a46d068327\n" +
            "    .message = \"f04e8860e6b86552cfa933c387\",\n" +
            "    // Encrypted message = 10edae238eadea475b4c4b0b3c\n" +
            "    // Mac Tag = 149ad359e4af0118ee89e6165342c164"
        } catch (error) {
          console.error(`“${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  })
}