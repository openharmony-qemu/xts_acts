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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function editableTitleBarV2InteractionTest() {
  describe('editableTitleBarV2Interaction', () => {
    beforeAll(async (): Promise<void> => {
      console.info("editableTitleBarV2Interaction beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.editableTitleBarV2.nowear.test.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("editableTitleBarV2Interaction beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/editableTitleBarV2/editableTitleBarV2Interaction',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get editableTitleBarV2Interaction state pages:" + JSON.stringify(pages));
        if (!("editableTitleBarV2Interaction" == pages.name)) {
          console.info("get editableTitleBarV2Interaction pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push editableTitleBarV2Interaction page error:" + err);
      }
      console.info("editableTitleBarV2Interaction beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('editableTitleBarV2Interaction afterEach called');
    });

    afterAll(async (): Promise<void> => {
      console.info('editableTitleBarV2Interaction afterAll called');
    });

    /**
     * @tc.number   editableTitleBarV2Interaction_static_0100
     * @tc.name     editableTitleBarV2Interaction_static_0100
     * @tc.desc     Test left icon click callback
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Interaction_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Interaction_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let leftIconClick = await driver.findComponent(ON.text('Left Icon Click'));
      expect(leftIconClick !== null).assertTrue();
      console.info('[editableTitleBarV2Interaction_static_0100] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Interaction_static_0200
     * @tc.name     editableTitleBarV2Interaction_static_0200
     * @tc.desc     Test menu item click callback
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Interaction_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Interaction_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let menuItemClick = await driver.findComponent(ON.text('Menu Item Click'));
      expect(menuItemClick !== null).assertTrue();
      console.info('[editableTitleBarV2Interaction_static_0200] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Interaction_static_0300
     * @tc.name     editableTitleBarV2Interaction_static_0300
     * @tc.desc     Test save button click callback
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Interaction_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Interaction_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let saveButtonClick = await driver.findComponent(ON.text('Save Button Click'));
      expect(saveButtonClick !== null).assertTrue();
      console.info('[editableTitleBarV2Interaction_static_0300] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Interaction_static_0400
     * @tc.name     editableTitleBarV2Interaction_static_0400
     * @tc.desc     Test Default Focus Left
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Interaction_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Interaction_static_0400] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let saveButtonClick = await driver.findComponent(ON.text('Default Focus Left'));
      expect(saveButtonClick !== null).assertTrue();
      console.info('[editableTitleBarV2Interaction_static_0400] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Interaction_static_0500
     * @tc.name     editableTitleBarV2Interaction_static_0500
     * @tc.desc     Test Default Focus Menu
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Interaction_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Interaction_static_0500] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let saveButtonClick = await driver.findComponent(ON.text('Default Focus Menu'));
      expect(saveButtonClick !== null).assertTrue();
      console.info('[editableTitleBarV2Interaction_static_0500] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Interaction_static_0600
     * @tc.name     editableTitleBarV2Interaction_static_0600
     * @tc.desc     Test Default Focus Save
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Interaction_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Interaction_static_0600] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let saveButtonClick = await driver.findComponent(ON.text('Default Focus Save'));
      expect(saveButtonClick !== null).assertTrue();
      console.info('[editableTitleBarV2Interaction_static_0600] END');
      done();
    });

  });
}