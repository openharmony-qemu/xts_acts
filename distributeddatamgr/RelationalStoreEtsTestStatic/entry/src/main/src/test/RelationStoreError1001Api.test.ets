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
  } from "../../../hypium/index";
  import hilog from '@ohos.hilog'
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  import { BusinessError } from '@ohos.base';
  import UIAbility from '@ohos.app.ability.UIAbility';
  import Utils from './Util.test';
  import { AppStorage } from '@ohos.arkui.stateManagement';
  import common from '@ohos.app.ability.common';
  import relationalStore from '@ohos.data.relationalStore';
  
  let domain: int = 0x0000;
  let tag: string = 'testTag';
  let context: common.UIAbilityContext;
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  
  let rdbStore: relationalStore.RdbStore;
  
  let STORE_CONFIG1: relationalStore.StoreConfig = {
    name: "test1001.db",
    securityLevel: relationalStore.SecurityLevel.S1,
  }
  
  let STORE_CONFIG2: relationalStore.StoreConfig = {
    name: "test1002.db",
    securityLevel: relationalStore.SecurityLevel.S1,
    dataGroupId: "invalidDataGroupId",
  }
  
  export default function RelationStoreError1001Test() {
    describe('RelationStoreError1001Test', (): void => {
      beforeAll(async () => {
        hilog.info(domain, tag, '%{public}s', 'beforeAll');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
        await Utils.msSleep(2000)
        context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      })
  
      beforeEach(async () => {
        hilog.info(domain, tag, '%{public}s', 'beforeEach');
      })
  
      afterEach(async () => {
        hilog.info(domain, tag, '%{public}s', 'afterEach');
      })
  
      afterAll(async () => {
        hilog.info(domain, tag, '%{public}s', 'afterAll');
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
      })
  
      /**
       * @tc.number ErrCode1001
       * @tc.name ErrCode1001
       * @tc.desc ErrCode1001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 3
       */
      it('ErrCode1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: () => void): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'ErrCode1001 start');
          try {
            rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
          } catch (err) {
            err = err as BusinessError;
            hilog.info(domain, tag, '%{public}s', 'getRdbStore errCode: ' + err.code);
            expect(err.code).assertEqual(14801001);
          }
          try {
            await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
          } catch (err) {
            err = err as BusinessError;
            hilog.info(domain, tag, '%{public}s', 'deleteRdbStore errCode: ' + err.code);
            expect(err.code).assertEqual(14801001);
          }
          done();
          hilog.info(domain, tag, '%{public}s', 'ErrCode1001 end');
        })
  
      /**
       * @tc.number ErrCode1002
       * @tc.name ErrCode1002
       * @tc.desc ErrCode1002
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 3
       */
      it('ErrCode1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: () => void): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', 'ErrCode1002 start');
          try {
            rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG2);
          } catch (err) {
            err = err as BusinessError;
            hilog.info(domain, tag, '%{public}s', 'getRdbStore errCode: ' + err.code);
            expect(err.code).assertEqual(14801002);
          }
          try {
            await relationalStore.deleteRdbStore(context, STORE_CONFIG2);
          } catch (err) {
            err = err as BusinessError;
            hilog.info(domain, tag, '%{public}s', 'deleteRdbStore errCode: ' + err.code);
            expect(err.code).assertEqual(14801002);
          }
          done();
          hilog.info(domain, tag, '%{public}s', 'ErrCode1002 end');
        })
    })
  }