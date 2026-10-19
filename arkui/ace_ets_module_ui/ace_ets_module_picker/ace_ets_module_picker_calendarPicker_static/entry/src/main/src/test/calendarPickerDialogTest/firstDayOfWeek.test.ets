'use static';
/*
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
import { describe, beforeEach, it, expect, Level, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function CalendarPickerDialogFirstDayOfWeekTest() {
  describe('CalendarPickerDialogFirstDayOfWeekTest', () => {
    beforeEach(async () => {
      console.info('CalendarPickerDialogFirstDayOfWeekTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/firstDayOfWeek',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('CalendarPickerDialogFirstDayOfWeekExample' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CalendarPickerDialogFirstDayOfWeekTest page error: ' + err);
      }
    });

    afterEach(async () => {
      try { await CommonFunc.sleep(2000); } catch (err) { console.error('' + err); }
      console.info('CalendarPickerDialogFirstDayOfWeekTest after each called');
    });

    /**
     * @tc.number   CalendarPickerDialogFirstDayOfWeekTest_static_001
     * @tc.name     CalendarPickerDialogFirstDayOfWeekTest_static_001
     * @tc.desc     Verify CalendarPickerDialog firstDayOfWeek property with CalendarFirstDayOfWeek.LOCAL test.
     * @tc.level    Level.LEVEL0
     */
    it('CalendarPickerDialogFirstDayOfWeekTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('firstDayOfWeek001'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        let dialog = tree.getArray('$children')[1];
        let column = dialog.getArray('$children')[0];
        let firstDayOfWeek: string = column.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerDialogFirstDayOfWeekTest_static_001 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
        let btn1 = await driver.findComponent(ON.text('确定'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        done();
      } catch (err) {
        console.error('CalendarPickerDialogFirstDayOfWeekTest_static_001 error: ' + err);
        done();
      }
    })

    /**
     * @tc.number   CalendarPickerDialogFirstDayOfWeekTest_static_002
     * @tc.name     CalendarPickerDialogFirstDayOfWeekTest_static_002
     * @tc.desc     Verify CalendarPickerDialog firstDayOfWeek property with CalendarFirstDayOfWeek.MON test.
     * @tc.level    Level.LEVEL0
     */
    it('CalendarPickerDialogFirstDayOfWeekTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('firstDayOfWeek002'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        let dialog = tree.getArray('$children')[1];
        let column = dialog.getArray('$children')[0];
        let firstDayOfWeek: string = column.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerDialogFirstDayOfWeekTest_static_002 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.MON');
        let btn1 = await driver.findComponent(ON.text('确定'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        done();
      } catch (err) {
        console.error('CalendarPickerDialogFirstDayOfWeekTest_static_002 error: ' + err);
        done();
      }
    })

    /**
     * @tc.number   CalendarPickerDialogFirstDayOfWeekTest_static_003
     * @tc.name     CalendarPickerDialogFirstDayOfWeekTest_static_003
     * @tc.desc     Verify CalendarPickerDialog firstDayOfWeek property with CalendarFirstDayOfWeek.TUE test.
     * @tc.level    Level.LEVEL0
     */
    it('CalendarPickerDialogFirstDayOfWeekTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('firstDayOfWeek003'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        let dialog = tree.getArray('$children')[1];
        let column = dialog.getArray('$children')[0];
        let firstDayOfWeek: string = column.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerDialogFirstDayOfWeekTest_static_003 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.TUE');
        let btn1 = await driver.findComponent(ON.text('确定'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        done();
      } catch (err) {
        console.error('CalendarPickerDialogFirstDayOfWeekTest_static_003 error: ' + err);
        done();
      }
    })

    /**
     * @tc.number   CalendarPickerDialogFirstDayOfWeekTest_static_004
     * @tc.name     CalendarPickerDialogFirstDayOfWeekTest_static_004
     * @tc.desc     Verify CalendarPickerDialog firstDayOfWeek property with CalendarFirstDayOfWeek.WED test.
     * @tc.level    Level.LEVEL0
     */
    it('CalendarPickerDialogFirstDayOfWeekTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('firstDayOfWeek004'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        let dialog = tree.getArray('$children')[1];
        let column = dialog.getArray('$children')[0];
        let firstDayOfWeek: string = column.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerDialogFirstDayOfWeekTest_static_004 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.WED');
        let btn1 = await driver.findComponent(ON.text('确定'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        done();
      } catch (err) {
        console.error('CalendarPickerDialogFirstDayOfWeekTest_static_004 error: ' + err);
        done();
      }
    })

    /**
     * @tc.number   CalendarPickerDialogFirstDayOfWeekTest_static_005
     * @tc.name     CalendarPickerDialogFirstDayOfWeekTest_static_005
     * @tc.desc     Verify CalendarPickerDialog firstDayOfWeek property with CalendarFirstDayOfWeek.THU test.
     * @tc.level    Level.LEVEL0
     */
    it('CalendarPickerDialogFirstDayOfWeekTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('firstDayOfWeek005'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        let dialog = tree.getArray('$children')[1];
        let column = dialog.getArray('$children')[0];
        let firstDayOfWeek: string = column.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerDialogFirstDayOfWeekTest_static_005 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.THU');
        let btn1 = await driver.findComponent(ON.text('确定'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        done();
      } catch (err) {
        console.error('CalendarPickerDialogFirstDayOfWeekTest_static_005 error: ' + err);
        done();
      }
    })

    /**
     * @tc.number   CalendarPickerDialogFirstDayOfWeekTest_static_006
     * @tc.name     CalendarPickerDialogFirstDayOfWeekTest_static_006
     * @tc.desc     Verify CalendarPickerDialog firstDayOfWeek property with CalendarFirstDayOfWeek.FRI test.
     * @tc.level    Level.LEVEL0
     */
    it('CalendarPickerDialogFirstDayOfWeekTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('firstDayOfWeek006'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        let dialog = tree.getArray('$children')[1];
        let column = dialog.getArray('$children')[0];
        let firstDayOfWeek: string = column.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerDialogFirstDayOfWeekTest_static_006 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.FRI');
        let btn1 = await driver.findComponent(ON.text('确定'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        done();
      } catch (err) {
        console.error('CalendarPickerDialogFirstDayOfWeekTest_static_006 error: ' + err);
        done();
      }
    })

    /**
     * @tc.number   CalendarPickerDialogFirstDayOfWeekTest_static_007
     * @tc.name     CalendarPickerDialogFirstDayOfWeekTest_static_007
     * @tc.desc     Verify CalendarPickerDialog firstDayOfWeek property with CalendarFirstDayOfWeek.SAT test.
     * @tc.level    Level.LEVEL0
     */
    it('CalendarPickerDialogFirstDayOfWeekTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('firstDayOfWeek007'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        let dialog = tree.getArray('$children')[1];
        let column = dialog.getArray('$children')[0];
        let firstDayOfWeek: string = column.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerDialogFirstDayOfWeekTest_static_007 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.SAT');
        let btn1 = await driver.findComponent(ON.text('确定'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        done();
      } catch (err) {
        console.error('CalendarPickerDialogFirstDayOfWeekTest_static_007 error: ' + err);
        done();
      }
    })

    /**
     * @tc.number   CalendarPickerDialogFirstDayOfWeekTest_static_008
     * @tc.name     CalendarPickerDialogFirstDayOfWeekTest_static_008
     * @tc.desc     Verify CalendarPickerDialog firstDayOfWeek property with CalendarFirstDayOfWeek.SUN test.
     * @tc.level    Level.LEVEL0
     */
    it('CalendarPickerDialogFirstDayOfWeekTest_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('firstDayOfWeek008'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        let dialog = tree.getArray('$children')[1];
        let column = dialog.getArray('$children')[0];
        let firstDayOfWeek: string = column.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerDialogFirstDayOfWeekTest_static_008 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.SUN');
        let btn1 = await driver.findComponent(ON.text('确定'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        done();
      } catch (err) {
        console.error('CalendarPickerDialogFirstDayOfWeekTest_static_008 error: ' + err);
        done();
      }
    })
  })
}
