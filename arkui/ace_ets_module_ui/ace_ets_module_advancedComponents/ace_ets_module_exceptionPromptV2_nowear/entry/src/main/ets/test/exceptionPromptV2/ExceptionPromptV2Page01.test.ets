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

export default function exceptionPromptV2Page01Test() {
  describe('exceptionPromptV2Page01', () => {
    beforeEach(async (done: Function) => {
      console.info('exceptionPromptV2Page01 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/exceptionPromptV2/ExceptionPromptV2Page01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ExceptionPromptV2Page01 state pages: ' + JSON.stringify(pages));
        if (!('ExceptionPromptV2Page01' == pages.name)) {
          console.info('get ExceptionPromptV2Page01 pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push ExceptionPromptV2Page01 page result successful');
        }
      } catch (err) {
        console.error('push ExceptionPromptV2Page01 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('exceptionPromptV2Page01 beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('exceptionPromptV2Page01 after each called');
    })

    /**
     * @tc.number exceptionPromptV2Page01Test
     * @tc.name   exceptionPromptV2Page01Test_0100
     * @tc.desc   Test hide and show functionality
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2Page01Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2Page01Test_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let initialTip = await driver.findComponent(ON.text('初始提示文本'));
      expect(initialTip !== null).assertTrue();
      console.info('[exceptionPromptV2Page01Test_0100] Tip visible initially');

      let hideButton = await driver.findComponent(ON.text('隐藏组件'));
      if (hideButton !== null) {
        await hideButton.click();
        await driver.delayMs(1000);
        console.info('[exceptionPromptV2Page01Test_0100] Hide button clicked');

        let hiddenTip = await driver.findComponent(ON.text('初始提示文本'));
        expect(hiddenTip === null).assertTrue();
        console.info('[exceptionPromptV2Page01Test_0100] Tip hidden');
      }

      let showButton = await driver.findComponent(ON.text('显示组件'));
      if (showButton !== null) {
        await showButton.click();
        await driver.delayMs(1000);
        console.info('[exceptionPromptV2Page01Test_0100] Show button clicked');

        let shownTip = await driver.findComponent(ON.text('初始提示文本'));
        expect(shownTip !== null).assertTrue();
        console.info('[exceptionPromptV2Page01Test_0100] Tip shown again');
      }

      console.info('[exceptionPromptV2Page01Test_0100] END');
      done();
    });
  })
}