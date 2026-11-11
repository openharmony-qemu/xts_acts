'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic'
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common'
import Utils from '../../../ets/MainAbility/common/Utils'
import { Driver, ON, Component, Rect } from '@ohos.UiTest'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'

const SLEEP_TIME = 1000

export default function DatePickerComponentExtendSelectedTest() {
  describe('DatePickerComponentExtendSelectedTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('DatePickerComponentExtendSelectedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentExtendSelected',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DatePickerComponentExtendSelectedTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DatePickerComponentExtendSelected') {
          routerInstance.replaceUrl(options)
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DatePickerComponentExtendSelectedTest replaceUrl error: ' + err);
        expect().assertFail();
      }
      console.info("DatePickerComponentExtendSelectedTest beforeEach end");
    })

    afterEach(async () => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('DatePickerComponentExtendSelectedTest sleep err: ' + JSON.stringify(err));
      }
      console.info("DatePickerComponentExtendSelectedTest after each called");
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_EXTENDSELECTED_0100
     * @tc.name DatePickerComponentExtendSelected_date_0100
     * @tc.desc Verify DatePickerComponent extendSelected with Date type value, initial selected date is applied
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentExtendSelected_date_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentExtendSelected_date_0100 START')
      try {
        let driver = await Driver.create();
        // 验证初始状态：onChange 未触发
        let strJson = inspector.getInspectorByKey('text_extendSelected_date_result');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('onChange1: false');

        // 滑动组件触发 onChange 回调
        let datePickerComp = await driver.findComponent(ON.id('datePickerComponent_extendSelected_date'));
        let bounds = await (datePickerComp?.getBounds() as Promise<Rect>);
        let centerX = Math.round(bounds.left + (bounds.right - bounds.left) / 2).toInt();
        let centerY = Math.round(bounds.top + (bounds.bottom - bounds.top) / 2).toInt();
        let displayId = await datePickerComp?.getDisplayId();
        await driver.swipeBetween(
          { x: Math.round(centerX).toInt(), y: Math.round(centerY).toInt(), displayId: displayId },
          { x: Math.round(centerX).toInt(), y: Math.round(centerY + 100).toInt(), displayId: displayId }, 600
        );
        await CommonFunc.sleep(SLEEP_TIME);

        // 验证 onChange 已触发，且年份与 extendSelected 设置的 Date(2025, 5, 15) 一致
        let strJson1 = inspector.getInspectorByKey('text_extendSelected_date_result');
        let obj1 = JSON.parseJsonElement(strJson1);
        let content1: string = obj1.getElement('$attrs').getString('content');
        expect(content1).assertContain('onChange1: true');
        expect(content1).assertContain('year:2025');
        done();
      } catch (err) {
        console.error('DatePickerComponentExtendSelected_date_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_EXTENDSELECTED_0200
     * @tc.name DatePickerComponentExtendSelected_result_0200
     * @tc.desc Verify DatePickerComponent extendSelected with DatePickerComponentResult type value, initial selected date is applied
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentExtendSelected_result_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentExtendSelected_result_0200 START')
      try {
        let driver = await Driver.create();
        // 验证初始状态：onChange 未触发
        let strJson = inspector.getInspectorByKey('text_extendSelected_result_result');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('onChange2: false');

        // 滑动组件触发 onChange 回调
        let datePickerComp = await driver.findComponent(ON.id('datePickerComponent_extendSelected_result'));
        let bounds = await (datePickerComp?.getBounds() as Promise<Rect>);
        let centerX = Math.round(bounds.left + (bounds.right - bounds.left) / 2).toInt();
        let centerY = Math.round(bounds.top + (bounds.bottom - bounds.top) / 2).toInt();
        let displayId = await datePickerComp?.getDisplayId();
        await driver.swipeBetween(
          { x: Math.round(centerX).toInt(), y: Math.round(centerY).toInt(), displayId: displayId },
          { x: Math.round(centerX).toInt(), y: Math.round(centerY + 100).toInt(), displayId: displayId }, 600
        );
        await CommonFunc.sleep(SLEEP_TIME);

        // 验证 onChange 已触发，且年份与 extendSelected 设置的 {year: 2026, month: 0, day: 1} 一致
        let strJson1 = inspector.getInspectorByKey('text_extendSelected_result_result');
        let obj1 = JSON.parseJsonElement(strJson1);
        let content1: string = obj1.getElement('$attrs').getString('content');
        expect(content1).assertContain('onChange2: true');
        expect(content1).assertContain('year:2026');
        done();
      } catch (err) {
        console.error('DatePickerComponentExtendSelected_result_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_EXTENDSELECTED_0300
     * @tc.name DatePickerComponentExtendSelected_undefined_0300
     * @tc.desc Verify DatePickerComponent extendSelected undefined, default behavior (current system date) is used
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentExtendSelected_undefined_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentExtendSelected_undefined_0300 START')
      try {
        let driver = await Driver.create();
        // 验证初始状态：onChange 未触发
        let strJson = inspector.getInspectorByKey('text_extendSelected_undefined_result');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('onChange3: false');

        // 滑动组件触发 onChange 回调
        let datePickerComp = await driver.findComponent(ON.id('datePickerComponent_extendSelected_undefined'));
        let bounds = await (datePickerComp?.getBounds() as Promise<Rect>);
        let centerX = Math.round(bounds.left + (bounds.right - bounds.left) / 2).toInt();
        let centerY = Math.round(bounds.top + (bounds.bottom - bounds.top) / 2).toInt();
        let displayId = await datePickerComp?.getDisplayId();
        await driver.swipeBetween(
          { x: Math.round(centerX).toInt(), y: Math.round(centerY).toInt(), displayId: displayId },
          { x: Math.round(centerX).toInt(), y: Math.round(centerY + 100).toInt(), displayId: displayId }, 600
        );
        await CommonFunc.sleep(SLEEP_TIME);

        // 验证 onChange 已触发，且返回了有效的年份值（默认当前系统日期）
        let strJson1 = inspector.getInspectorByKey('text_extendSelected_undefined_result');
        let obj1 = JSON.parseJsonElement(strJson1);
        let content1: string = obj1.getElement('$attrs').getString('content');
        expect(content1).assertContain('onChange3: true');
        expect(content1).assertContain('year:');
        done();
      } catch (err) {
        console.error('DatePickerComponentExtendSelected_undefined_0300 error: ' + err);
        expect().assertFail();
        done();
      }
    })
  })
}
