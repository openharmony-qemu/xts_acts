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

export default function DatePickerTimeFormatNullUndefinedTest() {
  describe('DatePickerTimeFormatNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerTimeFormatNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsTimeFormat',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerTimeFormatNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerComponentsTimeFormat" == pages.name)) {
          console.info("get DatePickerTimeFormatNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerTimeFormatNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerTimeFormatNullUndefinedTest page error:" + err);
      }
      console.info("DatePickerTimeFormatNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    it('datePickerTimeFormat_001', Level.LEVEL2, async () => {
      console.info('[datePickerTimeFormat_001] START');

      let strJson: string = getInspectorByKey('datePicker_timeFormat_hour_minute');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeFormat_001] format value is: " + JSON.stringify(obj.$attrs.format));

      expect(obj.$attrs.format).assertEqual('TimeFormat.HOUR_MINUTE');

      console.info('[datePickerTimeFormat_001] END');
    });

    it('datePickerTimeFormat_002', Level.LEVEL2, async () => {
      console.info('[datePickerTimeFormat_002] START');

      let strJson: string = getInspectorByKey('datePicker_timeFormat_hour_minute_second');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeFormat_002] format value is: " + JSON.stringify(obj.$attrs.format));

      expect(obj.$attrs.format).assertEqual('TimeFormat.HOUR_MINUTE_SECOND');

      console.info('[datePickerTimeFormat_002] END');
    });

    it('datePickerTimeFormat_003', Level.LEVEL2, async () => {
      console.info('[datePickerTimeFormat_003] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_timeFormat_hour_minute');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_timeFormat_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeFormat_003] default format value is: " + JSON.stringify(objCompare.$attrs.format));
      console.info("[datePickerTimeFormat_003] null format value is: " + JSON.stringify(obj.$attrs.format));

      expect(obj.$attrs.format).assertEqual(objCompare.$attrs.format);

      console.info('[datePickerTimeFormat_003] END');
    });

    it('datePickerTimeFormat_004', Level.LEVEL2, async () => {
      console.info('[datePickerTimeFormat_004] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_timeFormat_hour_minute');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_timeFormat_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeFormat_004] default format value is: " + JSON.stringify(objCompare.$attrs.format));
      console.info("[datePickerTimeFormat_004] undefined format value is: " + JSON.stringify(obj.$attrs.format));

      expect(obj.$attrs.format).assertEqual(objCompare.$attrs.format);

      console.info('[datePickerTimeFormat_004] END');
    });

    it('datePickerTimeFormat_005', Level.LEVEL2, async () => {
      console.info('[datePickerTimeFormat_005] START');

      let strJson: string = getInspectorByKey('datePicker_timeFormat_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeFormat_005] default format value is: " + JSON.stringify(obj.$attrs.format));

      expect(obj.$attrs.format).assertEqual('TimeFormat.HOUR_MINUTE');

      console.info('[datePickerTimeFormat_005] END');
    });
  })
}