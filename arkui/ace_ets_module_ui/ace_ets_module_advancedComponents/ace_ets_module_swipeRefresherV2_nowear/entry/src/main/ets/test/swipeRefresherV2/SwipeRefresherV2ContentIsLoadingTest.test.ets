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
import Utils from '../Utils.test';

export default function SwipeRefresherV2ContentIsLoadingTest() {
  describe('SwipeRefresherV2ContentIsLoadingTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SwipeRefresherV2ContentIsLoadingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swipeRefresherV2/SwipeRefresherV2ContentIsLoading',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SwipeRefresherV2ContentIsLoading state pages: ' + JSON.stringify(pages));
        if (!('SwipeRefresherV2ContentIsLoading' == pages.name)) {
          console.info('get SwipeRefresherV2ContentIsLoading pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push SwipeRefresherV2ContentIsLoading page result successful');
        }
      } catch (err) {
        console.error('push SwipeRefresherV2ContentIsLoading page error: ' + err);
      }
      
      await Utils.sleep(1000);
      console.info('SwipeRefresherV2ContentIsLoading beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('SwipeRefresherV2ContentIsLoading after each called');
    })

    /**
     * @tc.number SUB_ACE_ARKUI_SwipeRefresherV2ContentIsLoadingTest_0100
     * @tc.name   SwipeRefresherV2ContentIsLoadingTest_0100
     * @tc.desc   Test SwipeRefresherV2 content property with normal value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level0
     */
    it('SwipeRefresherV2ContentIsLoadingTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let component = await driver.findComponent(ON.text('场景2: 带content属性 - isLoading为true'));
      expect(component !== null).assertTrue();
      
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_SwipeRefresherV2ContentIsLoadingTest_0200
     * @tc.name   SwipeRefresherV2ContentIsLoadingTest_0200
     * @tc.desc   Test SwipeRefresherV2 content property with empty string
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level1
     */
    it('SwipeRefresherV2ContentIsLoadingTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let component = await driver.findComponent(ON.text('场景3: content为空字符串'));
      expect(component !== null).assertTrue();
      
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_SwipeRefresherV2ContentIsLoadingTest_0300
     * @tc.name   SwipeRefresherV2ContentIsLoadingTest_0300
     * @tc.desc   Test SwipeRefresherV2 isLoading property with false value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level0
     */
    it('SwipeRefresherV2ContentIsLoadingTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let component = await driver.findComponent(ON.text('场景1: 基本用法 - isLoading为false'));
      expect(component !== null).assertTrue();
      
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_SwipeRefresherV2ContentIsLoadingTest_0400
     * @tc.name   SwipeRefresherV2ContentIsLoadingTest_0400
     * @tc.desc   Test SwipeRefresherV2 isLoading property dynamic switch
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level1
     */
    it('SwipeRefresherV2ContentIsLoadingTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let button = await driver.findComponent(ON.text('切换加载状态'));
      expect(button !== null).assertTrue();
      
      await button.click();
      await driver.delayMs(1000);
      
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SwipeRefresherV2ContentIsLoadingTest_0500
     * @tc.name   SwipeRefresherV2ContentIsLoadingTest_0500
     * @tc.desc   Test SwipeRefresherV2 trigger loading button
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level1
     */
    it('SwipeRefresherV2ContentIsLoadingTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0500] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      
      let button = await driver.findComponent(ON.text('触发加载'));
      expect(button !== null).assertTrue();
      
      await button.click();
      await driver.delayMs(1000);
      
      console.info('[SwipeRefresherV2ContentIsLoadingTest_0500] END');
      done();
    });
  })
}