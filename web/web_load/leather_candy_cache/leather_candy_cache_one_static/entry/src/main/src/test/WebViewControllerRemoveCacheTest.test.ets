'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach, expect } from '../../../hypium/index';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';

let testAbilityContext: common.UIAbilityContext;

export default function webViewControllerRemoveCacheTest() {

  describe('WebViewControllerRemoveCacheTest', () => {

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
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      let cmd = "aa start -a EntryAbility -b com.open.harmony.leathercandycacheonetest.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(3000)
      console.log("beforeAll end,%s", "Succeed!")
    });


    /**
     * @tc.name   testRemoveCacheNullStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REMOVECACHE_NULL_0100
     * @tc.desc   test removeCache with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveCacheNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent("testRemoveCacheNullStatic001", 10)
          await Utils.msSleep(2000);
          Utils.registerBaseEvent("testRemoveCacheNullStatic001", '401', 41022501, done,
          (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
          });
          await Utils.msSleep(2000);
          inspector.sendEventByKey('WebViewControllerRemoveCacheTestButton', 10, '');
          await Utils.msSleep(4000);
          done();
      
        } catch (err) {
          console.info('[testRemoveCacheNullStatic001] err:' + JSON.stringify(err));
          done();

          }
      })

    /**
     * @tc.name   testRemoveCacheUndefinedStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REMOVECACHE_UNDEFINED_0100
     * @tc.desc   test removeCache with undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveCacheUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent("testRemoveCacheUndefinedStatic001", 10)
          await Utils.msSleep(2000);
          Utils.registerBaseEvent("testRemoveCacheUndefinedStatic001", 'success', 41022502, done,
          (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
          });
          await Utils.msSleep(2000);
          inspector.sendEventByKey('WebViewControllerRemoveCacheTestButton', 10, '');
          await Utils.msSleep(4000);
          done();
      
        } catch (err) {
          console.info('[testRemoveCacheUndefinedStatic001] err:' + JSON.stringify(err));
          done();

          }
      })

    /**
     * @tc.name   testRemoveCacheStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REMOVECACHE_0200
     * @tc.desc   test removeCache false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveCacheStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent("testRemoveCache002", 10)
        await Utils.msSleep(3000);
        Utils.registerBaseEvent("testRemoveCache002", true, 77202, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerRemoveCacheTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testRemoveCacheStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REMOVECACHE_0300
     * @tc.desc   test removeCache false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveCacheStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent("testRemoveCache003", 10)
        await Utils.msSleep(3000);
        Utils.registerBaseEvent("testRemoveCache003", 17100001, 20260331, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerRemoveCacheTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

  })
}
