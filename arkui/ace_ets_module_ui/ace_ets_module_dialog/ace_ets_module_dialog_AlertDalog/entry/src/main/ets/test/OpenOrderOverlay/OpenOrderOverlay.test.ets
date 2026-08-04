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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON, } from '@ohos.UiTest';
import { LevelOrder, LevelMode } from '@kit.ArkUI';

export default function OpenOrderOverlayTest() {
  describe('OpenOrderOverlayTest', () => {
    beforeEach(async (done: Function) => {
      console.info('OpenOrderOverlayTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/OpenOrderOverlay/OpenOrderOverlayTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get OpenOrderOverlayTest state pages:' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('OpenOrderOverlayTestPage' == pages.name)) {
          console.info('get OpenOrderOverlayTest pages.name:' + JSON.stringify(pages.name));
          await Utils.sleep(2500);
          console.info('push OpenOrderOverlayTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push OpenOrderOverlayTest page error:' + err);
      }
      console.info('OpenOrderOverlayTest beforeEach end');
      done();
    });
    afterAll(async (done:Function)=>{
      console.info('OpenOrderOverlayTest beforeEach end');
      done();
    })

    /**
     * @tc.name   OpenOrderOverlayTest_Content_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_Content_0100
     * @tc.desc   Test openOrderOverlay with content only (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_Content_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_Content_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_content_only'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_Content_0100 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_Content_0100 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_Options_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_Options_0100
     * @tc.desc   Test openOrderOverlay with full options (levelOrder + levelMode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_Options_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_Options_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_with_options'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_Options_0100 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_Options_0100 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelMode_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0100
     * @tc.desc   Test openOrderOverlay levelMode OVERLAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelMode_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelMode_0100 START');

      expect(LevelMode.OVERLAY).assertEqual(0);
      console.info('OpenOrderOverlayTest_LevelMode_0100 LevelMode.OVERLAY = ' + LevelMode.OVERLAY);

      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_overlay_mode'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_LevelMode_0100 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_LevelMode_0100 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelMode_0200
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0200
     * @tc.desc   Test openOrderOverlay levelMode EMBEDDED with levelUniqueId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelMode_0200', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelMode_0200 START');

      expect(LevelMode.EMBEDDED).assertEqual(1);
      console.info('OpenOrderOverlayTest_LevelMode_0200 LevelMode.EMBEDDED = ' + LevelMode.EMBEDDED);

      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_embedded_mode'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      console.info('OpenOrderOverlayTest_LevelMode_0200 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_LevelMode_0200 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelOrder_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0100
     * @tc.desc   Test openOrderOverlay with LevelOrder.clamp(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelOrder_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelOrder_0100 START');

      let order = LevelOrder.clamp(0);
      expect(order.getOrder()).assertEqual(0);
      console.info('OpenOrderOverlayTest_LevelOrder_0100 LevelOrder.clamp(0).getOrder() = ' + order.getOrder());

      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_order_0'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_LevelOrder_0100 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_LevelOrder_0100 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelOrder_0200
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0200
     * @tc.desc   Test openOrderOverlay with LevelOrder.clamp(100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelOrder_0200', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelOrder_0200 START');

      let order = LevelOrder.clamp(100);
      expect(order.getOrder()).assertEqual(100);
      console.info('OpenOrderOverlayTest_LevelOrder_0200 LevelOrder.clamp(100).getOrder() = ' + order.getOrder());

      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_order_100'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_LevelOrder_0200 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_LevelOrder_0200 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelOrder_0300
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0300
     * @tc.desc   Test openOrderOverlay with LevelOrder.clamp(-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelOrder_0300', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelOrder_0300 START');

      let order = LevelOrder.clamp(-100);
      expect(order.getOrder()).assertEqual(-100);
      console.info('OpenOrderOverlayTest_LevelOrder_0300 LevelOrder.clamp(-100).getOrder() = ' + order.getOrder());

      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_order_neg100'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_LevelOrder_0300 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_LevelOrder_0300 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelOrder_0400
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0400
     * @tc.desc   Test openOrderOverlay with LevelOrder.clamp(100000) max boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelOrder_0400', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelOrder_0400 START');

      let order = LevelOrder.clamp(100000);
      expect(order.getOrder()).assertEqual(100000);
      console.info('OpenOrderOverlayTest_LevelOrder_0400 LevelOrder.clamp(100000).getOrder() = ' + order.getOrder());

      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_order_max'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_LevelOrder_0400 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_LevelOrder_0400 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelUniqueId_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelUniqueId_0100
     * @tc.desc   Test openOrderOverlay with levelUniqueId 0 in EMBEDDED mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelUniqueId_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelUniqueId_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_uniqueid_0'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      console.info('OpenOrderOverlayTest_LevelUniqueId_0100 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_LevelUniqueId_0100 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_AllParams_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_AllParams_0100
     * @tc.desc   Test openOrderOverlay with all parameters combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_AllParams_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_AllParams_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_params'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_AllParams_0100 result: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_AllParams_0100 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_ReturnValue_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_ReturnValue_0100
     * @tc.desc   Test openOrderOverlay returns Promise<void>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_ReturnValue_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_ReturnValue_0100 START');

      let driver = await Driver.create()
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_content_only'));
      await btn.click();
      await Utils.sleep(1000);

      let resultText = await driver.findComponent(ON.id('result_text'));
      let text = await resultText.getText();
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info('OpenOrderOverlayTest_ReturnValue_0100 overlay opened: ' + text);

      let removeBtn = await driver.findComponent(ON.id('btn_remove'));
      await removeBtn.click();
      await Utils.sleep(500);

      console.info('OpenOrderOverlayTest_ReturnValue_0100 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelOrderClamp_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrderClamp_0100
     * @tc.desc   Test LevelOrder.clamp boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelOrderClamp_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelOrderClamp_0100 START');

      let order0 = LevelOrder.clamp(0);
      expect(order0.getOrder()).assertEqual(0);
      console.info('LevelOrder.clamp(0).getOrder() = ' + order0.getOrder());

      let order100 = LevelOrder.clamp(100);
      expect(order100.getOrder()).assertEqual(100);
      console.info('LevelOrder.clamp(100).getOrder() = ' + order100.getOrder());

      let orderNeg100 = LevelOrder.clamp(-100);
      expect(orderNeg100.getOrder()).assertEqual(-100);
      console.info('LevelOrder.clamp(-100).getOrder() = ' + orderNeg100.getOrder());

      let orderMax = LevelOrder.clamp(100000);
      expect(orderMax.getOrder()).assertEqual(100000);
      console.info('LevelOrder.clamp(100000).getOrder() = ' + orderMax.getOrder());

      let orderMin = LevelOrder.clamp(-100000);
      expect(orderMin.getOrder()).assertEqual(-100000);
      console.info('LevelOrder.clamp(-100000).getOrder() = ' + orderMin.getOrder());

      let orderOverflow = LevelOrder.clamp(200000);
      expect(orderOverflow.getOrder()).assertEqual(100000);
      console.info('LevelOrder.clamp(200000).getOrder() clamped to 100000 = ' + orderOverflow.getOrder());

      let orderUnderflow = LevelOrder.clamp(-200000);
      expect(orderUnderflow.getOrder()).assertEqual(-100000);
      console.info('LevelOrder.clamp(-200000).getOrder() clamped to -100000 = ' + orderUnderflow.getOrder());

      console.info('OpenOrderOverlayTest_LevelOrderClamp_0100 END');
      done();
    });

    /**
     * @tc.name   OpenOrderOverlayTest_LevelModeEnum_0100
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelModeEnum_0100
     * @tc.desc   Test LevelMode enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OpenOrderOverlayTest_LevelModeEnum_0100', Level.LEVEL0, async (done: Function) => {
      console.info('OpenOrderOverlayTest_LevelModeEnum_0100 START');

      expect(LevelMode.OVERLAY).assertEqual(0);
      console.info('LevelMode.OVERLAY = ' + LevelMode.OVERLAY);

      expect(LevelMode.EMBEDDED).assertEqual(1);
      console.info('LevelMode.EMBEDDED = ' + LevelMode.EMBEDDED);

      console.info('OpenOrderOverlayTest_LevelModeEnum_0100 END');
      done();
    });

  })
}
