/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size,TestType } from '@ohos/hypium'
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { contextConstant } from '@kit.AbilityKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[RDB_REKEY_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

export default function rdbStoreRekeyExEtsTest() {
  describe('rdbStoreRekeyExEtsTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await data_relationalStore.deleteRdbStore(context,"testRekeyEx.db")
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    });

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0100
     * @tc.name testRekeyEx0001
     * @tc.desc invalid iterationCount test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0001 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        iterationCount: -1,
      };

      try {
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyex success");
        expect().assertFail();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800001");
        done()
      }
      console.log(TAG + "************* testRekeyEx0001 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0200
     * @tc.name testRekeyEx0002
     * @tc.desc invalid encryptionAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0002 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        encryptionAlgo: -1,
      };

      try {
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyex success");
        expect().assertFail();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800001");
        done()
      }
      console.log(TAG + "************* testRekeyEx0002 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0300
     * @tc.name testRekeyEx0003
     * @tc.desc invalid parameters test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0003 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        hmacAlgo: -1,
      };

      try {
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyex success");
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRekeyEx0003 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0400
     * @tc.name testRekeyEx0004
     * @tc.desc invalid kdfAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0004 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        kdfAlgo: -1,
      };

      try {
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyex success");
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRekeyEx0004 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0500
     * @tc.name testRekeyEx0005
     * @tc.desc invalid cryptoPageSize test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0005 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        cryptoPageSize: -1,
      };

      try {
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyex success");
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRekeyEx0005 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0600
     * @tc.name testRekeyEx0006
     * @tc.desc non-encrypted database rekey to encrypted database test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0006 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam);
        rdbStore.close();
        storeConfig.encrypt = true;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done();
      }
      console.log(TAG + "************* testRekeyEx0006 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0700
     * @tc.name testRekeyEx0007
     * @tc.desc rekey iterationCount test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0007 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        iterationCount: 500,
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam);
        rdbStore.close();
        storeConfig.cryptoParam = cryptoParam;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0007 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0800
     * @tc.name testRekeyEx0008
     * @tc.desc rekey encryptionAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0008 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 2, 3, 4, 5,1]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        iterationCount: 500
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam1);
        await rdbStore.close();
        storeConfig.cryptoParam = cryptoParam1;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0008 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_0900
     * @tc.name testRekeyEx0009
     * @tc.desc rekey hmacAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0009 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        hmacAlgo: 2,
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam);
        rdbStore.close();
        storeConfig.cryptoParam = cryptoParam;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0009 end *************");;
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1000
     * @tc.name testRekeyEx0010
     * @tc.desc rekey kdfAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0010 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        kdfAlgo: 2,
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam);
        rdbStore.close();
        storeConfig.cryptoParam = cryptoParam;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0010 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1100
     * @tc.name testRekeyEx0011
     * @tc.desc rekey cryptoPageSize test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0011 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        cryptoPageSize: 2048,
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam);
        rdbStore.close();
        storeConfig.cryptoParam = cryptoParam;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0011 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1200
     * @tc.name testRekeyEx0012
     * @tc.desc custom encrypt rekey test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0012 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };
      try {
        await rdbStore.rekeyEx(cryptoParam1);
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0012 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1300
     * @tc.name testRekeyEx0013
     * @tc.desc custom encrypt rekey test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0013 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      try {
        await rdbStore.rekeyEx(cryptoParam1);
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0013 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1400
     * @tc.name testRekeyEx0014
     * @tc.desc default rekey test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0014 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        await rdbStore.rekeyEx(cryptoParam1);
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0014 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1500
     * @tc.name testRekeyEx0015
     * @tc.desc default rekey test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0015 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        await rdbStore.rekeyEx(cryptoParam1);
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* testRekeyEx0015 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1600
     * @tc.name testRekeyEx0016
     * @tc.desc transaction rekey test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0016 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let SQL_CREATE_TABLE =
        'CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER)';
      await rdbStore.executeSql(SQL_CREATE_TABLE);

      let transaction = await rdbStore?.createTransaction({
        transactionType: data_relationalStore.TransactionType.DEFERRED
      });
      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "id": 1,
          "name": "lisi",
          "age": 18,
        }
        await transaction.insert("employee", valueBucket)
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekeyEx success");
        expect().assertFail();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(14800024);
        done()
      }
      console.log(TAG + "************* testRekeyEx0016 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1700
     * @tc.name testRekeyEx0017
     * @tc.desc rekey 14800011 test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0017 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);


      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        iterationCount: 500,
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyEx success");
        rdbStore.close();
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        console.log(TAG + "getrdbstore success");
        expect().assertFail();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(14800011)
        done()
      }
      console.log(TAG + "************* testRekeyEx0017 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1800
     * @tc.name testRekeyEx0018
     * @tc.desc undefined parameters rekey test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0018 start *************");
      let storeConfig : data_relationalStore.StoreConfig= {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      try {
        await rdbStore.rekeyEx(undefined);
        console.log(TAG + "rekeyEx success");
        expect().assertFail();
        done()
      } catch (err) {
        console.log("catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("401");
        done()
      }
      console.log(TAG + "************* testRekeyEx0018 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_1900
     * @tc.name testRekeyEx0019
     * @tc.desc null parameters rekey test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0019 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      try {
        await rdbStore.rekeyEx(null);
        console.log(TAG + "rekeyEx success");
        expect().assertFail();
        done()
      } catch (err) {
        console.log("catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("401");
        done()
      }
      console.log(TAG + "************* testRekeyEx0019 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2000
     * @tc.name testRekeyEx0020
     * @tc.desc not close resultSet  rekey test 14800024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0020 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        const resultSet = await rdbStore.query(predicates);
        resultSet.goToNextRow();
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekeyEx success");
        expect().assertFail();
        done()
      } catch (err) {
        console.log("catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(14800024);
        done()
      }
      console.log(TAG + "************* testRekeyEx0020 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2100
     * @tc.name testRekeyEx0021
     * @tc.desc rekey iterationCount test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0021 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        iterationCount: 500,
      };

      try {
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekeyEx success" )
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0021 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2200
     * @tc.name testRekeyEx0022
     * @tc.desc rekey encryptionAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0022 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        encryptionAlgo: 1,
        iterationCount: 1000
      };

      try {
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekeyEx success" )
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0022 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2300
     * @tc.name testRekeyEx0023
     * @tc.desc rekey hmacAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0023 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);


      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        hmacAlgo: 2,
      };

      try {
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekeyEx success" )
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0023 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2400
     * @tc.name testRekeyEx0024
     * @tc.desc rekey kdfAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0024 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        kdfAlgo: 2,
      };

      try {
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekeyEx success" )
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0024 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2500
     * @tc.name testRekeyEx0025
     * @tc.desc default encry to custom encry test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0025 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([3, 2, 6, 3, 5, 6]),
        iterationCount: 500,
        encryptionAlgo: 2,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize:2048
      };
      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success" )
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyEx success" )
        rdbStore.close();
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0025 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2600
     * @tc.name testRekeyEx0026
     * @tc.desc non-encrypted database to encrypted database test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0026 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: false
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        encryptionAlgo: 2
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success" )
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyEx success" )
        storeConfig.encrypt = true;
        rdbStore.close();
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0026 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2700
     * @tc.name testRekeyEx0027
     * @tc.desc encrypted database to non-encrypted database test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0027 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        encryptionAlgo: 2
      };

      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekeyEx success" )
        rdbStore.close();
        storeConfig.encrypt = false;
        storeConfig.cryptoParam = cryptoParam1;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0027 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2800
     * @tc.name testRekeyEx0028
     * @tc.desc encryptionAlgo is plain_test create database test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0028 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        encryptionAlgo: 2
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);


      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0028 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_2900
     * @tc.name testRekeyEx0029
     * @tc.desc default encry to custom encry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0029 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      try {
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array(),
        };
        await rdbStore.rekey(cryptoParam);
        console.log(TAG + "rekey success")
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([6, 2, 3, 4, 5,1]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekeyEx success")
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0029 end *************");
    });


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3000
     * @tc.name testRekeyEx0030
     * @tc.desc default encry to custom encry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0030 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam1);
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };

        await rdbStore.rekey(cryptoParam);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0030 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3100
     * @tc.name testRekeyEx0031
     * @tc.desc errcode is 801
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0031 start *************");

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekeyEx(cryptoParam1);
        await rdbStore.close();
        storeConfig.cryptoParam = cryptoParam1;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array(),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        await rdbStore.rekey(cryptoParam);
        console.log(TAG + "rekey success");
        expect().assertFail();
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual(801);
        done()
      }
      console.log(TAG + "************* testRekeyEx0031 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3200
     * @tc.name testRekeyEx0032
     * @tc.desc errcode is 14800014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0032 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        iterationCount: 500
      };
      await rdbStore.close();
      try {
        await rdbStore.rekeyEx(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800014");
        done();
      }
      console.log(TAG + "************* testRekeyEx0032 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3300
     * @tc.name testRekeyEx0033
     * @tc.desc custom encry to default encry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0033 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        iterationCount: 500
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let  u8 = new Uint8Array([1, 2, 3])
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      }
      await rdbStore.insert("test", valueBucket);
      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };
      try {
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "RekeyEx success");
        await rdbStore.close();
        storeConfig.cryptoParam = cryptoParam1;
        rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan")
        let num = await rdbStore.update(valueBucket1, predicates);
        console.log(TAG + "num" + num);
        expect(num).assertEqual(1)
        let num1 = await rdbStore.delete(predicates);
        console.log(TAG + "num1" + num1);
        expect(num1).assertEqual(1)
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekeyEx0033 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3400
     * @tc.name testRekeyEx0034
     * @tc.desc encry database to no encry database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0034 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        iterationCount: 500
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam:cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success");
        await rdbStore.rekey(cryptoParam1);
        console.log(TAG + "rekey success");
        let cryptoParam2: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        await rdbStore.rekeyEx(cryptoParam2);
        storeConfig.encrypt = false;
        console.log(TAG + "rekeyEx success");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "update success,num:" + num);
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        console.log(TAG + "delete success,num:" + num1);
        expect(num1).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekeyEx0034 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3500
     * @tc.name testRekeyEx0035
     * @tc.desc no encry database to encry database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0035 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: false,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success");
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekey success");
        storeConfig.encrypt = true;
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        await rdbStore.rekey(cryptoParam1);
        console.log(TAG + "rekeyEx success");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "update success,num:" + num);
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        console.log(TAG + "delete success,num:" + num1);
        expect(num1).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekeyEx0035 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3600
     * @tc.name testRekeyEx0036
     * @tc.desc custom encry to default encry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0036 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        iterationCount: 500
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam:cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([3, 2, 3, 4, 5, 1]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          iterationCount: 500
        };
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success");
        await rdbStore.rekey(cryptoParam1);
        console.log(TAG + "rekey success");
        let cryptoParam2: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array(),
        };
        await rdbStore.rekeyEx(cryptoParam2);
        console.log(TAG + "rekeyEx success");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "update success,num:" + num);
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        console.log(TAG + "delete success,num:" + num1);
        expect(num1).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekeyEx0036 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3700
     * @tc.name testRekeyEx0037
     * @tc.desc custom encry to default encry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0037 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        iterationCount: 500
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam:cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array(),
        };
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success");
        await rdbStore.rekeyEx(cryptoParam1);
        console.log(TAG + "rekey success");
        let cryptoParam2: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array(),
        };
        await rdbStore.rekey(cryptoParam2);
        console.log(TAG + "rekeyEx success");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "update success,num:" + num);
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        console.log(TAG + "delete success,num:" + num1);
        expect(num1).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekeyEx0037 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3800
     * @tc.name testRekeyEx0038
     * @tc.desc custom encry to custom encry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0038 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 2, 3, 4, 5, 1]),
        iterationCount: 500,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize:2048
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam:cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([7, 2, 3, 4, 5, 1]),
          iterationCount: 500,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize:2048
        };
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success");
        await rdbStore.rekey(cryptoParam1);
        console.log(TAG + "rekey success");
        let cryptoParam2: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([9, 2, 3, 4, 5, 1]),
          iterationCount: 600,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.PLAIN_TEXT,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
          cryptoPageSize:4096
        };
        await rdbStore.rekeyEx(cryptoParam2);
        console.log(TAG + "rekeyEx success");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "update success,num:" + num);
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        console.log(TAG + "delete success,num:" + num1);
        expect(num1).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekeyEx0038 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_3900
     * @tc.name testRekeyEx0039
     * @tc.desc all enum test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testRekeyEx0039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
    //   console.log(TAG + "************* testRekeyEx0039 start *************");
    //   let cryptoParam: data_relationalStore.CryptoParam = {
    //     encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
    //     iterationCount: 1000,
    //     encryptionAlgo: data_relationalStore.EncryptionAlgo.PLAIN_TEXT,
    //     hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
    //     kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
    //     cryptoPageSize: 2048
    //   };
    //   let storeConfig: data_relationalStore.StoreConfig = {
    //     name: "testRekeyEx.db",
    //     securityLevel: data_relationalStore.SecurityLevel.S2,
    //     encrypt: true,
    //     cryptoParam:cryptoParam
    //   }
    //   let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
    //   await rdbStore.executeSql(CREATE_TABLE_TEST);
    //   try {
    //     let cryptoParam1: data_relationalStore.CryptoParam = {
    //       encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
    //       iterationCount: 1000,
    //       encryptionAlgo: data_relationalStore.EncryptionAlgo.PLAIN_TEXT,
    //       hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
    //       kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
    //       cryptoPageSize: 2048
    //     };
    //     let  u8 = new Uint8Array([1, 2, 3])
    //     const valueBucket: data_relationalStore.ValuesBucket = {
    //       "name": "zhangsan",
    //       "age": 18,
    //       "salary": 100.5,
    //       "blobType": u8,
    //     }
    //     await rdbStore.insert("test", valueBucket);
    //     console.log(TAG + "insert success");
    //     await rdbStore.rekeyEx(cryptoParam1);
    //     console.log(TAG + "rekeyrekeyEx success");
    //     const valueBucket1: data_relationalStore.ValuesBucket = {
    //       "name": "zhangsan",
    //       "age": 19,
    //       "salary": 101.5,
    //       "blobType": u8,
    //     }
    //     let predicates = new data_relationalStore.RdbPredicates("test");
    //     predicates.equalTo("NAME", "zhangsan");
    //     let num = await rdbStore.update(valueBucket1, predicates)
    //     console.log(TAG + "update success,num:" + num);
    //     expect(num).assertEqual(1);
    //     let num1 = await rdbStore.delete(predicates);
    //     console.log(TAG + "delete success,num:" + num1);
    //     expect(num1).assertEqual(1);
    //     done();
    //   } catch (err) {
    //     console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
    //     expect().assertFail();
    //     done();
    //   }
    //   console.log(TAG + "************* testRekeyEx0039 end *************");
    // });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_4000
     * @tc.name testRekeyEx0040
     * @tc.desc all enum test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0040 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
        cryptoPageSize: 2048
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([5, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
        cryptoPageSize: 2048
      };
      await rdbStore.rekey(cryptoParam1);
      console.log(TAG + "rekey success")
      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success")
        let cryptoParam2: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([4, 5, 4, 3, 2, 1]),
          iterationCount: 1000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
          cryptoPageSize: 2048
        };
        await rdbStore.rekeyEx(cryptoParam2);
        console.log(TAG + "rekeyEx success")
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0040 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_4100
     * @tc.name testRekeyEx0041
     * @tc.desc all enum test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0041 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
        cryptoPageSize: 2048
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([5, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
        cryptoPageSize: 2048
      };
      await rdbStore.rekey(cryptoParam1);
      console.log(TAG + "rekey success")
      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success")
        let cryptoParam2: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([4, 5, 4, 3, 2, 1]),
          iterationCount: 1000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
          cryptoPageSize: 2048
        };
        await rdbStore.rekeyEx(cryptoParam2);
        console.log(TAG + "rekeyEx success")
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0041 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_4200
     * @tc.name testRekeyEx0042
     * @tc.desc all enum test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0042 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 2048
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([5, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 2048
      };
      await rdbStore.rekey(cryptoParam1);
      console.log(TAG + "rekey success")
      try {
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        console.log(TAG + "insert success")
        let cryptoParam2: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([4, 5, 4, 3, 2, 1]),
          iterationCount: 1000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 2048
        };
        await rdbStore.rekeyEx(cryptoParam2);
        console.log(TAG + "rekeyEx success")
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "num" + num)
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        expect(num1).assertEqual(1);
        console.log(TAG + "num1" + num1)
        done()
      } catch (e) {
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        done()
      }
      console.log(TAG + "************* testRekeyEx0042 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_4300
     * @tc.name testRekeyEx0043
     * @tc.desc invalid kdfAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0043 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.PLAIN_TEXT,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512 + 1,
        cryptoPageSize: 2048
      };
      try {
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyex success");
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRekeyEx0043 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_4400
     * @tc.name testRekeyEx0044
     * @tc.desc invalid encryptionAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0044 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.PLAIN_TEXT+1,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 2048
      };

      try {
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyex success");
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRekeyEx0044 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyExJsAPITest_4500
     * @tc.name testRekeyEx0045
     * @tc.desc invalid hmacAlgo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRekeyEx0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log(TAG + "************* testRekeyEx0045 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekeyEx.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.PLAIN_TEXT,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512 + 1,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 2048
      };

      try {
        await rdbStore.rekeyEx(cryptoParam);
        console.log(TAG + "rekeyex success");
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code).assertEqual("14800001");
        done();
      }
      console.log(TAG + "************* testRekeyEx0045 end *************");
    });
    console.log(TAG + "*************Unit Test End*************");
  })
}