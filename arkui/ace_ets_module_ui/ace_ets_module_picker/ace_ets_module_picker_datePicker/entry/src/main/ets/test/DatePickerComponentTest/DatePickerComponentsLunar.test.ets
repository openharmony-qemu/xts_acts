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

export default function DatePickerComponentsLunarTest() {
  describe('DatePickerComponentsLunarTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerComponentsLunarTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsLunar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerComponentsLunarTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerComponentsLunar" == pages.name)) {
          console.info("get DatePickerComponentsLunarTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerComponentsLunarTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerComponentsLunarTest page error:" + err);
      }
      console.info("DatePickerComponentsLunarTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerDateLunar_001
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LUNAR_PARAM_0010
     * @tc.desc   测试DatePickerComponent的LUNAR属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDateLunar_001', Level.LEVEL2, async () => {
      console.info('[datePickerDateLunar_001] START');

      let strJson: string = getInspectorByKey('datePicker_lunar_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateLunar_001] lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      expect(obj.$attrs.lunar).assertEqual('false');

      console.info('[datePickerDateLunar_001] END');
    });

    /**
     * @tc.name   datePickerDateLunar_002
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LUNAR_PARAM_0020
     * @tc.desc   测试DatePickerComponent的LUNAR属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDateLunar_002', Level.LEVEL2, async () => {
      console.info('[datePickerDateLunar_002] START');

      let strJson: string = getInspectorByKey('datePicker_lunar_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateLunar_002] lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      expect(obj.$attrs.lunar).assertEqual('true');

      console.info('[datePickerDateLunar_002] END');
    });

    /**
     * @tc.name   datePickerDateLunar_003
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LUNAR_PARAM_0030
     * @tc.desc   测试DatePickerComponent的LUNAR属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDateLunar_003', Level.LEVEL2, async () => {
      console.info('[datePickerDateLunar_003] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_lunar_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_lunar_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateLunar_003] default lunar value is: " + JSON.stringify(objCompare.$attrs.lunar));
      console.info("[datePickerDateLunar_003] null lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      expect(obj.$attrs.lunar).assertEqual(objCompare.$attrs.lunar);

      console.info('[datePickerDateLunar_003] END');
    });

    /**
     * @tc.name   datePickerDateLunar_004
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LUNAR_PARAM_0040
     * @tc.desc   测试DatePickerComponent的LUNAR属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDateLunar_004', Level.LEVEL2, async () => {
      console.info('[datePickerDateLunar_004] START');

      let strJsonCompare: string = getInspectorByKey('datePicker_lunar_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      let strJson: string = getInspectorByKey('datePicker_lunar_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateLunar_004] default lunar value is: " + JSON.stringify(objCompare.$attrs.lunar));
      console.info("[datePickerDateLunar_004] undefined lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      expect(obj.$attrs.lunar).assertEqual(objCompare.$attrs.lunar);

      console.info('[datePickerDateLunar_004] END');
    });

    /**
     * @tc.name   datePickerDateLunar_005
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LUNAR_PARAM_0050
     * @tc.desc   测试DatePickerComponent的LUNAR属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDateLunar_005', Level.LEVEL2, async () => {
      console.info('[datePickerDateLunar_005] START');

      let strJson: string = getInspectorByKey('datePicker_lunar_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDateLunar_005] default lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      expect(obj.$attrs.lunar).assertEqual('false');

      console.info('[datePickerDateLunar_005] END');
    });
  })
}