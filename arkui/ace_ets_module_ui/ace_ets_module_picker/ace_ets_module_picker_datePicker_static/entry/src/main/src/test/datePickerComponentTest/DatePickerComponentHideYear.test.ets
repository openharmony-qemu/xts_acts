'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function DatePickerComponentHideYearTest() {
  describe('DatePickerComponentHideYearTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('DatePickerComponentHideYearTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentHideYear',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DatePickerComponentHideYearTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DatePickerComponentHideYear') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DatePickerComponentHideYearTest replaceUrl error: ' + err);
        expect().assertFail();
      }
      console.info("DatePickerComponentHideYearTest beforeEach end");
    })

    afterEach(async () => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('DatePickerComponentHideYearTest sleep err: ' + JSON.stringify(err));
      }
      console.info("DatePickerComponentHideYearTest after each called");
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0100
     * @tc.name DatePickerComponentHideYear_default_0100
     * @tc.desc Verify DatePickerComponent default hideYear text content contains 'hideYear: false'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_default_0100 START')
      try {
        let strJson = inspector.getInspectorByKey('text_hideYear_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('hideYear: false');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_default_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0200
     * @tc.name DatePickerComponentHideYear_true_0200
     * @tc.desc Verify DatePickerComponent hideYear changes to true after clicking button
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_true_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_true_0200 START')
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('button_hideYear_true'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('text_hideYear_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('hideYear: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_true_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0300
     * @tc.name DatePickerComponentHideYear_dynamicSwitch_0300
     * @tc.desc Verify DatePickerComponent hideYear supports runtime dynamic switching true -> false -> true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_dynamicSwitch_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_dynamicSwitch_0300 START')
      try {
        let driver = await Driver.create();

        let buttonTrue = await driver.findComponent(ON.id('button_hideYear_true'));
        await (buttonTrue?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJsonTrue = inspector.getInspectorByKey('text_hideYear_value');
        let objTrue = JSON.parseJsonElement(strJsonTrue);
        let contentTrue: string = objTrue.getElement('$attrs').getString('content');
        expect(contentTrue).assertContain('hideYear: true');

        let buttonFalse = await driver.findComponent(ON.id('button_hideYear_false'));
        await (buttonFalse?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJsonFalse = inspector.getInspectorByKey('text_hideYear_value');
        let objFalse = JSON.parseJsonElement(strJsonFalse);
        let contentFalse: string = objFalse.getElement('$attrs').getString('content');
        expect(contentFalse).assertContain('hideYear: false');

        let buttonTrueAgain = await driver.findComponent(ON.id('button_hideYear_true'));
        await (buttonTrueAgain?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJsonAgain = inspector.getInspectorByKey('text_hideYear_value');
        let objAgain = JSON.parseJsonElement(strJsonAgain);
        let contentAgain: string = objAgain.getElement('$attrs').getString('content');
        expect(contentAgain).assertContain('hideYear: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_dynamicSwitch_0300 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0400
     * @tc.name DatePickerComponentHideYear_effective_dateMode_0400
     * @tc.desc Verify hideYear is effective when displayMode=DATE and mode=DATE, component renders successfully
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_effective_dateMode_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_effective_dateMode_0400 START')
      try {
        let driver = await Driver.create();

        let buttonDisplayDate = await driver.findComponent(ON.id('button_displayMode_date'));
        await (buttonDisplayDate?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonModeDate = await driver.findComponent(ON.id('button_dateMode_date'));
        await (buttonModeDate?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonHideYear = await driver.findComponent(ON.id('button_hideYear_true'));
        await (buttonHideYear?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson = inspector.getInspectorByKey('datePickerComponent_hideYear');
        let obj = JSON.parseJsonElement(strJson);
        let type: string = obj.getString('$type');
        expect(type).assertEqual('DatePickerComponent');

        let strText = inspector.getInspectorByKey('text_hideYear_value');
        let objText = JSON.parseJsonElement(strText);
        let content: string = objText.getElement('$attrs').getString('content');
        expect(content).assertContain('hideYear: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_effective_dateMode_0400 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0500
     * @tc.name DatePickerComponentHideYear_effective_yearAndMonth_0500
     * @tc.desc Verify hideYear is effective when displayMode=DATE and mode=YEAR_AND_MONTH, component renders successfully
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_effective_yearAndMonth_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_effective_yearAndMonth_0500 START')
      try {
        let driver = await Driver.create();

        let buttonDisplayDate = await driver.findComponent(ON.id('button_displayMode_date'));
        await (buttonDisplayDate?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonModeYearMonth = await driver.findComponent(ON.id('button_dateMode_yearAndMonth'));
        await (buttonModeYearMonth?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonHideYear = await driver.findComponent(ON.id('button_hideYear_true'));
        await (buttonHideYear?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson = inspector.getInspectorByKey('datePickerComponent_hideYear');
        let obj = JSON.parseJsonElement(strJson);
        let type: string = obj.getString('$type');
        expect(type).assertEqual('DatePickerComponent');

        let strText = inspector.getInspectorByKey('text_hideYear_value');
        let objText = JSON.parseJsonElement(strText);
        let content: string = objText.getElement('$attrs').getString('content');
        expect(content).assertContain('hideYear: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_effective_yearAndMonth_0500 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0600
     * @tc.name DatePickerComponentHideYear_effective_dateTime_0600
     * @tc.desc Verify hideYear is effective when displayMode=DATE_TIME and mode=DATE, component renders successfully
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_effective_dateTime_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_effective_dateTime_0600 START')
      try {
        let driver = await Driver.create();

        let buttonDisplayDateTime = await driver.findComponent(ON.id('button_displayMode_dateTime'));
        await (buttonDisplayDateTime?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonModeDate = await driver.findComponent(ON.id('button_dateMode_date'));
        await (buttonModeDate?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonHideYear = await driver.findComponent(ON.id('button_hideYear_true'));
        await (buttonHideYear?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson = inspector.getInspectorByKey('datePickerComponent_hideYear');
        let obj = JSON.parseJsonElement(strJson);
        let type: string = obj.getString('$type');
        expect(type).assertEqual('DatePickerComponent');

        let strText = inspector.getInspectorByKey('text_hideYear_value');
        let objText = JSON.parseJsonElement(strText);
        let content: string = objText.getElement('$attrs').getString('content');
        expect(content).assertContain('hideYear: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_effective_dateTime_0600 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0700
     * @tc.name DatePickerComponentHideYear_nonEffective_monthAndDay_0700
     * @tc.desc Verify hideYear does not take effect when mode=MONTH_AND_DAY, component still renders successfully
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_nonEffective_monthAndDay_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_nonEffective_monthAndDay_0700 START')
      try {
        let driver = await Driver.create();

        let buttonDisplayDate = await driver.findComponent(ON.id('button_displayMode_date'));
        await (buttonDisplayDate?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonModeMonthDay = await driver.findComponent(ON.id('button_dateMode_monthAndDay'));
        await (buttonModeMonthDay?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonHideYear = await driver.findComponent(ON.id('button_hideYear_true'));
        await (buttonHideYear?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson = inspector.getInspectorByKey('datePickerComponent_hideYear');
        let obj = JSON.parseJsonElement(strJson);
        let type: string = obj.getString('$type');
        expect(type).assertEqual('DatePickerComponent');

        let strText = inspector.getInspectorByKey('text_hideYear_value');
        let objText = JSON.parseJsonElement(strText);
        let content: string = objText.getElement('$attrs').getString('content');
        expect(content).assertContain('hideYear: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_nonEffective_monthAndDay_0700 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0800
     * @tc.name DatePickerComponentHideYear_nonEffective_time_0800
     * @tc.desc Verify hideYear does not take effect when displayMode=TIME, component still renders successfully
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_nonEffective_time_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_nonEffective_time_0800 START')
      try {
        let driver = await Driver.create();

        let buttonDisplayTime = await driver.findComponent(ON.id('button_displayMode_time'));
        await (buttonDisplayTime?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let buttonHideYear = await driver.findComponent(ON.id('button_hideYear_true'));
        await (buttonHideYear?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson = inspector.getInspectorByKey('datePickerComponent_hideYear');
        let obj = JSON.parseJsonElement(strJson);
        let type: string = obj.getString('$type');
        expect(type).assertEqual('DatePickerComponent');

        let strText = inspector.getInspectorByKey('text_hideYear_value');
        let objText = JSON.parseJsonElement(strText);
        let content: string = objText.getElement('$attrs').getString('content');
        expect(content).assertContain('hideYear: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_nonEffective_time_0800 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_0900
     * @tc.name DatePickerComponentHideYear_onChange_0900
     * @tc.desc Verify DatePickerComponent onChange callback triggered and result captured when hideYear is true and date scrolled
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_onChange_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_onChange_0900 START')
      try {
        let driver = await Driver.create();

        let buttonHideYear = await driver.findComponent(ON.id('button_hideYear_true'));
        await (buttonHideYear?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson = inspector.getInspectorByKey('text_onChange_triggered');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('onChangeTriggered: false');

        let datePickerComp = await driver.findComponent(ON.id('datePickerComponent_hideYear'));
        let bounds = await (datePickerComp?.getBounds() as Promise<Rect>);
        let centerX = Math.round(bounds.left + (bounds.right - bounds.left) / 2).toInt();
        let centerY = Math.round(bounds.top + (bounds.bottom - bounds.top) / 2).toInt();
        let displayId = await datePickerComp?.getDisplayId();
        await driver.swipeBetween(
          { x: Math.round(centerX).toInt(), y: Math.round(centerY).toInt(), displayId: displayId },
          { x: Math.round(centerX).toInt(), y: Math.round(centerY + 50).toInt(), displayId: displayId }, 600
        );
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson1 = inspector.getInspectorByKey('text_onChange_triggered');
        let obj1 = JSON.parseJsonElement(strJson1);
        let content1 = obj1.getElement('$attrs').getString('content');
        expect(content1).assertContain('onChangeTriggered: true');

        let strResult = inspector.getInspectorByKey('text_onChange_result');
        let objResult = JSON.parseJsonElement(strResult);
        let contentResult: string = objResult.getElement('$attrs').getString('content');
        expect(contentResult).assertContain('year:');
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_onChange_0900 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_UNDEFINED_0100
     * @tc.name DatePickerComponentHideYear_undefined_1100
     * @tc.desc Verify hideYear = undefined renders successfully and restores to default (false) behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_undefined_1100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_undefined_1100 START')
      try {
        let driver = await Driver.create();

        // 点击按钮将isHideYear设置为undefined
        let buttonUndefined = await driver.findComponent(ON.id('button_hideYear_undefined'));
        await (buttonUndefined?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);

        // 验证状态变量已更新为undefined
        let strText = inspector.getInspectorByKey('text_hideYear_value');
        let objText = JSON.parseJsonElement(strText);
        let content: string = objText.getElement('$attrs').getString('content');
        expect(content).assertContain('hideYear: undefined');

        // 获取未设置hideYear的默认参考组件属性（hideYear取默认值false）
        let strJsonCompare = inspector.getInspectorByKey('datePickerComponent_hideYear_default');
        let objCompare = JSON.parseJsonElement(strJsonCompare);
        let typeCompare: string = objCompare.getString('$type');
        expect(typeCompare).assertEqual('DatePickerComponent');

        // 获取undefined参数组件的属性
        let strJson = inspector.getInspectorByKey('datePickerComponent_hideYear');
        let obj = JSON.parseJsonElement(strJson);
        let type: string = obj.getString('$type');
        expect(type).assertEqual('DatePickerComponent');

        // undefined应恢复为默认值false，组件属性应与默认参考组件一致
        let compareAttrs: string = JSON.stringifyJsonElement(objCompare.getElement('$attrs'));
        let undefinedAttrs: string = JSON.stringifyJsonElement(obj.getElement('$attrs'));
        console.info('DatePickerComponentHideYear_undefined_1100 compare $attrs: ' + compareAttrs);
        console.info('DatePickerComponentHideYear_undefined_1100 undefined $attrs: ' + undefinedAttrs);
        expect(undefinedAttrs).assertEqual(compareAttrs);
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_undefined_1100 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_HIDEYEAR_NOTSET_0100
     * @tc.name DatePickerComponentHideYear_notSet_1200
     * @tc.desc Verify hideYear not set renders successfully and uses default (false) behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentHideYear_notSet_1200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentHideYear_notSet_1200 START')
      try {
        let driver = await Driver.create();

        // 获取未设置hideYear的默认参考组件属性（hideYear取默认值false）
        let strJsonDefault = inspector.getInspectorByKey('datePickerComponent_hideYear_default');
        let objDefault = JSON.parseJsonElement(strJsonDefault);
        let typeDefault: string = objDefault.getString('$type');
        expect(typeDefault).assertEqual('DatePickerComponent');

        // 点击按钮将isHideYear设置为false，获取显式设置false的组件属性
        let buttonFalse = await driver.findComponent(ON.id('button_hideYear_false'));
        await (buttonFalse?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson = inspector.getInspectorByKey('datePickerComponent_hideYear');
        let obj = JSON.parseJsonElement(strJson);
        let type: string = obj.getString('$type');
        expect(type).assertEqual('DatePickerComponent');

        // 未设置hideYear应取默认值false，组件属性应与显式设置false的组件一致
        let defaultAttrs: string = JSON.stringifyJsonElement(objDefault.getElement('$attrs'));
        let falseAttrs: string = JSON.stringifyJsonElement(obj.getElement('$attrs'));
        console.info('DatePickerComponentHideYear_notSet_1200 default $attrs: ' + defaultAttrs);
        console.info('DatePickerComponentHideYear_notSet_1200 false $attrs: ' + falseAttrs);
        expect(defaultAttrs).assertEqual(falseAttrs);
        done();
      } catch (err) {
        console.error('DatePickerComponentHideYear_notSet_1200 error: ' + err);
        expect().assertFail();
        done();
      }
    })
  })
}
