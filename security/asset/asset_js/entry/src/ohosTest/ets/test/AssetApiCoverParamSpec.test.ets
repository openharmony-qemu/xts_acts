/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import asset from '@ohos.security.asset';
import { Logger } from './utils/common/Logger';
import { CreateBatchAssetMaps } from './utils/asset/AssetUtils';

export default function AssetApiCoverParamSpecTest() {

  describe('AssetApiCoverParamSpecTest', () => {

    //asset.batchAdd()
    /**
     * @tc.name   SUB_Security_Asset_ParamSpec_BatchAdd_Interface_5000
     * @tc.number SUB_Security_Asset_ParamSpec_BatchAdd_Interface_5000
     * @tc.desc   test batchAdd with null attributesArray parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ParamSpec_BatchAdd_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ParamSpec_BatchAdd_Interface_5000";

      try {
        await asset.batchAdd(null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_ParamSpec_BatchAdd_Interface_5100
     * @tc.number SUB_Security_Asset_ParamSpec_BatchAdd_Interface_5100
     * @tc.desc   test batchAdd with undefined attributesArray parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ParamSpec_BatchAdd_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ParamSpec_BatchAdd_Interface_5100";

      try {
        await asset.batchAdd(undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    //asset.batchRemove()
    /**
     * @tc.name   SUB_Security_Asset_ParamSpec_BatchRemove_Interface_5000
     * @tc.number SUB_Security_Asset_ParamSpec_BatchRemove_Interface_5000
     * @tc.desc   test batchRemove with null assetsToBeRemoved parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ParamSpec_BatchRemove_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ParamSpec_BatchRemove_Interface_5000";

      try {
        await asset.batchRemove(null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_ParamSpec_BatchRemove_Interface_5100
     * @tc.number SUB_Security_Asset_ParamSpec_BatchRemove_Interface_5100
     * @tc.desc   test batchRemove with undefined assetsToBeRemoved parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ParamSpec_BatchRemove_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ParamSpec_BatchRemove_Interface_5100";

      try {
        await asset.batchRemove(undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    //asset.batchUpdate()
    /**
     * @tc.name   SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_5000
     * @tc.number SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_5000
     * @tc.desc   test batchUpdate with null sourceAttributes parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_5000";
      let destAttributes = CreateBatchAssetMaps(testNumber + '_dest_', 1);

      try {
        await asset.batchUpdate(null, destAttributes);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_5100
     * @tc.number SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_5100
     * @tc.desc   test batchUpdate with undefined sourceAttributes parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_5100";
      let destAttributes = CreateBatchAssetMaps(testNumber + '_dest_', 1);

      try {
        await asset.batchUpdate(undefined, destAttributes);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_6000
     * @tc.number SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_6000
     * @tc.desc   test batchUpdate with null destAttributes parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_6000";
      let sourceAttributes = CreateBatchAssetMaps(testNumber + '_src_', 1);

      try {
        await asset.batchUpdate(sourceAttributes, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_6100
     * @tc.number SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_6100
     * @tc.desc   test batchUpdate with undefined destAttributes parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ParamSpec_BatchUpdate_Interface_6100";
      let sourceAttributes = CreateBatchAssetMaps(testNumber + '_src_', 1);

      try {
        await asset.batchUpdate(sourceAttributes, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
  });
}
