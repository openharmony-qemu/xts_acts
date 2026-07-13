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


import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function InjectOfflineResourcesTest() : void{

  describe('injectOfflineResourcesTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(500);
      console.info("injectOfflineResourcesTest beforeEach start");
    })

    /**
     * @tc.name   testInjectOfflineResourcesStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_STATIC_0100
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInjectOfflineResourcesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testInjectOfflineResources001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testInjectOfflineResources001", true, 20001, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
      })
    /**
     * @tc.name   testInjectOfflineResourcesStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_STATIC_0200
     * @tc.desc   test injectOfflineResources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInjectOfflineResourcesStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testInjectOfflineResources002", 10)
        await Utils.msSleep(500);
        Utils.registerEvent("testInjectOfflineResources002", 401, 20002, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testOfflineResourceTypeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_OFFLINERESOURCETYPE_STATIC_0100
     * @tc.desc   test OfflineResourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOfflineResourceTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testOfflineResourceType001", 10)
        await Utils.msSleep(500);
        Utils.registerEvent("testMODULE_JS", "int 3", 20003, done);
        Utils.registerEvent("testCLASSIC_JS", "int 2", 20004, done);
        Utils.registerEvent("testCSS", "int 1", 20005, done);
        Utils.registerEvent("testIMAGE", "int 0", 20006, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
      })

    /**
     * @tc.name   SwitchNextPage
     * @tc.number SUB_WEB_SwitchNextPage_STATIC_0100
     * @tc.desc   SwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitonSwitchNextPage", 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}