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
import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium-dynamic';
import huks from '@ohos.security.huks';
import * as huksCallback from './utils/huks/HuksCallbackUtils';
import { GetRsaGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils';
import { MergeOptions, SetInData, SetParam, GenParam } from './utils/huks/HuksOptionsUtils';
import {
  BuildCipherData,
  CipherData,
  CompareCipherData,
  DoCipher,
  DoCipherCallback,
  GetEcbNoPaddingOptions,
  GetEcbOaepSha256Options,
  GetEcbOaepSha384Options,
  GetEcbOaepSha512Options,
  GetEcbPkcs1Options,
  ReBuildCipherData,
  Cipher,
} from './utils/huks/CipherUtils';
import { Logger } from './utils/common/Logger';

export default function SecurityHuksCipherRsa() {
  describe('SecurityHuksCipherRsa', () => {
    /**
     * @tc.name   Security_HUKS_Cipher_API9_RSA_001
     * @tc.number Security_HUKS_Cipher_API9_RSA_001
     * @tc.desc   Security_HUKS_Cipher_API9_RSA_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_RSA_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_001';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([64, 64, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipherCallback(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [64, encryptResult.finishData!.length - 1 * 64, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipherCallback(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_RSA_002
     * @tc.number Security_HUKS_Cipher_API9_RSA_002
     * @tc.desc   Security_HUKS_Cipher_API9_RSA_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_RSA_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_RSA_002';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let initRes = await huksCallback.initSession(srcKeyAlias, cipherOptions);
        SetInData(cipherOptions, StringToUint8Array(GetDataBySize(512)));
        await huksCallback.updateSession(initRes.handle, cipherOptions);
        await huksCallback.abortSession(initRes.handle, cipherOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_RSA_003
     * @tc.number Security_HUKS_Cipher_API9_RSA_003
     * @tc.desc   Security_HUKS_Cipher_API9_RSA_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_RSA_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_RSA_003';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([128]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipherCallback(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipherCallback(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_RSA_004
     * @tc.number Security_HUKS_Cipher_API9_RSA_004
     * @tc.desc   Security_HUKS_Cipher_API9_RSA_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_RSA_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_RSA_004';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let initRes = await huksCallback.initSession(srcKeyAlias, cipherOptions);
        SetInData(cipherOptions, StringToUint8Array(GetDataBySize(64)));
        await huksCallback.updateSession(initRes.handle, cipherOptions);
        await huksCallback.abortSession(initRes.handle, cipherOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_RSA_101
     * @tc.number Security_HUKS_Cipher_API9_RSA_101
     * @tc.desc   Security_HUKS_Cipher_API9_RSA_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_RSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_AES_101';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([64, 64, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [64, encryptResult.finishData!.length - 1 * 64, 0]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_RSA_102
     * @tc.number Security_HUKS_Cipher_API9_RSA_102
     * @tc.desc   Security_HUKS_Cipher_API9_RSA_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_RSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_RSA_102';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
        SetInData(cipherOptions, StringToUint8Array(GetDataBySize(512)));
        await huks.updateSession(initRes.handle, cipherOptions);
        await huks.abortSession(initRes.handle, cipherOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_RSA_103
     * @tc.number Security_HUKS_Cipher_API9_RSA_103
     * @tc.desc   Security_HUKS_Cipher_API9_RSA_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_RSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_RSA_103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([128]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_Cipher_API9_RSA_104
     * @tc.number Security_HUKS_Cipher_API9_RSA_104
     * @tc.desc   Security_HUKS_Cipher_API9_RSA_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_Cipher_API9_RSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_Cipher_API9_RSA_104';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(1024));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(1024), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let initRes = await huks.initSession(srcKeyAlias, cipherOptions);
        SetInData(cipherOptions, StringToUint8Array(GetDataBySize(512)));
        await huks.updateSession(initRes.handle, cipherOptions);
        await huks.abortSession(initRes.handle, cipherOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize4096PADDINGNONESHA256KeyAlias103
     * @tc.number testCipherRSASize4096PADDINGNONESHA256KeyAlias103
     * @tc.desc   testCipherRSASize4096PADDINGNONESHA256KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize4096PADDINGNONESHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(4096), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([64, 64, 64, 64, 64, 64, 64, 64]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [64, 64, 64, 64, 64, 64, 64, 64]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103
     * @tc.number testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103
     * @tc.desc   testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbPkcs1Options(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(4096), GetEcbPkcs1Options());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103
     * @tc.number testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103
     * @tc.desc   testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha256Options(), GetRsaGenerateOptions(4096));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(4096), GetEcbOaepSha256Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103
     * @tc.number testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103
     * @tc.desc   testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha384Options(), GetRsaGenerateOptions(4096));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(4096), GetEcbOaepSha384Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103
     * @tc.number testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103
     * @tc.desc   testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha512Options(), GetRsaGenerateOptions(4096));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(4096), GetEcbOaepSha512Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize3072PADDINGNONESHA256KeyAlias103
     * @tc.number testCipherRSASize3072PADDINGNONESHA256KeyAlias103
     * @tc.desc   testCipherRSASize3072PADDINGNONESHA256KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize3072PADDINGNONESHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(3072), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([64, 64, 64, 64, 64, 64]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [64, 64, 64, 64, 64, 64]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103
     * @tc.number testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103
     * @tc.desc   testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbPkcs1Options(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(3072), GetEcbPkcs1Options());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103
     * @tc.number testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103
     * @tc.desc   testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha256Options(), GetRsaGenerateOptions(3072));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(3072), GetEcbOaepSha256Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103
     * @tc.number testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103
     * @tc.desc   testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha384Options(), GetRsaGenerateOptions(3072));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(3072), GetEcbOaepSha384Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize3072PADDINGOAEPSHA512KeyAlias103
     * @tc.number testCipherRSASize3072PADDINGOAEPSHA512KeyAlias103
     * @tc.desc   testCipherRSASize3072PADDINGOAEPSHA512KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize3072PADDINGOAEPSHA512KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha512Options(), GetRsaGenerateOptions(3072));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(3072), GetEcbOaepSha512Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize2048PADDINGNONESHA256KeyAlias103
     * @tc.number testCipherRSASize2048PADDINGNONESHA256KeyAlias103
     * @tc.desc   testCipherRSASize2048PADDINGNONESHA256KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize2048PADDINGNONESHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbNoPaddingOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(2048), GetEcbNoPaddingOptions());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([64, 64, 64, 64]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        encryptResult.updateDataArr = [];
        ReBuildCipherData(encryptResult, [64, 64, 64, encryptResult.finishData!.length - 3 * 64]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);
        decryptResult.updateDataArr = [];

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize2048PADDINGPKCS1_V1_5SHA384KeyAlias103
     * @tc.number testCipherRSASize2048PADDINGPKCS1_V1_5SHA384KeyAlias103
     * @tc.desc   testCipherRSASize2048PADDINGPKCS1_V1_5SHA384KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize2048PADDINGPKCS1_V1_5SHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize2048PADDINGPKCS1_V1_5SHA384KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbPkcs1Options(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384)
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(2048), GetEcbPkcs1Options());
      SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103
     * @tc.number testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103
     * @tc.desc   testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha256Options(), GetRsaGenerateOptions(2048));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(2048), GetEcbOaepSha256Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103
     * @tc.number testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103
     * @tc.desc   testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha384Options(), GetRsaGenerateOptions(2048));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(2048), GetEcbOaepSha384Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testCipherRSASize2048PADDINGOAEPSHA512KeyAlias103
     * @tc.number testCipherRSASize2048PADDINGOAEPSHA512KeyAlias103
     * @tc.desc   testCipherRSASize2048PADDINGOAEPSHA512KeyAlias103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCipherRSASize2048PADDINGOAEPSHA512KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetEcbOaepSha512Options(), GetRsaGenerateOptions(2048));
      let cipherOptions = MergeOptions(GetRsaGenerateOptions(2048), GetEcbOaepSha512Options());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(cipherOptions, exportKeyRes.outData!));

        let cipherData: CipherData = BuildCipherData([32]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
        let encryptResult: CipherData = await DoCipher(newSrcKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        let decryptResult: CipherData = await DoCipher(srcKeyAlias, cipherOptions, encryptResult);

        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
  });
  SecurityHuksCipherRSATest()
}

function SecurityHuksCipherRSATest() {
  let genKeyOption: huks.HuksOptions;
  let cipherOption: huks.HuksOptions;

  describe('SecurityHuksCipherRSATest', () => {

    beforeEach(() => {
      genKeyOption = GetRsaGenerateOptions(1024);
      cipherOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
          GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
        ]
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0100
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0100
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0100";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0200
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0200
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0200";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA224);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0300
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0300
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0300";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 2 * 256 / 8 - 2)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0400
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0400
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0400";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 11)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0500
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0500
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0500";
      let keySize = 1032;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 11)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0600
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0600
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0600";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0700
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0700
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0700";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA224);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0800
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0800
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0800";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_0900
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_0900
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_0900";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 2 * 384 / 8 - 2)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_1000
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_1000
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1000";
      let keySize = 2040;
      let cipherData: CipherData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 11)),
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await Cipher(testNumber, cipherOption, cipherData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_1100
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_1100
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1100";
      let keySize = 1016;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_1200
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_1200
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1200";
      let keySize = 2056;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_Cipher_RSA_API16_Func_1300
     * @tc.number SUB_Security_HUKS_Cipher_RSA_API16_Func_1300
     * @tc.desc   generate key, encrypt, decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_Cipher_RSA_API16_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_Cipher_RSA_API16_Func_1300";
      let keySize = 1025;
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(12000003);
        }
      }
    })


  }
  )
}
