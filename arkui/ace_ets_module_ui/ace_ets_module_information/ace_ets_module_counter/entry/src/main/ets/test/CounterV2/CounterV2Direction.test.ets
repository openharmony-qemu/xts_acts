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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function CounterV2Direction() {
  describe('CounterV2Direction', () => {
    beforeEach(async (done: Function) => {
      console.info('CounterV2Direction beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/CounterV2Direction',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CounterV2Direction state pages: ' + JSON.stringify(pages));
        if (!('CounterV2Direction' == pages.name)) {
          console.info('get CounterV2Direction pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push CounterV2Direction page result successful');
        }
      } catch (err) {
        console.log('push CounterV2Direction page error: ' + err);
        expect().assertFail();
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.log('CounterV2Direction beforeEach sleep error: ' + err);
      }
      console.info('CounterV2Direction beforeEach end');
      done();
    });

    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.log('CounterV2Direction afterEach sleep error: ' + err);
      }
      console.info('chipDirectionTest after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_API_CounterV2Direction_0100
     * @tc.number SUB_ARKUI_API_CounterV2Direction_0100
     * @tc.desc   Test Counter direction page test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2Direction_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_CounterV2Direction_0100] START');
      try {
        const driver = await Driver.create();
        let buttonAuto = await driver.findComponent(ON.id('Auto'));
        await buttonAuto.click();
        await driver.delayMs(1000);
        console.info('[SUB_ARKUI_API_CounterV2Direction_0100] click Auto');
        const lable = await driver.findComponent(ON.text('价格'));
        const rect1 = await lable.getBounds();
        console.info('[SUB_ARKUI_API_CounterV2Direction_0100] ', ' rect:' + JSON.stringify(rect1));
        let buttonRtl = await driver.findComponent(ON.id('Rtl'));
        await buttonRtl.click();
        console.info('[CounterV2Direction_0100] ', 'click Rtl');
        await driver.delayMs(1000);
        let lable2 = await driver.findComponent(ON.text('价格'));
        const rect2 = await lable2.getBounds();
        console.info('[SUB_ARKUI_API_CounterV2Direction_0100] ', ' rect:' + JSON.stringify(rect2));
        expect(rect1.left == rect2.left).assertFalse();
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Direction_0100 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2Direction_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_CounterV2Direction_0200
     * @tc.number SUB_ARKUI_API_CounterV2Direction_0200
     * @tc.desc   Test Counter direction page test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2Direction_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_CounterV2Direction_0200] START');
      try {
        const driver = await Driver.create();
        let buttonLtr = await driver.findComponent(ON.id('Ltr'));
        await buttonLtr.click();
        await driver.delayMs(1000);
        let label = await driver.findComponent(ON.text('价格'));
        const rectLtr = await label.getBounds();
        let buttonRtl = await driver.findComponent(ON.id('Rtl'));
        await buttonRtl.click();
        await driver.delayMs(1000);
        let label2 = await driver.findComponent(ON.text('价格'));
        const rectRtl = await label2.getBounds();
        expect(rectLtr.left == rectRtl.left).assertFalse();
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2Direction_0200 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2Direction_0200] END');
      done();
    });
  });
}
