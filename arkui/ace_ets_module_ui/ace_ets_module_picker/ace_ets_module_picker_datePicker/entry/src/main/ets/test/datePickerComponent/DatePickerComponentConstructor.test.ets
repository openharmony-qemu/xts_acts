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

export default function DatePickerComponentConstructorTest() {
  describe('DatePickerComponentConstructorTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DatePickerComponentConstructorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentConstructor',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePickerComponentConstructorTest state pages:' + JSON.stringify(pages));
        if (!('DatePickerComponentConstructor' === pages.name)) {
          console.info('get DatePickerComponentConstructorTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push DatePickerComponentConstructorTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePickerComponentConstructorTest page error:' + err);
      }
      console.info('DatePickerComponentConstructorTest beforeEach end');
      done();
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    /**
     * @tc.name   DatePickerComponentConstructorTest_0100
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_CONSTRUCTOR_PARAM_0100
     * @tc.desc   Test DatePickerComponent with default options, verify component exists and type is DatePickerComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentConstructorTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentConstructorTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_default_created');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentConstructorTest_0100 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('DatePickerComponent_default_created');
      console.info('DatePickerComponentConstructorTest_0100 END');
      done();
    });

    /**
     * @tc.name   DatePickerComponentConstructorTest_0200
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_CONSTRUCTOR_PARAM_0200
     * @tc.desc   Test DatePickerComponent with explicit dateOptions, verify component exists and options applied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerComponentConstructorTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerComponentConstructorTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_explicit_created');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DatePickerComponentConstructorTest_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('DatePickerComponent_explicit_created');
      console.info('DatePickerComponentConstructorTest_0200 END');
      done();
    });
  });
}
