'use static';
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

import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON, Rect } from '@ohos.UiTest';
import router from '@ohos.router';

import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';

import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function counterDirectionTest(): void {
  describe('counterDirectionTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('counterDirectionTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/counter/CounterDirection',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        const pages = routerInstance.getState();
        console.info('get counterDirectionTest state pages:' + JSON.stringify(pages));
        if (!('CounterDirection' === pages.name)) {
          console.info('get counterDirectionTest pages.name:' + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('push counterDirectionTest page error:' + err);
      }
      console.info('counterDirectionTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.log('counterDirectionTest afterEach error:' + err);
      }
      console.info('counterDirectionTest after each called');
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_DIRECTION_0010
     * @tc.name     testCounterDirection_static_0100
     * @tc.desc     test counter direction auto and rtl switch test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('testCounterDirection_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testCounterDirection_static_0100] START');
      let rect1: Rect | undefined = undefined;
      let rect2: Rect | undefined = undefined;
      try {
        const driver = Driver.create();
        const buttonAuto = await driver.findComponent(ON.id('Auto'));
        if (buttonAuto) {
          await buttonAuto.click();
        }
        await CommonFunc.sleep(1000);
        console.info('[testCounterDirection_static_0100] click Auto');
        const label1 = await driver.findComponent(ON.text('价格'));
        if (label1) {
          rect1 = await label1.getBounds();
        }
        console.info('[testCounterDirection_static_0100] rect1:' + JSON.stringify(rect1));
        const buttonRtl = await driver.findComponent(ON.id('Rtl'));
        if (buttonRtl) {
          await buttonRtl.click();
        }
        console.info('[testCounterDirection_static_0100] click Rtl');
        await CommonFunc.sleep(1000);
        const label2 = await driver.findComponent(ON.text('价格'));
        if (label2) {
          rect2 = await label2.getBounds();
        }
        console.info('[testCounterDirection_static_0100] rect2:' + JSON.stringify(rect2));
        if (rect1 && rect2) {
          expect(rect1.left === rect2.left).assertFalse();
        }
      } catch (err) {
        console.log('testCounterDirection_static_0100 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[testCounterDirection_static_0100] END');
      done();
    });
  });
}
