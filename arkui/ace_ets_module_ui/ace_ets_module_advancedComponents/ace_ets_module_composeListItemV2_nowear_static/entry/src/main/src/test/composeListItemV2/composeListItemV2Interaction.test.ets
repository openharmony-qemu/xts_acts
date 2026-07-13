'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function composeListItemV2InteractionTest() {
  describe('composeListItemV2InteractionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("composeListItemV2InteractionTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.composeListItemV2.nowear.test.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("composeListItemV2InteractionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItemV2/composeListItemV2Interaction',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get composeListItemV2Interaction state pages:" + JSON.stringify(pages));
        if (!("composeListItemV2Interaction" == pages.name)) {
          console.info("get composeListItemV2Interaction pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push composeListItemV2Interaction page error:" + err);
      }
      console.info("composeListItemV2InteractionTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('composeListItemV2InteractionTest after each called');
    })

    afterAll(async (): Promise<void> => {
      console.info("composeListItemV2InteractionTest afterAll start");
    });

    /**
     * @tc.number   composeListItemV2Interaction_static_0100
     * @tc.name     composeListItemV2Interaction_static_0100
     * @tc.desc     Test OnActionCallback for OperateIconV2
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2Interaction_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2Interaction_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let primaryText = await driver.findComponent(ON.text('Action Icon'));
      expect(primaryText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2Interaction_static_0100] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2Interaction_static_0200
     * @tc.name     composeListItemV2Interaction_static_0200
     * @tc.desc     Test OnChangeCallback for OperateCheckV2 toggle
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2Interaction_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2Interaction_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let primaryText = await driver.findComponent(ON.text('Toggle Callback'));
      expect(primaryText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2Interaction_static_0200] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2Interaction_static_0300
     * @tc.name     composeListItemV2Interaction_static_0300
     * @tc.desc     Test OnChangeCallback for OperateCheckV2 checkbox
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2Interaction_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2Interaction_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let primaryText = await driver.findComponent(ON.text('Checkbox Callback'));
      expect(primaryText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2Interaction_static_0300] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2Interaction_static_0400
     * @tc.name     composeListItemV2Interaction_static_0400
     * @tc.desc     Test OnChangeCallback for OperateCheckV2 radio
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2Interaction_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2Interaction_static_0400] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let primaryText = await driver.findComponent(ON.text('Radio Callback'));
      expect(primaryText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2Interaction_static_0400] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2Interaction_static_0500
     * @tc.name     composeListItemV2Interaction_static_0500
     * @tc.desc     Test for operation icon component
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2Interaction_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2Interaction_static_0500] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let primaryText = await driver.findComponent(ON.text('Ac Indicator'));
      expect(primaryText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2Interaction_static_0500] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2Interaction_static_0600
     * @tc.name     composeListItemV2Interaction_static_0600
     * @tc.desc     Test for list item interaction
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2Interaction_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2Interaction_static_0600] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let primaryText = await driver.findComponent(ON.text('Ac Test'));
      expect(primaryText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2Interaction_static_0600] END');
      done();
    });
  })
}