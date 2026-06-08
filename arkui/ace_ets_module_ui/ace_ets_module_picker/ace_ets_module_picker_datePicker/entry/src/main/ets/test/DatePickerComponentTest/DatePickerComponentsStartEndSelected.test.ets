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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'

export default function DatePickerComponentsStartEndSelectedTest() {
  describe('DatePickerComponentsStartEndSelectedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerComponentsStartEndSelectedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsStartEndSelected',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerComponentsStartEndSelectedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerComponentsStartEndSelected" == pages.name)) {
          console.info("get DatePickerComponentsStartEndSelectedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerComponentsStartEndSelectedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerComponentsStartEndSelectedTest page error:" + err);
      }
      console.info("DatePickerComponentsStartEndSelectedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    it('datePickerCommonStart_001', Level.LEVEL2, async () => {
      console.info('[datePickerCommonStart_001] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_start_end_selected_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_start_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonStart_001] default start value is: " + JSON.stringify(objCompare.$attrs.start));
      console.info("[datePickerCommonStart_001] null start value is: " + JSON.stringify(obj.$attrs.start));

      expect(obj.$attrs.start).assertEqual(objCompare.$attrs.start);

      console.info('[datePickerCommonStart_001] END');
    });

    it('datePickerCommonStart_002', Level.LEVEL2, async () => {
      console.info('[datePickerCommonStart_002] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_start_end_selected_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_start_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonStart_002] default start value is: " + JSON.stringify(objCompare.$attrs.start));
      console.info("[datePickerCommonStart_002] undefined start value is: " + JSON.stringify(obj.$attrs.start));

      expect(obj.$attrs.start).assertEqual(objCompare.$attrs.start);

      console.info('[datePickerCommonStart_002] END');
    });

    it('datePickerCommonEnd_001', Level.LEVEL2, async () => {
      console.info('[datePickerCommonEnd_001] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_start_end_selected_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_end_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonEnd_001] default end value is: " + JSON.stringify(objCompare.$attrs.end));
      console.info("[datePickerCommonEnd_001] null end value is: " + JSON.stringify(obj.$attrs.end));

      expect(obj.$attrs.end).assertEqual(objCompare.$attrs.end);

      console.info('[datePickerCommonEnd_001] END');
    });

    it('datePickerCommonEnd_002', Level.LEVEL2, async () => {
      console.info('[datePickerCommonEnd_002] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_start_end_selected_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_end_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonEnd_002] default end value is: " + JSON.stringify(objCompare.$attrs.end));
      console.info("[datePickerCommonEnd_002] undefined end value is: " + JSON.stringify(objCompare.$attrs.end));

      expect(obj.$attrs.end).assertEqual(objCompare.$attrs.end);

      console.info('[datePickerCommonEnd_002] END');
    });

    it('datePickerCommonSelected_001', Level.LEVEL2, async () => {
      console.info('[datePickerCommonSelected_001] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_start_end_selected_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_selected_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonSelected_001] default selected value is: " + JSON.stringify(objCompare.$attrs.selected));
      console.info("[datePickerCommonSelected_001] null selected value is: " + JSON.stringify(obj.$attrs.selected));

      expect(obj.$attrs.selected).assertEqual(objCompare.$attrs.selected);

      console.info('[datePickerCommonSelected_001] END');
    });

    it('datePickerCommonSelected_002', Level.LEVEL2, async () => {
      console.info('[datePickerCommonSelected_002] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_start_end_selected_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_selected_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonSelected_002] default selected value is: " + JSON.stringify(objCompare.$attrs.selected));
      console.info("[datePickerCommonSelected_002] undefined selected value is: " + JSON.stringify(obj.$attrs.selected));

      expect(obj.$attrs.selected).assertEqual(objCompare.$attrs.selected);

      console.info('[datePickerCommonSelected_002] END');
    });

    it('datePickerCommonStartEndSelected_001', Level.LEVEL2, async () => {
      console.info('[datePickerCommonStartEndSelected_001] START');

      let strJson: string = getInspectorByKey('datePicker_start_end_selected_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonStartEndSelected_001] start value is: " + JSON.stringify(obj.$attrs.start));
      console.info("[datePickerCommonStartEndSelected_001] end value is: " + JSON.stringify(obj.$attrs.end));
      console.info("[datePickerCommonStartEndSelected_001] selected value is: " + JSON.stringify(obj.$attrs.selected));

      expect(obj.$attrs.start !== undefined).assertTrue();
      expect(obj.$attrs.end !== undefined).assertTrue();
      expect(obj.$attrs.selected !== undefined).assertTrue();

      console.info('[datePickerCommonStartEndSelected_001] END');
    });
  })
}