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

export default function DatePickerComponentsLoopTest() {
  describe('DatePickerComponentsLoopTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerComponentsLoopTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsLoop',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerComponentsLoopTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerComponentsLoop" == pages.name)) {
          console.info("get DatePickerComponentsLoopTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerComponentsLoopTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerComponentsLoopTest page error:" + err);
      }
      console.info("DatePickerComponentsLoopTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerCommonLoop_001
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_COMMONLOOP_PARAM_0010
     * @tc.desc   测试DatePickerComponent的COMMONLOOP属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonLoop_001', Level.LEVEL2, async () => {
      console.info('[datePickerCommonLoop_001] START');

      let strJson: string = getInspectorByKey('datePicker_loop_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonLoop_001] loop value is: " + JSON.stringify(obj.$attrs.loop));

      expect(obj.$attrs.loop).assertEqual('true');

      console.info('[datePickerCommonLoop_001] END');
    });

    /**
     * @tc.name   datePickerCommonLoop_002
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_COMMONLOOP_PARAM_0020
     * @tc.desc   测试DatePickerComponent的COMMONLOOP属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonLoop_002', Level.LEVEL2, async () => {
      console.info('[datePickerCommonLoop_002] START');

      let strJson: string = getInspectorByKey('datePicker_loop_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonLoop_002] loop value is: " + JSON.stringify(obj.$attrs.loop));

      expect(obj.$attrs.loop).assertEqual('false');

      console.info('[datePickerCommonLoop_002] END');
    });

    /**
     * @tc.name   datePickerCommonLoop_003
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_COMMONLOOP_PARAM_0030
     * @tc.desc   测试DatePickerComponent的COMMONLOOP属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonLoop_003', Level.LEVEL2, async () => {
      console.info('[datePickerCommonLoop_003] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_loop_true');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_loop_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonLoop_003] default loop value is: " + JSON.stringify(objCompare.$attrs.loop));
      console.info("[datePickerCommonLoop_003] null loop value is: " + JSON.stringify(obj.$attrs.loop));

      expect(obj.$attrs.loop).assertEqual(objCompare.$attrs.loop);

      console.info('[datePickerCommonLoop_003] END');
    });

    /**
     * @tc.name   datePickerCommonLoop_004
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_COMMONLOOP_PARAM_0040
     * @tc.desc   测试DatePickerComponent的COMMONLOOP属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonLoop_004', Level.LEVEL2, async () => {
      console.info('[datePickerCommonLoop_004] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_loop_true');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_loop_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonLoop_004] default loop value is: " + JSON.stringify(objCompare.$attrs.loop));
      console.info("[datePickerCommonLoop_004] undefined loop value is: " + JSON.stringify(obj.$attrs.loop));

      expect(obj.$attrs.loop).assertEqual(objCompare.$attrs.loop);

      console.info('[datePickerCommonLoop_004] END');
    });

    /**
     * @tc.name   datePickerCommonLoop_005
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_COMMONLOOP_PARAM_0050
     * @tc.desc   测试DatePickerComponent的COMMONLOOP属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCommonLoop_005', Level.LEVEL2, async () => {
      console.info('[datePickerCommonLoop_005] START');

      let strJson: string = getInspectorByKey('datePicker_loop_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCommonLoop_005] default loop value is: " + JSON.stringify(obj.$attrs.loop));

      expect(obj.$attrs.loop).assertEqual('true');

      console.info('[datePickerCommonLoop_005] END');
    });
  })
}