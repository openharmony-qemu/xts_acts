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
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import { GetEmptyOptions, GetParam, MergeOptions, SetInData, SetParam } from './utils/huks/HuksOptionsUtils';
import { BuildSignVerifyData, DoSign, DoVerify, SignVerify, SignVerifyData, SignVerifyReal } from './utils/huks/SignVerifyUtils';
import { GetMlDsaGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { Logger } from './utils/common/Logger';
import { GetImportKeyPairOptions, GetImportPubKeyOptions, GetMlDsaImportData } from './utils/huks/ImportKeyUtils';
import { GetAccessGroupOptions, GetStorageLevelCeOptions, GetStorageLevelDeOptions, GetStorageLevelEceOptions } from './utils/huks/AccessControlUtils';
import { Uint8ArrayToString } from './utils/common/CommonUtils';
import { HuksDefaultKeyVersion, HuksDefaultOsPatchLevel, HuksDefaultOsVersion } from './utils/huks/HuksCommonUtils';


export default function SecurityHuksSignVerifyMLDSATest() {
  let signVerifyOptions: huks.HuksOptions;

  describe('SecurityHuksSignVerifyMLDSATest', () => {
    beforeEach(() => {
      signVerifyOptions = GetEmptyOptions();
      SetParam(signVerifyOptions, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
      SetParam(signVerifyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0100
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0100
     * @tc.desc   Generate ML-DSA 44 key with ECE storage level, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0100";

      let generateKeyOptions = MergeOptions(GetMlDsaGenerateOptions(44), GetStorageLevelEceOptions());
      let baseKeyOptions = GetStorageLevelEceOptions();

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        Logger.error(`${testNumber} getKeyProperties ${JSON.stringify(getKeyPropertiesRes.properties)}`);
        expect(getKeyPropertiesRes.properties?.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(44);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0200
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0200
     * @tc.desc   Generate ML-DSA 44 key with CE storage level, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0200";

      let generateKeyOptions = MergeOptions(GetMlDsaGenerateOptions(44), GetStorageLevelCeOptions());
      let baseKeyOptions = GetStorageLevelCeOptions();

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(getKeyPropertiesRes.properties?.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(44);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull(); //todo
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0300
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0300
     * @tc.desc   Generate ML-DSA 44 key with DE storage level, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0300";

      let generateKeyOptions = MergeOptions(GetMlDsaGenerateOptions(44), GetStorageLevelDeOptions());
      let baseKeyOptions = GetStorageLevelDeOptions();

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        expect(getKeyPropertiesRes.properties?.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(44);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0500
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0500
     * @tc.desc   Generate ML-DSA 44 key with default storage level, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0500";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        Logger.error(`${testNumber} getKeyProperties ${JSON.stringify(getKeyPropertiesRes.properties)}`);
        expect(getKeyPropertiesRes.properties?.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(44);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0600
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0600
     * @tc.desc   Generate ML-DSA 65 key, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0600";

      let generateKeyOptions = GetMlDsaGenerateOptions(65);
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        Logger.error(`${testNumber} getKeyProperties ${JSON.stringify(getKeyPropertiesRes.properties)}`);
        expect(getKeyPropertiesRes.properties?.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(65);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0700
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0700
     * @tc.desc   Generate ML-DSA 87 key, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0700";

      let generateKeyOptions = GetMlDsaGenerateOptions(87);
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        Logger.error(`${testNumber} getKeyProperties ${JSON.stringify(getKeyPropertiesRes.properties)}`);
        expect(getKeyPropertiesRes.properties?.length).assertEqual(10);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(87);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0800
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0800
     * @tc.desc   Import ML-DSA 44 key pair, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0800";

      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(44), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlDsaImportData(44))
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        Logger.error(`${testNumber} getKeyProperties ${JSON.stringify(getKeyPropertiesRes.properties)}`);
        expect(getKeyPropertiesRes.properties?.length).assertEqual(11);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(44);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE)).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0900
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0900
     * @tc.desc   Import ML-DSA 65 key pair, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_0900";

      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(65), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlDsaImportData(65))
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        Logger.error(`${testNumber} getKeyProperties ${JSON.stringify(getKeyPropertiesRes.properties)}`);
        expect(getKeyPropertiesRes.properties?.length).assertEqual(11);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(65);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE)).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1000
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1000
     * @tc.desc   Import ML-DSA 87 key pair, verify key properties, export and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1000";

      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(87), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlDsaImportData(87))
      let baseKeyOptions = GetEmptyOptions();

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let isKeyExistRes = await huks.isKeyItemExist(testNumber, baseKeyOptions);
        expect(isKeyExistRes).assertEqual(true);
        let getKeyPropertiesRes = await huks.getKeyItemProperties(testNumber, baseKeyOptions);
        let keyProperties = getKeyPropertiesRes.properties as huks.HuksParam[];
        Logger.error(`${testNumber} getKeyProperties ${JSON.stringify(getKeyPropertiesRes.properties)}`);
        expect(getKeyPropertiesRes.properties?.length).assertEqual(11);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_ALGORITHM)).assertEqual(huks.HuksKeyAlg.HUKS_ALG_ML_DSA);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_SIZE)).assertEqual(87);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PURPOSE)).assertEqual(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE)).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL)).assertEqual(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_PROCESS_NAME)).not().assertNull();
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_USER_ID)).assertLarger(99);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_VERSION)).assertEqual(HuksDefaultKeyVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_VERSION)).assertEqual(HuksDefaultOsVersion);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL)).assertEqual(HuksDefaultOsPatchLevel);
        expect(GetParam(keyProperties, huks.HuksTag.HUKS_TAG_KEY_FLAG)).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        let exportKeyRes = await huks.exportKeyItem(testNumber, baseKeyOptions);
        expect(exportKeyRes.outData?.length).assertLarger(0);
        await huks.deleteKeyItem(testNumber, baseKeyOptions);
        let hasKeyRes = await huks.hasKeyItem(testNumber, baseKeyOptions);
        expect(hasKeyRes).assertEqual(false);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1100
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1100
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with 63-byte data, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1100";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1200
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1200
     * @tc.desc   Generate ML-DSA 65 key, sign and verify with 63-byte data, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1200";

      let generateKeyOptions = GetMlDsaGenerateOptions(65);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1300
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1300
     * @tc.desc   Generate ML-DSA 87 key, sign and verify with 63-byte data, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1300";

      let generateKeyOptions = GetMlDsaGenerateOptions(87);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1400
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1400
     * @tc.desc   Import ML-DSA 44 key pair, sign and verify with 63-byte data, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1400";

      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(44), GetImportKeyPairOptions());
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      SetInData(importKeyOptions, GetMlDsaImportData(44));
      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1500
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1500
     * @tc.desc   Import ML-DSA 65 key pair, sign and verify with 63-byte data, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1500";

      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(65), GetImportKeyPairOptions());
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      SetInData(importKeyOptions, GetMlDsaImportData(65));
      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1600
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1600
     * @tc.desc   Import ML-DSA 87 key pair, sign and verify with 63-byte data, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1600";

      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(87), GetImportKeyPairOptions());
      SetInData(importKeyOptions, GetMlDsaImportData(87));
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      try {
        await huks.importKeyItem(testNumber, importKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1700
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1700
     * @tc.desc   Generate ML-DSA 44 key, export and import public key, cross-key sign and verify, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1700";
      let keyAliasA: string = testNumber + "A";
      let keyAliasB: string = testNumber + "B";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(44), GetImportPubKeyOptions());
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      try {
        await huks.generateKeyItem(keyAliasA, generateKeyOptions);

        let exportRes = await huks.exportKeyItem(keyAliasA, generateKeyOptions);
        SetInData(importKeyOptions, exportRes.outData as Uint8Array);
        SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(keyAliasB, importKeyOptions);

        let res: boolean = await SignVerifyReal(keyAliasA, keyAliasB, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1800
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1800
     * @tc.desc   Generate ML-DSA 65 key, export and import public key, cross-key sign and verify, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1800";
      let keyAliasA: string = testNumber + "A";
      let keyAliasB: string = testNumber + "B";

      let generateKeyOptions = GetMlDsaGenerateOptions(65);
      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(65), GetImportPubKeyOptions());
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      try {
        await huks.generateKeyItem(keyAliasA, generateKeyOptions);

        let exportRes = await huks.exportKeyItem(keyAliasA, generateKeyOptions);
        SetInData(importKeyOptions, exportRes.outData as Uint8Array);
        SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(keyAliasB, importKeyOptions);

        let res: boolean = await SignVerifyReal(keyAliasA, keyAliasB, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1900
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1900
     * @tc.desc   Generate ML-DSA 87 key, export and import public key, cross-key sign and verify, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_1900";
      let keyAliasA: string = testNumber + "A";
      let keyAliasB: string = testNumber + "B";

      let generateKeyOptions = GetMlDsaGenerateOptions(87);
      let importKeyOptions = MergeOptions(GetMlDsaGenerateOptions(87), GetImportPubKeyOptions());
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      try {
        await huks.generateKeyItem(keyAliasA, generateKeyOptions);

        let exportRes = await huks.exportKeyItem(keyAliasA, generateKeyOptions);
        SetInData(importKeyOptions, exportRes.outData as Uint8Array);
        SetParam(importKeyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await huks.importKeyItem(keyAliasB, importKeyOptions);

        let res: boolean = await SignVerifyReal(keyAliasA, keyAliasB, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2000
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2000
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with 100KB data, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2000";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([100 * 1024]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2100
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2100
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with 101KB data exceeding limit, process fail with error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2100";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([101 * 1024]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2200
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2200
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with segmented data 50KB+50KB, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2200";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([50 * 1024, 50 * 1024]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2300
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2300
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with segmented data 100KB+1KB exceeding limit, process fail with error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2300";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([100 * 1024, 1 * 1024]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2400
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2400
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with segmented data 100KB+0, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2400";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([100 * 1024, 0]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2500
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2500
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with segmented data 50KB+50KB+0, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2500";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([50 * 1024, 50 * 1024, 0]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let res: boolean = await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2600
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2600
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with segmented data 50KB+51KB+0 exceeding limit, process fail with error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2600";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([50 * 1024, 51 * 1024, 0]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        await SignVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2800
     * @tc.number SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2800
     * @tc.desc   Generate ML-DSA 44 key, sign and verify with tampered signature, process fail with error 12000006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_MLDSA_API26_Func_2800";

      let generateKeyOptions = GetMlDsaGenerateOptions(44);
      let signVerifyData: SignVerifyData = BuildSignVerifyData([63]);

      try {
        await huks.generateKeyItem(testNumber, generateKeyOptions);
        let signatureData = await DoSign(testNumber, signVerifyOptions, signVerifyData);
        signVerifyData.signatureData = signatureData.subarray(1, signatureData.length);
        // signVerifyData.signatureData = signatureData;
        SetParam(signVerifyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
        await DoVerify(testNumber, signVerifyOptions, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(12000006);
      }
    })


  }
  )
}
