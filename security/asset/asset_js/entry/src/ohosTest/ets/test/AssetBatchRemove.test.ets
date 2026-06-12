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

export default function AssetBatchRemoveTest() {
  const ALIAS_PREFIX = 'batch_remove_test_';

  describe('AssetBatchRemoveTest', () => {

    beforeEach(async () => {
      await CleanAllAssets();
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0010
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0010
     * @tc.desc   batchRemove 1 asset succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0010';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 1);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0020
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0020
     * @tc.desc   batchRemove 100 assets succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0020';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 100);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        for (let i = 0; i < 100; i++) {
          let queryAttr: asset.AssetMap = new Map();
          queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + String(i)));
          queryArray.push(queryAttr);
        }
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0030
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0030
     * @tc.desc   batchRemove with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0030';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0040
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0040
     * @tc.desc   batchRemove 101 assets throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0040';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        for (let i = 0; i < 101; i++) {
          let queryAttr: asset.AssetMap = new Map();
          queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + String(i)));
          queryArray.push(queryAttr);
        }
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0050
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0050
     * @tc.desc   batchRemove with REQUIRE_ATTR_ENCRYPTED type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0050';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, 1 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0060
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0060
     * @tc.desc   batchRemove with IS_PERSISTENT type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0060';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.IS_PERSISTENT, 1 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0070
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0070
     * @tc.desc   batchRemove with ACCESSIBILITY type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0070';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.ACCESSIBILITY, StringToUint8Array('a') as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0080
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0080
     * @tc.desc   batchRemove with AUTH_TYPE invalid value throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0080';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.AUTH_TYPE, -1 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0090
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0090
     * @tc.desc   batchRemove with AUTH_TYPE type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0090';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.AUTH_TYPE, StringToUint8Array('a') as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0100
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0100
     * @tc.desc   batchRemove with SYNC_TYPE invalid value throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0100';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.SYNC_TYPE, -1 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0110
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0110
     * @tc.desc   batchRemove with SYNC_TYPE type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0110';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.SYNC_TYPE, StringToUint8Array('a') as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0120
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0120
     * @tc.desc   batchRemove with ALIAS length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0120';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0130
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0130
     * @tc.desc   batchRemove with ALIAS length 1 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0130';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = new Map();
        attr.set(asset.Tag.ALIAS, StringToUint8Array('a'));
        attr.set(asset.Tag.SECRET, StringToUint8Array('secret'));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array('a'));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0140
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0140
     * @tc.desc   batchRemove with ALIAS length 256 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0140';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = new Map();
        attr.set(asset.Tag.ALIAS, StringToUint8Array(GetDataBySize(256)));
        attr.set(asset.Tag.SECRET, StringToUint8Array('secret'));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(GetDataBySize(256)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0150
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0150
     * @tc.desc   batchRemove with ALIAS length 257 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0150';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(GetDataBySize(257)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0160
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0160
     * @tc.desc   batchRemove with ALIAS type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0160';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0170
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0170
     * @tc.desc   batchRemove with GROUP_ID length 7 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0170';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0180
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0180
     * @tc.desc   batchRemove with GROUP_ID length 127 succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0180';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret');
        attr.set(asset.Tag.GROUP_ID, StringToUint8Array(MaxGroupId));
        assetArray.push(attr);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(MaxGroupId));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0190
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0190
     * @tc.desc   batchRemove with GROUP_ID length 6 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0190';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(GetDataBySize(6)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0200
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0200
     * @tc.desc   batchRemove with GROUP_ID length 128 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0200';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.GROUP_ID, StringToUint8Array(GetDataBySize(128)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0210
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0210
     * @tc.desc   batchRemove with GROUP_ID type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0210';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.GROUP_ID, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0220
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0220
     * @tc.desc   batchAdd with DATA_LABEL length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0220';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(1)));
        assetArray.push(queryAttr);
        await asset.batchRemove(assetArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0230
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0230
     * @tc.desc   batchAdd with DATA_LABEL length 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0230';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(2048)));
        assetArray.push(queryAttr);
        await asset.batchRemove(assetArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0240
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0240
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_1 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0240';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_1, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0250
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0250
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_1 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0250';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_1, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0260
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0260
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_1 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0260';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_1, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0270
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0270
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_2 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0270';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_2, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0280
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0280
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_2 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0280';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_2, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0290
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0290
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_2 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0290';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_2, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0300
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0300
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_3 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0300';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_3, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0310
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0310
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_3 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0310';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_3, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0320
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0320
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_3 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0320';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_3, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0330
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0330
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_4 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0330';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_4, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0340
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0340
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_4 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0340';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_4, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0350
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0350
     * @tc.desc   batchRemove with DATA_LABEL_CRITICAL_4 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0350';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_CRITICAL_4, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0360
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0360
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_1 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0360';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0370
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0370
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_1 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0370';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0380
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0380
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_1 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0380';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_1, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0390
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0390
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_2 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0390';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_2, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0400
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0400
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_2 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0400';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_2, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0410
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0410
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_2 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0410';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_2, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0420
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0420
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_3 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0420';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_3, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0430
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0430
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_3 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0430';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_3, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0440
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0440
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_3 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0440';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_3, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0450
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0450
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_4 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0450';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_4, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0460
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0460
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_4 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0460';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_4, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0470
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0470
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_4 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0470';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_4, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0480
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0480
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_1 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0480';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0490
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0490
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_1 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0490';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0500
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0500
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_1 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0500';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_1, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0510
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0510
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_2 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0510';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0520
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0520
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_2 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0520';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0530
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0530
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_2 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0530';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_2, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0540
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0540
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_3 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0540';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0550
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0550
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_3 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0550';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0560
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0560
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_3 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0560';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_3, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0570
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0570
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_4 length 0 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0570';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, StringToUint8Array(GetDataBySize(0)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0580
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0580
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_4 length 2049 throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0580';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, StringToUint8Array(GetDataBySize(2049)));
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0590
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0590
     * @tc.desc   batchRemove with DATA_LABEL_NORMAL_LOCAL_4 type error throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0590';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr: asset.AssetMap = new Map();
        queryAttr.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr.set(asset.Tag.DATA_LABEL_NORMAL_LOCAL_4, 123 as asset.Value);
        queryArray.push(queryAttr);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0600
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0600
     * @tc.desc   batchRemove nonexistent asset does not affect other deletions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0600';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 2);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryArray.push(queryAttr2);
        let queryAttr3: asset.AssetMap = new Map();
        queryAttr3.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + 'nonexistent'));
        queryArray.push(queryAttr3);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
  

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0610
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0610
     * @tc.desc   batchRemove，GROUP_ID全部不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0610';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 3);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0620
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0620
     * @tc.desc   batchRemove，GROUP_ID全部传相同倻
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0620';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        attr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(attr0);
        let attr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        attr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(attr1);
        let attr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        attr2.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        assetArray.push(attr2);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryAttr2.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0630
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0630
     * @tc.desc   batchRemove，GROUP_ID部分传部分不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0630';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000019);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0640
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0640
     * @tc.desc   batchRemove，GROUP_ID传不同倻
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0640';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr0.set(asset.Tag.GROUP_ID, StringToUint8Array(MinGroupId));
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryAttr1.set(asset.Tag.GROUP_ID, StringToUint8Array(MaxGroupId));
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryAttr2.set(asset.Tag.GROUP_ID, StringToUint8Array(MaxGroupId));
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000019);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0650
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0650
     * @tc.desc   batchRemove，REQUIRE_ATTR_ENCRYPTED全部不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0650';
      try {
        let assetArray: Array<asset.AssetMap> = CreateBatchAssetMaps(ALIAS_PREFIX, 3);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0660
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0660
     * @tc.desc   batchRemove，REQUIRE_ATTR_ENCRYPTED全部传false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0660';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        attr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(attr0);
        let attr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        attr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(attr1);
        let attr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        attr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(attr2);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0670
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0670
     * @tc.desc   batchRemove，REQUIRE_ATTR_ENCRYPTED全部传true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0670';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        attr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(attr0);
        let attr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        attr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(attr1);
        let attr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        attr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        assetArray.push(attr2);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0680
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0680
     * @tc.desc   batchRemove，REQUIRE_ATTR_ENCRYPTED部分传true部分不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0680';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000019);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0690
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0690
     * @tc.desc   batchRemove，REQUIRE_ATTR_ENCRYPTED部分传true部分传false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0690';
      try {
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryAttr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(24000019);
      }
    });

    /**
     * @tc.name   SUB_Security_Asset_BatchRemove_API26_Func_0700
     * @tc.number SUB_Security_Asset_BatchRemove_API26_Func_0700
     * @tc.desc   batchRemove，REQUIRE_ATTR_ENCRYPTED部分传false部分不传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_Asset_BatchRemove_API26_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let testNumber: string = 'SUB_Security_Asset_BatchRemove_API26_Func_0700';
      try {
        let assetArray: Array<asset.AssetMap> = [];
        let attr0: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '0', 'secret0');
        attr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(attr0);
        let attr1: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '1', 'secret1');
        attr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        assetArray.push(attr1);
        let attr2: asset.AssetMap = CreateAssetMap(ALIAS_PREFIX + '2', 'secret2');
        assetArray.push(attr2);
        await asset.batchAdd(assetArray);
        let queryArray: Array<asset.AssetMap> = [];
        let queryAttr0: asset.AssetMap = new Map();
        queryAttr0.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '0'));
        queryAttr0.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        queryArray.push(queryAttr0);
        let queryAttr1: asset.AssetMap = new Map();
        queryAttr1.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '1'));
        queryAttr1.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
        queryArray.push(queryAttr1);
        let queryAttr2: asset.AssetMap = new Map();
        queryAttr2.set(asset.Tag.ALIAS, StringToUint8Array(ALIAS_PREFIX + '2'));
        queryArray.push(queryAttr2);
        await asset.batchRemove(queryArray);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

});
}