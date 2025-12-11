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


import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import relationalStore from '@ohos.data.relationalStore';
import data_Rdb from '@ohos.data.relationalStore';
// import { ValuesBucket } from '@kit.ArkData';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let context:common.UIAbilityContext;
let delegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const TAG = "[RelationalStore_Ets_TEST >>>>>> ]";

let domain: int  = 0x0000;
let tag: string = TAG;
const RDB_DB_ICUNAME = "VectorStoreTest.db";
const STORE_CONFIGtest: data_Rdb.StoreConfig = {
  name: RDB_DB_ICUNAME
};

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test(id INTEGER PRIMARY KEY,repr floatvector(8));";

const STORE_CONFIG: data_Rdb.StoreConfig = {
  name: RDB_DB_ICUNAME,
  securityLevel: data_Rdb.SecurityLevel.S1,
  tokenizer: data_Rdb.Tokenizer.ICU_TOKENIZER,
  vector: true,
}

let rdbStore:data_Rdb.RdbStore;


export default function VectorStoreTest() {
  describe('VectorStoreTest', ():void => {
    beforeAll(async () : Promise<void>  => {
      console.info(TAG + 'beforeAll');
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    });
    beforeEach(async () : Promise<void>  => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () : Promise<void>  => {
      console.info(TAG + 'afterEach');

    });
    afterAll(async () : Promise<void>  => {
      console.info(TAG + 'afterAll');
      data_Rdb.deleteRdbStore(context, STORE_CONFIG);
    });
    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   VectorStoreTest0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0200
     * @tc.desc   VectorEtsAPITest isVectorSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VectorStoreTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> =>  {
      let TAGTEST = TAG + " VectorStoreTest0200 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err:BusinessError){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(err.code == 801).assertTrue();
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          let observer1 = (sqlExecutionInfo : data_Rdb.SqlExecutionInfo) => {
            console.log(TAG + "observer1")
            done()
          };
          try{
            rdbStore.on('perfStat',observer1);
            expect().assertFail()
            done()
          }catch(err:BusinessError){
            console.info(TAGTEST + "fail" + err.code + err.message);
            expect(err.code == 801).assertTrue();
            done()
          }
          console.log(TAG + "************* VectorStoreTest0200 end *************");
        } catch(err:BusinessError){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    /**
     * @tc.name   VectorStoreTest0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0300
     * @tc.desc   VectorEtsAPITest isVectorSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VectorStoreTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> =>  {
      let TAGTEST = TAG + " VectorStoreTest0300 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err:BusinessError){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(err.code == 801).assertTrue();
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          let observer1 = (sqlExecutionInfo : data_Rdb.SqlExecutionInfo) => {
            console.log(TAG + "observer1")
            done()
          };
          try{
            rdbStore.off('perfStat',observer1);
            expect().assertFail()
            done()
          }catch(err:BusinessError){
            console.info(TAGTEST + "fail" + err.code + err.message);
            expect(err.code == 801).assertTrue();
            done()
          }
          console.log(TAG + "************* VectorStoreTest0300 end *************");
        } catch(err:BusinessError){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    /**
     * @tc.name   VectorStoreTest0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0400
     * @tc.desc   VectorEtsAPITest isVectorSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VectorStoreTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> =>  {
      let TAGTEST = TAG + " VectorStoreTest0400 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err:BusinessError){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(err.code == 801).assertTrue();
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          try {
            let exceptionMessage: data_Rdb.ExceptionMessage;
            rdbStore.on('sqliteErrorOccurred', exceptionMessage => {
              console.log(TAG + `error log is ${exceptionMessage.code}`)
              expect().assertFail();
              done();
            });
          } catch (err:BusinessError) {
            console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
            expect(err.code == 801).assertTrue();
            done();
          }
          console.log(TAG + "************* VectorStoreTest0400 end *************");
        } catch(err:BusinessError){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    /**
     * @tc.name   VectorStoreTest0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0500
     * @tc.desc   VectorEtsAPITest isVectorSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VectorStoreTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> =>  {
      let TAGTEST = TAG + " VectorStoreTest0500 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
          expect().assertFail();
          done()
        } catch(err:BusinessError){
          console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
          expect(err.code == 801).assertTrue();
          done()
        }

      } else {
        console.info(TAGTEST + "true res111111=" + res);
        try {
          rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
          console.info(TAGTEST + "success getRdbStore111111. rdbStore=" + rdbStore);
          expect(rdbStore != null).assertTrue();
          try {
            let exceptionMessage: data_Rdb.ExceptionMessage;
            rdbStore.off('sqliteErrorOccurred', exceptionMessage => {
              console.log(TAG + `error log is ${exceptionMessage.code}`)
              expect().assertFail();
              done();
            });
          } catch (err:BusinessError) {
            expect(err.code == 801).assertTrue();
            console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
            done();
          }
          console.log(TAG + "************* VectorStoreTest0500 end *************");
        } catch(err:BusinessError){
          console.info(TAGTEST + "fail getRdbStore111, code=" + err.code + err.message);
          expect().assertFail();
          done();
        }
      }
      console.info(TAGTEST + " ************* End*************");
    });
    /**
     * @tc.name   VectorStoreTest0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0600
     * @tc.desc   isVectorSupported test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VectorStoreTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> =>  {
      let TAGTEST = TAG + " VectorStoreTest0600 ";
      const res = data_Rdb.isVectorSupported();
      console.info(TAGTEST + "res=" + res);
      try{
        if (res == false) {
          console.info(TAGTEST + "false res =" + res);
          expect(res).assertEqual(false);
          done();
        } else {
          console.info(TAGTEST + "true res111111=" + res);
          expect(res).assertEqual(true);
          done();
        }
      }catch(err:BusinessError){
        console.info(TAGTEST + "err.code" + err.code);
        expect().assertFail();
        done();
      }
      console.info(TAGTEST + " ************* End*************");
    });
    console.info(TAG + " *************Unit Test End*************");
  })
}
