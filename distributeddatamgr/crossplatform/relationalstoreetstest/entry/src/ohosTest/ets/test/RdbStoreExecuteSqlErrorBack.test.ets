/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RdbStoreExecuteSqlErrorTest]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG2: relationalStore.StoreConfig  = {
  name: "readOnly.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  isReadOnly: true,
}
const DATABASE_BACKUP_NAME = "Backup.db"
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "ExcuteSqlTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
let rdbStore: relationalStore.RdbStore | undefined

let cryptoParam1: relationalStore.CryptoParam = {
  encryptionKey: new Uint8Array([10, 20, 30]),
  encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_CBC,
  hmacAlgo: relationalStore.HmacAlgo.SHA512,
  kdfAlgo: relationalStore.KdfAlgo.KDF_SHA512,
}
const STORE_CONFIG_S2: relationalStore.StoreConfig = {
  name: "rdbstore4.db",
  encrypt: true,
  securityLevel: relationalStore.SecurityLevel.S2,
  rootDir: "",
  autoCleanDirtyData: true,
  allowRebuild: true,
  vector: true,
  isReadOnly: true,
  pluginLibs: ['rdbstore4.db'],
  cryptoParam: cryptoParam1,
  tokenizer: relationalStore.Tokenizer.CUSTOM_TOKENIZER,
  persist: true,
  enableSemanticIndex: true
}
let cryptoParam2: relationalStore.CryptoParam = {
  encryptionKey: new Uint8Array([10, 20, 30]),
  encryptionAlgo: relationalStore.EncryptionAlgo.PLAIN_TEXT,
  hmacAlgo: relationalStore.HmacAlgo.SHA256,
  kdfAlgo: relationalStore.KdfAlgo.KDF_SHA256,
}
const STORE_CONFIG_S3: relationalStore.StoreConfig = {
  name: "rdbstore5",
  encrypt: false,
  securityLevel: relationalStore.SecurityLevel.S3,
  rootDir: "",
  autoCleanDirtyData: false,
  allowRebuild: false,
  vector: false,
  isReadOnly: false,
  pluginLibs: undefined,
  cryptoParam: cryptoParam2,
  tokenizer: relationalStore.Tokenizer.ICU_TOKENIZER,
  persist: false,
  enableSemanticIndex: false

};
let cryptoParam3: relationalStore.CryptoParam = {
  encryptionKey: new Uint8Array([10, 20, 30]),
  encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
  hmacAlgo: relationalStore.HmacAlgo.SHA1,
  kdfAlgo: relationalStore.KdfAlgo.KDF_SHA1,
}
const STORE_CONFIG_S4: relationalStore.StoreConfig = {
  name: "rdbstore6",
  encrypt: false,
  securityLevel: relationalStore.SecurityLevel.S4,
  rootDir: "",
  autoCleanDirtyData: false,
  allowRebuild: false,
  vector: false,
  isReadOnly: false,
  pluginLibs: [],
  cryptoParam: cryptoParam3,
  tokenizer: relationalStore.Tokenizer.NONE_TOKENIZER,
};
export default function rdbstoreStoreExcuteSqlErrorCallBackTest() {
  describe("rdbstoreStoreExcuteSqlErrorCallBackTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      console.info(TAG + 'Get context successful. context=' + context);
    });
    beforeEach(async () => {
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await rdbStore.executeSql("DELETE FROM test");
      console.info(TAG + "beforeEach");
    });
    afterEach(async () => {
      console.info(TAG + "afterEach");
      await relationalStore.deleteRdbStore(context, "ExcuteSqlTest.db");
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      await relationalStore.deleteRdbStore(context, STORE_CONFIG_S2);
      await relationalStore.deleteRdbStore(context, STORE_CONFIG_S3);
      await relationalStore.deleteRdbStore(context, STORE_CONFIG_S4);
    });
    afterAll(async () => {
      console.info(TAG + "afterAll");
    });
    /**
     * @tc.name   testGetRdbStoreError0100
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0100
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testGetRdbStoreError0100 start *************");
      try {
        relationalStore.getRdbStore(null, STORE_CONFIG, async (err: BusinessError) => {
          console.info(`testGetRdbStoreError0100 faied.`);
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.error(TAG + `testGetRdbStoreError0100, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue()
        done();
      }
      console.info(TAG + "************* testGetRdbStoreError0100 end   *************");
    });
    /**
     * @tc.name   testGetRdbStoreError0200
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0200
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testGetRdbStoreError0200 start *************");
      try {
        relationalStore.getRdbStore(context, null, async (err: BusinessError) => {
          console.info(`testGetRdbStoreError0200 faied.`);
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.error(TAG + `testGetRdbStoreError0200, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue()
        done();
      }
      console.info(TAG + "************* testGetRdbStoreError0200 end   *************");
    });
    /**
     * @tc.name   testGetRdbStoreError0500
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreErrorAPITest_0500
     * @tc.desc   getRdbStore callback with err rootDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreError0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testGetRdbStoreError0500 start *************");
      let config: relationalStore.StoreConfig = {
        name: "ExcuteSqlTest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        rootDir: "./"
      };
      try{
        relationalStore.getRdbStore(context, config, async(err: BusinessError) => {
          expect(!err).assertFail();
          done();
        })
      }catch (e) {
        console.error(TAG + `testGetRdbStoreError0500 failed, code is ${e.code},message is ${e.message}`);
        expect(e.code == 14800010).assertTrue();
        done();
      }
      console.info(TAG + "************* testGetRdbStoreError0500 end   *************");
    });
    /**
     * @tc.name   testDeleteRdbStoreError0100
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0100
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testDeleteRdbStoreError0100 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      try {
        relationalStore.deleteRdbStore(null, "secure.db", async (err: BusinessError) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.error(TAG + `testDeleteRdbStoreError0100, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue()
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError0100 end   *************");
    });
    /**
     * @tc.name   testDeleteRdbStoreError0200
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0200
     * @tc.desc   getRdbStore callback with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testDeleteRdbStoreError0200 start *************");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      try {
        relationalStore.deleteRdbStore(context, null, async (err: BusinessError) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.error(TAG + `testDeleteRdbStoreError0200, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue()
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError0200 end   *************");
    });
    /**
     * @tc.name   testDeleteRdbStoreError0600
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreErrorAPITest_0600
     * @tc.desc   getRdbStore callback with rootDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreError0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testDeleteRdbStoreError0600 start *************");
      let config: relationalStore.StoreConfig = {
        name: "ExcuteSqlTest.db",
        securityLevel: relationalStore.SecurityLevel.S1,
        rootDir: "./"
      };
      try {
        relationalStore.deleteRdbStore(context, config, async (err: BusinessError) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.error(TAG + `testDeleteRdbStoreError0600, errcode:${JSON.stringify(err)}`);
        expect(err.code == 14800010).assertTrue()
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreError0600 end   *************");
    });
    /**
     * @tc.name   testGetRdbStoreConfigCallBack0100
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreConfigAPICallBackTest_0100
     * @tc.desc   getRdbStore promise with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreConfigCallBack0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testGetRdbStoreConfigCallBack0100 start *************");
      try{
        relationalStore.getRdbStore(context, STORE_CONFIG_S2, (err, store) => {
          if(err){
            expect(err.code == 801).assertTrue();
            done();
          }else{
            expect(typeof(store) === "object").assertTrue();
            done();
          }
        })
      }catch (e) {
        console.error(TAG + `testGetRdbStoreConfigCallBack0100 failed, code is ${e.code},message is ${e.message}`);
        expect(e.code == 801).assertTrue();
        done();
      }
      console.info(TAG + "************* testGetRdbStoreConfigCallBack0100 end   *************");
    });
    /**
     * @tc.name   testGetRdbStoreConfigCallBack0200
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreConfigAPICallBackTest_0200
     * @tc.desc   getRdbStore promise with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreConfigCallBack0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testGetRdbStoreConfigCallBack0200 start *************");
      try{
        relationalStore.getRdbStore(context, STORE_CONFIG_S3, (err, store) => {
          if(err){
            expect(err.code == 801).assertTrue();
            done();
          }else{
            expect(typeof(store) === "object").assertTrue();
            done();
          }
        })
      }catch (e) {
        console.error(TAG + `testGetRdbStoreConfigCallBack0200 failed, code is ${e.code},message is ${e.message}`);
        expect(e.code == 801).assertTrue();
        done();
      }
      console.info(TAG + "************* testGetRdbStoreConfigCallBack0200 end   *************");
    });
    /**
     * @tc.name   testGetRdbStoreConfigCallBack0300
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_GetRdbStoreConfigAPICallBackTest_0300
     * @tc.desc   getRdbStore promise with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetRdbStoreConfigCallBack0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testGetRdbStoreConfigCallBack0300 start *************");
      try{
        relationalStore.getRdbStore(context, STORE_CONFIG_S4, (err, store) => {
          if(err){
            expect(err.code == 801).assertTrue();
            done();
          }else{
            expect(typeof(store) === "object").assertTrue();
            done();
          }
        })
      }catch (e) {
        console.error(TAG + `testGetRdbStoreConfigCallBack0300 failed, code is ${e.code},message is ${e.message}`);
        expect(e.code == 801).assertTrue();
        done();
      }
      console.info(TAG + "************* testGetRdbStoreConfigCallBack0300 end   *************");
    });
    /**
     * @tc.name   testDeleteRdbStoreConfig0100
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreConfigAPITest_0100
     * @tc.desc   deleteRdbStore callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreConfig0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testDeleteRdbStoreConfig0100 start *************");
      let num = 1;
      try{
        relationalStore.deleteRdbStore(context, STORE_CONFIG_S3, async (err: BusinessError) => {
          if(err){
            expect(err.code == 801).assertTrue();
            done();
          }else{
            expect(num).assertEqual(1);
            done();
          }
        })
      }catch (e) {
        console.error(TAG + `testDeleteRdbStoreConfig0100 failed, code is ${e.code},message is ${e.message}`);
        expect(e.code == 801).assertTrue();
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreConfig0100 end   *************");
    });
    /**
     * @tc.name   testDeleteRdbStoreConfig0200
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreConfigAPITest_0200
     * @tc.desc   deleteRdbStore callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreConfig0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testDeleteRdbStoreConfig0200 start *************");
      let num = 1;
      try{
        relationalStore.deleteRdbStore(context, STORE_CONFIG_S2, async (err: BusinessError) => {
          if(err){
            expect(err.code == 801).assertTrue();
            done();
          }else{
            expect(num).assertEqual(1);
            done();
          }
        })
      }catch (e) {
        console.error(TAG + `testDeleteRdbStoreConfig0200 failed, code is ${e.code},message is ${e.message}`);
        expect(e.code == 801).assertTrue();
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreConfig0200 end   *************");
    });
    /**
     * @tc.name   testDeleteRdbStoreConfig0300
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_DeleteRdbStoreConfigAPITest_0300
     * @tc.desc   deleteRdbStore callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteRdbStoreConfig0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testDeleteRdbStoreConfig0200 start *************");
      let num = 1;
      try{
        relationalStore.deleteRdbStore(context, STORE_CONFIG_S4, async (err: BusinessError) => {
          if(err){
            expect(err.code == 801).assertTrue();
            done();
          }else{
            expect(num).assertEqual(1);
            done();
          }
        })
      }catch (e) {
        console.error(TAG + `testDeleteRdbStoreConfig0300 failed, code is ${e.code},message is ${e.message}`);
        expect(e.code == 801).assertTrue();
        done();
      }
      console.info(TAG + "************* testDeleteRdbStoreConfig0300 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0300
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0300
     * @tc.desc   Test remoteQuery callback device with null or undefined or ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0300 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("", "EMPLOYEE", predicates,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
              })
          }catch(err) {
            console.info(TAG + "Remote query error" + err);
            expect(err.code == 401).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0300 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0400
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0400
     * @tc.desc   Test remoteQuery callback device with null or undefined or ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0400 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery(null, "EMPLOYEE", predicates,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
              })
          }catch(err) {
            console.info(TAG + "Remote query error" + err);
            expect(err.code == 401).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0400 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0500
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0500
     * @tc.desc   Test remoteQuery callback device with null or undefined or ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0500 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery(undefined, "EMPLOYEE", predicates,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
              })
          }catch(err) {
            console.info(TAG + "Remote query error" + err);
            expect(err.code == 401).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0500 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0600
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0600
     * @tc.desc   Test remoteQuery callback table with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0600 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("12345678", "", predicates,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code == 401).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0600 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0700
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0700
     * @tc.desc   Test remoteQuery callback table with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0700 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("12345678", null, predicates,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code == 401).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0700 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0800
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0800
     * @tc.desc   Test remoteQuery callback table with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0800 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("12345678", undefined, predicates,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code == 401).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0800 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0900
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0900
     * @tc.desc   Test remoteQuery callback predicates with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0900 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", null,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code == 401).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_0900 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1000
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1000
     * @tc.desc   Test remoteQuery callback predicates with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1000 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", undefined,
              ["ID", "NAME", "AGE", "SALARY", "CODES"], (err) => {
                expect().assertFail();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code == 401).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1000 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1100
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1100
     * @tc.desc   Test remoteQuery callback columns with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1100 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("12345789", "EMPLOYEE", predicates,
              [], (err) => {
                expect(err.code == 14800000).assertTrue();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code == 14800000).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1100 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1200
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1200
     * @tc.desc   Test remoteQuery callback columns with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1200 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", predicates,
              null, (err) => {
                expect(err.code == 14800000).assertTrue();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code == 14800000).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1200 end-----")
      })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1300
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1300
     * @tc.desc   Test remoteQuery callback columns with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1300 start-----")
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try{
            (store as relationalStore.RdbStore).remoteQuery("123456789", "EMPLOYEE", predicates,
              undefined, (err) => {
                expect(err.code == 14800000).assertTrue();
              })
          }catch(err) {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code == 14800000).assertTrue();
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrCallBackTest_1300 end-----")
      })
  });
}
