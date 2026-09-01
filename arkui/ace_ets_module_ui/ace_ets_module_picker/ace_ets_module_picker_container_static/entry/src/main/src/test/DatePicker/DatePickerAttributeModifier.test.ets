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
export default function DatePickerAttributeModifierTest() {
  describe('DatePickerAttributeModifierTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("DatePickerAttributeModifierTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async () => {
      console.info('DatePickerAttributeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/DatePickerAttributeModifier',
      }
      await UtilsTest.msSleep(SLEEP_TIME_L);
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DatePickerAttributeModifierTest state pages:' + JSON.stringify(pages));
        if (!('DatePickerAttributeModifier' == pages.name)) {
          console.info('get DatePickerAttributeModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push DatePickerAttributeModifierTest page error:' + err);
      }
      console.info('DatePickerAttributeModifierTest beforeEach end');
    });

    afterEach(() => {
      console.info('DatePickerAttributeModifierTest afterEach');
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0001
     * @tc.name     SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0001
     * @tc.desc     Set the lunar property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('datePicker1');
      let obj = JSON.parseJsonElement(strJson);
      let lunar: string = obj.getElement('$attrs').getString('lunar');
      expect(lunar).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0002
     * @tc.name     SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0002
     * @tc.desc     Set the lunar property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('datePicker2');
      let obj = JSON.parseJsonElement(strJson);
      let lunar: string = obj.getElement('$attrs').getString('lunar');
      expect(lunar).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0003
     * @tc.name     SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0003
     * @tc.desc     Set the lunar property to undefined via modifier, verify default value false
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_LUNAR_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('datePicker3');
      let obj = JSON.parseJsonElement(strJson);
      let lunar: string = obj.getElement('$attrs').getString('lunar');
      expect(lunar).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the disappearTextStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('datePicker4');
      let obj = JSON.parseJsonElement(strJson);
      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');
      expect(disappearTextStyle.getString('color')).assertEqual('#FF808080');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('16.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the disappearTextStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('datePicker5');
      let obj = JSON.parseJsonElement(strJson);
      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');
      expect(disappearTextStyle.getString('color')).assertContain('#');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('14.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_TEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_DATEPICKER_TEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the textStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_TEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_TEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('datePicker6');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertEqual('#FF182431');
      expect(textStyle.getElement('font').getString('size')).assertEqual('18.00fp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_TEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_DATEPICKER_TEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the textStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_TEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_TEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('datePicker7');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertContain('#');
      expect(textStyle.getElement('font').getString('size')).assertEqual('16.00fp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the selectedTextStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('datePicker8');
      let obj = JSON.parseJsonElement(strJson);
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');
      expect(selectedTextStyle.getString('color')).assertEqual('#FF0000FF');
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual('26.00fp');
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the selectedTextStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('datePicker9');
      let obj = JSON.parseJsonElement(strJson);
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');
      expect(selectedTextStyle.getString('color')).assertContain('#');
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual('20.00fp');
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001
     * @tc.name     SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001
     * @tc.desc     Set the enableHapticFeedback property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('datePicker10');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(true);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002
     * @tc.name     SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002
     * @tc.desc     Set the enableHapticFeedback property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('datePicker11');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(false);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003
     * @tc.name     SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003
     * @tc.desc     Set the enableHapticFeedback property to undefined via modifier, verify default value true
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('datePicker12');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(true);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0001
     * @tc.name     SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0001
     * @tc.desc     Set the canLoop property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('datePicker13');
      let obj = JSON.parseJsonElement(strJson);
      let canLoop: string = obj.getElement('$attrs').getString('canLoop');
      expect(canLoop).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0002
     * @tc.name     SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0002
     * @tc.desc     Set the canLoop property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('datePicker14');
      let obj = JSON.parseJsonElement(strJson);
      let canLoop: string = obj.getElement('$attrs').getString('canLoop');
      expect(canLoop).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0003
     * @tc.name     SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0003
     * @tc.desc     Set the canLoop property to undefined via modifier, verify default value true
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_CANLOOP_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('datePicker15');
      let obj = JSON.parseJsonElement(strJson);
      let canLoop: string = obj.getElement('$attrs').getString('canLoop');
      expect(canLoop).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001
     * @tc.name     SUB_ARKUI_DATEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001
     * @tc.desc     Set the digitalCrownSensitivity property to CrownSensitivity.LOW via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('datePicker16');
      let obj = JSON.parseJsonElement(strJson);
      let digitalCrownSensitivity: string = obj.getElement('$attrs').getString('digitalCrownSensitivity');
      expect(digitalCrownSensitivity).assertEqual('1');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_DATEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002
     * @tc.name     SUB_ARKUI_DATEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002
     * @tc.desc     Set the digitalCrownSensitivity property to undefined via modifier, verify default value CrownSensitivity.MEDIUM
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_DATEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_DATEPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('datePicker17');
      let obj = JSON.parseJsonElement(strJson);
      let digitalCrownSensitivity: string = obj.getElement('$attrs').getString('digitalCrownSensitivity');
      expect(digitalCrownSensitivity).assertEqual('1');
      done();
    });
  })
}
