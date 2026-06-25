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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { LevelMode } from '@kit.ArkUI';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function PopupLevelModeTest() {
  describe('PopupLevelModeTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupLevelMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PopupLevelModeTest state success ' + JSON.stringify(pages));
        if (!('PopupLevelMode' == pages.name)) {
          console.info('get PopupLevelModeTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push PopupLevelModeTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PopupLevelModeTest page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PopupLevelModeTest after each called');
    });

    /**
     * @tc.name   PopupLevelModeTest_0100
     * @tc.number SUB_ACE_PopupLevelModeTest_0100
     * @tc.desc   Test LevelMode.OVERLAY enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupLevelModeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupLevelModeTest_0100 START');
      expect(LevelMode.OVERLAY).assertEqual(0);
      console.info('PopupLevelModeTest_0100 LevelMode.OVERLAY = ' + LevelMode.OVERLAY);
      console.info('PopupLevelModeTest_0100 END');
      done();
    });

    /**
     * @tc.name   PopupLevelModeTest_0200
     * @tc.number SUB_ACE_PopupLevelModeTest_0200
     * @tc.desc   Test LevelMode.EMBEDDED enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupLevelModeTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PopupLevelModeTest_0200 START');
      expect(LevelMode.EMBEDDED).assertEqual(1);
      console.info('PopupLevelModeTest_0200 LevelMode.EMBEDDED = ' + LevelMode.EMBEDDED);
      console.info('PopupLevelModeTest_0200 END');
      done();
    });

    /**
     * @tc.name   PopupLevelModeTest_0300
     * @tc.number SUB_ACE_PopupLevelModeTest_0300
     * @tc.desc   Test bindPopup without levelMode, verify popup shows with default behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupLevelModeTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PopupLevelModeTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup_default'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('Popup Default LevelMode Test'));
      expect(popupText).not().assertUndefined();
      console.info('PopupLevelModeTest_0300 Popup Default is visible');

      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupLevelModeTest_0300 END');
      done();
    });

    /**
     * @tc.name   PopupLevelModeTest_0400
     * @tc.number SUB_ACE_PopupLevelModeTest_0400
     * @tc.desc   Test bindPopup with LevelMode.OVERLAY, verify popup shows correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupLevelModeTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('PopupLevelModeTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup_overlay'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('Popup OVERLAY LevelMode Test'));
      expect(popupText).not().assertUndefined();
      console.info('PopupLevelModeTest_0400 Popup OVERLAY is visible');

      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupLevelModeTest_0400 END');
      done();
    });

    /**
     * @tc.name   PopupLevelModeTest_0500
     * @tc.number SUB_ACE_PopupLevelModeTest_0500
     * @tc.desc   Test bindPopup with LevelMode.EMBEDDED, verify popup shows correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupLevelModeTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('PopupLevelModeTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup_embedded'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('Popup EMBEDDED LevelMode Test'));
      expect(popupText).not().assertUndefined();
      console.info('PopupLevelModeTest_0500 Popup EMBEDDED is visible');

      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupLevelModeTest_0500 END');
      done();
    });

    /**
     * @tc.name   PopupLevelModeTest_0600
     * @tc.number SUB_ACE_PopupLevelModeTest_0600
     * @tc.desc   Test bindPopup with null levelMode, verify popup behaves as default (OVERLAY)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupLevelModeTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('PopupLevelModeTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup_null'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('Popup Null LevelMode Test'));
      expect(popupText).not().assertUndefined();
      console.info('PopupLevelModeTest_0600 Popup Null is visible');

      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupLevelModeTest_0600 END');
      done();
    });

    /**
     * @tc.name   PopupLevelModeTest_0700
     * @tc.number SUB_ACE_PopupLevelModeTest_0700
     * @tc.desc   Test bindPopup with undefined levelMode, verify popup behaves as default (OVERLAY)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupLevelModeTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('PopupLevelModeTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('Popup Undefined LevelMode Test'));
      expect(popupText).not().assertUndefined();
      console.info('PopupLevelModeTest_0700 Popup Undefined is visible');

      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupLevelModeTest_0700 END');
      done();
    });
  })
}
