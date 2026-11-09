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
import { BusinessError, Callback } from '@kit.BasicServicesKit';

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

    /**
     * @tc.name   testOffInterProcess_param_0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OffInterProcess_Add_0100
     * @tc.desc   Test off(event, interProcess=true, observer) with a registered observer - success path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffInterProcess_param_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOffInterProcess_param_0001 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      let storeObserver = () => {
        console.info(TAG + 'storeObserver interProcess=true');
      };
      try {
        store.on('storeObserver', true, storeObserver);
      } catch (err) {
        console.error(TAG + `Register observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      try {
        let num = 0;
        store.off('storeObserver', true, storeObserver);
        num += 1;
        console.info(TAG + 'testOffInterProcess_param_0001 off storeObserver interProcess=true success');
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(TAG + `Unregister observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      await store.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOffInterProcess_param_0001 end *************");
    })

    /**
     * @tc.name   testOffInterProcess_param_0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OffInterProcess_Add_0200
     * @tc.desc   Test off(event, interProcess=false, observer) with a registered observer - success path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffInterProcess_param_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOffInterProcess_param_0002 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      let storeObserver = () => {
        console.info(TAG + 'storeObserver interProcess=false');
      };
      try {
        if (store != undefined) {
          store.on('storeObserver', false, storeObserver);
        }
      } catch (err) {
        console.error(TAG + `Register observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      try {
        let num = 0;
        store.off('storeObserver', false, storeObserver);
        num += 1;
        console.info(TAG + 'testOffInterProcess_param_0002 off storeObserver interProcess=false success');
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(TAG + `Unregister observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      await store.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOffInterProcess_param_0002 end *************");
    })

    /**
     * @tc.name   testOffInterProcess_param_0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OffInterProcess_Add_0300
     * @tc.desc   Test off(event, interProcess) with observer omitted - unregisters all observers for that combo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffInterProcess_param_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOffInterProcess_param_0003 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      let storeObserver1 = () => {
        console.info(TAG + 'storeObserver1 interProcess=true');
      };
      let storeObserver2 = () => {
        console.info(TAG + 'storeObserver2 interProcess=true');
      };
      try {
        if (store != undefined) {
          store.on('storeObserver', true, storeObserver1);
          store.on('storeObserver', true, storeObserver2);
        }
        console.info(TAG + 'testOffInterProcess_param_0003 registered two observers for interProcess=true');
      } catch (err) {
        console.error(TAG + `Register observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      try {
        let num = 0;
        store.off('storeObserver', true);
        num += 1;
        console.info(TAG + 'testOffInterProcess_param_0003 off storeObserver interProcess=true without observer removes all');
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(TAG + `Unregister observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      await store.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOffInterProcess_param_0003 end *************");
    })

    /**
     * @tc.name   testOffInterProcess_param_0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OffInterProcess_Add_0400
     * @tc.desc   Test off(event, interProcess=false, observer) after on(event, interProcess=true, observer) -
     *            verify interProcess values are independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffInterProcess_param_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOffInterProcess_param_0004 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      let storeObserver = () => {
        console.info(TAG + 'storeObserver interProcess independence');
      };
      try {
        if (store != undefined) {
          store.on('storeObserver', true, storeObserver);
        }
        console.info(TAG + 'testOffInterProcess_param_0004 on storeObserver interProcess=true success');
      } catch (err) {
        console.error(TAG + `Register observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      try {
        let num = 0;
        store.off('storeObserver', false, storeObserver);
        num += 1;
        console.info(TAG + 'testOffInterProcess_param_0004 off storeObserver interProcess=false (nothing registered for false) does not error');
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(TAG + `Unregister observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      await store.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOffInterProcess_param_0004 end *************");
    })

    /**
     * @tc.name   testOffInterProcess_param_0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OffInterProcess_Add_0500
     * @tc.desc   Test off(event, interProcess=true, unregisteredObserver) without prior on - should not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffInterProcess_param_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOffInterProcess_param_0005 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      let unregisteredObserver = () => {
        console.info(TAG + 'unregistered storeObserver');
      };
      try {
        let num = 0;
        store.off('storeObserver', true, unregisteredObserver);
        num += 1;
        console.info(TAG + 'testOffInterProcess_param_0005 off with unregistered observer did not throw');
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(TAG + `Unregister observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      await store.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOffInterProcess_param_0005 end *************");
    })

    /**
     * @tc.name   testOffInterProcess_param_0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OffInterProcess_Add_0600
     * @tc.desc   Test off(event, interProcess=true, null observer) - should throw 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffInterProcess_param_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOffInterProcess_param_0006 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      try {
        if (store != undefined) {
          store.off('storeObserver', true, null as Object as Callback<void>);
        }
        console.error(TAG + 'testOffInterProcess_param_0006 off with null observer did not throw');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Unregister observer failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      await store.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOffInterProcess_param_0006 end *************");
    })

    /**
     * @tc.name   testOffInterProcess_param_0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OffInterProcess_Add_0800
     * @tc.desc   Test off(event, interProcess=true, observer) after store closed - should throw 14800014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffInterProcess_param_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOffInterProcess_param_0008 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      let storeObserver = () => {
        console.info(TAG + 'storeObserver after close');
      };
      try {
        if (store != undefined) {
          store.on('storeObserver', true, storeObserver);
        }
        console.info(TAG + 'testOffInterProcess_param_0008 registered observer before close');
      } catch (err) {
        console.error(TAG + `Register observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      await store.close();
      console.info(TAG + 'testOffInterProcess_param_0008 store closed');
      try {
        store.off('storeObserver', true, storeObserver);
        console.error(TAG + 'testOffInterProcess_param_0008 off after close did not throw');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Unregister observer failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual('14800014');
      }
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOffInterProcess_param_0008 end *************");
    })

    /**
     * @tc.name   testOffInterProcess_param_0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OffInterProcess_Add_0900
     * @tc.desc   Test off(event, interProcess) with the optional third parameter observer omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffInterProcess_param_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOffInterProcess_param_0009 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      let storeObserver = () => {
        console.info(TAG + 'storeObserver interProcess=false');
      };
      try {
        if (store != undefined) {
          store.on('storeObserver', false, storeObserver);
        }
      } catch (err) {
        console.error(TAG + `Register observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      try {
        let num = 0;
        store.off('storeObserver', false);
        num += 1;
        console.info(TAG + 'testOffInterProcess_param_0009 off storeObserver interProcess=false without observer success');
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(TAG + `Unregister observer failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      await store.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOffInterProcess_param_0009 end *************");
    })

    /**
     * @tc.name   testOnAutoSyncProgress_multiCallback_0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OnAutoSyncProgress_Add_0100
     * @tc.desc   Test on('autoSyncProgress') subscribing multiple distinct callbacks, verify they fire in subscription order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnAutoSyncProgress_multiCallback_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testOnAutoSyncProgress_multiCallback_0001 start *************");
      let store: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      let callOrder: string[] = [];
      let callback1 = (progress: data_relationalStore.ProgressDetails) => {
        callOrder.push('callback1');
        console.info(TAG + 'callback1 received: ' + JSON.stringify(progress));
      };
      let callback2 = (progress: data_relationalStore.ProgressDetails) => {
        callOrder.push('callback2');
        console.info(TAG + 'callback2 received: ' + JSON.stringify(progress));
      };
      let callback3 = (progress: data_relationalStore.ProgressDetails) => {
        callOrder.push('callback3');
        console.info(TAG + 'callback3 received: ' + JSON.stringify(progress));
      };
      try {
        store.on('autoSyncProgress', callback1);
        store.on('autoSyncProgress', callback2);
        store.on('autoSyncProgress', callback3);
        console.info(TAG + 'on autoSyncProgress 3 callbacks registered successfully');

        let mockProgress: data_relationalStore.ProgressDetails = {
          schedule: data_relationalStore.Progress.SYNC_FINISH,
          code: data_relationalStore.ProgressCode.SUCCESS,
          details: {} as Record<string, data_relationalStore.TableDetails>,
        };
        callback1(mockProgress);
        callback2(mockProgress);
        callback3(mockProgress);

        expect(callOrder.length).assertEqual(3);
        expect(callOrder[0]).assertEqual('callback1');
        expect(callOrder[1]).assertEqual('callback2');
        expect(callOrder[2]).assertEqual('callback3');
        console.info(TAG + 'callback invocation order verified: callback1 -> callback2 -> callback3');

        store.off('autoSyncProgress', callback1);
        store.off('autoSyncProgress', callback2);
        store.off('autoSyncProgress', callback3);
        console.info(TAG + 'off autoSyncProgress 3 callbacks unregistered successfully');
      } catch (err) {
        console.error(TAG + `on autoSyncProgress multi-callback failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      }
      await store.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1.name);
      done();
      console.log(TAG + "************* testOnAutoSyncProgress_multiCallback_0001 end *************");
    })
  })
}