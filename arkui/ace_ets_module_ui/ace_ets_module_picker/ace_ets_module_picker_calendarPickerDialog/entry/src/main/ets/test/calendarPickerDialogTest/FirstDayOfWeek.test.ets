/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { Driver, ON, Component } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function calendarPickerDialogFirstDayOfWeekTest() {
  describe('CalendarPickerDialogFirstDayOfWeek', () => {
    beforeAll(async () => {
      console.info('CalendarPickerDialogFirstDayOfWeek beforeAll start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/firstDayOfWeek',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CalendarPickerDialogFirstDayOfWeek state pages:' + JSON.stringify(pages));
        if (!('CalendarPickerDialogFirstDayOfWeekPage' == pages.name)) {
          console.info('get CalendarPickerDialogFirstDayOfWeek pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push CalendarPickerDialogFirstDayOfWeek page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CalendarPickerDialogFirstDayOfWeek page error: ' + err);
      }
      console.info('CalendarPickerDialogFirstDayOfWeek beforeAll end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info('CalendarPickerDialogFirstDayOfWeek after each called');
    });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_001
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0100
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.LOCAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_001] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek001'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_001] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_001] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_002
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0200
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.MON test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_002] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek002'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_002] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.MON');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_002] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_003
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0300
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.TUE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_003] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek003'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_003] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.TUE');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_003] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_004
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0400
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.WED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_004] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek004'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_004] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.WED');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_004] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_005
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0500
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.THU test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_005] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek005'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_005] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.THU');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_005] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_006
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0600
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.FRI test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_006] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek006'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_006] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.FRI');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_006] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_007
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0700
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.SAT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_007] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek007'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_007] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.SAT');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_007] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_008
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0800
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.SUN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_008] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek008'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_008] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.SUN');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_008] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_009
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_0900
     * @tc.desc   Test firstDayOfWeek property with invalid value -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_009] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek009'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_009] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_009] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_010
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_1000
     * @tc.desc   Test firstDayOfWeek property with invalid value 8 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_010] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek010'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_010] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_010] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_011
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_1100
     * @tc.desc   Test firstDayOfWeek property with undefined value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_011] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek011'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_011] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_011] END');
        done();
      });

    /**
     * @tc.name   CalendarPickerDialogFirstDayOfWeek_012
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_DIALOG_FIRST_DAY_OF_WEEK_1200
     * @tc.desc   Test firstDayOfWeek property with null value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CalendarPickerDialogFirstDayOfWeek_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[CalendarPickerDialogFirstDayOfWeek_012] START');
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('firstDayOfWeek012'));
        await CommonFunc.sleep(300);
        await button?.click();
        await CommonFunc.sleep(2000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let obj: ESObject = obj1.$children[1].$children[0].$children[0];
        console.info('[CalendarPickerDialogFirstDayOfWeek_012] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
        expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
        let cancelButton: Component = await driver.findComponent(ON.text('取消'));
        await CommonFunc.sleep(300);
        await cancelButton?.click();
        console.info('[CalendarPickerDialogFirstDayOfWeek_012] END');
        done();
      });
  })
}
