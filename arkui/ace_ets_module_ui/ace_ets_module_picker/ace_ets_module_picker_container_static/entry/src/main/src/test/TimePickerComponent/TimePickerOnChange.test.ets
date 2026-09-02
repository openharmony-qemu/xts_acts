'use static';
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
import { describe, beforeEach, it, expect, Level, beforeAll, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, ON, MouseButton, Rect } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L = 1000;
export default function TimePickerOnChangeTest() {
  describe('TimePickerOnChangeTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("TimePickerOnChangeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async (): Promise<void> => {
      console.info('TimePickerOnChangeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePickerComponent/TimePickerOnChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TimePickerOnChangeTest state pages:' + JSON.stringify(pages));
        if (!('TimePickerOnChange' == pages.name)) {
          console.info('get TimePickerOnChangeTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push TimePickerOnChangeTest page error:' + err);
      }
      console.info('TimePickerOnChangeTest beforeEach end');
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ONCHANGE_STATIC_0010
     * @tc.name     TimePickerOnChange_static_001
     * @tc.desc     Test OnTimePickerChangeCallback with HOUR_MINUTE format - verify result contains hour[0-23], minute[0-59], second[0-59]
     * @tc.level    Level.LEVEL1
     */
    it('TimePickerOnChange_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TimePickerOnChange_static_001 START');
      const driver = Driver.create();
      const picker = await driver.findComponent(ON.id('timepicker_onchange_hm'));
      console.info('TimePickerOnChange_static_001 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 2).toInt(),
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 4).toInt(),600
      );
      await Utils.sleep(SLEEP_TIME_L);
      const resultText = await driver.findComponent(ON.id('text_onchange_hm_result'));
      const resultStr = await resultText?.getText();
      console.info('TimePickerOnChange_static_001 resultStr: ' + resultStr);
      expect(resultStr).not().assertEqual('hm_result:init');
      expect(resultStr).assertContain('hm_result:');
      expect(resultStr).assertContain('hour');
      expect(resultStr).assertContain('minute');
      expect(resultStr).assertContain('second');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ONCHANGE_STATIC_0020
     * @tc.name     TimePickerOnChange_static_002
     * @tc.desc     Test OnTimePickerChangeCallback with HOUR_MINUTE_SECOND format - verify result contains hour, minute, second
     * @tc.level    Level.LEVEL1
     */
    it('TimePickerOnChange_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TimePickerOnChange_static_002 START');
      const driver = Driver.create();
      const picker = await driver.findComponent(ON.id('timepicker_onchange_hms'));
      console.info('TimePickerOnChange_static_002 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 2).toInt(),
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 4).toInt(),600
      );
      await Utils.sleep(SLEEP_TIME_L);
      const resultText = await driver.findComponent(ON.id('text_onchange_hms_result'));
      const resultStr = await resultText?.getText();
      console.info('TimePickerOnChange_static_002 resultStr: ' + resultStr);
      expect(resultStr).not().assertEqual('hms_result:init');
      expect(resultStr).assertContain('hms_result:');
      expect(resultStr).assertContain('hour');
      expect(resultStr).assertContain('minute');
      expect(resultStr).assertContain('second');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ONCHANGE_STATIC_0030
     * @tc.name     TimePickerOnChange_static_003
     * @tc.desc     Test OnTimePickerChangeCallback with 12-hour format (useMilitaryTime false) - verify callback returns 24-hour format values
     * @tc.level    Level.LEVEL1
     */
    it('TimePickerOnChange_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TimePickerOnChange_static_003 START');
      const driver = Driver.create();
      const picker = await driver.findComponent(ON.id('timepicker_onchange_12h'));
      console.info('TimePickerOnChange_static_003 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 2).toInt(),
        Math.round((left + right) / 2).toInt(),
        Math.round((top + bottom) / 4).toInt(),600
      );
      await Utils.sleep(SLEEP_TIME_L);
      const resultText = await driver.findComponent(ON.id('text_onchange_12h_result'));
      const resultStr = await resultText?.getText();
      console.info('TimePickerOnChange_static_003 resultStr: ' + resultStr);
      expect(resultStr).not().assertEqual('12h_result:init');
      expect(resultStr).assertContain('12h_result:');
      expect(resultStr).assertContain('hour');
      expect(resultStr).assertContain('minute');
      expect(resultStr).assertContain('second');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ONCHANGE_STATIC_0040
     * @tc.name     TimePickerOnChange_static_004
     * @tc.desc     Test OnTimePickerChangeCallback with undefined callback - component renders without crash
     * @tc.level    Level.LEVEL1
     */
    it('TimePickerOnChange_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TimePickerOnChange_static_004 START');
      let strJson = inspector.getInspectorByKey('timepicker_onchange_undefined');
      console.info('TimePickerOnChange_static_004 strJson: ' + strJson);
      expect(strJson).not().assertEqual('');
      let obj = JSON.parseJsonElement(strJson);
      let id: string = obj.getString('id');
      expect(id).assertEqual('timepicker_onchange_undefined');
      let compType: string = obj.getString('type');
      expect(compType).assertEqual('TimePicker');
      done();
    })
  })
}
