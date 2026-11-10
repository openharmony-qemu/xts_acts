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

export default function DatePickerComponentHideYearTest() {
  describe('DatePickerComponentHideYearTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DatePickerComponentHideYearTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentHideYear',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePickerComponentHideYearTest state pages:' + JSON.stringify(pages));
        if (!('DatePickerComponentHideYear' === pages.name)) {
          console.info('get DatePickerComponentHideYearTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push DatePickerComponentHideYearTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePickerComponentHideYearTest page error:' + err);
      }
      console.info('DatePickerComponentHideYearTest beforeEach end');
      done();
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0100
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0100
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear default value is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0100 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: false');
      console.info('DatePickerComponentHideYearTest_0100 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0200
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0200
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear changes to true when hideYear_true button clicked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('button_hideYear_true'));
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: true');
      console.info('DatePickerComponentHideYearTest_0200 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0300
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0300
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear changes back to false when hideYear_false button clicked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonTrue: Component = await driver.findComponent(ON.id('button_hideYear_true'));
      await CommonFunc.sleep(1000);
      await buttonTrue.click();
      await CommonFunc.sleep(1000);
      let strJsonTrue = getInspectorByKey('text_hideYear_value');
      let objTrue: ESObject = JSON.parse(strJsonTrue);
      console.info('DatePickerComponentHideYearTest_0300 after true obj is: ' + JSON.stringify(objTrue));
      expect(objTrue.$attrs.content).assertContain('hideYear: true');

      let buttonFalse: Component = await driver.findComponent(ON.id('button_hideYear_false'));
      await CommonFunc.sleep(1000);
      await buttonFalse.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0300 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: false');
      console.info('DatePickerComponentHideYearTest_0300 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0400
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0400
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear is true and effective when displayMode=DATE and mode=DATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonDisplayDate: Component = await driver.findComponent(ON.id('button_displayMode_date'));
      await CommonFunc.sleep(1000);
      await buttonDisplayDate.click();
      await CommonFunc.sleep(1000);
      let buttonModeDate: Component = await driver.findComponent(ON.id('button_dateMode_date'));
      await CommonFunc.sleep(1000);
      await buttonModeDate.click();
      await CommonFunc.sleep(1000);
      let buttonHideYear: Component = await driver.findComponent(ON.id('button_hideYear_true'));
      await CommonFunc.sleep(1000);
      await buttonHideYear.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0400 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: true');
      console.info('DatePickerComponentHideYearTest_0400 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0500
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0500
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear is true and effective when displayMode=DATE and mode=YEAR_AND_MONTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonDisplayDate: Component = await driver.findComponent(ON.id('button_displayMode_date'));
      await CommonFunc.sleep(1000);
      await buttonDisplayDate.click();
      await CommonFunc.sleep(1000);
      let buttonModeYearMonth: Component = await driver.findComponent(ON.id('button_dateMode_yearAndMonth'));
      await CommonFunc.sleep(1000);
      await buttonModeYearMonth.click();
      await CommonFunc.sleep(1000);
      let buttonHideYear: Component = await driver.findComponent(ON.id('button_hideYear_true'));
      await CommonFunc.sleep(1000);
      await buttonHideYear.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0500 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: true');
      console.info('DatePickerComponentHideYearTest_0500 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0600
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0600
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear is true and effective when displayMode=DATE_TIME and mode=DATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0600 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonDisplayDateTime: Component = await driver.findComponent(ON.id('button_displayMode_dateTime'));
      await CommonFunc.sleep(1000);
      await buttonDisplayDateTime.click();
      await CommonFunc.sleep(1000);
      let buttonModeDate: Component = await driver.findComponent(ON.id('button_dateMode_date'));
      await CommonFunc.sleep(1000);
      await buttonModeDate.click();
      await CommonFunc.sleep(1000);
      let buttonHideYear: Component = await driver.findComponent(ON.id('button_hideYear_true'));
      await CommonFunc.sleep(1000);
      await buttonHideYear.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0600 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: true');
      console.info('DatePickerComponentHideYearTest_0600 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0700
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0700
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear is true and effective when displayMode=DATE_TIME and mode=YEAR_AND_MONTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0700 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonDisplayDateTime: Component = await driver.findComponent(ON.id('button_displayMode_dateTime'));
      await CommonFunc.sleep(1000);
      await buttonDisplayDateTime.click();
      await CommonFunc.sleep(1000);
      let buttonModeYearMonth: Component = await driver.findComponent(ON.id('button_dateMode_yearAndMonth'));
      await CommonFunc.sleep(1000);
      await buttonModeYearMonth.click();
      await CommonFunc.sleep(1000);
      let buttonHideYear: Component = await driver.findComponent(ON.id('button_hideYear_true'));
      await CommonFunc.sleep(1000);
      await buttonHideYear.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0700 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: true');
      console.info('DatePickerComponentHideYearTest_0700 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0800
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0800
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear set to true with mode=MONTH_AND_DAY does not take effect (non-effective scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0800 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonDisplayDate: Component = await driver.findComponent(ON.id('button_displayMode_date'));
      await CommonFunc.sleep(1000);
      await buttonDisplayDate.click();
      await CommonFunc.sleep(1000);
      let buttonModeMonthDay: Component = await driver.findComponent(ON.id('button_dateMode_monthAndDay'));
      await CommonFunc.sleep(1000);
      await buttonModeMonthDay.click();
      await CommonFunc.sleep(1000);
      let buttonHideYear: Component = await driver.findComponent(ON.id('button_hideYear_true'));
      await CommonFunc.sleep(1000);
      await buttonHideYear.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0800 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: true');
      console.info('DatePickerComponentHideYearTest_0800 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_0900
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_PARAM_0900
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear set to true with displayMode=TIME does not take effect (non-effective scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_0900 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonDisplayTime: Component = await driver.findComponent(ON.id('button_displayMode_time'));
      await CommonFunc.sleep(1000);
      await buttonDisplayTime.click();
      await CommonFunc.sleep(1000);
      let buttonHideYear: Component = await driver.findComponent(ON.id('button_hideYear_true'));
      await CommonFunc.sleep(1000);
      await buttonHideYear.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_hideYear_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentHideYearTest_0900 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('hideYear: true');
      console.info('DatePickerComponentHideYearTest_0900 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentHideYearTest_1000
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_NULL_0200
     * @tc.desc   Test DatePickerComponent dateOptions.hideYear = null produces same behavior as undefined (both restore to default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentHideYearTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentHideYearTest_1000 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 点击按钮将isHideYear设置为null，获取组件属性
      let buttonNull: Component = await driver.findComponent(ON.id('button_hideYear_null'));
      await CommonFunc.sleep(1000);
      await buttonNull.click();
      await CommonFunc.sleep(1000);
      let strJsonNull: string = getInspectorByKey('datePickerComponent_hideYear');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);
      console.info('DatePickerComponentHideYearTest_1000 null obj: ' + JSON.stringify(objNull));
      let nullAttrs: string = JSON.stringify(objNull.$attrs);

      // 点击按钮将isHideYear设置为undefined，获取组件属性
      let buttonUndefined: Component = await driver.findComponent(ON.id('button_hideYear_undefined'));
      await CommonFunc.sleep(1000);
      await buttonUndefined.click();
      await CommonFunc.sleep(1000);
      let strJsonUndefined: string = getInspectorByKey('datePickerComponent_hideYear');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);
      console.info('DatePickerComponentHideYearTest_1000 undefined obj: ' + JSON.stringify(objUndefined));
      let undefinedAttrs: string = JSON.stringify(objUndefined.$attrs);

      // null与undefined应产生相同行为（均恢复为默认值false）
      console.info('DatePickerComponentHideYearTest_1000 null $attrs: ' + nullAttrs);
      console.info('DatePickerComponentHideYearTest_1000 undefined $attrs: ' + undefinedAttrs);
      expect(nullAttrs).assertEqual(undefinedAttrs);

      console.info('DatePickerComponentHideYearTest_1000 END');
      done();
    });
  });
}
