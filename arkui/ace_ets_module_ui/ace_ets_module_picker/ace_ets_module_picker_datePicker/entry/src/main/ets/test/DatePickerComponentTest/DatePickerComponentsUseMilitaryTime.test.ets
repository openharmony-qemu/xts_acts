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

export default function DatePickerComponentsUseMilitaryTimeTest() {
  describe('DatePickerComponentsUseMilitaryTimeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerComponentsUseMilitaryTimeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsUseMilitaryTime',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerComponentsUseMilitaryTimeTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerComponentsUseMilitaryTime" == pages.name)) {
          console.info("get DatePickerComponentsUseMilitaryTimeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerComponentsUseMilitaryTimeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerComponentsUseMilitaryTimeTest page error:" + err);
      }
      console.info("DatePickerComponentsUseMilitaryTimeTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    it('datePickerTimeMilitary_001', Level.LEVEL2, async () => {
      console.info('[datePickerTimeMilitary_001] START');

      let strJson: string = getInspectorByKey('datePicker_military_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeMilitary_001] useMilitaryTime value is: " + JSON.stringify(obj.$attrs.useMilitaryTime));

      expect(obj.$attrs.useMilitaryTime).assertEqual('false');

      console.info('[datePickerTimeMilitary_001] END');
    });

    it('datePickerTimeMilitary_002', Level.LEVEL2, async () => {
      console.info('[datePickerTimeMilitary_002] START');

      let strJson: string = getInspectorByKey('datePicker_military_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeMilitary_002] useMilitaryTime value is: " + JSON.stringify(obj.$attrs.useMilitaryTime));

      expect(obj.$attrs.useMilitaryTime).assertEqual('true');

      console.info('[datePickerTimeMilitary_002] END');
    });

    it('datePickerTimeMilitary_003', Level.LEVEL2, async () => {
      console.info('[datePickerTimeMilitary_003] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_military_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_military_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeMilitary_003] default useMilitaryTime value is: " + JSON.stringify(objCompare.$attrs.useMilitaryTime));
      console.info("[datePickerTimeMilitary_003] null useMilitaryTime value is: " + JSON.stringify(obj.$attrs.useMilitaryTime));

      expect(obj.$attrs.useMilitaryTime).assertEqual(objCompare.$attrs.useMilitaryTime);

      console.info('[datePickerTimeMilitary_003] END');
    });

    it('datePickerTimeMilitary_004', Level.LEVEL2, async () => {
      console.info('[datePickerTimeMilitary_004] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_military_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_military_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeMilitary_004] default useMilitaryTime value is: " + JSON.stringify(objCompare.$attrs.useMilitaryTime));
      console.info("[datePickerTimeMilitary_004] undefined useMilitaryTime value is: " + JSON.stringify(obj.$attrs.useMilitaryTime));

      expect(obj.$attrs.useMilitaryTime).assertEqual(objCompare.$attrs.useMilitaryTime);

      console.info('[datePickerTimeMilitary_004] END');
    });

    it('datePickerTimeMilitary_005', Level.LEVEL2, async () => {
      console.info('[datePickerTimeMilitary_005] START');

      let strJson: string = getInspectorByKey('datePicker_military_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTimeMilitary_005] default useMilitaryTime value is: " + JSON.stringify(obj.$attrs.useMilitaryTime));

      expect(obj.$attrs.useMilitaryTime).assertEqual('false');

      console.info('[datePickerTimeMilitary_005] END');
    });
  })
}