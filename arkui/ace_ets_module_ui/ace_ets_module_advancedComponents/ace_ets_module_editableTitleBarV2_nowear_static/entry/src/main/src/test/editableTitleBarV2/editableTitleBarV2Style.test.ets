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

export default function editableTitleBarV2StyleTest() {
  describe('editableTitleBarV2Style', () => {
    beforeAll(async (): Promise<void> => {
      console.info("editableTitleBarV2Style beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.editableTitleBarV2.nowear.test.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("editableTitleBarV2Style beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/editableTitleBarV2/editableTitleBarV2Style',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get editableTitleBarV2Style state pages:" + JSON.stringify(pages));
        if (!("editableTitleBarV2Style" == pages.name)) {
          console.info("get editableTitleBarV2Style pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push editableTitleBarV2Style page error:" + err);
      }
      console.info("editableTitleBarV2Style beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('editableTitleBarV2Style afterEach called');
    });

    afterAll(async (): Promise<void> => {
      console.info('editableTitleBarV2Style afterAll called');
    });

    /**
     * @tc.number   editableTitleBarV2Style_static_0100
     * @tc.name     editableTitleBarV2Style_static_0100
     * @tc.desc     Test background color property
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Style_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Style_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let titleBar = await driver.findComponent(ON.text('Background Color'));
      expect(titleBar !== null).assertTrue();
      console.info('[editableTitleBarV2Style_static_0100] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Style_static_0200
     * @tc.name     editableTitleBarV2Style_static_0200
     * @tc.desc     Test background blur style property
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Style_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Style_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let titleBarBlur = await driver.findComponent(ON.text('Blur Style'));
      expect(titleBarBlur !== null).assertTrue();
      console.info('[editableTitleBarV2Style_static_0200] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Style_static_0300
     * @tc.name     editableTitleBarV2Style_static_0300
     * @tc.desc     Test safe area types property
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Style_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Style_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let titleBarSafeArea = await driver.findComponent(ON.text('Safe Area'));
      expect(titleBarSafeArea !== null).assertTrue();
      console.info('[editableTitleBarV2Style_static_0300] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Style_static_0400
     * @tc.name     editableTitleBarV2Style_static_0400
     * @tc.desc     Test content margin property
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Style_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Style_static_0400] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let titleBarMargin = await driver.findComponent(ON.text('Content Margin'));
      expect(titleBarMargin !== null).assertTrue();
      console.info('[editableTitleBarV2Style_static_0400] END');
      done();
    });

    /**
     * @tc.number   editableTitleBarV2Style_static_0500
     * @tc.name     editableTitleBarV2Style_static_0500
     * @tc.desc     Test combined style options
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('editableTitleBarV2Style_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[editableTitleBarV2Style_static_0500] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let titleBarCombined = await driver.findComponent(ON.text('Combined Style'));
      expect(titleBarCombined !== null).assertTrue();
      console.info('[editableTitleBarV2Style_static_0500] END');
      done();
    });
  });
}