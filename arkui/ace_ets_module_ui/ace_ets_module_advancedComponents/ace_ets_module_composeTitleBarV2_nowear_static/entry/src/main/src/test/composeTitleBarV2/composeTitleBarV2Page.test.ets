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

export default function composeTitleBarV2PageTest() {
  describe('composeTitleBarV2Page', () => {

    beforeAll(async (): Promise<void> => {
      console.info("composeTitleBarV2Page beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.composeTitleBarV2.nowear.test.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("composeTitleBarV2Page beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeTitleBarV2/composeTitleBarV2Page',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get composeTitleBarV2Page state pages:" + JSON.stringify(pages));
        if (!("composeTitleBarV2Page" == pages.name)) {
          console.info("get composeTitleBarV2Page pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("composeTitleBarV2Page beforeEach error:" + JSON.stringify(err));
      }
      console.info("composeTitleBarV2Page beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('composeTitleBarV2Page afterEach called');
    });

    afterAll(async (): Promise<void> => {
      console.info('composeTitleBarV2Page afterAll called');
    });

    /**
     * @tc.number   composeTitleBarV2_static_0100
     * @tc.name     composeTitleBarV2_static_0100
     * @tc.desc     Verify basic title and subtitle display
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeTitleBarV2_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeTitleBarV2_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('标题测试'));
      let subtitle = await driver.findComponent(ON.text('副标题测试'));
      expect(title !== null).assertTrue();
      expect(subtitle !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeTitleBarV2_static_0100] END');
      done();
    });

    /**
     * @tc.number   composeTitleBarV2_static_0200
     * @tc.name     composeTitleBarV2_static_0200
     * @tc.desc     Verify basic title and subtitle display
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeTitleBarV2_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeTitleBarV2_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('标题Title'));
      let subtitle = await driver.findComponent(ON.text('副标题subtitle'));
      expect(title !== null).assertTrue();
      expect(subtitle !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeTitleBarV2_static_0200] END');
      done();
    });

  });
}