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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function composeListItemV2PageTest() {
  describe('composeListItemV2Page', () => {
    beforeEach(async (done: Function) => {
      console.info('composeListItemV2Page beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItemV2/ComposeListItemV2Page',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ComposeListItemV2Page state pages: ' + JSON.stringify(pages));
        if (!('ComposeListItemV2Page' == pages.name)) {
          console.info('get ComposeListItemV2Page pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push ComposeListItemV2Page page result successful');
        }
      } catch (err) {
        console.error('push ComposeListItemV2Page page error: ' + err);
      }
      
      await Utils.sleep(1000);
      console.info('composeListItemV2Page beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('composeListItemV2Page after each called');
    })

    /**
     * @tc.number composeListItemV2PageTest
     * @tc.name   composeListItemV2PageTest_0100
     * @tc.desc   Test ComposeListItemV2Page basic rendering
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeListItemV2PageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeListItemV2PageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let basicText = await driver.findComponent(ON.text('ComposeListItemV2 Basic Test'));
      expect(basicText !== null).assertTrue();
      
      let basicItem = await driver.findComponent(ON.text('Basic Item'));
      expect(basicItem !== null).assertTrue();
      
      console.info('[composeListItemV2PageTest_0100] END');
      done();
    });

    /**
     * @tc.number composeListItemV2PageTest
     * @tc.name   composeListItemV2PageTest_0200
     * @tc.desc   Test ComposeListItemV2 with IconStyle
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeListItemV2PageTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeListItemV2PageTest_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let iconStyleText = await driver.findComponent(ON.text('ComposeListItemV2 with IconStyle'));
      expect(iconStyleText !== null).assertTrue();
      
      let itemWithIcon = await driver.findComponent(ON.text('Item with Icon'));
      expect(itemWithIcon !== null).assertTrue();
      
      let badgeItem = await driver.findComponent(ON.text('Item with Badge'));
      expect(badgeItem !== null).assertTrue();
      
      console.info('[composeListItemV2PageTest_0200] END');
      done();
    });

    /**
     * @tc.number composeListItemV2PageTest
     * @tc.name   composeListItemV2PageTest_0300
     * @tc.desc   Test ComposeListItemV2 with OperateItem Arrow
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeListItemV2PageTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeListItemV2PageTest_0300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let operateItemText = await driver.findComponent(ON.text('ComposeListItemV2 with OperateItem'));
      expect(operateItemText !== null).assertTrue();
      
      let itemWithArrow = await driver.findComponent(ON.text('Item with Arrow'));
      expect(itemWithArrow !== null).assertTrue();
      
      console.info('[composeListItemV2PageTest_0300] END');
      done();
    });

    /**
     * @tc.number composeListItemV2PageTest
     * @tc.name   composeListItemV2PageTest_0400
     * @tc.desc   Test ComposeListItemV2 with Toggle interaction
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  1
     */
    it('composeListItemV2PageTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[composeListItemV2PageTest_0400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let itemWithToggle = await driver.findComponent(ON.text('Item with Toggle'));
      expect(itemWithToggle !== null).assertTrue();
      
      let toggleComponent = await driver.findComponent(ON.type('Toggle'));
      if (toggleComponent) {
        await toggleComponent.click();
        await driver.delayMs(500);
      }
      
      console.info('[composeListItemV2PageTest_0400] END');
      done();
    });

    /**
     * @tc.number composeListItemV2PageTest
     * @tc.name   composeListItemV2PageTest_0500
     * @tc.desc   Test ComposeListItemV2 with Checkbox interaction
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  1
     */
    it('composeListItemV2PageTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[composeListItemV2PageTest_0500] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let itemWithCheckbox = await driver.findComponent(ON.text('Item with Checkbox'));
      expect(itemWithCheckbox !== null).assertTrue();
      
      let checkboxComponent = await driver.findComponent(ON.type('Checkbox'));
      if (checkboxComponent) {
        await checkboxComponent.click();
        await driver.delayMs(500);
      }
      
      console.info('[composeListItemV2PageTest_0500] END');
      done();
    });

    /**
     * @tc.number composeListItemV2PageTest
     * @tc.name   composeListItemV2PageTest_0600
     * @tc.desc   Test ComposeListItemV2 with Radio interaction
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  1
     */
    it('composeListItemV2PageTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[composeListItemV2PageTest_0600] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let itemWithRadio = await driver.findComponent(ON.text('Item with Radio'));
      expect(itemWithRadio !== null).assertTrue();
      
      let radioComponent = await driver.findComponent(ON.type('Radio'));
      if (radioComponent) {
        await radioComponent.click();
        await driver.delayMs(500);
      }
      
      console.info('[composeListItemV2PageTest_0600] END');
      done();
    });
  })
}