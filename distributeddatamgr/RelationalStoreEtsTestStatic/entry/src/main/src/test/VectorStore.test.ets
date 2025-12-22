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


import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium";
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

let context: common.UIAbilityContext;
let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const TAG = "[RelationalStore_Ets_TEST >>>>>> ]";

let domain: int = 0x0000;
let tag: string = TAG;
const RDB_DB_ICUNAME = "VectorStoreTest.db";
const STORE_CONFIGtest: data_Rdb.StoreConfig = {
  name: RDB_DB_ICUNAME,
  securityLevel: data_Rdb.SecurityLevel.S1,
  tokenizer: data_Rdb.Tokenizer.ICU_TOKENIZER,
  vector: true,
};

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test(id INTEGER PRIMARY KEY,repr floatvector(8));";

const STORE_CONFIG: data_Rdb.StoreConfig = {
  name: RDB_DB_ICUNAME,
  securityLevel: data_Rdb.SecurityLevel.S1,
  tokenizer: data_Rdb.Tokenizer.ICU_TOKENIZER,
  vector: true,
}

let rdbStore: data_Rdb.RdbStore;


export default function VectorStoreTest() {
  describe('VectorStoreTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      // await data_Rdb.getRdbStore(context, STORE_CONFIG);
    });
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');

    });
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      await data_Rdb.deleteRdbStore(context, STORE_CONFIG);
    });
    console.info(TAG + "*************Unit Test Begin*************");
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
      if (res == false) {
        console.info(TAGTEST + "false res =" + res);
        expect(res).assertEqual(false);
        done();
      } else {
        console.info(TAGTEST + "true res111111=" + res);
        expect(res).assertEqual(true);
        done();
      }
      console.info(TAGTEST + " ************* End*************");
    });
    console.info(TAG + " *************Unit Test End*************");
  })
}
