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
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import { DeleteParam, GenParam, GetEmptyOptions, GetParam, MergeOptions, PrintOptions, SetInData, SetParam } from './utils/huks/HuksOptionsUtils';
import { GetMlKemGenerateOptions, GetSm4GenerateOptions } from './utils/huks/GenerateKeyUtils';
import { GetImportKeyPairOptions, GetImportPubKeyOptions, GetMlKemImportData } from './utils/huks/ImportKeyUtils';
import { Logger } from './utils/common/Logger';
import { HuksDefaultKeyVersion, HuksDefaultOsPatchLevel, HuksDefaultOsVersion, HuksMinGroupId } from './utils/huks/HuksCommonUtils';
import { GetAccessControlOptions, GetAccessGroupOptions, GetStorageLevelCeOptions, GetStorageLevelDeOptions, GetStorageLevelEceOptions, GetUserAuthOptions } from './utils/huks/AccessControlUtils';
import { Cipher, DoCipher, BuildCipherData, MergeCipherData, GetCtrNoPaddingOptions, CompareCipherData } from './utils/huks/CipherUtils';
import { GetAesGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { StringToUint8Array, Uint8ArrayToHexString, Uint8ArrayToString } from './utils/common/CommonUtils';

export default function SecurityHuksMlKemTest() {
  describe('SecurityHuksMlKemTest', () => {

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0100
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0100
     * @tc.desc   Generate ML-KEM 768 key, query key, get key properties, export key, delete key, verify key not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0100";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(768);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0200
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0200
     * @tc.desc   Generate ML-KEM 1024 key, query key, get key properties, export key, delete key, verify key not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0200";

      let generateKeyOptions = GetMlKemGenerateOptions(1024);
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(1024);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0300
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0300
     * @tc.desc   Generate ML-KEM 512 key, expect error 12000003 (unsupported key size)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0300";

      let generateKeyOptions = GetMlKemGenerateOptions(512);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0400
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0400
     * @tc.desc   Import ML-KEM 768 key pair with PURPOSE_WRAP, query key, get key properties, delete key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0400";

      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportKeyPairOptions());
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
      SetInData(importKeyOptions, GetMlKemImportData(768));
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(768);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE)).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0500
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0500
     * @tc.desc   Import ML-KEM 1024 key pair with PURPOSE_UNWRAP, query key, get key properties, delete key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0500";

      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(1024), GetImportKeyPairOptions());
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      SetInData(importKeyOptions, GetMlKemImportData(1024));
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(1024);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE)).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0600
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0600
     * @tc.desc   Import ML-KEM 512 key pair, expect error 12000003 (unsupported key size)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0600";

      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(512), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlKemImportData(512));

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0700
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0700
     * @tc.desc   Generate ML-KEM 768 key with PURPOSE_WRAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0700";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let baseKeyOptions = GetEmptyOptions();
      SetParam(generateKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP)

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(768);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0710
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0710
     * @tc.desc   Generate ML-KEM 768 key with PURPOSE_UNWRAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0710";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let baseKeyOptions = GetEmptyOptions();
      SetParam(generateKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP)

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(768);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0800
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0800
     * @tc.desc   Generate ML-KEM 768 key with PURPOSE_SIGN|VERIFY (not WRAP|UNWRAP), expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0800";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      SetParam(generateKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        Logger.error(`${testNumber} should fail but success`);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0900
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0900
     * @tc.desc   Generate ML-KEM 768 key with IS_DEVICE_PASSWORD_SET, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_0900";

      let generateKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetUserAuthOptions());

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1000
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1000
     * @tc.desc   Import ML-KEM 768 key pair with PURPOSE_WRAP|UNWRAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1000";

      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlKemImportData(768));
      let baseKeyOptions = GetEmptyOptions();
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP)

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(768);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE)).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })


    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1010
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1010
     * @tc.desc   Import ML-KEM 768 key pair with PURPOSE_WRAP|UNWRAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1010";

      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlKemImportData(768));
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP)
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(768);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE)).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1100
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1100
     * @tc.desc   Import ML-KEM 768 public key with PURPOSE_WRAP only (not WRAP|UNWRAP), expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1100";

      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlKemImportData(768));
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1200
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1200
     * @tc.desc   Import ML-KEM 768 public key with IS_DEVICE_PASSWORD_SET, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1200";

      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetUserAuthOptions(), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlKemImportData(768));

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1300
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1300
     * @tc.desc   Import ML-KEM 768 public key with PURPOSE_WRAP, encapsulate, query key, get key properties, delete key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1300";

      let genKeyAlias: string = testNumber + "_gen";
      let importKeyAlias: string = testNumber + "_import";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportPubKeyOptions());
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);

      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let exportKeyRes = await huks.exportKeyItem(genKeyAlias, baseKeyOptions);
        importKeyOptions.inData = exportKeyRes.outData;
        await huks.importKeyItem(importKeyAlias, importKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(importKeyAlias, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(importKeyAlias, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(768);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE)).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_PUBLIC_KEY);
        await huks.deleteKeyItem(importKeyAlias, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(importKeyAlias, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1400
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1400
     * @tc.desc   Import ML-KEM 768 public key with PURPOSE_UNWRAP (not WRAP), expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1400";

      let genKeyAlias: string = testNumber + "_gen";
      let importKeyAlias: string = testNumber + "_import";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportPubKeyOptions());
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let exportKeyRes = await huks.exportKeyItem(genKeyAlias, baseKeyOptions);
        importKeyOptions.inData = exportKeyRes.outData;
        await huks.importKeyItem(importKeyAlias, importKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1500
     * @tc.number SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1500
     * @tc.desc   Import ML-KEM 768 public key with IS_DEVICE_PASSWORD_SET, expect error 12000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_GenerateKey_MLKEM_API26_Func_1500";

      let genKeyAlias: string = testNumber + "_gen";
      let importKeyAlias: string = testNumber + "_import";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportPubKeyOptions(), GetUserAuthOptions());
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let exportKeyRes = await huks.exportKeyItem(genKeyAlias, baseKeyOptions);
        importKeyOptions.inData = exportKeyRes.outData;
        await huks.importKeyItem(importKeyAlias, importKeyOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000018);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0100
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0100
     * @tc.desc   Generate ML-KEM 768 key pair, encapsulate/decapsulate, no shared key stored, compare consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0100";

      let keyAlias: string = testNumber + "_key";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        expect(encapResult.outData?.length).assertEqual(1088);
        expect(encapResult.properties).assertEqual(undefined);
        expect(encapResult.certChains).assertEqual(undefined);
        expect(encapResult.sharedSecret?.length).assertEqual(32);
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.outData).assertEqual(undefined);
        expect(decapResult.properties).assertEqual(undefined);
        expect(decapResult.certChains).assertEqual(undefined);
        expect(decapResult.sharedSecret?.length).assertEqual(32);

        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0200
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0200
     * @tc.desc   Generate ML-KEM 768 key pair, encapsulate/decapsulate AES key, both shared keys stored, encrypt/decrypt verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0200";

      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let baseKeyOptions = GetEmptyOptions();
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetCtrNoPaddingOptions(16), GetAesGenerateOptions(256));
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        expect(encapResult.outData?.length).assertEqual(1088);
        expect(encapResult.properties).assertEqual(undefined);
        expect(encapResult.certChains).assertEqual(undefined);
        expect(encapResult.sharedSecret).assertEqual(undefined);
        let encapSharedKeyExist = await huks.isKeyItemExist(encapSharedKeyAlias, baseKeyOptions);
        expect(encapSharedKeyExist).assertEqual(true);
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        expect(decapResult.outData).assertEqual(undefined);
        expect(decapResult.properties).assertEqual(undefined);
        expect(decapResult.certChains).assertEqual(undefined);
        expect(encapResult.sharedSecret).assertEqual(undefined);
        let decapSharedKeyExist = await huks.isKeyItemExist(decapSharedKeyAlias, baseKeyOptions);
        expect(decapSharedKeyExist).assertEqual(true);

        let cipherData = BuildCipherData([64, 128]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT)
        let encryptResult = await DoCipher(encapSharedKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        let decryptResult = await DoCipher(decapSharedKeyAlias, cipherOptions, encryptResult);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0300
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0300
     * @tc.desc   Generate ML-KEM 768 key pair, encapsulate/decapsulate AES key, only decapsulate shared key stored, encrypt/decrypt verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0300";

      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let generateKeyOptions = GetMlKemGenerateOptions(768);

      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      let sharedKeyParams = MergeOptions(GetCtrNoPaddingOptions(16), GetAesGenerateOptions(256));
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        sharedKeyParams.inData = encapResult.sharedSecret;
        await huks.importKeyItem(encapSharedKeyAlias, sharedKeyParams);

        let cipherData = BuildCipherData([64, 128]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT)
        let encryptResult = await DoCipher(encapSharedKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        let decryptResult = await DoCipher(decapSharedKeyAlias, cipherOptions, encryptResult);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0400
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0400
     * @tc.desc   Generate ML-KEM 768 key pair, real scenario encapsulate/decapsulate with AES-CTR encryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0400";

      let genKeyAlias: string = testNumber + "_gen";
      let importKeyAlias: string = testNumber + "_import";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportPubKeyOptions());
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
      let baseKeyOptions = GetEmptyOptions();
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetCtrNoPaddingOptions(16), GetAesGenerateOptions(256));
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let exportKeyRes = await huks.exportKeyItem(genKeyAlias, baseKeyOptions);
        importKeyOptions.inData = exportKeyRes.outData;
        await huks.importKeyItem(importKeyAlias, importKeyOptions);

        let encapResult = await huks.encapsulate(importKeyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);

        let cipherData = BuildCipherData([64, 128]);
        let encryptResult = await DoCipher(encapSharedKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        let decryptResult = await DoCipher(decapSharedKeyAlias, cipherOptions, encryptResult);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0500
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0500
     * @tc.desc   Generate ML-KEM 1024 key pair, encapsulate/decapsulate, no shared key stored, compare consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0500";

      let keyAlias: string = testNumber + "_key";
      let generateKeyOptions = GetMlKemGenerateOptions(1024);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        expect(encapResult.outData?.length).assertEqual(1568);
        expect(encapResult.properties).assertEqual(undefined);
        expect(encapResult.certChains).assertEqual(undefined);
        expect(encapResult.sharedSecret?.length).assertEqual(32);
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.outData).assertEqual(undefined);
        expect(decapResult.properties).assertEqual(undefined);
        expect(decapResult.certChains).assertEqual(undefined);
        expect(decapResult.sharedSecret?.length).assertEqual(32);

        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0600
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0600
     * @tc.desc   Generate ML-KEM 1024 key pair, encapsulate/decapsulate AES key, both shared keys stored, encrypt/decrypt verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0600";

      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let baseKeyOptions = GetEmptyOptions();
      let generateKeyOptions = GetMlKemGenerateOptions(1024);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetCtrNoPaddingOptions(16), GetAesGenerateOptions(256));
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        expect(encapResult.outData?.length).assertEqual(1568);
        expect(encapResult.properties).assertEqual(undefined);
        expect(encapResult.certChains).assertEqual(undefined);
        expect(encapResult.sharedSecret).assertEqual(undefined);
        let encapSharedKeyExist = await huks.isKeyItemExist(encapSharedKeyAlias, baseKeyOptions);
        expect(encapSharedKeyExist).assertEqual(true);
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        expect(decapResult.outData).assertEqual(undefined);
        expect(decapResult.properties).assertEqual(undefined);
        expect(decapResult.certChains).assertEqual(undefined);
        expect(encapResult.sharedSecret).assertEqual(undefined);
        let decapSharedKeyExist = await huks.isKeyItemExist(decapSharedKeyAlias, baseKeyOptions);
        expect(decapSharedKeyExist).assertEqual(true);

        let cipherData = BuildCipherData([64, 128]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT)
        let encryptResult = await DoCipher(encapSharedKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        let decryptResult = await DoCipher(decapSharedKeyAlias, cipherOptions, encryptResult);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0700
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0700
     * @tc.desc   Generate ML-KEM 1024 key pair, encapsulate no shared key stored, decapsulate shared key stored, encrypt/decrypt verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0700";

      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let generateKeyOptions = GetMlKemGenerateOptions(1024);

      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      let sharedKeyParams = MergeOptions(GetCtrNoPaddingOptions(16), GetAesGenerateOptions(256));
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        sharedKeyParams.inData = encapResult.sharedSecret;
        await huks.importKeyItem(encapSharedKeyAlias, sharedKeyParams);

        let cipherData = BuildCipherData([64, 128]);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT)
        let encryptResult = await DoCipher(encapSharedKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        let decryptResult = await DoCipher(decapSharedKeyAlias, cipherOptions, encryptResult);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0800
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0800
     * @tc.desc   Generate ML-KEM 1024 key pair, real scenario encapsulate/decapsulate with AES-CTR encryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0800";

      let genKeyAlias: string = testNumber + "_gen";
      let importKeyAlias: string = testNumber + "_import";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let generateKeyOptions = GetMlKemGenerateOptions(1024);
      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(1024), GetImportPubKeyOptions());
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);
      let baseKeyOptions = GetEmptyOptions();
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetCtrNoPaddingOptions(16), GetAesGenerateOptions(256));
      let cipherOptions = MergeOptions(GetAesGenerateOptions(256), GetCtrNoPaddingOptions(16));

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let exportKeyRes = await huks.exportKeyItem(genKeyAlias, baseKeyOptions);
        importKeyOptions.inData = exportKeyRes.outData;
        await huks.importKeyItem(importKeyAlias, importKeyOptions);

        let encapResult = await huks.encapsulate(importKeyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);

        let cipherData = BuildCipherData([64, 128]);
        let encryptResult = await DoCipher(encapSharedKeyAlias, cipherOptions, cipherData);
        SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        let decryptResult = await DoCipher(decapSharedKeyAlias, cipherOptions, encryptResult);
        expect(CompareCipherData(cipherData, decryptResult)).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0900
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0900
     * @tc.desc   Import ML-KEM 768 key pair, encapsulate/decapsulate, no shared key stored, compare consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_0900";

      let keyAlias: string = testNumber + "_key";

      let keyPairOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportKeyPairOptions());
      SetInData(keyPairOptions, GetMlKemImportData(768));
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.importKeyItem(keyAlias, keyPairOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        expect(encapResult.sharedSecret).not().assertNull();
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.sharedSecret).not().assertNull();

        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1000
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1000
     * @tc.desc   Import ML-KEM 1024 key pair, encapsulate/decapsulate, no shared key stored, compare consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1000";

      let keyAlias: string = testNumber + "_key";

      let keyPairOptions = MergeOptions(GetMlKemGenerateOptions(1024), GetImportKeyPairOptions());
      SetInData(keyPairOptions, GetMlKemImportData(1024));
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.importKeyItem(keyAlias, keyPairOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        expect(encapResult.outData).not().assertNull();
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.sharedSecret).not().assertNull();

        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1100
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1100
     * @tc.desc   Import ML-KEM 768 key pair A (CE storage), encapsulate/decapsulate, shared key stored to HUKS, compare consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1100";
      let keyAlias: string = testNumber + "_key";

      let generateKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetStorageLevelEceOptions());
      let wrapParams = SetParam(GetStorageLevelEceOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        expect(encapResult.sharedSecret).not().assertNull();
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.sharedSecret).not().assertNull();
        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1200
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1200
     * @tc.desc   Import ML-KEM 768 key pair C (DE storage), encapsulate/decapsulate, shared key stored to HUKS, compare consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1200";
      let keyAlias: string = testNumber + "_key";

      let generateKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetStorageLevelCeOptions());
      let wrapParams = SetParam(GetStorageLevelCeOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        expect(encapResult.sharedSecret).not().assertNull();
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.sharedSecret).not().assertNull();
        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1300
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1300
     * @tc.desc   Import ML-KEM 768 key pair D (ECE storage), encapsulate/decapsulate, shared key stored to HUKS, compare consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1300";
      let keyAlias: string = testNumber + "_key";

      let generateKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetStorageLevelDeOptions());
      let wrapParams = SetParam(GetStorageLevelDeOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        expect(encapResult.sharedSecret).not().assertNull();
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.sharedSecret).not().assertNull();
        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1400
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1400
     * @tc.desc   Import ML-KEM 768 key pair cluster (user auth access control), encapsulate/decapsulate, compare consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1400";
      let keyAlias: string = testNumber + "_key";

      let generateKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetAccessGroupOptions(HuksMinGroupId));
      let wrapParams = SetParam(GetAccessGroupOptions(HuksMinGroupId), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties);
        expect(encapResult.sharedSecret).not().assertNull();
        let decapResult = await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData);
        expect(decapResult.sharedSecret).not().assertNull();
        expect(Uint8ArrayToHexString(encapResult.sharedSecret!)).assertEqual(Uint8ArrayToHexString(decapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1500
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1500
     * @tc.desc   Import ML-KEM 768 key pair A (CE), encap/decap AES key, retrieve key properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1500";

      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let baseKeyOptions = GetStorageLevelEceOptions();
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), baseKeyOptions);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(encapSharedKeyAlias, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(keyProperties.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);

        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        getKeyPropertiesRes = await huks.getKeyItemProperties(decapSharedKeyAlias, baseKeyOptions);
        keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(keyProperties.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1600
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1600
     * @tc.desc   Import ML-KEM 768 key pair C (DE), encap/decap AES key, retrieve key properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1600";

      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let baseKeyOptions = GetStorageLevelCeOptions();
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), baseKeyOptions);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(encapSharedKeyAlias, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(keyProperties.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        getKeyPropertiesRes = await huks.getKeyItemProperties(decapSharedKeyAlias, baseKeyOptions);
        keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(keyProperties.length).assertEqual(10);
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
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1700
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1700
     * @tc.desc   Import ML-KEM 768 key pair D (ECE), encap/decap AES key, retrieve key properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1700";

      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let baseKeyOptions = GetStorageLevelDeOptions();
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), baseKeyOptions);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(encapSharedKeyAlias, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        PrintOptions({ properties: keyProperties } as huks.HuksOptions);
        expect(keyProperties.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);

        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        getKeyPropertiesRes = await huks.getKeyItemProperties(decapSharedKeyAlias, baseKeyOptions);
        keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(keyProperties.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1800
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1800
     * @tc.desc   Import ML-KEM 768 key pair cluster, encap/decap AES key, retrieve key properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1800";

      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let baseKeyOptions = GetAccessGroupOptions(HuksMinGroupId);
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetAesGenerateOptions(256), baseKeyOptions);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(encapSharedKeyAlias, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        PrintOptions({ properties: keyProperties } as huks.HuksOptions);
        expect(keyProperties.length).assertEqual(12);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);

        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        getKeyPropertiesRes = await huks.getKeyItemProperties(decapSharedKeyAlias, baseKeyOptions);
        keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(keyProperties.length).assertEqual(12);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_ACCESS_GROUP)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1900
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1900
     * @tc.desc   Real scenario, sharedKeyAlias same as keyAlias, session key should overwrite ML-KEM key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_1900";

      let genKeyAlias: string = testNumber + "_gen";
      let importKeyAlias: string = testNumber + "_import";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let importKeyOptions = MergeOptions(GetMlKemGenerateOptions(768), GetImportPubKeyOptions());
      SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP);

      let baseKeyOptions = GetEmptyOptions();
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetCtrNoPaddingOptions(16), GetAesGenerateOptions(256));

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let exportKeyRes = await huks.exportKeyItem(genKeyAlias, baseKeyOptions);
        importKeyOptions.inData = exportKeyRes.outData;
        await huks.importKeyItem(importKeyAlias, importKeyOptions);

        let encapResult = await huks.encapsulate(importKeyAlias, wrapParams.properties, importKeyAlias, sharedKeyParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, genKeyAlias, sharedKeyParams.properties);

        let keyProps = await huks.getKeyItemProperties(importKeyAlias, baseKeyOptions);
        let props = keyProps.properties as huks.HuksParam[];
        expect(GetParam(props, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(props, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);

        let decapKeyProps = await huks.getKeyItemProperties(genKeyAlias, baseKeyOptions);
        let decapProps = decapKeyProps.properties as huks.HuksParam[];
        expect(GetParam(decapProps, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_AES);
        expect(GetParam(decapProps, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(256);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2000
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2000
     * @tc.desc   Encap/decap with user auth ALWAYS_VALID, retrieve key properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2000";
      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let baseKeyOptions = GetEmptyOptions();
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = MergeOptions(GetCtrNoPaddingOptions(16), GetAesGenerateOptions(256), GetUserAuthOptions());

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        let encapSharedKeyProps = await huks.getKeyItemProperties(encapSharedKeyAlias, baseKeyOptions);
        let encapProps = encapSharedKeyProps.properties as huks.HuksParam[];
        expect(GetParam(encapProps, huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE)).assertEqual(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN);
        expect(GetParam(encapProps, huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE)).assertEqual(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL);
        expect(GetParam(encapProps, huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE)).assertEqual(huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_ALWAYS_VALID);
        let decapSharedKeyProps = await huks.getKeyItemProperties(decapSharedKeyAlias, baseKeyOptions);
        let decapProps = decapSharedKeyProps.properties as huks.HuksParam[];
        expect(GetParam(decapProps, huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE)).assertEqual(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN);
        expect(GetParam(decapProps, huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE)).assertEqual(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL);
        expect(GetParam(decapProps, huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE)).assertEqual(huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_ALWAYS_VALID);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2100
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2100
     * @tc.desc   Encap/decap with secure sign key support, retrieve key properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2100";
      let keyAlias: string = testNumber + "_key";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let baseKeyOptions = GetEmptyOptions();
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC);

      try {
        await huks.generateKeyItem(keyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(keyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        let encapSharedKeyProps = await huks.getKeyItemProperties(encapSharedKeyAlias, baseKeyOptions);
        let encapProps = encapSharedKeyProps.properties as huks.HuksParam[];
        expect(GetParam(encapProps, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC);
        SetParam(sharedKeyParams, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE)
        await huks.decapsulate(keyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        let decapSharedKeyProps = await huks.getKeyItemProperties(decapSharedKeyAlias, baseKeyOptions);
        let decapProps = decapSharedKeyProps.properties as huks.HuksParam[];
        expect(GetParam(decapProps, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2300
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2300
     * @tc.desc   Encapsulate with unsupported algorithm type in params, expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2300";

      let genKeyAlias: string = testNumber + "_gen";
      let encapSharedKeyAlias: string = testNumber + "_encap_shared";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = GetSm4GenerateOptions(256);

      await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
      try {
        await huks.encapsulate(genKeyAlias, wrapParams.properties, encapSharedKeyAlias, sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2400
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2400
     * @tc.desc   Encapsulate with sharedKeyParams containing unsupported key type, expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2400";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let wrongSharedKeyParams = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        await huks.encapsulate(genKeyAlias, wrapParams.properties, sharedKeyAlias, wrongSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2500
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2500
     * @tc.desc   Encapsulate with sharedKeyParams containing unsupported key size, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2500";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let wrongSharedKeyParams = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_SIZE, 128);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        await huks.encapsulate(genKeyAlias, wrapParams.properties, sharedKeyAlias, wrongSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2600
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2600
     * @tc.desc   Encapsulate with sharedKeyParams containing unsupported key purpose, expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2600";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let wrongSharedKeyParams = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        await huks.encapsulate(genKeyAlias, wrapParams.properties, sharedKeyAlias, wrongSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2700
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2700
     * @tc.desc   Encapsulate with sharedKeyParams missing key type, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2700";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let missingSharedKeyParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_KEY_SIZE, 256);
      SetParam(missingSharedKeyParams, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        await huks.encapsulate(genKeyAlias, wrapParams.properties, sharedKeyAlias, missingSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2800
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2800
     * @tc.desc   Encapsulate with sharedKeyParams missing key size, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2800";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let missingSharedKeyParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      SetParam(missingSharedKeyParams, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        await huks.encapsulate(genKeyAlias, wrapParams.properties, sharedKeyAlias, missingSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2900
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2900
     * @tc.desc   Encapsulate with sharedKeyParams missing key purpose, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_2900";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let missingSharedKeyParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      SetParam(missingSharedKeyParams, huks.HuksTag.HUKS_TAG_KEY_SIZE, 256);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        await huks.encapsulate(genKeyAlias, wrapParams.properties, sharedKeyAlias, missingSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3100
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3100
     * @tc.desc   Decapsulate with wrong algorithm in params, expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3100";

      let genKeyAlias: string = testNumber + "_gen";
      let decapSharedKeyAlias: string = testNumber + "_decap_shared";

      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let sharedKeyParams = GetSm4GenerateOptions(256);

      await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
      let encapResult = await huks.encapsulate(genKeyAlias, wrapParams.properties);
      try {
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, decapSharedKeyAlias, sharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3200
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3200
     * @tc.desc   Decapsulate with encapData from mismatched key, shared key should be different
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3200";

      let keyAliasA: string = testNumber + "_keyA";
      let keyAliasB: string = testNumber + "_keyB";

      let generateKeyOptionsA = GetMlKemGenerateOptions(768);
      let generateKeyOptionsB = GetMlKemGenerateOptions(768);

      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.generateKeyItem(keyAliasA, generateKeyOptionsA);
        await huks.generateKeyItem(keyAliasB, generateKeyOptionsB);

        let encapResultA = await huks.encapsulate(keyAliasA, wrapParams.properties);
        let encapResultB = await huks.encapsulate(keyAliasB, wrapParams.properties);

        let decapResultMismatch = await huks.decapsulate(keyAliasA, wrapParams.properties, encapResultB.outData);
        expect(decapResultMismatch.sharedSecret).not().assertNull();

        let decapResultCorrect = await huks.decapsulate(keyAliasA, wrapParams.properties, encapResultA.outData);
        expect(decapResultCorrect.sharedSecret).not().assertNull();

        expect(Uint8ArrayToHexString(decapResultMismatch.sharedSecret!)).not().assertEqual(Uint8ArrayToHexString(decapResultCorrect.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3300
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3300
     * @tc.desc   Decapsulate with tampered encapData, shared key should be different from correct one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3300";

      let genKeyAlias: string = testNumber + "_gen";
      let generateKeyOptions = GetMlKemGenerateOptions(768);

      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);

        let encapResult = await huks.encapsulate(genKeyAlias, wrapParams.properties);
        expect(encapResult.outData).not().assertNull();

        let correctDecapResult = await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData);
        expect(correctDecapResult.sharedSecret).not().assertNull();

        let tamperedEncapData = new Uint8Array(encapResult.outData as Uint8Array);
        tamperedEncapData[0] = tamperedEncapData[0] ^ 0xFF;
        let tamperedDecapResult = await huks.decapsulate(genKeyAlias, wrapParams.properties, tamperedEncapData);
        expect(tamperedDecapResult.sharedSecret).not().assertNull();
        expect(Uint8ArrayToHexString(tamperedDecapResult.sharedSecret!)).not().assertEqual(Uint8ArrayToHexString(correctDecapResult.sharedSecret!));
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3400
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3400
     * @tc.desc   Decapsulate with sharedKeyParams containing unsupported key type, expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3400";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let wrongSharedKeyParams = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(genKeyAlias, wrapParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, wrongSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3500
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3500
     * @tc.desc   Decapsulate with sharedKeyParams containing unsupported key size, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3500";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let wrongSharedKeyParams = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_KEY_SIZE, 128);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(genKeyAlias, wrapParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, wrongSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3600
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3600
     * @tc.desc   Decapsulate with sharedKeyParams containing unsupported key purpose, expect error 12000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3600";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let wrongSharedKeyParams = SetParam(GetAesGenerateOptions(256), huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(genKeyAlias, wrapParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, wrongSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000003);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3700
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3700
     * @tc.desc   Decapsulate with sharedKeyParams missing key type, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3700";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let missingSharedKeyParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_KEY_SIZE, 256);
      SetParam(missingSharedKeyParams, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(genKeyAlias, wrapParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, missingSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3800
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3800
     * @tc.desc   Decapsulate with sharedKeyParams missing key size, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3800";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let missingSharedKeyParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      SetParam(missingSharedKeyParams, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(genKeyAlias, wrapParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, missingSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3900
     * @tc.number SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3900
     * @tc.desc   Decapsulate with sharedKeyParams missing key purpose, expect error 12000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_WrapKey_MLKEM_API26_Func_3900";

      let genKeyAlias: string = testNumber + "_gen";
      let sharedKeyAlias: string = testNumber + "_shared";
      let generateKeyOptions = GetMlKemGenerateOptions(768);
      let wrapParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_KEM);
      let missingSharedKeyParams = SetParam(GetEmptyOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      SetParam(missingSharedKeyParams, huks.HuksTag.HUKS_TAG_KEY_SIZE, 256);

      try {
        await huks.generateKeyItem(genKeyAlias, generateKeyOptions);
        let encapResult = await huks.encapsulate(genKeyAlias, wrapParams.properties);
        await huks.decapsulate(genKeyAlias, wrapParams.properties, encapResult.outData, sharedKeyAlias, missingSharedKeyParams.properties);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000002);
      }
    })
  })
}
