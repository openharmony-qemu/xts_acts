/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file expect in compliance with the License.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context =  delegator.getAppContext().getApplicationContext();
const TAG = "[RelationalStore_JSKITS_TEST]";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG1:data_relationalStore.StoreConfig = {
  name: "TransactionTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let rdbStore:data_relationalStore.RdbStore | undefined = undefined;
const STORE_CONFIG: data_relationalStore.StoreConfig= {
  name: "Asset.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
export default function RelationalStoreCoverageRateTestAddTest() {
  describe('RelationalStoreCoverageRateTestAddTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      try {
        await rdbStore?.close();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch(error) {
        const err = error as BusinessError;
        console.error(TAG + `afterAll failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
    })
    console.log(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name   RelationalStore_getRdbStore_add_0001
     * @tc.number SUB_DistributedData_RDB_SDK_GetRdbStore_Add_0100
     * @tc.desc   The encryptionAlgo is AES_256_GCM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelationalStore_getRdbStore_add_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const STORE_CONFIG1: data_relationalStore.StoreConfig = {
        name: "Asset.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        pluginLibs:[""],
        cryptoParam: {
          encryptionKey:new Uint8Array([10, 20, 30]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1
        },
      };
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      data_relationalStore.deleteRdbStore(context, STORE_CONFIG, (err: BusinessError) => {
        if (err) {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done()
        }
        expect(err).assertUndefined()
        done()
      })
      console.log(TAG + "************* RelationalStore_getRdbStore_add_0001 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStore_add_0002
     * @tc.number SUB_DistributedData_RDB_SDK_GetRdbStore_Add_0200
     * @tc.desc   The encryptionAlgo is AES_256_CBC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelationalStore_getRdbStore_add_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const STORE_CONFIG1: data_relationalStore.StoreConfig = {
        name: "Asset.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        pluginLibs:[""],
        cryptoParam: {
          encryptionKey:new Uint8Array([10, 20, 30]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256
        },
      };
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      data_relationalStore.deleteRdbStore(context, STORE_CONFIG, (err: BusinessError) => {
        if (err) {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done()
        }
        expect(err).assertUndefined()
        done()
      })
      console.log(TAG + "************* RelationalStore_getRdbStore_add_0002 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStore_add_0003
     * @tc.number SUB_DistributedData_RDB_SDK_GetRdbStore_Add_0300
     * @tc.desc   The encryptionAlgo is AES_256_CBC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelationalStore_getRdbStore_add_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const STORE_CONFIG1: data_relationalStore.StoreConfig = {
        name: "Asset.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        pluginLibs:[""],
        cryptoParam: {
          encryptionKey:new Uint8Array([10, 20, 30]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.PLAIN_TEXT,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512
        },
      };
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      data_relationalStore.deleteRdbStore(context, STORE_CONFIG, (err: BusinessError) => {
        if (err) {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done()
        }
        expect(err).assertUndefined()
        done()
      })
      console.log(TAG + "************* RelationalStore_getRdbStore_add_0003 end *************");
    })
    /**
     * @tc.name   RelationalStore_execute_add_0001
     * @tc.number SUB_DistributedData_RDB_SDK_execute_Add_0100
     * @tc.desc   The third is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelationalStore_execute_add_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* RelationalStore_execute_add_0001 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.close();
      try {
        await rdbStore.execute(CREATE_TABLE_TEST1, 0, null);
        expect().assertFail();
      } catch (e) {
        console.log(TAG, `RelationalStore_execute_add_0001 insert error ${e.code}`);
        expect("14800014").assertEqual(e.code);
      }
      done();
      console.log(TAG + "************* RelationalStore_execute_add_0001 end *************");
    })
    /**
     * @tc.name   RelationalStore_execute_add_0002
     * @tc.number SUB_DistributedData_RDB_SDK_execute_Add_0200
     * @tc.desc   The third is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelationalStore_execute_add_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* RelationalStore_execute_add_0002 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.close();
      try {
        await rdbStore.execute(CREATE_TABLE_TEST1, 0, undefined);
        expect().assertFail();
      } catch (e) {
        console.log(TAG, `RelationalStore_execute_add_0002 insert error ${e.code}`);
        expect("14800014").assertEqual(e.code);
      }
      done();
      console.log(TAG + "************* RelationalStore_execute_add_0002 end *************");
    })
  })
}