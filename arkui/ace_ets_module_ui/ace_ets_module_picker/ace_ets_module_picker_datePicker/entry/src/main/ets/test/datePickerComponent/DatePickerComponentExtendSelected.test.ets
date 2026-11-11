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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function DatePickerComponentExtendSelectedTest() {
  describe('DatePickerComponentExtendSelectedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DatePickerComponentExtendSelectedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentExtendSelected',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePickerComponentExtendSelectedTest state pages:' + JSON.stringify(pages));
        if (!('DatePickerComponentExtendSelected' === pages.name)) {
          console.info('get DatePickerComponentExtendSelectedTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push DatePickerComponentExtendSelectedTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePickerComponentExtendSelectedTest page error:' + err);
      }
      console.info('DatePickerComponentExtendSelectedTest beforeEach end');
      done();
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    /**
     * @tc.name   DatePickerComponentExtendSelectedTest_0100
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_EXTENDSELECTED_PARAM_0100
     * @tc.desc   Test DatePickerComponent extendSelected with Date type value, verify initial selected date is applied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentExtendSelectedTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentExtendSelectedTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 验证初始状态：onChange 未触发
      let strJson = getInspectorByKey('text_extendSelected_date_result');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentExtendSelectedTest_0100 initial obj: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('onChange1: false');

      // 滑动组件触发 onChange 回调
      let datePickerComp: Component = await driver.findComponent(ON.id('datePickerComponent_extendSelected_date'));
      await CommonFunc.sleep(500);
      let bounds = await datePickerComp.getBounds();
      let displayId = await datePickerComp.getDisplayId();
      let centerX: number = bounds.left + (bounds.right - bounds.left) / 2;
      let centerY: number = bounds.top + (bounds.bottom - bounds.top) / 2;
      await driver.swipeBetween(
        { x: Math.round(centerX), y: Math.round(centerY), displayId: displayId },
        { x: Math.round(centerX), y: Math.round(centerY + 100), displayId: displayId },
        600
      );
      await CommonFunc.sleep(1500);

      // 验证 onChange 已触发，且年份与 extendSelected 设置的 Date(2025, 5, 15) 一致
      let strJson1 = getInspectorByKey('text_extendSelected_date_result');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('DatePickerComponentExtendSelectedTest_0100 after swipe obj: ' + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertContain('onChange1: true');
      expect(obj1.$attrs.content).assertContain('year:2025');

      console.info('DatePickerComponentExtendSelectedTest_0100 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentExtendSelectedTest_0200
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_EXTENDSELECTED_PARAM_0200
     * @tc.desc   Test DatePickerComponent extendSelected with DatePickerComponentResult type value, verify initial selected date is applied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentExtendSelectedTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentExtendSelectedTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 验证初始状态：onChange 未触发
      let strJson = getInspectorByKey('text_extendSelected_result_result');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentExtendSelectedTest_0200 initial obj: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('onChange2: false');

      // 滑动组件触发 onChange 回调
      let datePickerComp: Component = await driver.findComponent(ON.id('datePickerComponent_extendSelected_result'));
      await CommonFunc.sleep(500);
      let bounds = await datePickerComp.getBounds();
      let displayId = await datePickerComp.getDisplayId();
      let centerX: number = bounds.left + (bounds.right - bounds.left) / 2;
      let centerY: number = bounds.top + (bounds.bottom - bounds.top) / 2;
      await driver.swipeBetween(
        { x: Math.round(centerX), y: Math.round(centerY), displayId: displayId },
        { x: Math.round(centerX), y: Math.round(centerY + 100), displayId: displayId },
        600
      );
      await CommonFunc.sleep(1500);

      // 验证 onChange 已触发，且年份与 extendSelected 设置的 {year: 2026, month: 0, day: 1} 一致
      let strJson1 = getInspectorByKey('text_extendSelected_result_result');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('DatePickerComponentExtendSelectedTest_0200 after swipe obj: ' + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertContain('onChange2: true');
      expect(obj1.$attrs.content).assertContain('year:2026');

      console.info('DatePickerComponentExtendSelectedTest_0200 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentExtendSelectedTest_0300
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_EXTENDSELECTED_PARAM_0300
     * @tc.desc   Test DatePickerComponent extendSelected undefined, verify default behavior (current system date is used)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentExtendSelectedTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentExtendSelectedTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 验证初始状态：onChange 未触发
      let strJson = getInspectorByKey('text_extendSelected_undefined_result');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentExtendSelectedTest_0300 initial obj: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('onChange3: false');

      // 滑动组件触发 onChange 回调
      let datePickerComp: Component = await driver.findComponent(ON.id('datePickerComponent_extendSelected_undefined'));
      await CommonFunc.sleep(500);
      let bounds = await datePickerComp.getBounds();
      let displayId = await datePickerComp.getDisplayId();
      let centerX: number = bounds.left + (bounds.right - bounds.left) / 2;
      let centerY: number = bounds.top + (bounds.bottom - bounds.top) / 2;
      await driver.swipeBetween(
        { x: Math.round(centerX), y: Math.round(centerY), displayId: displayId },
        { x: Math.round(centerX), y: Math.round(centerY + 100), displayId: displayId },
        600
      );
      await CommonFunc.sleep(1500);

      // 验证 onChange 已触发，且返回了有效的年份值（默认当前系统日期）
      let strJson1 = getInspectorByKey('text_extendSelected_undefined_result');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('DatePickerComponentExtendSelectedTest_0300 after swipe obj: ' + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertContain('onChange3: true');
      expect(obj1.$attrs.content).assertContain('year:');

      console.info('DatePickerComponentExtendSelectedTest_0300 END');
      done();
    });
  });
}
