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

export default function composeListItemV2Page03Test() {
  describe('ComposeListItemV2Page03', () => {
    beforeEach(async (done: Function) => {
      console.info('ComposeListItemV2Page03 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeListItemV2/ComposeListItemV2Page03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ComposeListItemV2Page03 state pages: ' + JSON.stringify(pages));
        if (!('ComposeListItemV2Page03' == pages.name)) {
          console.info('get ComposeListItemV2Page03 pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push ComposeListItemV2Page03 page result successful');
        }
      } catch (err) {
        console.error('push ComposeListItemV2Page03 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('ComposeListItemV2Page03 beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('ComposeListItemV2Page03 after each called');
    })

    /**
     * @tc.number ComposeListItemV2Page03Test
     * @tc.name   ComposeListItemV2Page03Test_0100
     * @tc.desc   Test ComposeListItemV2 with Button
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ComposeListItemV2Page03Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ComposeListItemV2Page03Test_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let operateArrowtext = await driver.findComponent(ON.text('operate arrow text'));
      expect(operateArrowtext !== null).assertTrue();

      let iconStyleIconText = await driver.findComponent(ON.text('iconStyle NORMAL_ICON'));
      expect(iconStyleIconText !== null).assertTrue();

      let arrowText = await driver.findComponent(ON.text('arrow文本'));
      expect(arrowText !== null).assertTrue();

      console.info('[ComposeListItemV2Page03Test_0100] END');
      done();
    });

    /**
     * @tc.number ComposeListItemV2Page03Test
     * @tc.name   ComposeListItemV2Page03Test_0200
     * @tc.desc   Test ComposeListItemV2 with Description
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ComposeListItemV2Page03Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ComposeListItemV2Page03Test_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let subIconText = await driver.findComponent(ON.text('operate icon subIcon'));
      expect(subIconText !== null).assertTrue();

      let iconStyleText = await driver.findComponent(ON.text('iconStyle NORMAL_ICON'));
      expect(iconStyleText !== null).assertTrue();

      let operateText = await driver.findComponent(ON.text('operate image'));
      expect(operateText !== null).assertTrue();

      console.info('[ComposeListItemV2Page03Test_0200] END');
      done();
    });

    /**
     * @tc.number ComposeListItemV2Page03Test
     * @tc.name   ComposeListItemV2Page03Test_0300
     * @tc.desc   Test ComposeListItemV2 Complete Example
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ComposeListItemV2Page03Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ComposeListItemV2Page03Test_0300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let operateText = await driver.findComponent(ON.text('operate button'));
      expect(operateText !== null).assertTrue();

      let checkboxText  = await driver.findComponent(ON.text('operate checkbox'));
      expect(checkboxText !== null).assertTrue();

      let radioText = await driver.findComponent(ON.text('operate radio 1'));
      expect(radioText !== null).assertTrue();

      console.info('[ComposeListItemV2Page03Test_0300] END');
      done();
    });

    /**
     * @tc.number ComposeListItemV2Page03Test
     * @tc.name   ComposeListItemV2Page03Test_0400
     * @tc.desc   Test ComposeListItemV2 Complete Example
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ComposeListItemV2Page03Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[ComposeListItemV2Page03Test_0400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let toggleText = await driver.findComponent(ON.text('operate toggle'));
      expect(toggleText !== null).assertTrue();

      let radioText = await driver.findComponent(ON.text('operate radio 2'));
      expect(radioText !== null).assertTrue();

      console.info('[ComposeListItemV2Page03Test_0400] END');
      done();
    });


  })
}