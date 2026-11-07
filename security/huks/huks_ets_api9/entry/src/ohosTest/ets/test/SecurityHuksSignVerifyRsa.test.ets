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
import { describe, it, TestType, Size, Level, expect, beforeAll, beforeEach } from '@ohos/hypium-dynamic';
import { huks } from '@kit.UniversalKeystoreKit';
import * as huksCallback from './utils/huks/HuksCallbackUtils';
import { GetRsaGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { MergeOptions, SetParam, SetInData, CheckSoftware, CheckWearable } from './utils/huks/HuksOptionsUtils';
import {
  SignVerifyData,
  BuildSignVerifyData,
  SignVerifyReal,
  SignVerifyCallbackReal,
  GetSha256Pkcs1SignOptions,
  DoSignCallbackEndWithAbort,
  GetSha512Pkcs1SignOptions,
  DoSignEndWithAbort,
  GetMd5Pkcs1SignOptions,
  GetNoDigestPkcs1SignOptions,
  GetSha1Pkcs1SignOptions,
  GetSha224Pkcs1SignOptions,
  GetSha384Pkcs1SignOptions,
  GetSha256PssSignOptions,
  GetMd5PssSignOptions,
  GetNoDigestPssSignOptions,
  GetSha1PssSignOptions,
  GetSha224PssSignOptions,
  GetSha384PssSignOptions,
  GetSha512PssSignOptions,
  GetNoDigestNoPaddingSignOptions,
  SignVerify,
} from './utils/huks/SignVerifyUtils';
import { Logger } from './utils/common/Logger';
import { GetDataBySize, StringToUint8Array } from './utils/common/CommonUtils';
import { GetSha256Options } from './utils/huks/DeriveAgreeUtils';

export default function SecurityHuksSignVerifyRsa() {
  let useSoftware: boolean = true;
  describe('SecurityHuksSignVerifyRsa', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })
    /**
     * @tc.name   Security_HUKS_SignVerify_API9_RSA_001
     * @tc.number Security_HUKS_SignVerify_API9_RSA_001
     * @tc.desc   Security_HUKS_SignVerify_API9_RSA_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_RSA_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_RSA_001';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha256Pkcs1SignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);
        let res = await SignVerifyCallbackReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   Security_HUKS_SignVerify_API9_RSA_002
     * @tc.number Security_HUKS_SignVerify_API9_RSA_002
     * @tc.desc   Security_HUKS_SignVerify_API9_RSA_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_RSA_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_RSA_002';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha256Pkcs1SignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);
        await DoSignCallbackEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   Security_HUKS_SignVerify_API9_RSA_003
     * @tc.number Security_HUKS_SignVerify_API9_RSA_003
     * @tc.desc   Security_HUKS_SignVerify_API9_RSA_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_RSA_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_RSA_003';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha256Pkcs1SignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huksCallback.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huksCallback.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyCallbackReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   Security_HUKS_SignVerify_API9_RSA_004
     * @tc.number Security_HUKS_SignVerify_API9_RSA_004
     * @tc.desc   Security_HUKS_SignVerify_API9_RSA_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_RSA_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_RSA_004';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha256Pkcs1SignOptions());

      try {
        await huksCallback.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        await DoSignCallbackEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_RSA_101
     * @tc.number Security_HUKS_SignVerify_API9_RSA_101
     * @tc.desc   Security_HUKS_SignVerify_API9_RSA_101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_RSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_RSA_101';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha512Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_RSA_102
     * @tc.number Security_HUKS_SignVerify_API9_RSA_102
     * @tc.desc   Security_HUKS_SignVerify_API9_RSA_102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_RSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_RSA_102';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha512Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha512Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);
        await DoSignEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   Security_HUKS_SignVerify_API9_RSA_103
     * @tc.number Security_HUKS_SignVerify_API9_RSA_103
     * @tc.desc   Security_HUKS_SignVerify_API9_RSA_103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_RSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_RSA_103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetMd5Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetMd5Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });
    /**
     * @tc.name   Security_HUKS_SignVerify_API9_RSA_104
     * @tc.number Security_HUKS_SignVerify_API9_RSA_104
     * @tc.desc   Security_HUKS_SignVerify_API9_RSA_104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_HUKS_SignVerify_API9_RSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'Security_HUKS_SignVerify_API9_RSA_104';
      let srcKeyAlias = testNumber;

      let genOptions = MergeOptions(GetSha512Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha512Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        await DoSignEndWithAbort(srcKeyAlias, signOptions, signVerifyData);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPKCS1NONE103
     * @tc.number testSignVerifyRSASize2048SIGNPKCS1NONE103
     * @tc.desc   testSignVerifyRSASize2048SIGNPKCS1NONE103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPKCS1NONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPKCS1NONE103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestPkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestPkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPKCS1SHA1103
     * @tc.number testSignVerifyRSASize2048SIGNPKCS1SHA1103
     * @tc.desc   testSignVerifyRSASize2048SIGNPKCS1SHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPKCS1SHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPKCS1SHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha1Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPKCS1SHA224103
     * @tc.number testSignVerifyRSASize2048SIGNPKCS1SHA224103
     * @tc.desc   testSignVerifyRSASize2048SIGNPKCS1SHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPKCS1SHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPKCS1SHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha224Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPKCS1SHA256103
     * @tc.number testSignVerifyRSASize2048SIGNPKCS1SHA256103
     * @tc.desc   testSignVerifyRSASize2048SIGNPKCS1SHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPKCS1SHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPKCS1SHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha256Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPKCS1SHA384103
     * @tc.number testSignVerifyRSASize2048SIGNPKCS1SHA384103
     * @tc.desc   testSignVerifyRSASize2048SIGNPKCS1SHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPKCS1SHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPKCS1SHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha384Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha384Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPKCS1SHA512103
     * @tc.number testSignVerifyRSASize2048SIGNPKCS1SHA512103
     * @tc.desc   testSignVerifyRSASize2048SIGNPKCS1SHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPKCS1SHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPKCS1SHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512Pkcs1SignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha512Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPSSMD5103
     * @tc.number testSignVerifyRSASize2048SIGNPSSMD5103
     * @tc.desc   testSignVerifyRSASize2048SIGNPSSMD5103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPSSMD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPSSMD5103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetMd5PssSignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetMd5PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPSSNONE103
     * @tc.number testSignVerifyRSASize2048SIGNPSSNONE103
     * @tc.desc   testSignVerifyRSASize2048SIGNPSSNONE103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPSSNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPSSNONE103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestPssSignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestPssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPSSSHA1103
     * @tc.number testSignVerifyRSASize2048SIGNPSSSHA1103
     * @tc.desc   testSignVerifyRSASize2048SIGNPSSSHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPSSSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPSSSHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1PssSignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha1PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPSSSHA224103
     * @tc.number testSignVerifyRSASize2048SIGNPSSSHA224103
     * @tc.desc   testSignVerifyRSASize2048SIGNPSSSHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPSSSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPSSSHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224PssSignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha224PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPSSSHA256103
     * @tc.number testSignVerifyRSASize2048SIGNPSSSHA256103
     * @tc.desc   testSignVerifyRSASize2048SIGNPSSSHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPSSSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPSSSHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256PssSignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha256PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPSSSHA384103
     * @tc.number testSignVerifyRSASize2048SIGNPSSSHA384103
     * @tc.desc   testSignVerifyRSASize2048SIGNPSSSHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPSSSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPSSSHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha384PssSignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha384PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize2048SIGNPSSSHA512103
     * @tc.number testSignVerifyRSASize2048SIGNPSSSHA512103
     * @tc.desc   testSignVerifyRSASize2048SIGNPSSSHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize2048SIGNPSSSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize2048SIGNPSSSHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512PssSignOptions(), GetRsaGenerateOptions(2048));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha512PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPKCS1MD5103
     * @tc.number testSignVerifyRSASize3072SIGNPKCS1MD5103
     * @tc.desc   testSignVerifyRSASize3072SIGNPKCS1MD5103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPKCS1MD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPKCS1MD5103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetMd5Pkcs1SignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetMd5Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPKCS1NONE103
     * @tc.number testSignVerifyRSASize3072SIGNPKCS1NONE103
     * @tc.desc   testSignVerifyRSASize3072SIGNPKCS1NONE103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPKCS1NONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPKCS1NONE103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestPkcs1SignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetNoDigestPkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPKCS1SHA1103
     * @tc.number testSignVerifyRSASize3072SIGNPKCS1SHA1103
     * @tc.desc   testSignVerifyRSASize3072SIGNPKCS1SHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPKCS1SHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPKCS1SHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1Pkcs1SignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha1Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPKCS1SHA224103
     * @tc.number testSignVerifyRSASize3072SIGNPKCS1SHA224103
     * @tc.desc   testSignVerifyRSASize3072SIGNPKCS1SHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPKCS1SHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPKCS1SHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224Pkcs1SignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha224Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPKCS1SHA256103
     * @tc.number testSignVerifyRSASize3072SIGNPKCS1SHA256103
     * @tc.desc   testSignVerifyRSASize3072SIGNPKCS1SHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPKCS1SHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPKCS1SHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha256Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPKCS1SHA384103
     * @tc.number testSignVerifyRSASize3072SIGNPKCS1SHA384103
     * @tc.desc   testSignVerifyRSASize3072SIGNPKCS1SHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPKCS1SHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPKCS1SHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha384Pkcs1SignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha384Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPKCS1SHA512103
     * @tc.number testSignVerifyRSASize3072SIGNPKCS1SHA512103
     * @tc.desc   testSignVerifyRSASize3072SIGNPKCS1SHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPKCS1SHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPKCS1SHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512Pkcs1SignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha512Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPSSMD5103
     * @tc.number testSignVerifyRSASize3072SIGNPSSMD5103
     * @tc.desc   testSignVerifyRSASize3072SIGNPSSMD5103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPSSMD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPSSMD5103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetMd5PssSignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetMd5PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPSSNONE103
     * @tc.number testSignVerifyRSASize3072SIGNPSSNONE103
     * @tc.desc   testSignVerifyRSASize3072SIGNPSSNONE103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPSSNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPSSNONE103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestPssSignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetNoDigestPssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPSSSHA1103
     * @tc.number testSignVerifyRSASize3072SIGNPSSSHA1103
     * @tc.desc   testSignVerifyRSASize3072SIGNPSSSHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPSSSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPSSSHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1PssSignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha1PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPSSSHA224103
     * @tc.number testSignVerifyRSASize3072SIGNPSSSHA224103
     * @tc.desc   testSignVerifyRSASize3072SIGNPSSSHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPSSSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPSSSHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224PssSignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha224PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPSSSHA256103
     * @tc.number testSignVerifyRSASize3072SIGNPSSSHA256103
     * @tc.desc   testSignVerifyRSASize3072SIGNPSSSHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPSSSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPSSSHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256PssSignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha256PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPSSSHA384103
     * @tc.number testSignVerifyRSASize3072SIGNPSSSHA384103
     * @tc.desc   testSignVerifyRSASize3072SIGNPSSSHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPSSSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPSSSHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha384PssSignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha384PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize3072SIGNPSSSHA512103
     * @tc.number testSignVerifyRSASize3072SIGNPSSSHA512103
     * @tc.desc   testSignVerifyRSASize3072SIGNPSSSHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize3072SIGNPSSSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize3072SIGNPSSSHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512PssSignOptions(), GetRsaGenerateOptions(3072));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetSha512PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPKCS1MD5103
     * @tc.number testSignVerifyRSASize4096SIGNPKCS1MD5103
     * @tc.desc   testSignVerifyRSASize4096SIGNPKCS1MD5103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPKCS1MD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPKCS1MD5103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetMd5Pkcs1SignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetMd5Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPKCS1NONE103
     * @tc.number testSignVerifyRSASize4096SIGNPKCS1NONE103
     * @tc.desc   testSignVerifyRSASize4096SIGNPKCS1NONE103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPKCS1NONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPKCS1NONE103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestPkcs1SignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetNoDigestPkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPKCS1SHA1103
     * @tc.number testSignVerifyRSASize4096SIGNPKCS1SHA1103
     * @tc.desc   testSignVerifyRSASize4096SIGNPKCS1SHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPKCS1SHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPKCS1SHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1Pkcs1SignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha1Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPKCS1SHA224103
     * @tc.number testSignVerifyRSASize4096SIGNPKCS1SHA224103
     * @tc.desc   testSignVerifyRSASize4096SIGNPKCS1SHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPKCS1SHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPKCS1SHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224Pkcs1SignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha224Pkcs1SignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPKCS1SHA256103
     * @tc.number testSignVerifyRSASize4096SIGNPKCS1SHA256103
     * @tc.desc   testSignVerifyRSASize4096SIGNPKCS1SHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPKCS1SHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPKCS1SHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256Pkcs1SignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha256Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPKCS1SHA384103
     * @tc.number testSignVerifyRSASize4096SIGNPKCS1SHA384103
     * @tc.desc   testSignVerifyRSASize4096SIGNPKCS1SHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPKCS1SHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPKCS1SHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha384Pkcs1SignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha384Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPKCS1SHA512103
     * @tc.number testSignVerifyRSASize4096SIGNPKCS1SHA512103
     * @tc.desc   testSignVerifyRSASize4096SIGNPKCS1SHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPKCS1SHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPKCS1SHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512Pkcs1SignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha512Pkcs1SignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPSSMD5103
     * @tc.number testSignVerifyRSASize4096SIGNPSSMD5103
     * @tc.desc   testSignVerifyRSASize4096SIGNPSSMD5103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPSSMD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPSSMD5103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetMd5PssSignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetMd5PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPSSNONE103
     * @tc.number testSignVerifyRSASize4096SIGNPSSNONE103
     * @tc.desc   testSignVerifyRSASize4096SIGNPSSNONE103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPSSNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPSSNONE103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetNoDigestPssSignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetNoDigestPssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPSSSHA1103
     * @tc.number testSignVerifyRSASize4096SIGNPSSSHA1103
     * @tc.desc   testSignVerifyRSASize4096SIGNPSSSHA1103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPSSSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPSSSHA1103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha1PssSignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha1PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPSSSHA224103
     * @tc.number testSignVerifyRSASize4096SIGNPSSSHA224103
     * @tc.desc   testSignVerifyRSASize4096SIGNPSSSHA224103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPSSSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPSSSHA224103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha224PssSignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha224PssSignOptions());

      if (useSoftware) {
        try {
          await huks.generateKeyItem(srcKeyAlias, genOptions);
          let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
          SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
          await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

          let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
          let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPSSSHA256103
     * @tc.number testSignVerifyRSASize4096SIGNPSSSHA256103
     * @tc.desc   testSignVerifyRSASize4096SIGNPSSSHA256103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPSSSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPSSSHA256103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha256PssSignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha256PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPSSSHA384103
     * @tc.number testSignVerifyRSASize4096SIGNPSSSHA384103
     * @tc.desc   testSignVerifyRSASize4096SIGNPSSSHA384103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPSSSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPSSSHA384103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha384PssSignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha384PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   testSignVerifyRSASize4096SIGNPSSSHA512103
     * @tc.number testSignVerifyRSASize4096SIGNPSSSHA512103
     * @tc.desc   testSignVerifyRSASize4096SIGNPSSSHA512103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignVerifyRSASize4096SIGNPSSSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber = 'testSignVerifyRSASize4096SIGNPSSSHA512103';
      let srcKeyAlias = testNumber;
      let newSrcKeyAlias = srcKeyAlias + "new";

      let genOptions = MergeOptions(GetSha512PssSignOptions(), GetRsaGenerateOptions(4096));
      SetParam(genOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetSha512PssSignOptions());

      try {
        await huks.generateKeyItem(srcKeyAlias, genOptions);
        let exportKeyRes = await huks.exportKeyItem(srcKeyAlias, genOptions);
        SetParam(signOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(newSrcKeyAlias, SetInData(signOptions, exportKeyRes.outData!));

        let signVerifyData: SignVerifyData = BuildSignVerifyData([64, 1]);
        let res = await SignVerifyReal(srcKeyAlias, newSrcKeyAlias, signOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

  });
  SecurityHuksSignVerifyRSATest()
}

function SecurityHuksSignVerifyRSATest() {
  let useSoftware: boolean = true;
  let isWearable: boolean = false;
  let genKeyOption: huks.HuksOptions;
  let signVerifyOption: huks.HuksOptions;

  describe('SecurityHuksSignVerifyRSATest', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
      isWearable = await CheckWearable();
    })
    beforeEach(() => {
      genKeyOption = GetRsaGenerateOptions(1024);
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY)
      signVerifyOption = MergeOptions(GetRsaGenerateOptions(1024), GetNoDigestPkcs1SignOptions());
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0100
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0100
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0100";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0200
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0200
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0200";
      let signVerifyData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(65)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_MD5);
      if (useSoftware) {
        try {
          await huks.generateKeyItem(testNumber, genKeyOption);
          let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      } else {
        try {
          await huks.generateKeyItem(testNumber, genKeyOption);
          let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000001);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0300
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0300
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0300";
      let signVerifyData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64)), StringToUint8Array(GetDataBySize(33))],
        finishData: StringToUint8Array(GetDataBySize(16)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1);
      if (useSoftware) {
        try {
          await huks.generateKeyItem(testNumber, genKeyOption);
          let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      } else {
        try {
          await huks.generateKeyItem(testNumber, genKeyOption);
          let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000001);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0400
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0400
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0400";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0500
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0500
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0500";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0600
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0600
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0600";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0700
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0700
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0700";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0800
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0800
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0800";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_0900
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_0900
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_0900";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1032);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1000
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1000
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1000";
      let signVerifyData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(32))],
        finishData: StringToUint8Array(GetDataBySize(32)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1100
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1100
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1100";
      let signVerifyData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(1024)), StringToUint8Array(GetDataBySize(1023))],
        finishData: StringToUint8Array(GetDataBySize(1025)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_MD5);
      if (useSoftware) {
        try {
          await huks.generateKeyItem(testNumber, genKeyOption);
          let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      } else {
        try {
          await huks.generateKeyItem(testNumber, genKeyOption);
          let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000001);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1200
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1200
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1200";
      let signVerifyData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(1024))],
        finishData: StringToUint8Array(GetDataBySize(1024)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1);
      if (useSoftware) {
        try {
          await huks.generateKeyItem(testNumber, genKeyOption);
          let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
          expect(res).assertEqual(true);
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(null).assertFail();
        }
      } else {
        try {
          await huks.generateKeyItem(testNumber, genKeyOption);
          let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
          expect(null).assertFail();
        } catch (err) {
          Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(12000001);
        }
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1300
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1300
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1300";
      let signVerifyData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(1024))],
        finishData: StringToUint8Array(GetDataBySize(1025)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1400
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1400
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1400";
      let signVerifyData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(1024)), StringToUint8Array(GetDataBySize(1023))],
        finishData: StringToUint8Array(GetDataBySize(1025)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1500
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1500
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1500";
      let signVerifyData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(32))],
        finishData: StringToUint8Array(GetDataBySize(65)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2040);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1600
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1600
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1600";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(65)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 1016);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1700
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1700
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1700";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, 2056);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API12_Func_0100
     * @tc.number SUB_Security_HUKS_Cipher_SM4_API16_Func_0100
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API12_Func_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API12_Func_0100";
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(128)),
        signatureData: null
      }
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9796_2);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(isWearable).assertEqual(true);
        expect(res).assertEqual(true)
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        let expectErrCode = useSoftware ? 12000001 : 12000012;
        expect(err.code).assertEqual(expectErrCode);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1800
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1800
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1800";
      let keySize = 1032;
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 21)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9796_2);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(isWearable).assertEqual(true);
        expect(res).assertEqual(true)
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        let expectErrCode = useSoftware ? 12000001 : 12000012;
        expect(err.code).assertEqual(expectErrCode);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_1900
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_1900
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_1900";
      let keySize = 2040;
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 21)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9796_2);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(isWearable).assertEqual(true);
        expect(res).assertEqual(true)
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        let expectErrCode = useSoftware ? 12000001 : 12000012;
        expect(err.code).assertEqual(expectErrCode);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API16_Func_2000
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API16_Func_2000
     * @tc.desc   generate key, sign, verify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API16_Func_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API16_Func_2000";
      let keySize = 2048;
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(keySize / 8 - 21)),
        signatureData: null
      }
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9796_2);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(isWearable).assertEqual(true);
        expect(res).assertEqual(true)
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        let expectErrCode = useSoftware ? 12000001 : 12000012;
        expect(err.code).assertEqual(expectErrCode);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0100
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0100
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0100";
      let genKeyOptions = GetRsaGenerateOptions(512);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(64)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(512), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(useSoftware).assertEqual(false);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0200
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0200
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0200";
      let genKeyOptions = GetRsaGenerateOptions(768);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(48))],
        finishData: StringToUint8Array(GetDataBySize(48)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(768), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(useSoftware).assertEqual(false);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0300
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0300
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0300";
      let genKeyOptions = GetRsaGenerateOptions(1024);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(64))],
        finishData: StringToUint8Array(GetDataBySize(64)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(1024), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0400
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0400
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0400";
      let genKeyOptions = GetRsaGenerateOptions(1032);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(128))],
        finishData: StringToUint8Array(GetDataBySize(1)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(1032), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0500
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0500
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0500";
      let genKeyOptions = GetRsaGenerateOptions(2040);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(128))],
        finishData: StringToUint8Array(GetDataBySize(127)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(2040), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0600
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0600
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0600";
      let genKeyOptions = GetRsaGenerateOptions(2048);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(256)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0700
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0700
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0700";
      let genKeyOptions = GetRsaGenerateOptions(3072);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(128)), StringToUint8Array(GetDataBySize(127))],
        finishData: StringToUint8Array(GetDataBySize(129)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(3072), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0800
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0800
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0800";
      let genKeyOptions = GetRsaGenerateOptions(4096);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(255))],
        finishData: StringToUint8Array(GetDataBySize(257)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(4096), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_0900
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_0900
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0900";
      let genKeyOptions = GetRsaGenerateOptions(2048);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(512)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_1000
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_1000
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_0900";
      let genKeyOptions = GetRsaGenerateOptions(2048);
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: [StringToUint8Array(GetDataBySize(1))],
        finishData: StringToUint8Array(GetDataBySize(256)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_1100
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_1100
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_1100";
      let genKeyOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestPkcs1SignOptions());
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(256)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_1200
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_1200
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_1200";
      let genKeyOptions = MergeOptions(GetRsaGenerateOptions(2048), GetSha256Options());
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(256)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestNoPaddingSignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })


    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_RSA_API20_Func_1300
     * @tc.number SUB_Security_HUKS_SignVerify_RSA_API20_Func_1300
     * @tc.desc   test rsa sign verify, no digest, no padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_SignVerify_RSA_API20_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_RSA_API20_Func_1300";
      let genKeyOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestNoPaddingSignOptions());
      SetParam(genKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      let signData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array(GetDataBySize(256)),
        signatureData: null
      }
      let signOptions = MergeOptions(GetRsaGenerateOptions(2048), GetNoDigestPkcs1SignOptions());
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        let res = await SignVerify(testNumber, signOptions, signData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
      }
    })
  }
  )
}
