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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function DatePickerDateModeNullUndefinedTest() {
  describe('DatePickerDateModeNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerDateModeNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsDateMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerDateModeNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerComponentsDateMode" == pages.name)) {
          console.info("get DatePickerDateModeNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerDateModeNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDateModeNullUndefinedTest page error:" + err);
      }
      console.info("DatePickerDateModeNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    it('datePickerDateMode_001', Level.LEVEL2, async () => {
      console.info('[datePickerDateMode_001] START');

      let strJson: string = getInspectorByKey('datePicker_dateMode_date');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateMode_001] mode value is: " + JSON.stringify(obj.$attrs.mode));

      expect(obj.$attrs.mode).assertEqual('DateMode.DATE');

      console.info('[datePickerDateMode_001] END');
    });

    it('datePickerDateMode_002', Level.LEVEL2, async () => {
      console.info('[datePickerDateMode_002] START');

      let strJson: string = getInspectorByKey('datePicker_dateMode_year_and_month');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateMode_002] mode value is: " + JSON.stringify(obj.$attrs.mode));

      expect(obj.$attrs.mode).assertEqual('DateMode.YEAR_AND_MONTH');

      console.info('[datePickerDateMode_002] END');
    });

    it('datePickerDateMode_003', Level.LEVEL2, async () => {
      console.info('[datePickerDateMode_003] START');

      let strJson: string = getInspectorByKey('datePicker_dateMode_month_and_day');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateMode_003] mode value is: " + JSON.stringify(obj.$attrs.mode));

      expect(obj.$attrs.mode).assertEqual('DateMode.MONTH_AND_DAY');

      console.info('[datePickerDateMode_003] END');
    });

    it('datePickerDateMode_004', Level.LEVEL2, async () => {
      console.info('[datePickerDateMode_004] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_dateMode_date');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_dateMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateMode_004] default mode value is: " + JSON.stringify(objCompare.$attrs.mode));
      console.info("[datePickerDateMode_004] null mode value is: " + JSON.stringify(obj.$attrs.mode));

      expect(obj.$attrs.mode).assertEqual(objCompare.$attrs.mode);

      console.info('[datePickerDateMode_004] END');
    });

    it('datePickerDateMode_005', Level.LEVEL2, async () => {
      console.info('[datePickerDateMode_005] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_dateMode_date');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_dateMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateMode_005] default mode value is: " + JSON.stringify(objCompare.$attrs.mode));
      console.info("[datePickerDateMode_005] undefined mode value is: " + JSON.stringify(obj.$attrs.mode));

      expect(obj.$attrs.mode).assertEqual(objCompare.$attrs.mode);

      console.info('[datePickerDateMode_005] END');
    });

    it('datePickerDateMode_006', Level.LEVEL2, async () => {
      console.info('[datePickerDateMode_006] START');

      let strJson: string = getInspectorByKey('datePicker_dateMode_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateMode_006] default mode value is: " + JSON.stringify(obj.$attrs.mode));

      expect(obj.$attrs.mode).assertEqual('DateMode.DATE');

      console.info('[datePickerDateMode_006] END');
    });
  })
}