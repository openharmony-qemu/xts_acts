'use static';
/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import factory from '@ohos.data.distributedKVStore'
import common from "@ohos.app.ability.common";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 123  as long;
const VALUE_TEST_FLOAT_ELEMENT = 321.12.toLong();
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-001';

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'SingleKvStoreConcurrencyTesWBId';
let kvManager: factory.KVManager | null = null;
let kvStore: factory.SingleKVStore | null = null;
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function KvManagerConcurrencyEtsTest() {
  describe('KvManagerConcurrencyEtsTest', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: false,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      schema: undefined,
      securityLevel: factory.SecurityLevel.S2,
    }

    beforeAll(async (done: () => void): Promise<void> => {
      let cmd = "aa start -a EntryAbility -b com.example.kvstoreetstest.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(1000)

      context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      const config: factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context
      }
      console.info('test logbeforeAll config:' + JSON.stringify(config));
      kvManager = factory.createKVManager(config)
      console.info('test logbeforeAll end');
      done();
    })

    afterAll(async (done: () => void): Promise<void> => {
      console.info('test logafterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async (done: () => void): Promise<void> => {
      await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
        kvStore = store;
        console.info('test logbeforeEach getKVStore success');
        done();
      }).catch((err: Error) => {
        console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });
    })

    afterEach(async (done: () => void): Promise<void> => {
      console.info('test logafterEach');
      await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err: Error) => {
          console.error('afterEach getKVStore err ' +
            `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      }).catch((err: Error) => {
        console.error('afterEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });
    })

    /**
     * @tc.name   TestConcurrencyGetKVStoreSuccess_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerPromiseEtsApiConcurrencyTest_0100
     * @tc.desc   getKVStore<T>(storeId: string, options: Options): Promise<T>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestConcurrencyGetKVStoreSuccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyGetKVStoreSuccess_0100 test start');
        let count: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
              expect(store != undefined).assertTrue();
              kvStore = store;
              count--;
              if (count == 0) {
                console.info('KVMANAGER_CONCURRENCY_GETKVSTORE_PROMISE_0100 test end');
                done();
              }
            }).catch((err: Error) => {
              console.error('getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            });
          } catch (e) {
            console.error('catch e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyCloseKVStoreWithoutPutSuccess_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerPromiseEtsApiConcurrencyTest_0200
     * @tc.desc   closeKVStore(appId: string, storeId: string): Promise<void>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestConcurrencyCloseKVStoreWithoutPutSuccess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyCloseKVStoreWithoutPutSuccess_0200 test start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
              expect(store != undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0100 test end');
                done();
              }
            }).catch((err: Error) => {
              console.error('getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            });
            kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0100 test end');
                done();
              }
            }).catch((err: Error) => {
              console.error(`Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
            });
          } catch (e) {
            console.error('catch e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyCloseKVStoreWithPutSuccess_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerPromiseEtsApiConcurrencyTest_0300
     * @tc.desc   closeKVStore(appId: string, storeId: string): Promise<void>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestConcurrencyCloseKVStoreWithPutSuccess_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyCloseKVStoreWithPutSuccess start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
            expect(store != undefined).assertTrue();
            kvStore = store;
            kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0200 end');
                done();
              }
            }).catch((error: Error) => {
              console.error('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0200 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
            count1--;
            if (count == 0 && count1 == 0) {
              console.info('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0200 test end');
              done();
            }
          }).catch((err: Error) => {
            console.error(`Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
          });
        }
        console.info('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0200 end');
      })

    /**
     * @tc.name   TestConcurrencyGetAfterCloseKVStoreSuccess_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerPromiseEtsApiConcurrencyTest_0400
     * @tc.desc   closeKVStore(appId: string, storeId: string): Promise<void>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestConcurrencyGetAfterCloseKVStoreSuccess_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyGetAfterCloseKVStoreSuccess_0400 start');
        let count: number = 200;
        let count1: number = 200;
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
          expect(data == undefined).assertTrue();
        }).catch((error: Error) => {
          console.error('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0300 put error' +
            `, error code is ${error.code}, message is ${error.message}`);
          expect(null).assertFail();
          done();
        });
        for (let i = 0; i < 200; i++) {
          await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
            expect(store != undefined).assertTrue();
            kvStore = store;
            kvStore!.get(KEY_TEST_STRING_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(VALUE_TEST_STRING_ELEMENT == data).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0300 end');
                done();
              }
            }).catch((err: Error) => {
              console.error('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0300 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error('getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
            count1--;
            if (count == 0 && count1 == 0) {
              console.info('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0300 test end');
              done();
            }
          }).catch((err: Error) => {
            console.error(`Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
          });
        }
        console.info('KVMANAGER_CONCURRENCY_CLOSEKVSTORE_PROMISE_0300 end');
      })

    /**
     * @tc.name   TestConcurrencyPutStringValueSuccess_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvStorePromiseEtsApiConcurrencyTest_0100
     * @tc.desc   Test Js Api SingleKvStore.Put(String) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestConcurrencyPutStringValueSuccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyPutStringValueSuccess_0100 start');
        let count: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_PUTSTRING_PROMISE_0100 end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_PUTSTRING_PROMISE_0100 put error' +
              `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_PUTSTRING_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
        console.info('SINGLEKVSTORE_CONCURRENCY_PUTSTRING_PROMISE_0100 end');
      })

    /**
     * @tc.name   TestConcurrencyPutIntValueSuccess_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_0200
     * @tc.desc   Test Js Api SingleKvStore.Put(Int) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestConcurrencyPutIntValueSuccess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyPutIntValueSuccess_0200 start');
        let count: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_PUTINT_PROMISE_0100 end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_PUTINT_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_PUTINT_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
        console.info('SINGLEKVSTORE_CONCURRENCY_PUTINT_PROMISE_0100 end');
      })

    /**
     * @tc.name   TestConcurrencyPutFloatValueSuccess_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_0300
     * @tc.desc   Test Js Api SingleKvStore.Put(Float) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestConcurrencyPutFloatValueSuccess_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyPutFloatValueSuccess_0300 start');
        let count: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_PUTFLOAT_PROMISE_0100 end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_PUTFLOAT_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_PUTFLOAT_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
        console.info('SINGLEKVSTORE_CONCURRENCY_PUTFLOAT_PROMISE_0100 end');
      })

    /**
     * @tc.name   TestConcurrencyPutBooleanValueSuccess_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_0400
     * @tc.desc   Test Js Api SingleKvStore.Put(Boolean) testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestConcurrencyPutBooleanValueSuccess_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyPutBooleanValueSuccess_0400 start');
        let count: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_PUTBOOLEAN_PROMISE_0100 end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_PUTBOOLEAN_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_PUTBOOLEAN_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
        console.info('SINGLEKVSTORE_CONCURRENCY_PUTFLOAT_PROMISE_0100 end');
      })

    /**
     * @tc.name   TestConcurrencyGetStringValueSuccess_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_0500
     * @tc.desc   Test Js Api SingleKvStoreGetString testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyGetStringValueSuccess_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyGetStringValueSuccess_0500 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_GETSTRING_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETSTRING_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.get(KEY_TEST_STRING_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_GETSTRING_PROMISE_0100 get end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETSTRING_PROMISE_0100 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              if (err.code != 15100004) {
                expect(null).assertFail();
                done();
              }
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_GETSTRING_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyGetIntValueSuccess_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_0600
     * @tc.desc   Test Js Api SingleKvStoreGetInt testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyGetIntValueSuccess_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyGetIntValueSuccess_0600 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_GETINT_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETINT_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.get(KEY_TEST_INT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(VALUE_TEST_INT_ELEMENT == data).assertTrue();
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_GETINT_PROMISE_0100 get end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETINT_PROMISE_0100 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              if (err.code != 15100004) {
                expect(null).assertFail();
                done();
              }
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_GETINT_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyGetFloatValueSuccess_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_0700
     * @tc.desc   Test Js Api SingleKvStoreGetFloat testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyGetFloatValueSuccess_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyGetFloatValueSuccess_0700 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_GETFLOAT_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETFLOAT_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.get(KEY_TEST_FLOAT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(VALUE_TEST_FLOAT_ELEMENT == data).assertTrue();
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_GETFLOAT_PROMISE_0100 get end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETFLOAT_PROMISE_0100 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              if (err.code != 15100004) {
                expect(null).assertFail();
                done();
              }
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_GETFLOAT_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyGetBooleanValueSuccess_0800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_0800
     * @tc.desc   Test Js Api SingleKvStoreGetBoolean testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyGetBooleanValueSuccess_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyGetBooleanValueSuccess_0800 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_GETBOOLEAN_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETBOOLEAN_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.get(KEY_TEST_BOOLEAN_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(VALUE_TEST_BOOLEAN_ELEMENT == data).assertTrue();
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_GETBOOLEAN_PROMISE_0100 get end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETBOOLEAN_PROMISE_0100 get fail ' +
                `, error code is ${err.code}, message is ${err.message}`);

              if (err.code != 15100004) {
                expect(null).assertFail();
                done();
              }
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_GETBOOLEAN_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyDeleteStringValueSuccess_0900
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_0900
     * @tc.desc   Test Js Api SingleKvStoreDeleteString testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyDeleteStringValueSuccess_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyDeleteStringValueSuccess_0900 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_DELETESTRING_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_DELETESTRING_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.delete(KEY_TEST_STRING_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_DELETESTRING_PROMISE_0100 delete end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_DELETESTRING_PROMISE_0100 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_DELETESTRING_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyDeleteIntValueSuccess_1000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1000
     * @tc.desc   Test Js Api SingleKvStoreDeleteInt testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyDeleteIntValueSuccess_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyDeleteIntValueSuccess_1000 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_DELETEINT_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_DELETEINT_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.delete(KEY_TEST_INT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_DELETEINT_PROMISE_0100 delete end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_DELETEINT_PROMISE_0100 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_DELETEINT_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyDeleteFloatValueSuccess_1100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1100
     * @tc.desc   Test Js Api SingleKvStoreDeleteFloat testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyDeleteFloatValueSuccess_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyDeleteFloatValueSuccess_1100 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_DELETEFLOAT_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_DELETEFLOAT_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.delete(KEY_TEST_FLOAT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_DELETEFLOAT_PROMISE_0100 delete end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_DELETEFLOAT_PROMISE_0100 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_DELETEFLOAT_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyDeleteBooleanValueSuccess_1200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1200
     * @tc.desc   Test Js Api SingleKvStoreDeleteBoolean testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyDeleteBooleanValueSuccess_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyDeleteBooleanValueSuccess_1200 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_DELETEBOOLEAN_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_DELETEBOOLEAN_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.delete(KEY_TEST_BOOLEAN_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_DELETEBOOLEAN_PROMISE_0100 delete end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_DELETEBOOLEAN_PROMISE_0100 delete fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_DELETEBOOLEAN_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyChangeStringValueSuccess_1300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1300
     * @tc.desc   Test Js Api SingleKvStoreChangeString testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyChangeStringValueSuccess_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyChangeStringValueSuccess_1300 start');
        let count: number = 200;
        let count1: number = 200;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_CHANGESTRING_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_CHANGESTRING_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.put(KEY_TEST_STRING_ELEMENT, 'value-string-002').
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_CHANGESTRING_PROMISE_0100 change end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_CHANGESTRING_PROMISE_0100 change error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_CHANGESTRING_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyChangeIntValueSuccess_1400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1400
     * @tc.desc   Test Js Api SingleKvStoreChangeInt testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyChangeIntValueSuccess_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyChangeIntValueSuccess_1400 start');
        let count: number = 200;
        let count1: number = 200;
        let VALUE_TEST_INT1_ELEMENT = 456  as long;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_CHANGEINT_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEINT_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT1_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_CHANGEINT_PROMISE_0100 change end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEINT_PROMISE_0100 change error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEINT_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyChangeFloatValueSuccess_1500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1500
     * @tc.desc   Test Js Api SingleKvStoreChangeFloat testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyChangeFloatValueSuccess_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyChangeFloatValueSuccess_1500 start');
        let count: number = 200;
        let count1: number = 200;
        let VALUE_TEST_FLOAT1_ELEMENT = 456.78.toLong();
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_CHANGEFLOAT_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEFLOAT_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT1_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_CHANGEFLOAT_PROMISE_0100 change end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEFLOAT_PROMISE_0100 change error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEFLOAT_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyChangeBooleanValueSuccess_1600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1600
     * @tc.desc   Test Js Api SingleKvStoreChangeBoolean testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyChangeBooleanValueSuccess_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyChangeBooleanValueSuccess_1600 start');
        let count: number = 200;
        let count1: number = 200;
        let VALUE_TEST_BOOLEAN1_ELEMENT = false;
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              expect(data == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_CHANGEBOOLEAN_PROMISE_0100 put end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEBOOLEAN_PROMISE_0100 put error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN1_ELEMENT).
            then((data: boolean | string | Long | double | Uint8Array | undefined) => {
              count1--;
              if (count == 0 && count1 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_CHANGEBOOLEAN_PROMISE_0100 change end');
                done();
              }
            }).catch((error: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEBOOLEAN_PROMISE_0100 change error' +
                `, error code is ${error.code}, message is ${error.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_CHANGEBOOLEAN_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyPutBatchGetEntriesSuccess_1700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1700
     * @tc.desc   Test Js Api SingleKvStorePutBatch testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyPutBatchGetEntriesSuccess_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyPutBatchGetEntriesSuccess_1700 start');
        let count: number = 200;
        let count1: number = 200;
        let count2: number = 200;
        let entries: factory.Entry[] = [];
        let keys: string[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_number_key';
          let entry: factory.Entry = {
            key: key + i,
            value: {
              type: factory.ValueType.LONG,
              value: 222 as long
            }
          } as factory.Entry;
          entries.push(entry);
          keys.push(key + i);
        }
        for (let i = 0; i < 200; i++) {
          try {
            kvStore!.putBatch(entries).then((err) => {
              expect(err == undefined).assertTrue();
              count--;
              if (count == 0 && count1 == 0 && count2 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_PUTBATCHGETENTRIES_PROMISE_0100 putBatch end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_PUTBATCHGETENTRIES_PROMISE_0100 putBatch fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.getEntries('batch_test_number_key').then((entrys: factory.Entry[] | undefined) => {
              count1--;
              if (count == 0 && count1 == 0 && count2 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_PUTBATCHGETENTRIES_PROMISE_0100 getEntries end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_PUTBATCHGETENTRIES_PROMISE_0100 getEntries fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
            kvStore!.deleteBatch(keys).then((err) => {
              expect(err == undefined).assertTrue();
              count2--;
              if (count == 0 && count1 == 0 && count2 == 0) {
                console.info('SINGLEKVSTORE_CONCURRENCY_PUTBATCHGETENTRIES_PROMISE_0100 deleteBatch end');
                done();
              }
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_PUTBATCHGETENTRIES_PROMISE_0100 deleteBatch fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          } catch (e) {
            console.error('SINGLEKVSTORE_CONCURRENCY_PUTBATCHGETENTRIES_PROMISE_0100 e ' +
              `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   TestConcurrencyGetResultSetSuccess_1800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1800
     * @tc.desc   Test Js Api SingleKvStoreGetResultSet testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyGetResultSetSuccess_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyGetResultSetSuccess_1800 start');
        let count: number = 8;
        let entries: factory.Entry[] = [];
        let resultSet: factory.KVStoreResultSet;
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          } as factory.Entry;
          entries.push(entry);
        }
        await kvStore!.putBatch(entries).then((err: Error | undefined) => {
          console.info('SINGLEKVSTORE_CONCURRENCY_GETRESULTSET_PROMISE_0100 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SINGLEKVSTORE_CONCURRENCY_GETRESULTSET_PROMISE_0100 putBatch fail ' +
            `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        for (let i = 0; i < 8; i++) {
          kvStore!.getResultSet('batch_test_string').then((result: factory.KVStoreResultSet) => {
            resultSet = result;
            expect(resultSet!.getCount() == 10).assertTrue();
            count--;
            kvStore!.closeResultSet(resultSet).then((err: Error | undefined) => {
              console.info('SINGLEKVSTORE_CONCURRENCY_GETRESULTSET_PROMISE_0100 closeResultSet end, count=' + count);
            }).catch((err: Error) => {
              console.error('SINGLEKVSTORE_CONCURRENCY_GETRESULTSET_PROMISE_0100 closeResultSet fail ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });

            if (count == 0) {
              console.info('SINGLEKVSTORE_CONCURRENCY_GETRESULTSET_PROMISE_0100 getResultSet end');
              done();
            }
          }).catch((err: Error) => {
            console.error('SINGLEKVSTORE_CONCURRENCY_GETRESULTSET_PROMISE_0100 getResultSet fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          });
        }
      })

    /**
     * @tc.name   TestConcurrencyGetResultSizeSuccess_1900
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvPromiseEtsApiConcurrencyTest_1900
     * @tc.desc   Test Js Api SingleKvStoreGetResultSize testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestConcurrencyGetResultSizeSuccess_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('TestConcurrencyGetResultSizeSuccess_1900 start');
        let count: number = 200;
        let entries: factory.Entry[] = [];
        let resultSet: factory.KVStoreResultSet;
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          } as factory.Entry;
          entries.push(entry);
        }
        await kvStore!.putBatch(entries).then((err: Error | undefined) => {
          console.info('SINGLEKVSTORE_CONCURRENCY_GETRESULTSIZE_PROMISE_0100 putBatch success');
          expect(err == undefined).assertTrue();
        }).catch((err: Error) => {
          console.error('SINGLEKVSTORE_CONCURRENCY_GETRESULTSIZE_PROMISE_0100 putBatch fail ' +
            `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        let query = new factory.Query();
        query.prefixKey("batch_test");
        for (let i = 0; i < 200; i++) {
          kvStore!.getResultSize(query).then((resultSize: int) => {
            expect(resultSize == 10).assertTrue();
            count--;
            if (count == 0) {
              console.info('SINGLEKVSTORE_CONCURRENCY_GETRESULTSIZE_PROMISE_0100 end');
              done();
            }
          }).catch((err: Error) => {
            console.error('SINGLEKVSTORE_CONCURRENCY_GETRESULTSIZE_PROMISE_0100 getResultSize fail ' +
              `, error code is ${err.code}, message is ${err.message}`);
            if (err.code != 15100004) {
              expect(null).assertFail();
              done();
            }
          });
        }
      })
  })
}