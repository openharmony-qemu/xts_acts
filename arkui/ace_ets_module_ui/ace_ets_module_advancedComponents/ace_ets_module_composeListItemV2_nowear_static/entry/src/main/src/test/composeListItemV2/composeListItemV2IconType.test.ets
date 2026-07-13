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

export default function composeListItemV2IconTypeTest() {
  describe('composeListItemV2IconTypeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("composeListItemV2IconTypeTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.composeListItemV2.nowear.test.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("composeListItemV2IconTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItemV2/composeListItemV2IconType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get composeListItemV2IconType state pages:" + JSON.stringify(pages));
        if (!("composeListItemV2IconType" == pages.name)) {
          console.info("get composeListItemV2IconType pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push composeListItemV2IconType page error:" + err);
      }
      console.info("composeListItemV2IconTypeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('composeListItemV2IconTypeTest after each called');
    })

    afterAll(async (): Promise<void> => {
      console.info("composeListItemV2IconTypeTest afterAll start");
    });

    /**
     * @tc.number   composeListItemV2IconType_static_0100
     * @tc.name     composeListItemV2IconType_static_0100
     * @tc.desc     Test ContentItemV2 with IconTypeV2.BADGE
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2IconType_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2IconType_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let badgeText = await driver.findComponent(ON.text('Badge Icon'));
      expect(badgeText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2IconType_static_0100] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2IconType_static_0200
     * @tc.name     composeListItemV2IconType_static_0200
     * @tc.desc     Test ContentItemV2 with IconTypeV2.NORMAL_ICON
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2IconType_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2IconType_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let normalText = await driver.findComponent(ON.text('Normal Icon'));
      expect(normalText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2IconType_static_0200] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2IconType_static_0300
     * @tc.name     composeListItemV2IconType_static_0300
     * @tc.desc     Test ContentItemV2 with IconTypeV2.SYSTEM_ICON
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2IconType_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2IconType_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let systemText = await driver.findComponent(ON.text('System Icon'));
      expect(systemText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2IconType_static_0300] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2IconType_static_0400
     * @tc.name     composeListItemV2IconType_static_0400
     * @tc.desc     Test ContentItemV2 with IconTypeV2.HEAD_SCULPTURE
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2IconType_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2IconType_static_0400] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let headText = await driver.findComponent(ON.text('Head Sculpture'));
      expect(headText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2IconType_static_0400] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2IconType_static_0500
     * @tc.name     composeListItemV2IconType_static_0500
     * @tc.desc     Test ContentItemV2 with IconTypeV2.APP_ICON
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2IconType_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2IconType_static_0500] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let appText = await driver.findComponent(ON.text('App Icon'));
      expect(appText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2IconType_static_0500] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2IconType_static_0600
     * @tc.name     composeListItemV2IconType_static_0600
     * @tc.desc     Test ContentItemV2 with IconTypeV2.PREVIEW
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2IconType_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2IconType_static_0600] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let previewText = await driver.findComponent(ON.text('Preview Icon'));
      expect(previewText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2IconType_static_0600] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2IconType_static_0700
     * @tc.name     composeListItemV2IconType_static_0700
     * @tc.desc     Test ContentItemV2 with IconTypeV2.LONGITUDINAL
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2IconType_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2IconType_static_0700] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let longitudinalText = await driver.findComponent(ON.text('Longitudinal Icon'));
      expect(longitudinalText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2IconType_static_0700] END');
      done();
    });

    /**
     * @tc.number   composeListItemV2IconType_static_0800
     * @tc.name     composeListItemV2IconType_static_0800
     * @tc.desc     Test ContentItemV2 with IconTypeV2.VERTICAL
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('composeListItemV2IconType_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[composeListItemV2IconType_static_0800] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      let verticalText = await driver.findComponent(ON.text('Vertical Icon'));
      expect(verticalText !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[composeListItemV2IconType_static_0800] END');
      done();
    });
  })
}