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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import { GetAesGenerateOptions, GetRsaGenerateOptions, GetHmacGenerateOptions, GetEccGenerateOptions, GetEd25519GenerateOptions, GetX25519GenerateOptions, GetDsaGenerateOptions, GetDhGenerateOptions, GetSm2GenerateOptions, GetSm4GenerateOptions, Get3DesGenerateOptions, GetDesGenerateOptions } from './utils/huks/GenerateKeyUtils';
import { GenParam, GetEmptyOptions, SetParam } from './utils/huks/HuksOptionsUtils';
import { StringToUint8Array } from './utils/common/CommonUtils';
import { Logger } from './utils/common/Logger';

export default function SecurityHuksApiCover() {
  describe('SecurityHuksApiCover', () => {

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Generate_StringParam_0100
     * @tc.number SUB_Security_HUKS_ApiCover_Generate_StringParam_0100
     * @tc.desc   test generateKeyItem with minimum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Generate_StringParam_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Generate_StringParam_0100";
      let huksOptions = GetAesGenerateOptions(128);
      let alias = "a"; // minimum string length

      try {
        await huks.generateKeyItem(alias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Generate_StringParam_0200
     * @tc.number SUB_Security_HUKS_ApiCover_Generate_StringParam_0200
     * @tc.desc   test generateKeyItem with maximum string parameter length for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Generate_StringParam_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Generate_StringParam_0200";
      let huksOptions = GetAesGenerateOptions(128);
      let alias = "a".repeat(128); // maximum string length

      try {
        await huks.generateKeyItem(alias, huksOptions);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Generate_StringParam_0300
     * @tc.number SUB_Security_HUKS_ApiCover_Generate_StringParam_0300
     * @tc.desc   test generateKeyItem with empty string parameter for alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Generate_StringParam_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Generate_StringParam_0300";
      let huksOptions = GetAesGenerateOptions(128);
      let alias = ""; // empty string

      try {
        await huks.generateKeyItem(alias, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401); // HUKS_ERR_CODE_INVALID_ARGUMENT
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Generate_StringParam_0400
     * @tc.number SUB_Security_HUKS_ApiCover_Generate_StringParam_0400
     * @tc.desc   test generateKeyItem with null alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Generate_StringParam_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Generate_StringParam_0400";
      let huksOptions = GetAesGenerateOptions(128);
      let alias: string | null = null; // null string

      try {
        await huks.generateKeyItem(alias, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401); // HUKS_ERR_CODE_INVALID_ARGUMENT
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Generate_StringParam_0500
     * @tc.number SUB_Security_HUKS_ApiCover_Generate_StringParam_0500
     * @tc.desc   test generateKeyItem with undefined alias parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Generate_StringParam_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Generate_StringParam_0500";
      let huksOptions = GetAesGenerateOptions(128);
      let alias: string | undefined = undefined; // undefined string

      try {
        await huks.generateKeyItem(alias, huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401); // HUKS_ERR_CODE_INVALID_ARGUMENT
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Generate_OptionsParam_0100
     * @tc.number SUB_Security_HUKS_ApiCover_Generate_OptionsParam_0100
     * @tc.desc   test generateKeyItem with null options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Generate_OptionsParam_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Generate_OptionsParam_0100";
      let huksOptions: huks.HuksOptions | null = null; // null options

      try {
        await huks.generateKeyItem("test_options_null", huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401); // HUKS_ERR_CODE_INVALID_ARGUMENT
      }
    });

    /**
     * @tc.name   SUB_Security_HUKS_ApiCover_Generate_OptionsParam_0200
     * @tc.number SUB_Security_HUKS_ApiCover_Generate_OptionsParam_0200
     * @tc.desc   test generateKeyItem with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_HUKS_ApiCover_Generate_OptionsParam_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_HUKS_ApiCover_Generate_OptionsParam_0200";
      let huksOptions: huks.HuksOptions | undefined = undefined; // undefined options

      try {
        await huks.generateKeyItem("test_options_undefined", huksOptions);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
       expect(err.code).assertEqual(401); // HUKS_ERR_CODE_INVALID_ARGUMENT
      }
    });

  });
}