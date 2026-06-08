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

export default function DatePickerDisplayModeNullUndefinedTest() {
  describe('DatePickerDisplayModeNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerDisplayModeNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsDisplayMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerDisplayModeNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerDisplayModeNullUndefined" == pages.name)) {
          console.info("get DatePickerDisplayModeNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerDisplayModeNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDisplayModeNullUndefinedTest page error:" + err);
      }
      console.info("DatePickerDisplayModeNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    it('datePickerDisplayMode_001', Level.LEVEL2, async () => {
      console.info('[datePickerDisplayMode_001] START');

      let strJson: string = getInspectorByKey('datePicker_displayMode_date');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisplayMode_001] displayMode value is: " + JSON.stringify(obj.$attrs.displayMode));

      expect(obj.$attrs.displayMode).assertEqual('DisplayMode.DATE');

      console.info('[datePickerDisplayMode_001] END');
    });

    it('datePickerDisplayMode_002', Level.LEVEL2, async () => {
      console.info('[datePickerDisplayMode_002] START');

      let strJson: string = getInspectorByKey('datePicker_displayMode_time');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisplayMode_002] displayMode value is: " + JSON.stringify(obj.$attrs.displayMode));

      expect(obj.$attrs.displayMode).assertEqual('DisplayMode.TIME');

      console.info('[datePickerDisplayMode_002] END');
    });

    it('datePickerDisplayMode_003', Level.LEVEL2, async () => {
      console.info('[datePickerDisplayMode_003] START');

      let strJson: string = getInspectorByKey('datePicker_displayMode_date_time');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisplayMode_003] displayMode value is: " + JSON.stringify(obj.$attrs.displayMode));

      expect(obj.$attrs.displayMode).assertEqual('DisplayMode.DATE_TIME');

      console.info('[datePickerDisplayMode_003] END');
    });

    it('datePickerDisplayMode_004', Level.LEVEL2, async () => {
      console.info('[datePickerDisplayMode_004] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_displayMode_date');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_displayMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisplayMode_004] default displayMode value is: " + JSON.stringify(objCompare.$attrs.displayMode));
      console.info("[datePickerDisplayMode_004] null displayMode value is: " + JSON.stringify(obj.$attrs.displayMode));

      expect(obj.$attrs.displayMode).assertEqual(objCompare.$attrs.displayMode);

      console.info('[datePickerDisplayMode_004] END');
    });

    it('datePickerDisplayMode_005', Level.LEVEL2, async () => {
      console.info('[datePickerDisplayMode_005] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_displayMode_date');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_displayMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisplayMode_005] default displayMode value is: " + JSON.stringify(objCompare.$attrs.displayMode));
      console.info("[datePickerDisplayMode_005] undefined displayMode value is: " + JSON.stringify(obj.$attrs.displayMode));

      expect(obj.$attrs.displayMode).assertEqual(objCompare.$attrs.displayMode);

      console.info('[datePickerDisplayMode_005] END');
    });

    it('datePickerDisplayMode_006', Level.LEVEL2, async () => {
      console.info('[datePickerDisplayMode_006] START');

      let strJson: string = getInspectorByKey('datePicker_displayMode_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisplayMode_006] default displayMode value is: " + JSON.stringify(obj.$attrs.displayMode));

      expect(obj.$attrs.displayMode).assertEqual('DisplayMode.DATE');

      console.info('[datePickerDisplayMode_006] END');
    });
  })
}