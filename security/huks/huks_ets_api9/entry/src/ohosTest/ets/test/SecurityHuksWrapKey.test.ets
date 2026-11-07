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
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { huks } from '@kit.UniversalKeystoreKit';
import { CheckSoftware } from './utils/huks/HuksOptionsUtils';
import { GetWrapKeyGenerateOptions, GetWrapKeyOptions } from './utils/huks/WrapKeyUtils';
import { Logger } from './utils/common/Logger';


export default function SecurityHuksWrapKeyTest() {
  let useSoftware: boolean = true;

  describe('SecurityHuksWrapKeyTest', () => {
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_WrapKey_API20_Func_0100
     * @tc.number SUB_Security_HUKS_KeyGenerate_WrapKey_API20_Func_0100
     * @tc.desc   test wrapKeyItem, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyGenerate_WrapKey_API20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_WrapKey_API20_Func_0100";
      let genKeyOptions: huks.HuksOptions = GetWrapKeyGenerateOptions();
      let wrapKeyOptions: huks.HuksOptions = GetWrapKeyOptions();
      let keyGenerated: boolean = false;
      const cleanupKey: () => Promise<void> = async () => {
        if (keyGenerated) {
          try {
            await huks.deleteKeyItem(testNumber, genKeyOptions);
            keyGenerated = false;
          } catch (err) {
            Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
            expect(null).assertFail();
          }
        }
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        keyGenerated = true;
        let wrapResult: huks.HuksReturnResult = await huks.wrapKeyItem(testNumber, wrapKeyOptions);
        expect(useSoftware).assertEqual(false);
        expect(wrapResult.outData?.length).assertLarger(0);
        await cleanupKey();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(useSoftware).assertEqual(true);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SUPPORTED_API);
        await cleanupKey();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_KeyGenerate_UnwrapKey_API20_Func_0100
     * @tc.number SUB_Security_HUKS_KeyGenerate_UnwrapKey_API20_Func_0100
     * @tc.desc   test unwrapKeyItem, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_KeyGenerate_UnwrapKey_API20_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_KeyGenerate_UnwrapKey_API20_Func_0100";
      let genKeyOptions: huks.HuksOptions = GetWrapKeyGenerateOptions();
      let wrapKeyOptions: huks.HuksOptions = GetWrapKeyOptions();
      let keyGenerated: boolean = false;
      const cleanupKey: () => Promise<void> = async () => {
        if (keyGenerated) {
          try {
            await huks.deleteKeyItem(testNumber, genKeyOptions);
            keyGenerated = false;
          } catch (err) {
            Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
            expect(null).assertFail();
          }
        }
      };
      try {
        await huks.generateKeyItem(testNumber, genKeyOptions);
        keyGenerated = true;
        let wrapResult: huks.HuksReturnResult = await huks.wrapKeyItem(testNumber, wrapKeyOptions);
        let wrappedKey: Uint8Array = wrapResult.outData as Uint8Array;
        await huks.deleteKeyItem(testNumber, genKeyOptions);
        await huks.unwrapKeyItem(testNumber, wrapKeyOptions, wrappedKey);
        expect(useSoftware).assertEqual(false);
        await cleanupKey();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(useSoftware).assertEqual(true);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SUPPORTED_API);
        await cleanupKey();
      }
    })
  })
}