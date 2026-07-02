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
import { CreateAssetMap } from './utils/asset/AssetUtils';
import { StringToUint8Array } from './utils/common/CommonUtils';

const NONEXISTENT_GROUP_ID = 'nonexistent_group_errorcode_test';

export default function AssetApiCoverErrorCodeTest() {

  describe('AssetApiCoverErrorCodeTest', () => {

    //asset.batchAdd()
    /**
     * @tc.name   SUB_Security_Asset_ErrorCode_BatchAdd_Interface_0900
     * @tc.number SUB_Security_Asset_ErrorCode_BatchAdd_Interface_0900
     * @tc.desc   test batchAdd with nonexistent GROUP_ID throws IPC error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ErrorCode_BatchAdd_Interface_0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ErrorCode_BatchAdd_Interface_0900";

      let assetArray: Array<asset.AssetMap> = [];
      let attr: asset.AssetMap = CreateAssetMap(testNumber + '_alias_0', 'secret');
      attr.set(asset.Tag.GROUP_ID, StringToUint8Array(NONEXISTENT_GROUP_ID));
      assetArray.push(attr);

      try {
        await asset.batchAdd(assetArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000010);
      }
    });

    //asset.batchRemove()
    /**
     * @tc.name   SUB_Security_Asset_ErrorCode_BatchRemove_Interface_0500
     * @tc.number SUB_Security_Asset_ErrorCode_BatchRemove_Interface_0500
     * @tc.desc   test batchRemove with nonexistent GROUP_ID throws IPC error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ErrorCode_BatchRemove_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ErrorCode_BatchRemove_Interface_0500";

      let queryArray: Array<asset.AssetMap> = [];
      let queryAttr: asset.AssetMap = new Map();
      queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(testNumber + '_alias_0'));
      queryAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(NONEXISTENT_GROUP_ID));
      queryArray.push(queryAttr);

      try {
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000010);
      }
    });

    //asset.batchUpdate()
    /**
     * @tc.name   SUB_Security_Asset_ErrorCode_BatchUpdate_Interface_0500
     * @tc.number SUB_Security_Asset_ErrorCode_BatchUpdate_Interface_0500
     * @tc.desc   test batchUpdate with nonexistent GROUP_ID throws IPC error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_Asset_ErrorCode_BatchUpdate_Interface_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testNumber = "SUB_Security_Asset_ErrorCode_BatchUpdate_Interface_0500";
      
      let sourceArray: Array<asset.AssetMap> = [];
      let sourceAttr: asset.AssetMap = new Map();
      sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(testNumber + '_alias_0'));
      sourceAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(NONEXISTENT_GROUP_ID));
      sourceArray.push(sourceAttr);
      let destArray: Array<asset.AssetMap> = [];
      let destAttr: asset.AssetMap = new Map();
      destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
      destArray.push(destAttr);

      try {
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000010);
      }
    });
  });
}
