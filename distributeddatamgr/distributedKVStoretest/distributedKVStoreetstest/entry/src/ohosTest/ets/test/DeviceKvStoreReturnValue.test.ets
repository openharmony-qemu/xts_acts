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

const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const VALUE_TEST_STRING_ELEMENT = 'value-test-string';
const KEY_TEST_STRING_1 = 'key_test_string_1';
const VALUE_TEST_STRING_1 = 'value_string_1';
const KEY_TEST_STRING_11 = 'key_test_string_11';
const VALUE_TEST_STRING_11 = 'value_string_11';
const KEY_TEST_STRING_2 = 'key_test_string_2';
const VALUE_TEST_STRING_2 = 'value_string_2';

const TEST_BUNDLE_NAME = 'ohos.acts.kv2';
const TEST_STORE_ID = 'DeviceKvStoreReturnValueId';
let kvManager: factory.KVManager|null ;
let kvStore : factory.DeviceKVStore|null;
let localDeviceId = '';

function sleep(ms:number) {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

const TAG = "[Kv_Promise_Ets_TEST >>>>>> ]"

const config : factory.KVManagerConfig = {
  bundleName: TEST_BUNDLE_NAME,
  context: context
};


export default function DeviceKvStoreReturnValue(){
  describe('DeviceKvStoreReturnValue', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done:Function) => {
      console.info(TAG + 'beforeAll context.databaseDir=' + context.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);

      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeAll getKVStore for getKVStore success');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });

      let getDeviceId = new Promise<string>((resolve, reject) => {
        kvStore!.on('dataChange', 0, (data) => {
          console.info(TAG + 'beforeAll on data change: ' + JSON.stringify(data));
          console.info(TAG + 'beforeAll on data.deviceId=' + JSON.stringify(data.deviceId));
          resolve(data.deviceId);
        });
        kvStore!.put("getDeviceId", "byPut").then((data) => {
          console.info(TAG + 'beforeAll put success');
          expect(data == undefined).assertTrue();
        });
        setTimeout(() => {
          reject(new Error('not resolved in 2 second, reject it.'));
        }, 2000);
      });
      await getDeviceId.then((deviceId) => {
        console.info(TAG + 'beforeAll getDeviceId=' + JSON.stringify(deviceId));
        localDeviceId = deviceId;
      }).catch((error: BusinessError) => {
        console.error(TAG + 'beforeAll can NOT getDeviceId, fail: ' +
          `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });

      await sleep(3000);
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
      await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
      kvStore = null;
      console.info(TAG + 'beforeAll end');
      await sleep(2000);
      done();

    });


    beforeEach(async (done:Function) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0100
     * @tc.name SUB_DDM_DKV_ReturnValue_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getAllKVStoreId(appId: string, callback: AsyncCallback<string[]>): void
     * data.length = 1
     */
    it('SUB_DDM_DKV_ReturnValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0100 begin---------  ');
        kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME, (err: BusinessError, data: string[]) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) + ',err=' + err);
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(1);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0100 end--------- ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0101
     * @tc.name SUB_DDM_DKV_ReturnValue_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getAllKVStoreId(appId: string, callback: AsyncCallback<string[]>): void
     * data.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0101 begin---------  ');
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

        kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME, (err: BusinessError, data: string[]) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) + ',err=' + err);
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0101 end--------- ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })



    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0200
     * @tc.name SUB_DDM_DKV_ReturnValue_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getAllKVStoreId(appId: string): Promise<string[]>
     * data.length = 1
     */
    it('SUB_DDM_DKV_ReturnValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0200 begin---------  ');
        await kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME).then((data: string[]) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) );
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(1);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0200 end--------- ');
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0201
     * @tc.name SUB_DDM_DKV_ReturnValue_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getAllKVStoreId(appId: string): Promise<string[]>
     * data.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0201 begin---------  ');

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

        await kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME).then((data: string[]) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) );
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0201 end--------- ');
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0300
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0301
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0400
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0401
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0500
     * @tc.name SUB_DDM_DKV_ReturnValue_0500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0500 begin---------  ');
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
          kvStore!.getEntries(localDeviceId, 'batch_test_string_key', (err: BusinessError, entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0500 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0501
     * @tc.name SUB_DDM_DKV_ReturnValue_0501
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0501 begin---------  ');
        kvStore!.getEntries(localDeviceId, 'batch_test_string_key', (err: BusinessError, entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0501 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0600
     * @tc.name SUB_DDM_DKV_ReturnValue_0600
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, keyPrefix: string): Promise<Entry[]>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0600 begin---------  ');
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

        await kvStore!.getEntries(localDeviceId, 'batch_test_string_key').then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0600 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0601
     * @tc.name SUB_DDM_DKV_ReturnValue_0601
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, keyPrefix: string): Promise<Entry[]>
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0601 begin---------  ');

        await kvStore!.getEntries(localDeviceId, 'batch_test_string_key').then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0601 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0700
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0701
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0800
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0801
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0900
     * @tc.name SUB_DDM_DKV_ReturnValue_0900
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0900 begin---------  ');
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
          kvStore!.getEntries(localDeviceId, query, (err: BusinessError, entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0900 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0901
     * @tc.name SUB_DDM_DKV_ReturnValue_0901
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0901 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore!.getEntries(localDeviceId, query, (err: BusinessError, entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0901 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1000
     * @tc.name SUB_DDM_DKV_ReturnValue_1000
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1000 begin---------  ');
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
        await kvStore!.getEntries(localDeviceId, query).then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1000 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1001
     * @tc.name SUB_DDM_DKV_ReturnValue_1001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1001 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getEntries(localDeviceId, query).then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1001 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1100
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1101
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1200
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1201
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1300
     * @tc.name SUB_DDM_DKV_ReturnValue_1300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId:string, key:string, callback:AsyncCallback<boolean|string| number|Uint8Array>):void--true
     */
    it('SUB_DDM_DKV_ReturnValue_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1300 begin---------  ');
        kvStore!.put(KEY_TEST_BOOL_ELEMENT, true, (err: BusinessError) => {
          console.info(TAG + "Succeeded in putting");
          kvStore!.get(localDeviceId, KEY_TEST_BOOL_ELEMENT, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(true);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1300 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1301
     * @tc.name SUB_DDM_DKV_ReturnValue_1301
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId:string, key:string, callback:AsyncCallback<boolean|string| number|Uint8Array>)---false
     */
    it('SUB_DDM_DKV_ReturnValue_1301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1301 begin---------  ');
        kvStore!.put(KEY_TEST_BOOL_ELEMENT, false, (err: BusinessError) => {
          console.info(TAG + "Succeeded in putting");
          kvStore!.get(localDeviceId, KEY_TEST_BOOL_ELEMENT, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(false);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1301 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1400
     * @tc.name SUB_DDM_DKV_ReturnValue_1400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string): Promise<boolean | string | number | Uint8Array>---true
     */
    it('SUB_DDM_DKV_ReturnValue_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1400 begin---------  ');
        await kvStore!.put(KEY_TEST_BOOL_ELEMENT, true);
        await kvStore!.get(localDeviceId, KEY_TEST_BOOL_ELEMENT).then((data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(true);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1400 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1401
     * @tc.name SUB_DDM_DKV_ReturnValue_1401
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string): Promise<boolean | string | number | Uint8Array>---false
     */
    it('SUB_DDM_DKV_ReturnValue_1401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1401 begin---------  ');
        await kvStore!.put(KEY_TEST_BOOL_ELEMENT, false);
        await kvStore!.get(localDeviceId, KEY_TEST_BOOL_ELEMENT).then((data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(false);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1401 end---------  ');
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
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_3000
     * @tc.name SUB_DDM_DKV_ReturnValue_3000
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc FieldNode.appendChild(child: FieldNode): boolean---true
     */
    it('SUB_DDM_DKV_ReturnValue_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_3000 begin---------  ');
        let node:factory.FieldNode|null = new factory.FieldNode("root");
        let child:factory.FieldNode|null = new factory.FieldNode("child");
        let res1 = node.appendChild(child);
        console.info(TAG + ' appendChild res1=' + res1);
        expect(res1).assertEqual(true);
        child = null;
        node = null;
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_3000 end---------  ');
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_3001
     * @tc.name SUB_DDM_DKV_ReturnValue_3001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc FieldNode.appendChild(child: FieldNode): boolean---false
     */
    it('SUB_DDM_DKV_ReturnValue_3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_3001 begin---------  ');
        let node:factory.FieldNode|null = new factory.FieldNode("root");
        let res1 = node.appendChild(null);
        console.info(TAG + ' try appendChild res1=' + res1);
        expect(res1).assertEqual(false);
        node = null;
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_3001 end---------  ');
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    console.info(TAG + '-------------------describe KvStoreReturnValue  end-------------------');
  })
}