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

export default function DatePickerComponentsEnableHapticFeedbackTest() {
  describe('DatePickerComponentsEnableHapticFeedbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerComponentsEnableHapticFeedbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsEnableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerComponentsEnableHapticFeedbackTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerComponentsEnableHapticFeedback" == pages.name)) {
          console.info("get DatePickerComponentsEnableHapticFeedbackTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerComponentsEnableHapticFeedbackTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerComponentsEnableHapticFeedbackTest page error:" + err);
      }
      console.info("DatePickerComponentsEnableHapticFeedbackTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerEnableHapticFeedback_001
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_ENABLEHAPTICFEEDBACK_PARAM_0010
     * @tc.desc   测试DatePickerComponent的EnableHapticFeedback属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonHaptic_001', Level.LEVEL2, async () => {
      console.info('[datePickerCommonHaptic_001] START');

      let strJson: string = getInspectorByKey('datePicker_haptic_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonHaptic_001] enableHapticFeedback value is: " + JSON.stringify(obj.$attrs.enableHapticFeedback));

      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');

      console.info('[datePickerCommonHaptic_001] END');
    });

    /**
     * @tc.name   datePickerEnableHapticFeedback_002
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_ENABLEHAPTICFEEDBACK_PARAM_0020
     * @tc.desc   测试DatePickerComponent的EnableHapticFeedback属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonHaptic_002', Level.LEVEL2, async () => {
      console.info('[datePickerCommonHaptic_002] START');

      let strJson: string = getInspectorByKey('datePicker_haptic_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonHaptic_002] enableHapticFeedback value is: " + JSON.stringify(obj.$attrs.enableHapticFeedback));

      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');

      console.info('[datePickerCommonHaptic_002] END');
    });

    /**
     * @tc.name   datePickerEnableHapticFeedback_003
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_ENABLEHAPTICFEEDBACK_PARAM_0030
     * @tc.desc   测试DatePickerComponent的EnableHapticFeedback属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonHaptic_003', Level.LEVEL2, async () => {
      console.info('[datePickerCommonHaptic_003] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_haptic_true');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_haptic_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonHaptic_003] default enableHapticFeedback value is: " + JSON.stringify(objCompare.$attrs.enableHapticFeedback));
      console.info("[datePickerCommonHaptic_003] null enableHapticFeedback value is: " + JSON.stringify(obj.$attrs.enableHapticFeedback));

      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);

      console.info('[datePickerCommonHaptic_003] END');
    });

    /**
     * @tc.name   datePickerEnableHapticFeedback_004
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_ENABLEHAPTICFEEDBACK_PARAM_0040
     * @tc.desc   测试DatePickerComponent的EnableHapticFeedback属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonHaptic_004', Level.LEVEL2, async () => {
      console.info('[datePickerCommonHaptic_004] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_haptic_true');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_haptic_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonHaptic_004] default enableHapticFeedback value is: " + JSON.stringify(objCompare.$attrs.enableHapticFeedback));
      console.info("[datePickerCommonHaptic_004] undefined enableHapticFeedback value is: " + JSON.stringify(obj.$attrs.enableHapticFeedback));

      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);

      console.info('[datePickerCommonHaptic_004] END');
    });

    /**
     * @tc.name   datePickerEnableHapticFeedback_005
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_ENABLEHAPTICFEEDBACK_PARAM_0050
     * @tc.desc   测试DatePickerComponent的EnableHapticFeedback属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonHaptic_005', Level.LEVEL2, async () => {
      console.info('[datePickerCommonHaptic_005] START');

      let strJson: string = getInspectorByKey('datePicker_haptic_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonHaptic_005] default enableHapticFeedback value is: " + JSON.stringify(obj.$attrs.enableHapticFeedback));

      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');

      console.info('[datePickerCommonHaptic_005] END');
    });
  })
}