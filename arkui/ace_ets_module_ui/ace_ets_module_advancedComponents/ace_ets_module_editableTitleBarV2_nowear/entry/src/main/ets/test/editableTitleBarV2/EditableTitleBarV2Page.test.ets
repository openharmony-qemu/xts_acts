/**
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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function editableTitleBarV2PageTest() {
  describe('EditableTitleBarV2Page', () => {
    beforeEach(async (done: Function) => {
      console.info('EditableTitleBarV2Page beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/editableTitleBarV2/EditableTitleBarV2Page',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EditableTitleBarV2Page state pages: ' + JSON.stringify(pages));
        if (!('EditableTitleBarV2Page' == pages.name)) {
          console.info('get EditableTitleBarV2Page pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push EditableTitleBarV2Page page result successful');
        }
      } catch (err) {
        console.error('push EditableTitleBarV2Page page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('EditableTitleBarV2Page beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('EditableTitleBarV2Page after each called');
    })

    /**
     * @tc.number EditableTitleBarV2PageTest_0100
     * @tc.name   EditableTitleBarV2PageTest_0100
     * @tc.desc   Test EditableTitleBarV2 basic rendering
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('EditableTitleBarV2PageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[EditableTitleBarV2PageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let component = await driver.findComponent(ON.text('Basic Title'));
      expect(component !== null).assertTrue();

      console.info('[EditableTitleBarV2PageTest_0100] END');
      done();
    });

    /**
     * @tc.number EditableTitleBarV2PageTest_0200
     * @tc.name   EditableTitleBarV2PageTest_0200
     * @tc.desc   Test EditableTitleBarV2 with left icon
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('EditableTitleBarV2PageTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[EditableTitleBarV2PageTest_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let component = await driver.findComponent(ON.text('With Left Icon'));
      expect(component !== null).assertTrue();

      console.info('[EditableTitleBarV2PageTest_0200] END');
      done();
    });

    /**
     * @tc.number EditableTitleBarV2PageTest_0300
     * @tc.name   EditableTitleBarV2PageTest_0300
     * @tc.desc   Test EditableTitleBarV2 with title object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('EditableTitleBarV2PageTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[EditableTitleBarV2PageTest_0300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let titleComponent = await driver.findComponent(ON.text('Title'));
      expect(titleComponent !== null).assertTrue();

      let subTitleComponent = await driver.findComponent(ON.text('Subtitle'));
      expect(subTitleComponent !== null).assertTrue();

      console.info('[EditableTitleBarV2PageTest_0300] END');
      done();
    });

    /**
     * @tc.number EditableTitleBarV2PageTest_0400
     * @tc.name   EditableTitleBarV2PageTest_0400
     * @tc.desc   Test EditableTitleBarV2 with menu items
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('EditableTitleBarV2PageTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[EditableTitleBarV2PageTest_0400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let component = await driver.findComponent(ON.text('With Menu'));
      expect(component !== null).assertTrue();

      console.info('[EditableTitleBarV2PageTest_0400] END');
      done();
    });

    /**
     * @tc.number EditableTitleBarV2PageTest_0500
     * @tc.name   EditableTitleBarV2PageTest_0500
     * @tc.desc   Test EditableTitleBarV2 with save button
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('EditableTitleBarV2PageTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[EditableTitleBarV2PageTest_0500] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let component = await driver.findComponent(ON.text('With Save Button'));
      expect(component !== null).assertTrue();

      console.info('[EditableTitleBarV2PageTest_0500] END');
      done();
    });
  })
}