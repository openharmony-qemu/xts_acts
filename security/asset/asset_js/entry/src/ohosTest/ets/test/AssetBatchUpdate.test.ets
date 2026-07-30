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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import asset from '@ohos.security.asset';
import { Logger } from './utils/common/Logger';
import { CreateBatchAssetMaps, CleanAllAssets, CreateAssetMap, MinGroupId, MaxGroupId } from './utils/asset/AssetUtils';
import { StringToUint8Array, GetDataBySize } from './utils/common/CommonUtils';

export default function AssetBatchUpdateTest() {
  const ALIAS_PREFIX = 'batch_update_test_';

  describe('AssetBatchUpdateTest', () => {

    beforeEach(async () => {
      await CleanAllAssets();
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0010
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0010
     * @tc.desc   batchUpdate with 1 item succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0010';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0020
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0020
     * @tc.desc   batchUpdate with 100 items succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0020';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 100);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let destArray: Array<asset.AssetMap> = [];
        for (let i = 0; i < 100; i++) {
          let sourceAttr: asset.AssetMap = new Map();
          sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + String(i)));
          sourceArray.push(sourceAttr);
          let destAttr: asset.AssetMap = new Map();
          destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret_' + String(i)));
          destArray.push(destAttr);
        }
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0030
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0030
     * @tc.desc   batchUpdate with 0 items throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0030';
      try {
        let sourceArray: Array<asset.AssetMap> = [];
        let destArray: Array<asset.AssetMap> = [];
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0040
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0040
     * @tc.desc   batchUpdate with 101 items throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0040';
      try {
        let sourceArray: Array<asset.AssetMap> = [];
        let destArray: Array<asset.AssetMap> = [];
        for (let i = 0; i < 101; i++) {
          let sourceAttr: asset.AssetMap = new Map();
          sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + String(i)));
          sourceArray.push(sourceAttr);
          let destAttr: asset.AssetMap = new Map();
          destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret_' + String(i)));
          destArray.push(destAttr);
        }
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0050
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0050
     * @tc.desc   batchUpdate with ALIAS missing throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0050';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0060
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0060
     * @tc.desc   batchUpdate with ALIAS type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0060';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0070
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0070
     * @tc.desc   batchUpdate with ALIAS length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0070';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0080
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0080
     * @tc.desc   batchUpdate with ALIAS length 256 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0080';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.ALIAS, StringToUint8Array(GetDataBySize(256)));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(GetDataBySize(256)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0090
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0090
     * @tc.desc   batchUpdate with ALIAS length 257 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0090';
      try {
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(GetDataBySize(257)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0100
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0100
     * @tc.desc   batchUpdate with source REQUIRE_ATTR_ENCRYPTED type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0100';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, 1 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0110
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0110
     * @tc.desc   batchUpdate with source IS_PERSISTENT type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0110';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.IS_PERSISTENT, 1 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0120
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0120
     * @tc.desc   batchUpdate with source ACCESSIBILITY invalid value -1 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0120';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.ACCESSIBILITY, -1 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0130
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0130
     * @tc.desc   batchUpdate with source ACCESSIBILITY type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0130';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.ACCESSIBILITY, StringToUint8Array('a') as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0140
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0140
     * @tc.desc   batchUpdate with source AUTH_TYPE invalid value -1 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0140';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.AUTH_TYPE, -1 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0150
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0150
     * @tc.desc   batchUpdate with source AUTH_TYPE type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0150';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.AUTH_TYPE, StringToUint8Array('a') as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0160
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0160
     * @tc.desc   batchUpdate with source SYNC_TYPE invalid value -1 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0160';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.SYNC_TYPE, -1 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0170
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0170
     * @tc.desc   batchUpdate with source SYNC_TYPE type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0170';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.SYNC_TYPE, StringToUint8Array('a') as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0180
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0180
     * @tc.desc   batchUpdate with source GROUP_ID length 6 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0180';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(GetDataBySize(6)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0190
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0190
     * @tc.desc   batchUpdate with source GROUP_ID length 7 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0190';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0200
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0200
     * @tc.desc   batchUpdate with source GROUP_ID length 127 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0200';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.GROUP_ID, StringToUint8Array(MaxGroupId));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(MaxGroupId));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0210
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0210
     * @tc.desc   batchUpdate with source GROUP_ID length 128 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0210';
      try {
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(GetDataBySize(128)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0220
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0220
     * @tc.desc   batchUpdate with source GROUP_ID type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0220';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.GROUP_ID, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0230
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0230
     * @tc.desc   batchUpdate with source DATA_LABEL length 1 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0230';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(1)));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(1)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0240
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0240
     * @tc.desc   batchUpdate with source DATA_LABEL length 2048 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0240';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(2048)));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(2048)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0250
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0250
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_1 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0250';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_1, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0260
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0260
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_1 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0260';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_1, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0270
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0270
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_1 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0270';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_1, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0280
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0280
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_2 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0280';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_2, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0290
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0290
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_2 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0290';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_2, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0300
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0300
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_2 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0300';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_2, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0310
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0310
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_3 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0310';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_3, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0320
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0320
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_3 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0320';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_3, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0330
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0330
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_3 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0330';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_3, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0340
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0340
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_4 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0340';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_4, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0350
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0350
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_4 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0350';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_4, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0360
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0360
     * @tc.desc   batchUpdate with source DATA_LABEL_CRITICAL_4 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0360';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_CRITICAL_4, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0370
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0370
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_1 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0370';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0380
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0380
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_1 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0380';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0390
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0390
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_1 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0390';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0400
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0400
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_2 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0400';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_2, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0410
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0410
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_2 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0410';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_2, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0420
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0420
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_2 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0420';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_2, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0430
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0430
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_3 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0430';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_3, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0440
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0440
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_3 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0440';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_3, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0450
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0450
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_3 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0450';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_3, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0460
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0460
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_4 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0460';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_4, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0470
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0470
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_4 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0470';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_4, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0480
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0480
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_4 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0480';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_4, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0490
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0490
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_1 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0490';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0500
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0500
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_1 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0500';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0510
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0510
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_1 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0510';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0520
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0520
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_2 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0520';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0530
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0530
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_2 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0530';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0540
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0540
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_2 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0540';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0550
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0550
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_3 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0550';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0560
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0560
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_3 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0560';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0570
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0570
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_3 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0570';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0580
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0580
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_4 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0580';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, StringToUint8Array(GetDataBySize(0)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0590
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0590
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_4 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0590';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, StringToUint8Array(GetDataBySize(2049)));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0600
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0600
     * @tc.desc   batchUpdate with source DATA_LABEL_NORMAL_LOCAL_4 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0600';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, 123 as asset.Value);
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        destArray.push(new Map().set(asset.Tag.SECRET, StringToUint8Array('updated_secret')));
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
});
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0610
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0610
     * @tc.desc   batchUpdate with dest SECRET length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0610';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0620
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0620
     * @tc.desc   batchUpdate with dest SECRET length 1 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0620';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array(GetDataBySize(1)));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0630
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0630
     * @tc.desc   batchUpdate with dest SECRET length 1024 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0630';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array(GetDataBySize(1024)));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0640
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0640
     * @tc.desc   batchUpdate with dest SECRET length 1025 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0640';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array(GetDataBySize(1025)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0650
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0650
     * @tc.desc   batchUpdate with dest SECRET type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0650';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, 123 as asset.Value);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0660
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0660
     * @tc.desc   batchUpdate with dest DATA_LABEL length 1 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0660';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(1)));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(1)));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0670
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0670
     * @tc.desc   batchUpdate with dest DATA_LABEL length 2048 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0670';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(2048)));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(2048)));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0680
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0680
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_1 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0680';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0690
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0690
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_1 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0690';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(2049)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0700
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0700
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_2 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0700';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_2, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0710
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0710
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_2 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0710';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_2, StringToUint8Array(GetDataBySize(2049)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0720
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0720
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_3 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0720';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_3, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0730
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0730
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_3 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0730';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_3, StringToUint8Array(GetDataBySize(2049)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0740
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0740
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_4 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0740';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_4, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0750
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0750
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_4 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0750';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_4, StringToUint8Array(GetDataBySize(2049)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0760
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0760
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_LOCAL_1 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0760';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0770
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0770
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_LOCAL_1 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0770';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, StringToUint8Array(GetDataBySize(2049)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0780
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0780
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_LOCAL_2 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0780';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0790
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0790
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_LOCAL_2 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0790';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, StringToUint8Array(GetDataBySize(2049)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0800
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0800
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_LOCAL_3 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0800';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0810
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0810
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_LOCAL_3 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0810';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, StringToUint8Array(GetDataBySize(2049)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0820
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0820
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_LOCAL_4 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0820';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, StringToUint8Array(GetDataBySize(0)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0830
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0830
     * @tc.desc   batchUpdate with dest DATA_LABEL_NORMAL_LOCAL_4 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0830';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, StringToUint8Array(GetDataBySize(2049)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0840
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0840
     * @tc.desc   batchUpdate with source and dest length mismatch throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0840';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0850
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0850
     * @tc.desc   batchUpdate with nonexistent data fails in return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0850';
      try {
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr: asset.AssetMap = new Map();
        sourceAttr.set(asset.Tag.ALIAS, StringToUint8Array('nonexistent_alias'));
        sourceArray.push(sourceAttr);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destArray.push(destAttr);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(1);
        expect(result.failedErrorInfos.length).assertEqual(1);
        let errInfo: asset.BatchErrInfo = result.failedErrorInfos[0];
        expect(errInfo.index).assertEqual(0);
        expect(errInfo.errCode).assertEqual(24000002);
        expect(typeof errInfo.message).assertEqual('string');
        expect(errInfo.message.length > 0).assertTrue();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0860
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0860
     * @tc.desc   batchUpdate with dest ACCESSIBILITY passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0860';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0870
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0870
     * @tc.desc   batchUpdate with dest ALIAS passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0870';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.ALIAS, StringToUint8Array('new_alias'));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0880
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0880
     * @tc.desc   batchUpdate with dest AUTH_TYPE passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0880';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.AUTH_TYPE, asset.AuthType.NONE);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0890
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0890
     * @tc.desc   batchUpdate with dest CONFLICT_RESOLUTION passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0890';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.CONFLICT_RESOLUTION, asset.ConflictResolution.OVERWRITE);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0900
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0900
     * @tc.desc   batchUpdate with dest DATA_LABEL_CRITICAL_1 passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0900';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_CRITICAL_1, StringToUint8Array(GetDataBySize(10)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0910
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0910
     * @tc.desc   batchUpdate with dest DATA_LABEL_CRITICAL_2 passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0910';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_CRITICAL_2, StringToUint8Array(GetDataBySize(10)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0920
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0920
     * @tc.desc   batchUpdate with dest DATA_LABEL_CRITICAL_3 passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0920';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_CRITICAL_3, StringToUint8Array(GetDataBySize(10)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0930
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0930
     * @tc.desc   batchUpdate with dest DATA_LABEL_CRITICAL_4 passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0930';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.DATA_LABEL_CRITICAL_4, StringToUint8Array(GetDataBySize(10)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0940
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0940
     * @tc.desc   batchUpdate with dest GROUP_ID passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0940';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(GetDataBySize(10)));
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0950
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0950
     * @tc.desc   batchUpdate with dest IS_PERSISTENT passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0950';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.IS_PERSISTENT, true);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0960
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0960
     * @tc.desc   batchUpdate with dest REQUIRE_PASSWORD_SET passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0960';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.REQUIRE_PASSWORD_SET, true);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0970
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0970
     * @tc.desc   batchUpdate with dest REQUIRE_ATTR_ENCRYPTED passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0970';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0980
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0980
     * @tc.desc   batchUpdate with dest SYNC_TYPE passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0980';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.SYNC_TYPE, asset.SyncType.NEVER);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_0990
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_0990
     * @tc.desc   batchUpdate with dest WRAP_TYPE passed throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_0990';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        sourceArray.push(new Map().set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0')));
        let destArray: Array<asset.AssetMap> = [];
        let destAttr: asset.AssetMap = new Map();
        destAttr.set(asset.Tag.SECRET, StringToUint8Array('updated_secret'));
        destAttr.set(asset.Tag.WRAP_TYPE, asset.WrapType.NEVER);
        destArray.push(destAttr);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

  

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1000
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1000
     * @tc.desc   batchUpdate，source，GROUP_ID全部不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1000';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 3);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1010
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1010
     * @tc.desc   batchUpdate，source，GROUP_ID全部传相同倻
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1010';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let addAttr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        addAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(addAttr0);
        let addAttr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        addAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(addAttr1);
        let addAttr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        addAttr2.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(addAttr2);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceAttr2.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1020
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1020
     * @tc.desc   batchUpdate，source，GROUP_ID部分传部分不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1020';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let addAttr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        addAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(addAttr0);
        let addAttr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        addAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(addAttr1);
        let addAttr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        assetArray.push(addAttr2);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000019);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1030
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1030
     * @tc.desc   batchUpdate，source，GROUP_ID传不同倻
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1030';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let addAttr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        addAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(addAttr0);
        let addAttr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        addAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MaxGroupId));
        assetArray.push(addAttr1);
        let addAttr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        addAttr2.set(asset.Tag.GROUP_ID, StringToUint8Array(GetDataBySize(64)));
        assetArray.push(addAttr2);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MaxGroupId));
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceAttr2.set(asset.Tag.GROUP_ID, StringToUint8Array(GetDataBySize(64)));
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000019);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1040
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1040
     * @tc.desc   batchUpdate，source，REQUIRE_ATTR_ENCRYPTED全部不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1040';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 3);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1050
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1050
     * @tc.desc   batchUpdate，source，REQUIRE_ATTR_ENCRYPTED全部传false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1050';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let addAttr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        addAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(addAttr0);
        let addAttr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        addAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(addAttr1);
        let addAttr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        addAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(addAttr2);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1060
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1060
     * @tc.desc   batchUpdate，source，REQUIRE_ATTR_ENCRYPTED全部传true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1060';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let addAttr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        addAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(addAttr0);
        let addAttr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        addAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(addAttr1);
        let addAttr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        addAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(addAttr2);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1070
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1070
     * @tc.desc   batchUpdate，source，REQUIRE_ATTR_ENCRYPTED部分传true部分不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1070';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let addAttr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        addAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(addAttr0);
        let addAttr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        addAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(addAttr1);
        let addAttr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        assetArray.push(addAttr2);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000019);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1080
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1080
     * @tc.desc   batchUpdate，source，REQUIRE_ATTR_ENCRYPTED部分传true部分传false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1080';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let addAttr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        addAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(addAttr0);
        let addAttr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        addAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(addAttr1);
        let addAttr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        addAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(addAttr2);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        await asset.batchUpdate(sourceArray, destArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000019);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchUpdate_API26_Func_1090
     * @tc.number SUB_Security_Asset_BatchUpdate_API26_Func_1090
     * @tc.desc   batchUpdate，source，REQUIRE_ATTR_ENCRYPTED部分传false部分不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchUpdate_API26_Func_1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchUpdate_API26_Func_1090';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let addAttr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        addAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(addAttr0);
        let addAttr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        addAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(addAttr1);
        let addAttr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        assetArray.push(addAttr2);
        await asset.batchAdd(assetArray);
        let sourceArray: Array<asset.AssetMap> = [];
        let sourceAttr0: asset.AssetMap = new Map();
        sourceAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        sourceAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        sourceArray.push(sourceAttr0);
        let sourceAttr1: asset.AssetMap = new Map();
        sourceAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        sourceAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        sourceArray.push(sourceAttr1);
        let sourceAttr2: asset.AssetMap = new Map();
        sourceAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        sourceArray.push(sourceAttr2);
        let destArray: Array<asset.AssetMap> = [];
        let destAttr0: asset.AssetMap = new Map();
        destAttr0.set(asset.Tag.SECRET, StringToUint8Array('updated_secret0'));
        destArray.push(destAttr0);
        let destAttr1: asset.AssetMap = new Map();
        destAttr1.set(asset.Tag.SECRET, StringToUint8Array('updated_secret1'));
        destArray.push(destAttr1);
        let destAttr2: asset.AssetMap = new Map();
        destAttr2.set(asset.Tag.SECRET, StringToUint8Array('updated_secret2'));
        destArray.push(destAttr2);
        let result: asset.BatchResult = await asset.batchUpdate(sourceArray, destArray);
        expect(result.failedCount).assertEqual(0);
        expect(result.failedErrorInfos.length).assertEqual(0);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

});
}
