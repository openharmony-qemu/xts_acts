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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
const SLEEP_TIME_L = 1000;
export default function TimePickerAttributeModifierTest() {
  describe('TimePickerAttributeModifierTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("TimePickerAttributeModifierTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async () => {
      console.info('TimePickerAttributeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/TimePickerAttributeModifier',
      }
      await UtilsTest.msSleep(SLEEP_TIME_L);
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TimePickerAttributeModifierTest state pages:' + JSON.stringify(pages));
        if (!('TimePickerAttributeModifier' == pages.name)) {
          console.info('get TimePickerAttributeModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push TimePickerAttributeModifierTest page error:' + err);
      }
      console.info('TimePickerAttributeModifierTest beforeEach end');
    });

    afterEach(() => {
      console.info('TimePickerAttributeModifierTest afterEach');
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0001
     * @tc.desc     Set the useMilitaryTime property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker1');
      let obj = JSON.parseJsonElement(strJson);
      let useMilitaryTime: string = obj.getElement('$attrs').getString('useMilitaryTime');
      expect(useMilitaryTime).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0002
     * @tc.desc     Set the useMilitaryTime property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker2');
      let obj = JSON.parseJsonElement(strJson);
      let useMilitaryTime: string = obj.getElement('$attrs').getString('useMilitaryTime');
      expect(useMilitaryTime).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0003
     * @tc.name     SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0003
     * @tc.desc     Set the useMilitaryTime property to undefined via modifier, verify default value false
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_USEMILITARYTIME_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('timePicker3');
      let obj = JSON.parseJsonElement(strJson);
      let useMilitaryTime: string = obj.getElement('$attrs').getString('useMilitaryTime');
      expect(useMilitaryTime).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the disappearTextStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker4');
      let obj = JSON.parseJsonElement(strJson);
      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');
      expect(disappearTextStyle.getString('color')).assertEqual('#FF808080');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('16.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the disappearTextStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker5');
      let obj = JSON.parseJsonElement(strJson);
      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');
      expect(disappearTextStyle.getString('color')).assertContain('#');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('14.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_TEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_TEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the textStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_TEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_TEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker6');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertEqual('#FF000000');
      expect(textStyle.getElement('font').getString('size')).assertEqual('26.00fp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_TEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_TEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the textStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_TEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_TEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker7');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertContain('#');
      expect(textStyle.getElement('font').getString('size')).assertEqual('16.00fp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the selectedTextStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker8');
      let obj = JSON.parseJsonElement(strJson);
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');
      expect(selectedTextStyle.getString('color')).assertEqual('#FF0000FF');
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual('30.00fp');
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Bolder');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the selectedTextStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker9');
      let obj = JSON.parseJsonElement(strJson);
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');
      expect(selectedTextStyle.getString('color')).assertContain('#');
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual('20.00fp');
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0001
     * @tc.desc     Set the loop property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker10');
      let obj = JSON.parseJsonElement(strJson);
      let loop: string = obj.getElement('$attrs').getString('loop');
      expect(loop).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0002
     * @tc.desc     Set the loop property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker11');
      let obj = JSON.parseJsonElement(strJson);
      let loop: string = obj.getElement('$attrs').getString('loop');
      expect(loop).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0003
     * @tc.name     SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0003
     * @tc.desc     Set the loop property to undefined via modifier, verify default value true
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_LOOP_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('timePicker12');
      let obj = JSON.parseJsonElement(strJson);
      let loop: string = obj.getElement('$attrs').getString('loop');
      expect(loop).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_DATETIMEOPTIONS_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_DATETIMEOPTIONS_MODIFIER_0001
     * @tc.desc     Set the dateTimeOptions property with custom hour, minute and second via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_DATETIMEOPTIONS_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_DATETIMEOPTIONS_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker13');
      let obj = JSON.parseJsonElement(strJson);
      let dateTimeOptions = obj.getElement('$attrs').getElement('dateTimeOptions');
      expect(dateTimeOptions.getString('hour')).assertEqual('2-digit');
      expect(dateTimeOptions.getString('minute')).assertEqual('2-digit');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_DATETIMEOPTIONS_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_DATETIMEOPTIONS_MODIFIER_0002
     * @tc.desc     Set the dateTimeOptions property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_DATETIMEOPTIONS_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_DATETIMEOPTIONS_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker14');
      let obj = JSON.parseJsonElement(strJson);
      let dateTimeOptions = obj.getElement('$attrs').getElement('dateTimeOptions');
      expect(dateTimeOptions.getString('minute')).assertEqual('2-digit');
      expect(dateTimeOptions.getString('second')).assertEqual('2-digit');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001
     * @tc.desc     Set the enableHapticFeedback property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker15');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(true);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002
     * @tc.desc     Set the enableHapticFeedback property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker16');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(false);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003
     * @tc.name     SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003
     * @tc.desc     Set the enableHapticFeedback property to undefined via modifier, verify default value true
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('timePicker17');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(true);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0001
     * @tc.desc     Set the enableCascade property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker18');
      let obj = JSON.parseJsonElement(strJson);
      let enableCascade: boolean = obj.getElement('$attrs').getBoolean('enableCascade');
      expect(enableCascade).assertEqual(true);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0002
     * @tc.desc     Set the enableCascade property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker19');
      let obj = JSON.parseJsonElement(strJson);
      let enableCascade: boolean = obj.getElement('$attrs').getBoolean('enableCascade');
      expect(enableCascade).assertEqual(false);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0003
     * @tc.name     SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0003
     * @tc.desc     Set the enableCascade property to undefined via modifier, verify default value false
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_ENABLECASCADE_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('timePicker20');
      let obj = JSON.parseJsonElement(strJson);
      let enableCascade: boolean = obj.getElement('$attrs').getBoolean('enableCascade');
      expect(enableCascade).assertEqual(false);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TIMEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001
     * @tc.desc     Set the digitalCrownSensitivity property to CrownSensitivity.LOW via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('timePicker21');
      let obj = JSON.parseJsonElement(strJson);
      let digitalCrownSensitivity: string = obj.getElement('$attrs').getString('digitalCrownSensitivity');
      expect(digitalCrownSensitivity).assertEqual('0');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TIMEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TIMEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002
     * @tc.desc     Set the digitalCrownSensitivity property to undefined via modifier, verify default value MEDIUM
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TIMEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TIMEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('timePicker22');
      let obj = JSON.parseJsonElement(strJson);
      let digitalCrownSensitivity: string = obj.getElement('$attrs').getString('digitalCrownSensitivity');
      expect(digitalCrownSensitivity).assertEqual('1');
      done();
    });
  })
}
