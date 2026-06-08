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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'
import Utils from '../../MainAbility/common/Utils'

export default function DatePickerComponentResultTest() {
  describe('DatePickerComponentResultTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerComponentResultTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerComponent/DatePickerComponentsResult',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerComponentResultTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerComponentsResult" == pages.name)) {
          console.info("get DatePickerComponentResultTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerComponentResultTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerComponentResultTest page error:" + err);
      }
      console.info("DatePickerComponentResultTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerResult_001
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_RESULT_PARAM_0010
     * @tc.desc   测试DatePickerComponent的RESULT属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerResult_001', Level.LEVEL2, async () => {
      console.info('[datePickerResult_001] START');

      let driver = Driver.create();
      let datePickerRect = Utils.getComponentRect('datePicker_result_date');
      let top = datePickerRect.top
      let bottom = datePickerRect.bottom
      let right = datePickerRect.right
      let middle = (bottom - top) / 2 + top
      let left = datePickerRect.left

      await driver.swipe(Math.round(globalThis.winLeft + (right - left) / 2 + left),
        Math.round(globalThis.winTop + middle), Math.round(globalThis.winLeft + (right - left) / 2 + left),
        Math.round(0));
      await Utils.sleep(3000);

      let flagStrJson: string = getInspectorByKey('date_onChange_flag');
      let flagObj: Record<string, ESObject> = JSON.parse(flagStrJson);
      console.info("[datePickerResult_001] date onChange flag: " + JSON.stringify(flagObj.$attrs.content));
      expect(flagObj.$attrs.content).assertEqual('true');

      let yearStrJson: string = getInspectorByKey('date_result_year');
      let yearObj: Record<string, ESObject> = JSON.parse(yearStrJson);
      console.info("[datePickerResult_001] date year: " + JSON.stringify(yearObj.$attrs.content));
      expect(yearObj.$attrs.content !== 'undefined').assertTrue();

      let monthStrJson: string = getInspectorByKey('date_result_month');
      let monthObj: Record<string, ESObject> = JSON.parse(monthStrJson);
      console.info("[datePickerResult_001] date month: " + JSON.stringify(monthObj.$attrs.content));
      expect(monthObj.$attrs.content !== 'undefined').assertTrue();

      let dayStrJson: string = getInspectorByKey('date_result_day');
      let dayObj: Record<string, ESObject> = JSON.parse(dayStrJson);
      console.info("[datePickerResult_001] date day: " + JSON.stringify(dayObj.$attrs.content));
      expect(dayObj.$attrs.content !== 'undefined').assertTrue();

      let hourStrJson: string = getInspectorByKey('date_result_hour');
      let hourObj: Record<string, ESObject> = JSON.parse(hourStrJson);
      console.info("[datePickerResult_001] date hour: " + JSON.stringify(hourObj.$attrs.content));
      expect(hourObj.$attrs.content).assertEqual('undefined');

      let minuteStrJson: string = getInspectorByKey('date_result_minute');
      let minuteObj: Record<string, ESObject> = JSON.parse(minuteStrJson);
      console.info("[datePickerResult_001] date minute: " + JSON.stringify(minuteObj.$attrs.content));
      expect(minuteObj.$attrs.content).assertEqual('undefined');

      let secondStrJson: string = getInspectorByKey('date_result_second');
      let secondObj: Record<string, ESObject> = JSON.parse(secondStrJson);
      console.info("[datePickerResult_001] date second: " + JSON.stringify(secondObj.$attrs.content));
      expect(secondObj.$attrs.content).assertEqual('undefined');

      console.info('[datePickerResult_001] END');
    });

    /**
     * @tc.name   datePickerResult_002
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_RESULT_PARAM_0020
     * @tc.desc   测试DatePickerComponent的RESULT属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerResult_002', Level.LEVEL2, async () => {
      console.info('[datePickerResult_002] START');

      let monthStrJson: string = getInspectorByKey('date_result_month');
      let monthObj: Record<string, ESObject> = JSON.parse(monthStrJson);
      let monthValue: number = Number(monthObj.$attrs.content);
      console.info("[datePickerResult_002] month value: " + monthValue);
      expect(monthValue >= 0 && monthValue <= 11).assertTrue();

      let dayStrJson: string = getInspectorByKey('date_result_day');
      let dayObj: Record<string, ESObject> = JSON.parse(dayStrJson);
      let dayValue: number = Number(dayObj.$attrs.content);
      console.info("[datePickerResult_002] day value: " + dayValue);
      expect(dayValue >= 1 && dayValue <= 31).assertTrue();

      let yearStrJson: string = getInspectorByKey('date_result_year');
      let yearObj: Record<string, ESObject> = JSON.parse(yearStrJson);
      let yearValue: number = Number(yearObj.$attrs.content);
      console.info("[datePickerResult_002] year value: " + yearValue);
      expect(yearValue >= 2000 && yearValue <= 2100).assertTrue();

      console.info('[datePickerResult_002] END');
    });

    /**
     * @tc.name   datePickerResult_003
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_RESULT_PARAM_0030
     * @tc.desc   测试DatePickerComponent的RESULT属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerResult_003', Level.LEVEL2, async () => {
      console.info('[datePickerResult_003] START');

      let driver = Driver.create();
      let timePickerRect = Utils.getComponentRect('datePicker_result_time');
      let top = timePickerRect.top
      let bottom = timePickerRect.bottom
      let right = timePickerRect.right
      let middle = (bottom - top) / 2 + top
      let left = timePickerRect.left

      await driver.swipe(Math.round(globalThis.winLeft + (right - left) / 2 + left),
        Math.round(globalThis.winTop + middle), Math.round(globalThis.winLeft + (right - left) / 2 + left),
        Math.round(0));
      await Utils.sleep(3000);

      let flagStrJson: string = getInspectorByKey('time_onChange_flag');
      let flagObj: Record<string, ESObject> = JSON.parse(flagStrJson);
      console.info("[datePickerResult_003] time onChange flag: " + JSON.stringify(flagObj.$attrs.content));
      expect(flagObj.$attrs.content).assertEqual('true');

      let hourStrJson: string = getInspectorByKey('time_result_hour');
      let hourObj: Record<string, ESObject> = JSON.parse(hourStrJson);
      console.info("[datePickerResult_003] time hour: " + JSON.stringify(hourObj.$attrs.content));
      expect(hourObj.$attrs.content !== 'undefined').assertTrue();

      let minuteStrJson: string = getInspectorByKey('time_result_minute');
      let minuteObj: Record<string, ESObject> = JSON.parse(minuteStrJson);
      console.info("[datePickerResult_003] time minute: " + JSON.stringify(minuteObj.$attrs.content));
      expect(minuteObj.$attrs.content !== 'undefined').assertTrue();

      let secondStrJson: string = getInspectorByKey('time_result_second');
      let secondObj: Record<string, ESObject> = JSON.parse(secondStrJson);
      console.info("[datePickerResult_003] time second: " + JSON.stringify(secondObj.$attrs.content));
      expect(secondObj.$attrs.content !== 'undefined').assertTrue();

      let yearStrJson: string = getInspectorByKey('time_result_year');
      let yearObj: Record<string, ESObject> = JSON.parse(yearStrJson);
      console.info("[datePickerResult_003] time year: " + JSON.stringify(yearObj.$attrs.content));
      expect(yearObj.$attrs.content).assertEqual('undefined');

      let monthStrJson: string = getInspectorByKey('time_result_month');
      let monthObj: Record<string, ESObject> = JSON.parse(monthStrJson);
      console.info("[datePickerResult_003] time month: " + JSON.stringify(monthObj.$attrs.content));
      expect(monthObj.$attrs.content).assertEqual('undefined');

      let dayStrJson: string = getInspectorByKey('time_result_day');
      let dayObj: Record<string, ESObject> = JSON.parse(dayStrJson);
      console.info("[datePickerResult_003] time day: " + JSON.stringify(dayObj.$attrs.content));
      expect(dayObj.$attrs.content).assertEqual('undefined');

      console.info('[datePickerResult_003] END');
    });

    /**
     * @tc.name   datePickerResult_004
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_RESULT_PARAM_0040
     * @tc.desc   测试DatePickerComponent的RESULT属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerResult_004', Level.LEVEL2, async () => {
      console.info('[datePickerResult_004] START');

      let hourStrJson: string = getInspectorByKey('time_result_hour');
      let hourObj: Record<string, ESObject> = JSON.parse(hourStrJson);
      let hourValue: number = Number(hourObj.$attrs.content);
      console.info("[datePickerResult_004] hour value: " + hourValue);
      expect(hourValue >= 0 && hourValue <= 23).assertTrue();

      let minuteStrJson: string = getInspectorByKey('time_result_minute');
      let minuteObj: Record<string, ESObject> = JSON.parse(minuteStrJson);
      let minuteValue: number = Number(minuteObj.$attrs.content);
      console.info("[datePickerResult_004] minute value: " + minuteValue);
      expect(minuteValue >= 0 && minuteValue <= 59).assertTrue();

      let secondStrJson: string = getInspectorByKey('time_result_second');
      let secondObj: Record<string, ESObject> = JSON.parse(secondStrJson);
      let secondValue: number = Number(secondObj.$attrs.content);
      console.info("[datePickerResult_004] second value: " + secondValue);
      expect(secondValue >= 0 && secondValue <= 59).assertTrue();

      console.info('[datePickerResult_004] END');
    });

    /**
     * @tc.name   datePickerResult_005
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_RESULT_PARAM_0050
     * @tc.desc   测试DatePickerComponent的RESULT属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerResult_005', Level.LEVEL2, async () => {
      console.info('[datePickerResult_005] START');

      let strJson: string = getInspectorByKey('date_scrollStop_flag');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[datePickerResult_005] scrollStop flag: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('true');

      console.info('[datePickerResult_005] END');
    });
  })
}