/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { GenParam, MergeOptions, SetParam, GetEmptyOptions, GetParam } from './utils/huks/HuksOptionsUtils';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils';
import { BuildCipherData, Cipher, CipherData, DoCipher, GetEcbNoPaddingOptions, GetSm3NoPaddingOptions } from './utils/huks/CipherUtils';
import { GetAesImportData, GetDesImportData, GetRsaImportData, GetImportPubKeyOptions, GetImportKeyPairOptions } from './utils/huks/ImportKeyUtils';
import { SignVerify, SignVerifyData } from './utils/huks/SignVerifyUtils';
import { Logger } from './utils/common/Logger';
import { GetAesGenerateOptions, GetSm2GenerateOptions, GetSm4GenerateOptions, GetEccGenerateOptions, GetDsaGenerateOptions, GetDhGenerateOptions, GetEd25519GenerateOptions, GetRsaGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { BuildSm2WrappedKeyData, GetSm2RawKeyPairData, GetRsaKeyPairData, GetEccRawKeyPairData, GetDhRawKeyPairData, GetEd25519RawKeyPairData } from './utils/huks/ImportWrappedKeyUtils';
import { HuksMinGroupId, HuksDefaultKeyVersion, HuksDefaultOsVersion, HuksDefaultOsPatchLevel } from './utils/huks/HuksCommonUtils';
import { GetAccessGroupOptions, GetUserAuthOptions } from './utils/huks/AccessControlUtils';


export default function SecurityHuksImportTest() {

  describe('SecurityHuksImportTest', () => {

    /**
         * @tc.name   SUB_Security_HUKS_Import_API16_Func_0100
         * @tc.number SUB_Security_HUKS_Import_API16_Func_0100
         * @tc.desc   import RSA1032 key pair, encrypt and decrypt
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it('SUB_Security_HUKS_Import_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0100";
      let keySize = 1032;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0200
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0200
     * @tc.desc   import RSA1032 key pair, sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0200";
      let keySize = 1032;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      let signVerifyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
        ]
      }
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0300
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0300
     * @tc.desc   import RSA2040 key pair, encrypt and decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0300";
      let keySize = 2040;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0400
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0400
     * @tc.desc   import RSA2040 key pair, sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0400";
      let keySize = 2040;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      let signVerifyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
        ]
      }
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0500
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0500
     * @tc.desc   import RSA key with invalid key size 1016, expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0500";
      let keySize = 1016;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(keySize)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0600
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0600
     * @tc.desc   import RSA key with key size 2056 mismatching key data, expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0600";
      let keySize = 2056;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
          GenParam(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE, huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR),
        ],
        inData: GetRsaImportData(1032)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0700
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0700
     * @tc.desc   import DES64 key, encrypt and decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0700";
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_DES_KEY_SIZE_64),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT),
        ],
        inData: GetDesImportData(64)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_DES_KEY_SIZE_64),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0800
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0800
     * @tc.desc   import DES key with invalid key size 128, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0800";
      let keySize = 128;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_0900
     * @tc.number SUB_Security_HUKS_Import_API16_Func_0900
     * @tc.desc   import 3DES128 key, encrypt and decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_0900";
      let keySize = 128;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_1000
     * @tc.number SUB_Security_HUKS_Import_API16_Func_1000
     * @tc.desc   import 3DES192 key, encrypt and decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_1000";
      let keySize = 192;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      let cipherOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
      let cipherData: CipherData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
      }
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
         * @tc.name   SUB_Security_HUKS_Import_API16_Func_1100
         * @tc.number SUB_Security_HUKS_Import_API16_Func_1100
         * @tc.desc   import 3DES key with invalid key size 64, expect error 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it('SUB_Security_HUKS_Import_API16_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_1100";
      let keySize = 64;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Import_API16_Func_1200
     * @tc.number SUB_Security_HUKS_Import_API16_Func_1200
     * @tc.desc   import 3DES key with invalid key size 256, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Import_API16_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Import_API16_Func_1200";
      let keySize = 256;
      let importKeyOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_3DES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ],
        inData: GetDesImportData(keySize)
      };
      try {
        await huks.importKeyItem(testNumber, importKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0100
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0100
     * @tc.desc   SM2-SM4 digital envelope secure import AES128 key, verify key exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0100";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 128;
      let plainKeyData = GetAesImportData(plainKeySize);
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0200
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0200
     * @tc.desc   SM2-SM4 digital envelope secure import AES256 key, verify key exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0200";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let plainKeyData = GetAesImportData(plainKeySize);
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0300
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0300
     * @tc.desc   SM2-SM4 digital envelope secure import SM2 key pair, verify key exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0300";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let plainKeyData = GetSm2RawKeyPairData(plainKeySize).priKey;
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = MergeOptions(GetSm2GenerateOptions(plainKeySize), GetImportKeyPairOptions());
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, GetSm2RawKeyPairData(plainKeySize).pubKey);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0400
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0400
     * @tc.desc   SM2-SM4 digital envelope secure import SM2 key pair with sign/verify purpose, verify key exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0400";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let plainKeyData = GetSm2RawKeyPairData(plainKeySize).priKey;
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = MergeOptions(GetSm2GenerateOptions(plainKeySize), GetImportKeyPairOptions());
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, GetSm2RawKeyPairData(plainKeySize).pubKey);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0500
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0500
     * @tc.desc   SM2-SM4 digital envelope secure import RSA2048 key pair for encryption/decryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0500";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 2048;
      let keyPairData = GetRsaKeyPairData(plainKeySize);
      let plainKeyData = keyPairData.priKey;
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = MergeOptions(GetRsaGenerateOptions(plainKeySize), GetImportKeyPairOptions());
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, keyPairData.pubKey);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0600
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0600
     * @tc.desc   SM2-SM4 digital envelope secure import ECC256 key pair for key agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0600";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let keyPairData = GetEccRawKeyPairData(plainKeySize);
      let plainKeyData = keyPairData.priKey;
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = MergeOptions(GetEccGenerateOptions(plainKeySize), GetImportKeyPairOptions());
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, keyPairData.pubKey);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0700
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0700
     * @tc.desc   SM2-SM4 digital envelope secure import DSA1024 key pair, expect failure with error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0700";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 1024;
      let keyPairData = GetRsaKeyPairData(2048);
      let plainKeyData = keyPairData.priKey;
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = MergeOptions(GetDsaGenerateOptions(plainKeySize), GetImportKeyPairOptions());
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, keyPairData.pubKey);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        Logger.error(testNumber + ': DSA import should fail but succeeded');
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch expected error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0800
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0800
     * @tc.desc   SM2-SM4 digital envelope secure import DH2048 key pair for key agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0800";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 2048;
      let keyPairData = GetDhRawKeyPairData(plainKeySize);
      let plainKeyData = keyPairData.priKey;
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = MergeOptions(GetDhGenerateOptions(plainKeySize), GetImportKeyPairOptions());
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, keyPairData.pubKey);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_0900
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_0900
     * @tc.desc   SM2-SM4 digital envelope secure import ED25519 key pair for sign/verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_0900";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let keyPairData = GetEd25519RawKeyPairData(plainKeySize);
      let plainKeyData = keyPairData.priKey;
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = MergeOptions(GetEd25519GenerateOptions(plainKeySize), GetImportKeyPairOptions());
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, keyPairData.pubKey);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_1000
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_1000
     * @tc.desc   SM2-SM4 digital envelope secure import SM2 public key, expect fail with error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_1000";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let keyPairData = GetSm2RawKeyPairData(plainKeySize);
      let plainKeyData = keyPairData.priKey;
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = MergeOptions(GetSm2GenerateOptions(plainKeySize), GetImportPubKeyOptions());
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, keyPairData.pubKey);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);

        let options = MergeOptions(GetSm2GenerateOptions(256), GetSm3NoPaddingOptions())
        let cipherData = await DoCipher(keyAlias, options, BuildCipherData([64]));
        SetParam(options, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        cipherData = await DoCipher(keyAlias, options, cipherData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch expected error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_1100
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_1100
     * @tc.desc   SM2-SM4 digital envelope secure import AES key with KEY_SIZE 192 mismatching key data, expect failure with error code 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_1100";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let plainKeyData = GetAesImportData(plainKeySize);
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_KEY_SIZE, 192);
      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_1200
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_1200
     * @tc.desc   SM2-SM4 digital envelope secure import AES256 key with access group, verify key exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_1200";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let plainKeyData = GetAesImportData(plainKeySize);
      let baseKeyOptions: huks.HuksOptions = GetAccessGroupOptions(HuksMinGroupId);
      let genKeyOptions: huks.HuksOptions = MergeOptions(GetSm2GenerateOptions(256), baseKeyOptions);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      MergeOptions(importWrappedKeyOptions, baseKeyOptions);
      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        expect(await huks.hasKeyItem(keyAlias, importWrappedKeyOptions)).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_ImportKey_API23_Func_1300
     * @tc.number SUB_Security_HUKS_ImportKey_API23_Func_1300
     * @tc.desc   SM2-SM4 digital envelope secure import AES256 key with secondary access control, verify key exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ImportKey_API23_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API23_Func_1300";
      let keyAlias: string = testNumber;
      let sourceKeyAlias: string = testNumber + "SourceKeyAlias";

      let plainKeySize: number = 256;
      let plainKeyData = GetAesImportData(plainKeySize);
      let baseKeyOptions: huks.HuksOptions = GetEmptyOptions();
      let genKeyOptions: huks.HuksOptions = GetSm2GenerateOptions(256);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let importWrappedKeyOptions: huks.HuksOptions = GetAesGenerateOptions(plainKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING);

      await huks.generateKeyItem(sourceKeyAlias, genKeyOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(sourceKeyAlias, genKeyOptions)).outData as Uint8Array;
      importWrappedKeyOptions.inData = await BuildSm2WrappedKeyData(deviceAPubKeyData, plainKeyData);

      MergeOptions(importWrappedKeyOptions, baseKeyOptions, GetUserAuthOptions());
      try {
        await huks.importWrappedKeyItem(keyAlias, sourceKeyAlias, importWrappedKeyOptions);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(keyAlias, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE)).assertEqual(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE)).assertEqual(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE)).assertEqual(huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_ALWAYS_VALID);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

  }
  )
}