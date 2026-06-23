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

export default function exceptionPromptV2PageTest() {
  describe('exceptionPromptV2Page', () => {
    beforeEach(async (done: Function) => {
      console.info('exceptionPromptV2Page beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/exceptionPromptV2/ExceptionPromptV2Page',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ExceptionPromptV2Page state pages: ' + JSON.stringify(pages));
        if (!('ExceptionPromptV2Page' == pages.name)) {
          console.info('get ExceptionPromptV2Page pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push ExceptionPromptV2Page page result successful');
        }
      } catch (err) {
        console.error('push ExceptionPromptV2Page page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('exceptionPromptV2Page beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('exceptionPromptV2Page after each called');
    })

    /**
     * @tc.number exceptionPromptV2PageTest
     * @tc.name   exceptionPromptV2PageTest_0100
     * @tc.desc   Test ExceptionPromptV2 page display
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2PageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2PageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let titleText = await driver.findComponent(ON.text('ExceptionPromptV2 测试页面'));
      expect(titleText !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0100] Page title found');

      let test1Text = await driver.findComponent(ON.text('测试1: 默认边距类型'));
      expect(test1Text !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0100] Test section 1 found');

      let tipText = await driver.findComponent(ON.text('网络未连接'));
      expect(tipText !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0100] Default tip text found');

      console.info('[exceptionPromptV2PageTest_0100] END');
      done();
    });

    /**
     * @tc.number exceptionPromptV2PageTest
     * @tc.name   exceptionPromptV2PageTest_0200
     * @tc.desc   Test MarginType FIT_MARGIN display
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2PageTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2PageTest_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let test2Text = await driver.findComponent(ON.text('测试2: 适配边距类型'));
      expect(test2Text !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0200] Test section 2 found');

      let unstableTip = await driver.findComponent(ON.text('网络连接不稳定'));
      expect(unstableTip !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0200] FIT_MARGIN tip found');

      let actionText = await driver.findComponent(ON.text('设置'));
      expect(actionText !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0200] Action text found');

      console.info('[exceptionPromptV2PageTest_0200] END');
      done();
    });

    /**
     * @tc.number exceptionPromptV2PageTest
     * @tc.name   exceptionPromptV2PageTest_0300
     * @tc.desc   Test onTipClick callback
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2PageTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2PageTest_0300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let tipText = await driver.findComponent(ON.text('网络未连接'));
      if (tipText !== null) {
        await tipText.click();
        await driver.delayMs(1000);
        console.info('[exceptionPromptV2PageTest_0300] Tip clicked');

        let countText = await driver.findComponent(ON.text('tip点击次数: 1'));
        expect(countText !== null).assertTrue();
        console.info('[exceptionPromptV2PageTest_0300] Click count updated');
      }

      console.info('[exceptionPromptV2PageTest_0300] END');
      done();
    });

    /**
     * @tc.number exceptionPromptV2PageTest
     * @tc.name   exceptionPromptV2PageTest_0400
     * @tc.desc   Test onActionTextClick callback
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2PageTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2PageTest_0400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let actionText = await driver.findComponent(ON.text('设置'));
      if (actionText !== null) {
        await actionText.click();
        await driver.delayMs(1000);
        console.info('[exceptionPromptV2PageTest_0400] Action button clicked');

        let countText = await driver.findComponent(ON.text('action点击次数: 1'));
        expect(countText !== null).assertTrue();
        console.info('[exceptionPromptV2PageTest_0400] Click count updated');
      }

      console.info('[exceptionPromptV2PageTest_0400] END');
      done();
    });

    /**
     * @tc.number exceptionPromptV2PageTest
     * @tc.name   exceptionPromptV2PageTest_0500
     * @tc.desc   Test isShown toggle visibility
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2PageTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2PageTest_0500] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let button1 = await driver.findComponent(ON.text('切换显示状态1'));
      expect(button1 !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0500] Toggle button 1 found');

      let tipTextBefore = await driver.findComponent(ON.text('网络未连接'));
      expect(tipTextBefore !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0500] Tip visible before toggle');

      await button1.click();
      await driver.delayMs(1000);
      console.info('[exceptionPromptV2PageTest_0500] Toggle button clicked');

      let tipTextAfter = await driver.findComponent(ON.text('网络未连接'));
      expect(tipTextAfter === null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0500] Tip hidden after toggle');

      console.info('[exceptionPromptV2PageTest_0500] END');
      done();
    });

    /**
     * @tc.number exceptionPromptV2PageTest
     * @tc.name   exceptionPromptV2PageTest_0600
     * @tc.desc   Test component with icon
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2PageTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2PageTest_0600] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let test3Text = await driver.findComponent(ON.text('测试3: 带图标'));
      expect(test3Text !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0600] Test section 3 found');

      let serverTip = await driver.findComponent(ON.text('服务器连接失败'));
      expect(serverTip !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0600] Tip with icon found');

      console.info('[exceptionPromptV2PageTest_0600] END');
      done();
    });

    /**
     * @tc.number exceptionPromptV2PageTest
     * @tc.name   exceptionPromptV2PageTest_0700
     * @tc.desc   Test complete configuration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2PageTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2PageTest_0700] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let test4Text = await driver.findComponent(ON.text('测试4: 完整配置'));
      expect(test4Text !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0700] Test section 4 found');

      let locationTip = await driver.findComponent(ON.text('无法获取位置信息'));
      expect(locationTip !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0700] Complete tip found');

      let refreshAction = await driver.findComponent(ON.text('刷新'));
      expect(refreshAction !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0700] Action button found');

      console.info('[exceptionPromptV2PageTest_0700] END');
      done();
    });


    /**
     * @tc.number exceptionPromptV2PageTest
     * @tc.name   exceptionPromptV2PageTest_0800
     * @tc.desc   Test hide and show functionality
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('exceptionPromptV2PageTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[exceptionPromptV2PageTest_0800] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let initialTip = await driver.findComponent(ON.text('初始提示文本'));
      expect(initialTip !== null).assertTrue();
      console.info('[exceptionPromptV2PageTest_0800] Tip visible initially');

      let hideButton = await driver.findComponent(ON.text('隐藏组件'));
      if (hideButton !== null) {
        await hideButton.click();
        await driver.delayMs(1000);
        console.info('[exceptionPromptV2PageTest_0800] Hide button clicked');

        let hiddenTip = await driver.findComponent(ON.text('初始提示文本'));
        expect(hiddenTip === null).assertTrue();
        console.info('[exceptionPromptV2PageTest_0800] Tip hidden');
      }

      let showButton = await driver.findComponent(ON.text('显示组件'));
      if (showButton !== null) {
        await showButton.click();
        await driver.delayMs(1000);
        console.info('[exceptionPromptV2PageTest_0800] Show button clicked');

        let shownTip = await driver.findComponent(ON.text('初始提示文本'));
        expect(shownTip !== null).assertTrue();
        console.info('[exceptionPromptV2PageTest_0800] Tip shown again');
      }

      console.info('[exceptionPromptV2PageTest_0800] END');
      done();
    });
  })
}