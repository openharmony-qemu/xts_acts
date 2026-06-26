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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function DatePickerComponentOnScrollStopTest() {
  describe('DatePickerComponentOnScrollStopTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DatePickerComponentOnScrollStopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentOnScrollStop',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePickerComponentOnScrollStopTest state pages:' + JSON.stringify(pages));
        if (!('DatePickerComponentOnScrollStop' === pages.name)) {
          console.info('get DatePickerComponentOnScrollStopTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push DatePickerComponentOnScrollStopTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePickerComponentOnScrollStopTest page error:' + err);
      }
      console.info('DatePickerComponentOnScrollStopTest beforeEach end');
      done();
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    /**
     * @tc.name   DatePickerComponentOnScrollStopTest_0100
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_ONSCROLLSTOP_EVENT_0100
     * @tc.desc   Test DatePickerComponent onScrollStop callback triggered when scroll stops, verify state variable updated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentOnScrollStopTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentOnScrollStopTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('text_onScrollStop_triggered');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentOnScrollStopTest_0100 initial triggered: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('onScrollStopTriggered: false');

      let datePickerComp: Component = await driver.findComponent(ON.id('datePickerComponent_onScrollStop'));
      await CommonFunc.sleep(500);
      let bounds = await datePickerComp.getBounds();
      let centerX: number = bounds.left + (bounds.right - bounds.left) / 2;
      let centerY: number = bounds.top + (bounds.bottom - bounds.top) / 2;
      await driver.swipe(centerX, centerY, centerX, centerY + 100, 600);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('text_onScrollStop_triggered');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('DatePickerComponentOnScrollStopTest_0100 after swipe triggered: ' + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertContain('onScrollStopTriggered: true');

      console.info('DatePickerComponentOnScrollStopTest_0100 END');
      done();
    });
  });
}
