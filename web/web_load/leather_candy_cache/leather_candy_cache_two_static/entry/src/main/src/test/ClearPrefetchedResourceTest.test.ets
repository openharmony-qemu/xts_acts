'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;


export default function ClearPrefetchedResourceTest() : void {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError | null, data: undefined): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      let cmd = "aa start -a EntryAbility -b com.open.harmony.leathercandycachetwotest.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("componentLifeCycleTestOne beforeEach start");
    })

    /**
     * @tc.name   testClearPrefetchedResourceStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_STATIC_0100
     * @tc.desc   test clearPrefetchedResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearPrefetchedResourceStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testClearPrefetchedResource001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPrefetchResource001", 17100002, 10110, done);
        await Utils.msSleep(2000);
        Utils.registerEvent("testClearPrefetchedResource001", true, 10112, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testClearPrefetchedResourceStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_STATIC_0200
     * @tc.desc   testClearPrefetchedResourceStatic002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearPrefetchedResourceStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitonSwitchNextPage", 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testPrefetchResourceEmptyStatic001
     * @tc.number SUB_WEB_PREFETCHRESOURCE_EMPTY_0100
     * @tc.desc   test prefetchResource with empty strings and empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrefetchResourceEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(2000);
        Utils.emitEvent("testPrefetchResourceEmptyStatic001", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testPrefetchResourceEmptyStatic001", 401, 41023101, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
        } catch (error) {
          console.info(JSON.stringify(error));
          done();
        }
      })

    /**
     * @tc.name   testPrefetchResourceNullStatic001
     * @tc.number SUB_WEB_PREFETCHRESOURCE_NULL_0100
     * @tc.desc   test prefetchResource with null params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrefetchResourceNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(2000);
        Utils.emitEvent("testPrefetchResourceNullStatic001", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testPrefetchResourceNullStatic001", 401, 41023102, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
        } catch (error) {
          console.info(JSON.stringify(error));
          done();
        }
      })

    /**
     * @tc.name   testPrefetchResourceUndefinedStatic001
     * @tc.number SUB_WEB_PREFETCHRESOURCE_UNDEFINED_0100
     * @tc.desc   test prefetchResource with undefined params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrefetchResourceUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(2000);
        Utils.emitEvent("testPrefetchResourceUndefinedStatic001", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testPrefetchResourceUndefinedStatic001", 401, 41023103, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
        } catch (error) {
          console.info(JSON.stringify(error));
          done();
        }
      })
  })
}
