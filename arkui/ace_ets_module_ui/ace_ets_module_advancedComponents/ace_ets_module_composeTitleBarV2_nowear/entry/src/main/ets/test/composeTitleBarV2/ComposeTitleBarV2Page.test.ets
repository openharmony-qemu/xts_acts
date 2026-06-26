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

export default function composeTitleBarV2PageTest() {
  describe('composeTitleBarV2Page', () => {
    beforeEach(async (done: Function) => {
      console.info('composeTitleBarV2Page beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/composeTitleBarV2/ComposeTitleBarV2Page',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ComposeTitleBarV2Page state pages: ' + JSON.stringify(pages));
        if (!('ComposeTitleBarV2Page' == pages.name)) {
          console.info('get ComposeTitleBarV2Page pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push ComposeTitleBarV2Page page result successful');
        }
      } catch (err) {
        console.error('push ComposeTitleBarV2Page page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('composeTitleBarV2Page beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('composeTitleBarV2Page after each called');
    })

    /**
     * @tc.number composeTitleBarV2PageTest
     * @tc.name   composeTitleBarV2PageTest_0100
     * @tc.desc   Test ComposeTitleBarV2 basic rendering with title
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeTitleBarV2PageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeTitleBarV2PageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let sectionTitle = await driver.findComponent(ON.text('基本用法 - 仅标题'));
      expect(sectionTitle !== null).assertTrue();
      
      let basicTitle = await driver.findComponent(ON.text('基本标题'));
      expect(basicTitle !== null).assertTrue();
      
      console.info('[composeTitleBarV2PageTest_0100] END');
      done();
    });

    /**
     * @tc.number composeTitleBarV2PageTest
     * @tc.name   composeTitleBarV2PageTest_0200
     * @tc.desc   Test ComposeTitleBarV2 with title and subtitle
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeTitleBarV2PageTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeTitleBarV2PageTest_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let sectionTitle = await driver.findComponent(ON.text('完整用法 - 标题+副标题'));
      expect(sectionTitle !== null).assertTrue();
      
      let title = await driver.findComponent(ON.text('完整标题'));
      expect(title !== null).assertTrue();
      
      let subtitle = await driver.findComponent(ON.text('副标题内容'));
      expect(subtitle !== null).assertTrue();
      
      console.info('[composeTitleBarV2PageTest_0200] END');
      done();
    });

    /**
     * @tc.number composeTitleBarV2PageTest
     * @tc.name   composeTitleBarV2PageTest_0300
     * @tc.desc   Test ComposeTitleBarV2 with left avatar item
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeTitleBarV2PageTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeTitleBarV2PageTest_0300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let sectionTitle = await driver.findComponent(ON.text('左侧头像项'));
      expect(sectionTitle !== null).assertTrue();
      
      let title = await driver.findComponent(ON.text('带头像的标题'));
      expect(title !== null).assertTrue();
      
      let subtitle = await driver.findComponent(ON.text('副标题'));
      expect(subtitle !== null).assertTrue();
      
      console.info('[composeTitleBarV2PageTest_0300] END');
      done();
    });

    /**
     * @tc.number composeTitleBarV2PageTest
     * @tc.name   composeTitleBarV2PageTest_0400
     * @tc.desc   Test ComposeTitleBarV2 with right menu items
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeTitleBarV2PageTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeTitleBarV2PageTest_0400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let sectionTitle = await driver.findComponent(ON.text('右侧菜单项'));
      expect(sectionTitle !== null).assertTrue();
      
      let title = await driver.findComponent(ON.text('带菜单的标题'));
      expect(title !== null).assertTrue();
      
      let subtitle = await driver.findComponent(ON.text('副标题'));
      expect(subtitle !== null).assertTrue();
      
      console.info('[composeTitleBarV2PageTest_0400] END');
      done();
    });

    /**
     * @tc.number composeTitleBarV2PageTest
     * @tc.name   composeTitleBarV2PageTest_0500
     * @tc.desc   Test ComposeTitleBarV2 dynamic property update
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('composeTitleBarV2PageTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[composeTitleBarV2PageTest_0500] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let sectionTitle = await driver.findComponent(ON.text('动态属性测试'));
      expect(sectionTitle !== null).assertTrue();
      
      let title = await driver.findComponent(ON.text('标题'));
      expect(title !== null).assertTrue();
      
      let subtitle = await driver.findComponent(ON.text('副标题'));
      expect(subtitle !== null).assertTrue();
      
      let toggleButton = await driver.findComponent(ON.text('切换菜单启用状态'));
      expect(toggleButton !== null).assertTrue();
      await toggleButton.click();
      await driver.delayMs(1000);
      
      console.info('[composeTitleBarV2PageTest_0500] END');
      done();
    });
  })
}