'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let domain: int = 0x0000;
let tag: string = "RdbSetDistributedTableTypeParamErr";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "RdbSetDistributedTableTypeParamErr.db",
  securityLevel: relationalStore.SecurityLevel.S1
}

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " +
  "age INTEGER, " +
  "salary REAL)";

const CREATE_TABLE_CLOUD_TEXT = "CREATE TABLE IF NOT EXISTS cloud_text (" +
  "data TEXT, " +
  "recycled BOOLEAN, " +
  "recycledTime INTEGER, " +
  "num TEXT PRIMARY KEY)";

const CREATE_TABLE_CLOUD_INTEGER = "CREATE TABLE IF NOT EXISTS cloud_integer (" +
  "data TEXT, " +
  "recycled BOOLEAN, " +
  "recycledTime INTEGER, " +
  "num INTEGER PRIMARY KEY)";

let rdbStore: relationalStore.RdbStore | undefined;

export default function RdbSetDistributedTableTypeParamErrTest():void {
  describe('RdbSetDistributedTableTypeParamErrTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll');
      let cmd = "aa start -a EntryAbility -b com.example.relationalstore";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    });
    beforeEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      hilog.info(domain, tag, "create rdb store success");
    });
    afterEach(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterEach');
      await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      hilog.info(domain, tag, 'afterEach success');
    });
    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterAll');
    });
    console.info(tag + "*************Unit Test Begin*************");
    /**
     * @tc.name   testOffParamErr001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSetDistributedTableTypeParamErr_0010
     * @tc.desc   off(event: string, interProcess: boolean, observer?: Callback<void>) with empty string event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testOffParamErr001 start *************");
        if (rdbStore == undefined) {
          hilog.error(domain, tag, '%{public}s', `testOffParamErr001 rdbStore is undefined`);
          expect().assertFail();
        } else {
          let storeObserver = () => {
            hilog.info(domain, tag, '%{public}s', `storeObserver callback`);
          };
          try {
            rdbStore!.off('', false, storeObserver);
            hilog.info(domain, tag, '%{public}s', `testOffParamErr001 off with empty string event succeeded unexpectedly`);
            expect().assertFail();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', `testOffParamErr001 off err: ${err.code} ${err.message}`);
            expect(401).assertEqual(err.code);
          }
        }
        hilog.info(domain, tag, "************* testOffParamErr001 end *************");
        done();
      })
    /**
     * @tc.name   testUTCTimeTypeCall001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSetDistributedTableTypeParamErr_0020
     * @tc.desc   UTCTime type alias call coverage: assign Date, verify type and methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUTCTimeTypeCall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testUTCTimeTypeCall001 start *************");
        try {
          let utcTime: relationalStore.UTCTime = new Date(2025, 5, 15, 10, 30, 45);
          hilog.info(domain, tag, '%{public}s', `utcTime: ${utcTime.toString()}`);
          expect(utcTime instanceof Date).assertTrue();
          expect(utcTime.getFullYear()).assertEqual(2025);
          expect(utcTime.getMonth()).assertEqual(5);
          expect(utcTime.getDate()).assertEqual(15);
          expect(utcTime.getHours()).assertEqual(10);
          expect(utcTime.getMinutes()).assertEqual(30);
          expect(utcTime.getSeconds()).assertEqual(45);
          expect(utcTime.getTime()).assertEqual(new Date(2025, 5, 15, 10, 30, 45).getTime());
          let isoStr: string = utcTime.toISOString();
          expect(isoStr.length > 0).assertTrue();
          hilog.info(domain, tag, '%{public}s', `UTCTime toISOString: ${isoStr}`);
        } catch (err) {
          let e = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `testUTCTimeTypeCall001 err: ${e.code} ${e.message}`);
          expect().assertFail();
        }
        hilog.info(domain, tag, "************* testUTCTimeTypeCall001 end *************");
        done();
      })
    /**
     * @tc.name   testStoreConfigNameParamErr001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSetDistributedTableTypeParamErr_0040
     * @tc.desc   StoreConfig constructor(name: string) with name containing path separator '/', expect error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreConfigNameParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testStoreConfigNameParamErr001 start *************");
        try {
          const storeConfig: relationalStore.StoreConfig = {
            name: "test/invalid.db",
            securityLevel: relationalStore.SecurityLevel.S1
          };
          await relationalStore.getRdbStore(context!, storeConfig);
          hilog.info(domain, tag, '%{public}s', `testStoreConfigNameParamErr001 getRdbStore with path separator name succeeded unexpectedly`);
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `testStoreConfigNameParamErr001 err: ${e.code} ${e.message}`);
          expect(401).assertEqual(e.code);
        }
        hilog.info(domain, tag, "************* testStoreConfigNameParamErr001 end *************");
        done();
      })
    /**
     * @tc.name   testStoreConfigNameParamErr002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSetDistributedTableTypeParamErr_0050
     * @tc.desc   StoreConfig constructor(name: string) with name being only '/', expect error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreConfigNameParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testStoreConfigNameParamErr002 start *************");
        try {
          const storeConfig: relationalStore.StoreConfig = {
            name: "/",
            securityLevel: relationalStore.SecurityLevel.S1
          };
          await relationalStore.getRdbStore(context!, storeConfig);
          hilog.info(domain, tag, '%{public}s', `testStoreConfigNameParamErr002 getRdbStore with '/' name succeeded unexpectedly`);
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `testStoreConfigNameParamErr002 err: ${e.code} ${e.message}`);
          expect(401).assertEqual(e.code);
        }
        hilog.info(domain, tag, "************* testStoreConfigNameParamErr002 end *************");
        done();
      })
    /**
     * @tc.name   testOffParamErr002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSetDistributedTableTypeParamErr_0070
     * @tc.desc   off(event: string, interProcess: boolean, observer?: Callback<void>) with invalid event string and interProcess=true without observer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testOffParamErr002 start *************");
        if (rdbStore == undefined) {
          hilog.error(domain, tag, '%{public}s', `testOffParamErr002 rdbStore is undefined`);
          expect().assertFail();
        } else {
          try {
            rdbStore!.off('', true);
            hilog.info(domain, tag, '%{public}s', `testOffParamErr002 off with invalid event and interProcess=true completed without error`);
            expect().assertFail();
          } catch (err) {
            let e = err as BusinessError;
            hilog.info(domain, tag, '%{public}s', `testOffParamErr002 off err: ${e.code} ${e.message}`);
            expect(401).assertEqual(e.code);
          }
        }
        hilog.info(domain, tag, "************* testOffParamErr002 end *************");
        done();
      })

    /**
     * @tc.name   testEmitMultiCallback001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RdbSetDistributedTableTypeParamErr_0080
     * @tc.desc   emit(event: string) triggers all registered observers in subscription order, verifying callback1 -> callback2 -> callback3 invocation sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmitMultiCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "************* testEmitMultiCallback001 start *************");
        if (rdbStore == undefined) {
          hilog.error(domain, tag, '%{public}s', `testEmitMultiCallback001 rdbStore is undefined`);
          expect().assertFail();
          done();
        } else {
          let callOrder: number[] = [];
          let observer1 = () => {
            hilog.info(domain, tag, '%{public}s', `testEmitMultiCallback001 observer1 invoked`);
            callOrder.push(1);
          };
          let observer2 = () => {
            hilog.info(domain, tag, '%{public}s', `testEmitMultiCallback001 observer2 invoked`);
            callOrder.push(2);
          };
          let observer3 = () => {
            hilog.info(domain, tag, '%{public}s', `testEmitMultiCallback001 observer3 invoked`);
            callOrder.push(3);
          };
          try {
            rdbStore!.on('dataChange', false, observer1);
            rdbStore!.on('dataChange', false, observer2);
            rdbStore!.on('dataChange', false, observer3);
            rdbStore!.emit('dataChange');
            await Utils.msSleep(500);
            expect(callOrder.length).assertEqual(3);
            expect(callOrder[0]).assertEqual(1);
            expect(callOrder[1]).assertEqual(2);
            expect(callOrder[2]).assertEqual(3);
            hilog.info(domain, tag, '%{public}s', `testEmitMultiCallback001 all observers invoked in order: ${callOrder.toString()}`);
          } catch (err) {
            let e = err as BusinessError;
            hilog.info(domain, tag, '%{public}s', `testEmitMultiCallback001 err: ${e.code} ${e.message}`);
            expect().assertFail();
          } finally {
            rdbStore!.off('dataChange', false, observer1);
            rdbStore!.off('dataChange', false, observer2);
            rdbStore!.off('dataChange', false, observer3);
          }
        }
        hilog.info(domain, tag, "************* testEmitMultiCallback001 end *************");
        done();
      })

  })
}