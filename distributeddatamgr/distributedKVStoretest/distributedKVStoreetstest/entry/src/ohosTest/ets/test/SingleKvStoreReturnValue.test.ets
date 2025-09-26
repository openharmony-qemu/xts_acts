/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import factory from '@ohos.data.distributedKVStore';

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();


const KEY_TEST_STRING_1 = 'key_test_string_1';
const VALUE_TEST_STRING_1 = 'value_string_1';
const KEY_TEST_STRING_11 = 'key_test_string_11';
const VALUE_TEST_STRING_11 = 'value_string_11';
const KEY_TEST_STRING_2 = 'key_test_string_2';
const VALUE_TEST_STRING_2 = 'value_string_2';

const TEST_BUNDLE_NAME = 'ohos.acts.kv2';
const TEST_STORE_ID = 'SingleKvStoreReturnValueId';
let kvManager: factory.KVManager|null ;
let kvStore : factory.SingleKVStore|null;
let localDeviceId = '';

function sleep(ms:number) {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

const TAG = "[Kv_Promise_Ets_TEST >>>>>> ]"

const config : factory.KVManagerConfig = {
  bundleName: TEST_BUNDLE_NAME,
  context: context
};


export default function SingleKvStoreReturnValue(){
  describe('SingleKvStoreReturnValue', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done:Function) => {
      console.info(TAG + 'beforeAll context.databaseDir=' + context.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);

      console.info(TAG + 'beforeAll end');
      done();

    });


    beforeEach(async (done:Function) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      done();
    });
    afterEach(async (done:Function) =>  {
      console.info(TAG + 'afterEach');
      kvStore = null;
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded closeKVStore');
      }).catch((err: BusinessError) => {
        console.error(TAG + `afterEach Failed closeKVStore.code is ${err.code},message is ${err.message}`);
      });

      await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded deleteKVStore');
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG + `afterEach Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
        done();
      });

    });

    afterAll(async (done:Function) => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0300
     * @tc.name SUB_DDM_DKV_ReturnValue_0300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0300 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);

        kvStore!.putBatch(entries, async (err: BusinessError) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          kvStore!.getEntries('batch_test_string_key', (err: BusinessError, entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0300 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0301
     * @tc.name SUB_DDM_DKV_ReturnValue_0301
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0301 begin---------  ');
        kvStore!.getEntries('batch_test_string_key', (err: BusinessError, entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0301 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0400
     * @tc.name SUB_DDM_DKV_ReturnValue_0400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(keyPrefix: string): Promise<Entry[]>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0400 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }

        await kvStore!.putBatch(entries);

        await kvStore!.getEntries('batch_test_string_key').then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0400 end---------  ');
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0401
     * @tc.name SUB_DDM_DKV_ReturnValue_0401
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(keyPrefix: string): Promise<Entry[]>
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0401 begin---------  ');

        await kvStore!.getEntries('batch_test_string_key').then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0401 end---------  ');
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0700
     * @tc.name SUB_DDM_DKV_ReturnValue_0700
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0700 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);

        kvStore!.putBatch(entries, async (err: BusinessError) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.getEntries(query, (err: BusinessError, entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0700 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0701
     * @tc.name SUB_DDM_DKV_ReturnValue_0701
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0701 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore!.getEntries(query, (err: BusinessError, entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0701 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0800
     * @tc.name SUB_DDM_DKV_ReturnValue_0800
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query): Promise<Entry[]>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0800 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }

        await kvStore!.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getEntries(query).then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0800 end---------  ');
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0801
     * @tc.name SUB_DDM_DKV_ReturnValue_0801
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query): Promise<Entry[]>
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0801 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getEntries(query).then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0801 end---------  ');
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1100
     * @tc.name SUB_DDM_DKV_ReturnValue_1100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---true
     */
    it('SUB_DDM_DKV_ReturnValue_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1100 begin---------  ');
        kvStore!.put(KEY_TEST_BOOL_ELEMENT, true, (err: BusinessError) => {
          console.info(TAG + "Succeeded in putting");
          kvStore!.get(KEY_TEST_BOOL_ELEMENT, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(true);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1100 end---------  ');
            done();
          });
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1101
     * @tc.name SUB_DDM_DKV_ReturnValue_1101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---false
     */
    it('SUB_DDM_DKV_ReturnValue_1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1101 begin---------  ');
        kvStore!.put(KEY_TEST_BOOL_ELEMENT, false, (err: BusinessError) => {
          console.info(TAG + "Succeeded in putting");
          kvStore!.get(KEY_TEST_BOOL_ELEMENT, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(false);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1101 end---------  ');
            done();
          });
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1200
     * @tc.name SUB_DDM_DKV_ReturnValue_1200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>---true
     */
    it('SUB_DDM_DKV_ReturnValue_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1200 begin---------  ');
        await kvStore!.put(KEY_TEST_BOOL_ELEMENT, true);
        await kvStore!.get(KEY_TEST_BOOL_ELEMENT).then((data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(true);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1200 end---------  ');
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1201
     * @tc.name SUB_DDM_DKV_ReturnValue_1201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>---false
     */
    it('SUB_DDM_DKV_ReturnValue_1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1201 begin---------  ');
        await kvStore!.put(KEY_TEST_BOOL_ELEMENT, false);
        await kvStore!.get(KEY_TEST_BOOL_ELEMENT).then((data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(false);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1201 end---------  ');
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2100
     * @tc.name SUB_DDM_DKV_ReturnValue_2100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S1
     */
    it('SUB_DDM_DKV_ReturnValue_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2100 begin---------  ');
        const optionsS1: factory.Options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S1,
        };
        const TEST_STORE_S1_ID = 'DataChangeStoreS1Id';

        let kvStoreS1: factory.SingleKVStore = await kvManager!.getKVStore(TEST_STORE_S1_ID, optionsS1);

        kvStoreS1!.getSecurityLevel((err: BusinessError, data: factory.SecurityLevel) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) + ',err=' + err);
          expect(data).assertEqual(factory.SecurityLevel.S1);
        });

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(() => {
          console.info(TAG + '  Succeeded closeKVStore S1');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(() => {
          console.info(TAG + '  Succeeded deleteKVStore S1');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed deleteKVStore S1 .code is ${err.code},message is ${err.message}`);
        });

        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2100 end--------- ');
        done();

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2101
     * @tc.name SUB_DDM_DKV_ReturnValue_2101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S2
     */
    it('SUB_DDM_DKV_ReturnValue_2101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2101 begin---------  ');
        const optionsS2: factory.Options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        const TEST_STORE_S2_ID = 'DataChangeStoreS2Id';

        let kvStoreS2: factory.SingleKVStore = await kvManager!.getKVStore(TEST_STORE_S2_ID, optionsS2);

        kvStoreS2!.getSecurityLevel((err: BusinessError, data: factory.SecurityLevel) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) + ',err=' + err);
          expect(data).assertEqual(factory.SecurityLevel.S2);
        });

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(() => {
          console.info(TAG + '  Succeeded closeKVStore S2');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed closeKVStore S2 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(() => {
          console.info(TAG + '  Succeeded deleteKVStore S2');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed deleteKVStore S2 .code is ${err.code},message is ${err.message}`);
        });

        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2101 end--------- ');
        done();

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2102
     * @tc.name SUB_DDM_DKV_ReturnValue_2102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S3
     */
    it('SUB_DDM_DKV_ReturnValue_2102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2102 begin---------  ');
        const optionsS3: factory.Options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S3,
        };
        const TEST_STORE_S3_ID = 'DataChangeStoreS3Id';

        let kvStoreS3: factory.SingleKVStore = await kvManager!.getKVStore(TEST_STORE_S3_ID, optionsS3);

        kvStoreS3!.getSecurityLevel((err: BusinessError, data: factory.SecurityLevel) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) + ',err=' + err);
          expect(data).assertEqual(factory.SecurityLevel.S3);
        });

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
          console.info(TAG + '  Succeeded closeKVStore S3');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed closeKVStore S3 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
          console.info(TAG + '  Succeeded deleteKVStore S3');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed deleteKVStore S3 .code is ${err.code},message is ${err.message}`);
        });

        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2102 end--------- ');
        done();

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2103
     * @tc.name SUB_DDM_DKV_ReturnValue_2103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S4
     */
    it('SUB_DDM_DKV_ReturnValue_2103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2103 begin---------  ');
        const optionsS4: factory.Options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S4,
        };
        const TEST_STORE_S4_ID = 'DataChangeStoreS4Id';

        let kvStoreS4: factory.SingleKVStore = await kvManager!.getKVStore(TEST_STORE_S4_ID, optionsS4);

        kvStoreS4!.getSecurityLevel((err: BusinessError, data: factory.SecurityLevel) => {
          console.info(TAG + 'Succeeded getSecurityLevel S4, data.=' + JSON.stringify(data) + ',err=' + err);
          expect(data).assertEqual(factory.SecurityLevel.S4);
        });

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
          console.info(TAG + '  Succeeded closeKVStore S4');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed closeKVStore S4 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
          console.info(TAG + '  Succeeded deleteKVStore S4');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed deleteKVStore S4 .code is ${err.code},message is ${err.message}`);
        });

        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2103 end--------- ');
        done();

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2200
     * @tc.name SUB_DDM_DKV_ReturnValue_2200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getSecurityLevel(): Promise<SecurityLevel>---S1
     */
    it('SUB_DDM_DKV_ReturnValue_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2200 begin---------  ');
        const optionsS1: factory.Options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S1,
        };
        const TEST_STORE_S1_ID = 'DataChangeStoreS1Id';

        let kvStoreS1: factory.SingleKVStore = await kvManager!.getKVStore(TEST_STORE_S1_ID, optionsS1);

        await kvStoreS1!.getSecurityLevel().then((data: factory.SecurityLevel) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) );
          expect(data).assertEqual(factory.SecurityLevel.S1);
        }).catch((err: BusinessError) => {
          console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(() => {
          console.info(TAG + '  Succeeded closeKVStore S1');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(() => {
          console.info(TAG + '  Succeeded deleteKVStore S1');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed deleteKVStore S1 .code is ${err.code},message is ${err.message}`);
        });

        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2200 end--------- ');
        done();

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2201
     * @tc.name SUB_DDM_DKV_ReturnValue_2201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getSecurityLevel(): Promise<SecurityLevel>---S2
     */
    it('SUB_DDM_DKV_ReturnValue_2201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2201 begin---------  ');
        const optionsS2: factory.Options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        const TEST_STORE_S2_ID = 'DataChangeStoreS2Id';

        let kvStoreS2: factory.SingleKVStore = await kvManager!.getKVStore(TEST_STORE_S2_ID, optionsS2);

        await kvStoreS2!.getSecurityLevel().then((data: factory.SecurityLevel) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) );
          expect(data).assertEqual(factory.SecurityLevel.S2);
        }).catch((err: BusinessError) => {
          console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(() => {
          console.info(TAG + '  Succeeded closeKVStore S2');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed closeKVStore S2 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(() => {
          console.info(TAG + '  Succeeded deleteKVStore S2');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed deleteKVStore S2 .code is ${err.code},message is ${err.message}`);
        });

        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2201 end--------- ');
        done();

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2202
     * @tc.name SUB_DDM_DKV_ReturnValue_2202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getSecurityLevel(): Promise<SecurityLevel>---S3
     */
    it('SUB_DDM_DKV_ReturnValue_2202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2202 begin---------  ');
        const optionsS3: factory.Options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S3,
        };
        const TEST_STORE_S3_ID = 'DataChangeStoreS3Id';

        let kvStoreS3: factory.SingleKVStore = await kvManager!.getKVStore(TEST_STORE_S3_ID, optionsS3);

        await kvStoreS3!.getSecurityLevel().then((data: factory.SecurityLevel) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) );
          expect(data).assertEqual(factory.SecurityLevel.S3);
        }).catch((err: BusinessError) => {
          console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
          console.info(TAG + '  Succeeded closeKVStore S3');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed closeKVStore S3 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
          console.info(TAG + '  Succeeded deleteKVStore S3');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed deleteKVStore S3 .code is ${err.code},message is ${err.message}`);
        });

        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2202 end--------- ');
        done();

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2203
     * @tc.name SUB_DDM_DKV_ReturnValue_2203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getSecurityLevel(): Promise<SecurityLevel>---S4
     */
    it('SUB_DDM_DKV_ReturnValue_2203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2203 begin---------  ');
        const optionsS4: factory.Options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S4,
        };
        const TEST_STORE_S4_ID = 'DataChangeStoreS4Id';

        let kvStoreS4: factory.SingleKVStore = await kvManager!.getKVStore(TEST_STORE_S4_ID, optionsS4);

        await kvStoreS4!.getSecurityLevel().then((data: factory.SecurityLevel) => {
          console.info(TAG + 'Succeeded getSecurityLevel S4, data.=' + JSON.stringify(data) );
          expect(data).assertEqual(factory.SecurityLevel.S4);
        }).catch((err: BusinessError) => {
          console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
          console.info(TAG + '  Succeeded closeKVStore S4');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed closeKVStore S4 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
          console.info(TAG + '  Succeeded deleteKVStore S4');
        }).catch((err: BusinessError) => {
          console.error(TAG + ` Failed deleteKVStore S4 .code is ${err.code},message is ${err.message}`);
        });

        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2203 end--------- ');
        done();

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })





    console.info(TAG + '-------------------describe SingleKvStoreReturnValue  end-------------------');
  })
}