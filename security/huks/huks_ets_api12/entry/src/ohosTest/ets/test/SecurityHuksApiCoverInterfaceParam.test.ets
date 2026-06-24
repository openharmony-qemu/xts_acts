/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import {
  GetAesGenerateOptions, GetEccGenerateOptions, GetEd25519GenerateOptions, GetMlKemGenerateOptions, GetX25519GenerateOptions,
} from './utils/huks/GenerateKeyUtils';
import { CheckSoftware, ClearAllKeys, GetEmptyOptions, GetParam, MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import { GetDataBySize, StringToUint8Array, Uint8ArrayToHexString } from './utils/common/CommonUtils';
import { Logger } from './utils/common/Logger';
import { HuksMaxAliasLength } from './utils/huks/HuksCommonUtils';
import { GetAesImportData } from './utils/huks/ImportKeyUtils';
import { BuildWrappedKeyData } from './utils/huks/ImportWrappedKeyUtils';
import { CheckWifiInfo } from './utils/common/NetworkUtils';
import { GetAttestKeyOptions } from './utils/huks/AttestKeyUtils';
import { GetCbcPkcs7Options, GetCtrNoPaddingOptions } from './utils/huks/CipherUtils';

export default function SecurityHuksApiCoverInterfaceParam() {

  let useSoftware: boolean = true;

  describe('SecurityHuksApiCoverInterfaceParam', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    afterEach(async () => {
      await ClearAllKeys();
    })

    //huks.generateKeyItem()
    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0100
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0100";
      let keyAlias = "a";

      let huksOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        await huks.generateKeyItem(keyAlias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0200
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem(keyAlias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0300
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0300";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem("", huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0400
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0400";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0500
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0500";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem(null, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0600
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_0600";

      let huksOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem(undefined, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5000
     * @tc.desc   test generateKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.generateKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5100
     * @tc.desc   test generateKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.generateKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5200
     * @tc.desc   test generateKeyItem with empty properties array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GenerateKeyItem_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions: huks.HuksOptions = {
        properties: []
      }

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    });

    //huks.deleteKeyItem()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0100";
      let keyAlias = "a";

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.deleteKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0200
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.deleteKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0300";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.deleteKeyItem("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0400
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0400";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.deleteKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0500
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0500";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.deleteKeyItem(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0600
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_0600";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.deleteKeyItem(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.deleteKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.deleteKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_DeleteKeyItem_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.deleteKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.importKeyItem()
    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0100
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0100";
      let keyAlias = "a";

      let huksOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };
      huksOptions.inData = GetAesImportData(128);

      try {
        await huks.importKeyItem(keyAlias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0200
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huks.importKeyItem(keyAlias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0300
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0300";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huks.importKeyItem("", huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0400
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0400";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huks.importKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0500
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0500";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huks.importKeyItem(null, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0600
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_0600";

      let huksOptions = GetAesGenerateOptions(128);
      huksOptions.inData = GetAesImportData(128);

      try {
        await huks.importKeyItem(undefined, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5000
     * @tc.desc   test generateKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.importKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5100
     * @tc.desc   test generateKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.importKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5200
     * @tc.desc   test generateKeyItem with empty properties array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportKeyItem_Interface_5200";
      let keyAlias: string = testNumber;

      let huksOptions: huks.HuksOptions = {
        properties: []
      }

      try {
        await huks.importKeyItem(keyAlias, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(undefined);
      }
    });

    //importWrappedKeyItem
    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0100
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0100";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: wrappedKeySize
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE,
            value: huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING
          }
        ],
        inData: wrappedKeyData
      };
      try {
        await huks.importWrappedKeyItem("a", deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0200
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0200";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber.padEnd(HuksMaxAliasLength, "targetKey"), deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0300
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0300";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem("", deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0400
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0400";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0500
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0500";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(null, deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0600
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_0600";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(undefined, deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1100
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1100
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1100";

      let deviceAKeyPairAlias: string = "a";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1200
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1200
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1200";

      let deviceAKeyPairAlias: string = GetDataBySize(HuksMaxAliasLength);
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1300
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1300
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1300";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, "", importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1400
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1400
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1400";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, testNumber.padEnd(HuksMaxAliasLength + 1, "a"), importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1500
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1500
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1500";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, null, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1600
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1600
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_1600";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let wrappedKeySize = 192;
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
      let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
      let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
      let importWrappedKeyOptions = GetAesGenerateOptions(wrappedKeySize);
      SetParam(importWrappedKeyOptions, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
      importWrappedKeyOptions.inData = wrappedKeyData;
      try {
        await huks.importWrappedKeyItem(testNumber, undefined, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5000
     * @tc.desc   test generateKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5000";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);

      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5100
     * @tc.desc   test generateKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5100";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);

      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5200
     * @tc.desc   test generateKeyItem with empty properties array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ImportWrappedKeyItem_Interface_5200";

      let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
      let genKeyPairOptions = GetEccGenerateOptions(256);
      SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);

      let importWrappedKeyOptions: huks.HuksOptions = {
        properties: []
      }
      try {
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.message == "empty error message").assertTrue();
      }
    });

    //huks.exportKeyItem()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0100";
      let keyAlias = "a";

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: [
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
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
          }
        ]
      };

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.exportKeyItem(keyAlias, useOptions);
        expect(res.outData).not().assertEqual(undefined);
        expect(res.properties).assertEqual(undefined);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0200
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetEccGenerateOptions(256);
      let useOptions = GetEccGenerateOptions(256);

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.exportKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0300";

      let useOptions = GetEccGenerateOptions(256);

      try {
        await huks.exportKeyItem("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0400
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0400";

      let useOptions = GetEccGenerateOptions(256);

      try {
        await huks.exportKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0500
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0500";

      let useOptions = GetEccGenerateOptions(256);

      try {
        await huks.exportKeyItem(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0600
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_0600";

      let useOptions = GetEccGenerateOptions(256);

      try {
        await huks.exportKeyItem(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.exportKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.exportKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ExportKeyItem_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.exportKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.getKeyItemProperties()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0100";
      let keyAlias = "a";

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.getKeyItemProperties(keyAlias, useOptions);
        expect(res.outData).assertEqual(undefined);
        expect(res.properties).not().assertEqual(undefined);
        expect(res.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0200
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.getKeyItemProperties(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0300";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.getKeyItemProperties("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0400
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0400";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.getKeyItemProperties(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0500
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0500";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.getKeyItemProperties(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0600
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_0600";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.getKeyItemProperties(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.getKeyItemProperties(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.getKeyItemProperties(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_GetKeyItemProperties_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.getKeyItemProperties(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.isKeyItemExist()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0100";
      let keyAlias = "a";

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.isKeyItemExist(keyAlias, useOptions);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0200
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.isKeyItemExist(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0300";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.isKeyItemExist("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0400
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0400";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.isKeyItemExist(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0500
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0500";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.isKeyItemExist(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0600
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_0600";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.isKeyItemExist(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.isKeyItemExist(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.isKeyItemExist(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_IsKeyItemExist_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.isKeyItemExist(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.hasKeyItem()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0100";
      let keyAlias = "a";

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
          }
        ]
      };

      try {
        let res = await huks.hasKeyItem(keyAlias, useOptions);
        expect(res).assertEqual(false);
        await huks.generateKeyItem(keyAlias, genOptions);
        res = await huks.hasKeyItem(keyAlias, useOptions);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0200
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.hasKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0300";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.hasKeyItem("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0400
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0400";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.hasKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0500
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0500";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.hasKeyItem(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0600
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_0600";

      let useOptions = GetAesGenerateOptions(128);

      try {
        await huks.hasKeyItem(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.hasKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.hasKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_HasKeyItem_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.hasKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.initSession()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0100";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_CBC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          },
          {
            tag: huks.HuksTag.HUKS_TAG_IV,
            value: StringToUint8Array(GetDataBySize(16))
          }
        ]
      };

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.initSession(keyAlias, useOptions);
        expect(res.handle).assertLarger(0);
        await huks.abortSession(res.handle, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0200
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetAesGenerateOptions(128);
      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.initSession(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0300";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.initSession("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0400
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0400";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.initSession(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0500
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0500";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.initSession(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_0600
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_0600";

      let useOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.initSession(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.initSession(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.initSession(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_InitSession_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_InitSession_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_InitSession_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_InitSession_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.initSession(keyAlias, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    //huks.updateSession()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0100";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let updateOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_CBC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          },
          {
            tag: huks.HuksTag.HUKS_TAG_IV,
            value: StringToUint8Array(GetDataBySize(16))
          }
        ]
      };
      updateOptions.inData = StringToUint8Array(GetDataBySize(64));
      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.initSession(keyAlias, initOptions);
        let updateRes = await huks.updateSession(res.handle, updateOptions);
        expect(updateRes.outData).not().assertEqual(undefined);
        expect(updateRes.properties).assertEqual(undefined);
        expect(updateRes.certChains).assertEqual(undefined);
        await huks.abortSession(res.handle, abortOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0300";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.updateSession(0, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0400
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0400";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.updateSession(null, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0500
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_0500";

      let updateOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.updateSession(undefined, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5000";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.updateSession(res.handle, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5100";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.updateSession(res.handle, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_UpdateSession_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let updateOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.updateSession(res.handle, updateOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    //huks.finishSession()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_0100";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let finishOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_CBC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          },
          {
            tag: huks.HuksTag.HUKS_TAG_IV,
            value: StringToUint8Array(GetDataBySize(16))
          }
        ]
      };
      finishOptions.inData = StringToUint8Array(GetDataBySize(64));

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.initSession(keyAlias, initOptions);
        let finishRes = await huks.finishSession(res.handle, finishOptions);
        expect(finishRes.outData).not().assertEqual(undefined);
        expect(finishRes.properties).assertEqual(undefined);
        expect(finishRes.certChains).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_0300";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.finishSession(0, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000011);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_0400
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_0400";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.finishSession(null, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_0500
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_0500";

      let finishOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.finishSession(undefined, finishOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_5000";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.finishSession(res.handle, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_5100";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.finishSession(res.handle, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_FinishSession_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_FinishSession_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_FinishSession_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_FinishSession_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let finishOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.finishSession(res.handle, finishOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.abortSession()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_0100";
      let keyAlias = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let abortOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_AES
          },
          {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: 128
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
          },
          {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_CBC
          },
          {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
          },
          {
            tag: huks.HuksTag.HUKS_TAG_IV,
            value: StringToUint8Array(GetDataBySize(16))
          }
        ]
      };

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.initSession(keyAlias, initOptions);
        await huks.abortSession(res.handle, abortOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_0300";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.abortSession(0, abortOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_0400
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_0400";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.abortSession(null, abortOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_0500
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_0500";

      let abortOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      try {
        await huks.abortSession(undefined, abortOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_5000";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.abortSession(res.handle, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_5100";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.abortSession(res.handle, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AbortSession_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_AbortSession_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AbortSession_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AbortSession_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let initOptions = MergeOptions(GetAesGenerateOptions(128), GetCbcPkcs7Options(16));
      let abortOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      let res = await huks.initSession(keyAlias, initOptions);
      try {
        await huks.abortSession(res.handle, abortOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    //huks.anonAttestKeyItem()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0100";
      let keyAlias = "a";

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO,
            value: StringToUint8Array("sec_level")
          },
          {
            tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
            value: StringToUint8Array("challenge_data")
          },
          {
            tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO,
            value: StringToUint8Array("version_info")
          },
          {
            tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
            value: StringToUint8Array("keyAlias")
          }
        ]
      };

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.anonAttestKeyItem(keyAlias, useOptions);
        expect(res.outData).assertEqual(undefined);
        expect(res.properties).assertEqual(undefined);
        expect(res.certChains).not().assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0200
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0200
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0200";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetEccGenerateOptions(256);
      let useOptions = GetAttestKeyOptions();

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.anonAttestKeyItem(keyAlias, useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0300
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0300";

      let useOptions = GetAttestKeyOptions();

      try {
        await huks.anonAttestKeyItem("", useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0400
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0400
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0400";

      let useOptions = GetAttestKeyOptions();

      try {
        await huks.anonAttestKeyItem(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0500
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0500
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0500";

      let useOptions = GetAttestKeyOptions();

      try {
        await huks.anonAttestKeyItem(null, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0600
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0600
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_0600";

      let useOptions = GetAttestKeyOptions();

      try {
        await huks.anonAttestKeyItem(undefined, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.anonAttestKeyItem(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.anonAttestKeyItem(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_AnonAttestKeyItem_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetEccGenerateOptions(256);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.anonAttestKeyItem(keyAlias, useOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });


    //huks.listAliases()

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ListAliases_Interface_0100
     * @tc.number SUB_Security_HUKS_ApiCover_ListAliases_Interface_0100
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ListAliases_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ListAliases_Interface_0100";

      let useOptions: huks.HuksOptions = {
        properties: [
          {
            tag: huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL,
            value: huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE
          },
        ]
      };

      try {
        let res = await huks.listAliases(useOptions);
        expect(res.keyAliases).not().assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ListAliases_Interface_5000
     * @tc.number SUB_Security_HUKS_ApiCover_ListAliases_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ListAliases_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ListAliases_Interface_5000";

      try {
        await huks.listAliases(null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ListAliases_Interface_5100
     * @tc.number SUB_Security_HUKS_ApiCover_ListAliases_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ListAliases_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ListAliases_Interface_5100";

      try {
        await huks.listAliases(undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_ListAliases_Interface_5200
     * @tc.number SUB_Security_HUKS_ApiCover_ListAliases_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_ListAliases_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_ListAliases_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetAesGenerateOptions(128);
      let useOptions: huks.HuksOptions = {
        properties: []
      }

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.listAliases(useOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });


    //huks.anonAttestKeyItemOffline()

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0000
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0000
     * @tc.desc   test deleteKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0000";
      let keyAlias = "a";

      let genOptions = GetEccGenerateOptions(256);
      let params: huks.HuksParam[] = [
        {
          tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
          value: StringToUint8Array("challenge_data")
        },
        {
          tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
          value: StringToUint8Array("keyAlias")
        }
      ];

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        let res = await huks.anonAttestKeyItemOffline(keyAlias, params);
        expect(res.outData).assertEqual(undefined);
        expect(res.properties).assertEqual(undefined);
        expect(res.certChains).not().assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0100
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0100
     * @tc.desc   test deleteKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      if (!useSoftware) {
        await CheckWifiInfo();
      }
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0100";
      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let genOptions = GetEccGenerateOptions(256);
      let useOptions = GetAttestKeyOptions();

      try {
        await huks.generateKeyItem(keyAlias, genOptions);
        await huks.anonAttestKeyItemOffline(keyAlias, useOptions.properties);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0200
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0200
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0200";

      let useOptions = GetAttestKeyOptions();

      try {
        await huks.anonAttestKeyItemOffline("", useOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0300
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0300
     * @tc.desc   test deleteKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0300";

      let useOptions = GetAttestKeyOptions();

      try {
        await huks.anonAttestKeyItemOffline(testNumber.padEnd(HuksMaxAliasLength + 1, "a"), useOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0400
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0400
     * @tc.desc   test deleteKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0400";

      let useOptions = GetAttestKeyOptions();

      try {
        await huks.anonAttestKeyItemOffline(null, useOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0500
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0500
     * @tc.desc   test deleteKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_0500";

      let useOptions = GetAttestKeyOptions();

      try {
        await huks.anonAttestKeyItemOffline(undefined, useOptions.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5000
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5000
     * @tc.desc   test deleteKeyItem with null Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5000";
      let keyAlias: string = testNumber;

      try {
        await huks.anonAttestKeyItemOffline(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5100
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5100
     * @tc.desc   test deleteKeyItem with undefined Options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5100";
      let keyAlias: string = testNumber;

      try {
        await huks.anonAttestKeyItemOffline(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5200
     * @tc.number SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5200
     * @tc.desc   test deleteKeyItem with undefined Options parameter after generate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_AnonAttestKeyItemOffline_Interface_5200";
      let keyAlias: string = testNumber;

      let genOptions = GetEccGenerateOptions(256);

      await huks.generateKeyItem(keyAlias, genOptions);

      try {
        await huks.anonAttestKeyItemOffline(keyAlias, []);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0000
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0000
     * @tc.desc   test encapsulate with keyAlias length 1 (valid boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0000";

      let keyAlias = "a";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        let encapResult = await huks.encapsulate(keyAlias, mlKemEncapParams.properties);
        expect(encapResult.outData?.length).assertLarger(0);
        expect(encapResult.sharedSecret?.length).assertLarger(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0100
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0100
     * @tc.desc   test encapsulate with keyAlias length 128 (valid boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0100";

      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        let encapResult = await huks.encapsulate(keyAlias, mlKemEncapParams.properties);
        expect(encapResult.outData?.length).assertLarger(0);
        expect(encapResult.sharedSecret?.length).assertLarger(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0200
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0200
     * @tc.desc   test encapsulate with keyAlias length 0, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0200";

      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.encapsulate("", mlKemEncapParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0300
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0300
     * @tc.desc   test encapsulate with keyAlias length 129, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0300";

      let keyAlias: string = testNumber.padEnd(HuksMaxAliasLength + 1, "a");

      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.encapsulate(keyAlias, mlKemEncapParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0400
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0400
     * @tc.desc   test encapsulate with keyAlias null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0400";

      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.encapsulate(null, mlKemEncapParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0500
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0500
     * @tc.desc   test encapsulate with keyAlias undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_0500";

      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.encapsulate(undefined, mlKemEncapParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1000
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1000
     * @tc.desc   test encapsulate with params null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1000";

      let keyAlias: string = testNumber;

      let mlKemGenOptions = GetMlKemGenerateOptions(768);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1100
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1100
     * @tc.desc   test encapsulate with params undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1100";

      let keyAlias: string = testNumber;

      let mlKemGenOptions = GetMlKemGenerateOptions(768);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1200
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1200
     * @tc.desc   test encapsulate with params length 0 (empty array), expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_1200";

      let keyAlias: string = testNumber;

      let mlKemGenOptions = GetMlKemGenerateOptions(768);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, []);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2000
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2000
     * @tc.desc   test encapsulate with sharedKeyAlias length 1 (valid boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2000";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias = "a";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        let encapResult = await huks.encapsulate(keyAlias, mlKemEncapParams.properties, sharedKeyAlias, sharedKeyParams.properties);
        expect(encapResult.outData?.length).assertLarger(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2100
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2100
     * @tc.desc   test encapsulate with sharedKeyAlias length 128 (valid boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2100";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        let encapResult = await huks.encapsulate(keyAlias, mlKemEncapParams.properties, sharedKeyAlias, sharedKeyParams.properties);
        expect(encapResult.outData?.length).assertLarger(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2200
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2200
     * @tc.desc   test encapsulate with sharedKeyAlias length 0, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2200";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, mlKemEncapParams.properties, "", sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2300
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2300
     * @tc.desc   test encapsulate with sharedKeyAlias length 129, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2300";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber.padEnd(HuksMaxAliasLength + 1, "a");

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, mlKemEncapParams.properties, sharedKeyAlias, sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2400
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2400
     * @tc.desc   test encapsulate with sharedKeyAlias null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2400";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, mlKemEncapParams.properties, null, sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2500
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2500
     * @tc.desc   test encapsulate with sharedKeyAlias undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_2500";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, mlKemEncapParams.properties, undefined, sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3000
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3000
     * @tc.desc   test encapsulate with sharedKeyParams length 0, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3000";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber + "_shared";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, mlKemEncapParams.properties, sharedKeyAlias, []);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3100
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3100
     * @tc.desc   test encapsulate with sharedKeyParams null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3100";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber + "_shared";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, mlKemEncapParams.properties, sharedKeyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3200
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3200
     * @tc.desc   test encapsulate with sharedKeyParams undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3200";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber + "_shared";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, mlKemEncapParams.properties, sharedKeyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3300
     * @tc.number SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3300
     * @tc.desc   test encapsulate without sharedKeyParams parameter, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Encapsulate_Interface_3300";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber + "_shared";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.encapsulate(keyAlias, wrapParams.properties, sharedKeyAlias);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0000
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0000
     * @tc.desc   test decapsulate with keyAlias length 1 (valid boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0000";

      let keyAlias = "a";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);

      try {
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.sharedSecret?.length).assertLarger(0);
        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0100
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0100
     * @tc.desc   test decapsulate with keyAlias length 128 (valid boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0100";

      let keyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);

      try {
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.sharedSecret?.length).assertLarger(0);
        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0200
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0200
     * @tc.desc   test decapsulate with keyAlias length 0, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0200";

      let mlKemDecapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.decapsulate("", mlKemDecapParams.properties, new Uint8Array([0]));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0300
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0300
     * @tc.desc   test decapsulate with keyAlias length 129, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0300";

      let keyAlias: string = testNumber.padEnd(HuksMaxAliasLength + 1, "a");

      let mlKemDecapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.decapsulate(keyAlias, mlKemDecapParams.properties, new Uint8Array([0]));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0400
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0400
     * @tc.desc   test decapsulate with keyAlias null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0400";

      let mlKemDecapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.decapsulate(null, mlKemDecapParams.properties, new Uint8Array([0]));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0500
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0500
     * @tc.desc   test decapsulate with keyAlias undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_0500";

      let mlKemDecapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.decapsulate(undefined, mlKemDecapParams.properties, new Uint8Array([0]));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1000
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1000
     * @tc.desc   test decapsulate with params null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1000";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, mlKemEncapParams.properties);

      try {
        await huks.decapsulate(keyAlias, null, encapResult.outData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1100
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1100
     * @tc.desc   test decapsulate with params undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1100";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, mlKemEncapParams.properties);

      try {
        await huks.decapsulate(keyAlias, undefined, encapResult.outData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1200
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1200
     * @tc.desc   test decapsulate with params length 0 (empty array), expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_1200";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemEncapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, mlKemEncapParams.properties);

      try {
        await huks.decapsulate(keyAlias, [], encapResult.outData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2000
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2000
     * @tc.desc   test decapsulate with encapData length 0 (empty Uint8Array), expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2000";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemDecapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.decapsulate(keyAlias, mlKemDecapParams.properties, new Uint8Array(0));
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2100
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2100
     * @tc.desc   test decapsulate with encapData null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2100";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemDecapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.decapsulate(keyAlias, mlKemDecapParams.properties, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2200
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2200
     * @tc.desc   test decapsulate with encapData undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_2200";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let mlKemDecapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);

      try {
        await huks.decapsulate(keyAlias, mlKemDecapParams.properties, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3000
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3000
     * @tc.desc   test decapsulate with sharedKeyAlias length 1 (valid boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3000";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias = "a";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams: Array<huks.HuksParam> = [
        { tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_ML_KEM }
      ];
      let sharedKeyParams: Array<huks.HuksParam> = [
        { tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_AES },
        { tag: huks.HuksTag.HUKS_TAG_KEY_SIZE, value: 256 },
        { tag: huks.HuksTag.HUKS_TAG_PURPOSE, value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT },
        { tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE, value: huks.HuksCipherMode.HUKS_MODE_CTR },
        { tag: huks.HuksTag.HUKS_TAG_PADDING, value: huks.HuksKeyPadding.HUKS_PADDING_NONE },
        { tag: huks.HuksTag.HUKS_TAG_IV, value: StringToUint8Array(GetDataBySize(16)) }
      ];

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams, sharedKeyAlias, sharedKeyParams);

      try {
        await huks.decapsulate(keyAlias, wrapParams, encapResult.outData, sharedKeyAlias, sharedKeyParams);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3100
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3100
     * @tc.desc   test decapsulate with sharedKeyAlias length 128 (valid boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3100";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = GetDataBySize(HuksMaxAliasLength);

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, sharedKeyAlias, sharedKeyParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, sharedKeyParams.properties);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3200
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3200
     * @tc.desc   test decapsulate with sharedKeyAlias length 0, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3200";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, "", sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3300
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3300
     * @tc.desc   test decapsulate with sharedKeyAlias length 129, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3300";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber.padEnd(HuksMaxAliasLength + 1, "a");

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3400
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3400
     * @tc.desc   test decapsulate with sharedKeyAlias null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3400";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, null, sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3500
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3500
     * @tc.desc   test decapsulate with sharedKeyAlias undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_3500";

      let keyAlias: string = testNumber + "_key";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, undefined, sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4000
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4000
     * @tc.desc   test decapsulate with sharedKeyParams length 0, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4000";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber + "_decap_shared";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, []);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4100
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4100
     * @tc.desc   test decapsulate with sharedKeyParams null, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4100";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber + "_decap_shared";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4200
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4200
     * @tc.desc   test decapsulate with sharedKeyParams undefined, expect error 401
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4200";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber + "_decap_shared";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4300
     * @tc.number SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4300
     * @tc.desc   test decapsulate without sharedKeyParams parameter, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ParamSpec_Decapsulate_Interface_4300";

      let keyAlias: string = testNumber + "_key";
      let sharedKeyAlias: string = testNumber + "_decap_shared";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";

      let mlKemGenOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      await huks.generateKeyItem(keyAlias, mlKemGenOptions);
      let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);

      try {
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    });


  });
}