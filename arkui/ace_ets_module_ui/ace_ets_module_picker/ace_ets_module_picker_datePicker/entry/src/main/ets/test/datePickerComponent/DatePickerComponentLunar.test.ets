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

export default function DatePickerComponentLunarTest() {
  describe('DatePickerComponentLunarTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DatePickerComponentLunarTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentLunar',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePickerComponentLunarTest state pages:' + JSON.stringify(pages));
        if (!('DatePickerComponentLunar' === pages.name)) {
          console.info('get DatePickerComponentLunarTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push DatePickerComponentLunarTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePickerComponentLunarTest page error:' + err);
      }
      console.info('DatePickerComponentLunarTest beforeEach end');
      done();
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    /**
     * @tc.name   DatePickerComponentLunarTest_0100
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LUNAR_PARAM_0100
     * @tc.desc   Test DatePickerComponent dateOptions.lunar default value is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentLunarTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentLunarTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_lunar_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentLunarTest_0100 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('lunar: false');
      console.info('DatePickerComponentLunarTest_0100 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentLunarTest_0200
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LUNAR_PARAM_0200
     * @tc.desc   Test DatePickerComponent dateOptions.lunar changes to true when lunar_true button clicked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentLunarTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentLunarTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('button_lunar_true'));
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_lunar_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentLunarTest_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('lunar: true');
      console.info('DatePickerComponentLunarTest_0200 END');
      done();
    });
  });
}
