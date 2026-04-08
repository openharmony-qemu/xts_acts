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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;


export default function ClearPrefetchedResourceTest() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("componentLifeCycleTestOne beforeEach start");
    })

    /**
     * @tc.name   testClearPrefetchedResourceStatic0101
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_STATIC_0101
     * @tc.desc   test clearPrefetchedResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearPrefetchedResourceStatic0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testClearPrefetchedResourceStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_STATIC_0300
     * @tc.desc   test clearPrefetchedResource ErrorCode 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearPrefetchedResourceStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testClearPrefetchedResource003", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testClearPrefetchedResource003", true, 148310, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testPrefetchedResourceErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARPREFETCHEDRESOURCES_STATIC_0100
     * @tc.desc   test clearPrefetchedResource ErrorCode 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrefetchedResourceErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testPrefetchResourceErrorCode001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPrefetchResourceErrorCode001", 17100002, 10510, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testClearPrefetchedResourceStatic002
     * @tc.number testClearPrefetchedResourceStatic002
     * @tc.desc   testClearPrefetchedResourceStatic002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearPrefetchedResourceStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitonSwitchNextPage", 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('clearPrefetchedResourceTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}
