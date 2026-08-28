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
export default function TextPickerAttributeModifierTest() {
  describe('TextPickerAttributeModifierTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("TextPickerAttributeModifierTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async () => {
      console.info('TextPickerAttributeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/TextPickerAttributeModifier',
      }
      await UtilsTest.msSleep(SLEEP_TIME_L);
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerAttributeModifierTest state pages:' + JSON.stringify(pages));
        if (!('TextPickerAttributeModifier' == pages.name)) {
          console.info('get TextPickerAttributeModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push TextPickerAttributeModifierTest page error:' + err);
      }
      console.info('TextPickerAttributeModifierTest beforeEach end');
    });

    afterEach(() => {
      console.info('TextPickerAttributeModifierTest afterEach');
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_MODIFIER_0001
     * @tc.desc     Set the defaultPickerItemHeight property to 50 via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker1');
      let obj = JSON.parseJsonElement(strJson);
      let height: string = obj.getElement('$attrs').getString('defaultPickerItemHeight');
      expect(height).assertEqual('50.00vp');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_MODIFIER_0002
     * @tc.desc     Set the defaultPickerItemHeight property to undefined via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker2');
      let obj = JSON.parseJsonElement(strJson);
      let height: string = obj.getElement('$attrs').getString('defaultPickerItemHeight');
      expect(height).assertEqual('0.00px');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the disappearTextStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker3');
      let obj = JSON.parseJsonElement(strJson);
      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');
      expect(disappearTextStyle.getString('color')).assertEqual('#FF808080');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('16.00vp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the disappearTextStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker4');
      let obj = JSON.parseJsonElement(strJson);
      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');
      expect(disappearTextStyle.getString('color')).assertContain('#');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('14.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_TEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_TEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the textStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_TEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_TEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker5');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertEqual('#FF000000');
      expect(textStyle.getElement('font').getString('size')).assertEqual('20.00fp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_TEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_TEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the textStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_TEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_TEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker6');
      let obj = JSON.parseJsonElement(strJson);
      let textStyle = obj.getElement('$attrs').getElement('textStyle');
      expect(textStyle.getString('color')).assertContain('#');
      expect(textStyle.getElement('font').getString('size')).assertEqual('16.00fp');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the selectedTextStyle property with custom color, fontSize and fontWeight via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker7');
      let obj = JSON.parseJsonElement(strJson);
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');
      expect(selectedTextStyle.getString('color')).assertEqual('#FF0000FF');
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual('30.00fp');
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Bolder');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002
     * @tc.desc     Set the selectedTextStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker8');
      let obj = JSON.parseJsonElement(strJson);
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');
      expect(selectedTextStyle.getString('color')).assertContain('#');
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual('20.00fp');
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0001
     * @tc.desc     Set the canLoop property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker11');
      let obj = JSON.parseJsonElement(strJson);
      let canLoop: string = obj.getElement('$attrs').getString('canLoop');
      expect(canLoop).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0002
     * @tc.desc     Set the canLoop property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker12');
      let obj = JSON.parseJsonElement(strJson);
      let canLoop: string = obj.getElement('$attrs').getString('canLoop');
      expect(canLoop).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0003
     * @tc.name     SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0003
     * @tc.desc     Set the canLoop property to undefined via modifier, verify default value true
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_CANLOOP_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('textPicker13');
      let obj = JSON.parseJsonElement(strJson);
      let canLoop: string = obj.getElement('$attrs').getString('canLoop');
      expect(canLoop).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DIVIDER_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_DIVIDER_MODIFIER_0001
     * @tc.desc     Set the divider property with custom DividerOptions via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DIVIDER_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DIVIDER_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker14');
      let obj = JSON.parseJsonElement(strJson);
      let divider = obj.getElement('$attrs').getElement('divider');
      expect(divider.getString('strokeWidth')).assertEqual('10.00vp');
      expect(divider.getString('color')).assertEqual('#FFFF0000');
      expect(divider.getString('startMargin')).assertEqual('10.00vp');
      expect(divider.getString('endMargin')).assertEqual('20.00vp');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DIVIDER_MODIFIER_0003
     * @tc.name     SUB_ARKUI_TEXTPICKER_DIVIDER_MODIFIER_0003
     * @tc.desc     Set the divider property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DIVIDER_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DIVIDER_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('textPicker16');
      let obj = JSON.parseJsonElement(strJson);
      let divider = obj.getElement('$attrs').getElement('divider');
      expect(divider.getString('strokeWidth')).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_MODIFIER_0001
     * @tc.desc     Set the gradientHeight property to 100 via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker17');
      let obj = JSON.parseJsonElement(strJson);
      let gradientHeight: string = obj.getElement('$attrs').getString('gradientHeight');
      expect(gradientHeight).assertEqual('100.00vp');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_MODIFIER_0002
     * @tc.desc     Set the gradientHeight property to undefined via modifier, verify default value 36vp
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker18');
      let obj = JSON.parseJsonElement(strJson);
      let gradientHeight: string = obj.getElement('$attrs').getString('gradientHeight');
      expect(gradientHeight).assertEqual('36.00vp');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0001
     * @tc.desc     Set the disableTextStyleAnimation property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker19');
      let obj = JSON.parseJsonElement(strJson);
      let disableTextStyleAnimation: string = obj.getElement('$attrs').getString('disableTextStyleAnimation');
      expect(disableTextStyleAnimation).assertEqual('true');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0002
     * @tc.desc     Set the disableTextStyleAnimation property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker20');
      let obj = JSON.parseJsonElement(strJson);
      let disableTextStyleAnimation: string = obj.getElement('$attrs').getString('disableTextStyleAnimation');
      expect(disableTextStyleAnimation).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0003
     * @tc.name     SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0003
     * @tc.desc     Set the disableTextStyleAnimation property to undefined via modifier, verify default value false
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DISABLETEXTSTYLEANIMATION_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('textPicker21');
      let obj = JSON.parseJsonElement(strJson);
      let disableTextStyleAnimation: string = obj.getElement('$attrs').getString('disableTextStyleAnimation');
      expect(disableTextStyleAnimation).assertEqual('false');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DEFAULTTEXTSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_DEFAULTTEXTSTYLE_MODIFIER_0001
     * @tc.desc     Set the defaultTextStyle property with custom values via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DEFAULTTEXTSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DEFAULTTEXTSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker22');
      let obj = JSON.parseJsonElement(strJson);
      let defaultTextStyle = obj.getElement('$attrs').getElement('defaultTextStyle');
      expect(defaultTextStyle.getString('color')).assertEqual('#FF000000');
      expect(defaultTextStyle.getElement('font').getString('size')).assertEqual('20.00fp');
      expect(defaultTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001
     * @tc.desc     Set the enableHapticFeedback property to true via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker23');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(true);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002
     * @tc.desc     Set the enableHapticFeedback property to false via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker24');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(false);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003
     * @tc.name     SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003
     * @tc.desc     Set the enableHapticFeedback property to undefined via modifier, verify default value true
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_ENABLEHAPTICFEEDBACK_MODIFIER_0003 START');
      let strJson = inspector.getInspectorByKey('textPicker25');
      let obj = JSON.parseJsonElement(strJson);
      let enableHapticFeedback: boolean = obj.getElement('$attrs').getBoolean('enableHapticFeedback');
      expect(enableHapticFeedback).assertEqual(true);
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001
     * @tc.desc     Set the digitalCrownSensitivity property to CrownSensitivity.LOW via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker26');
      let obj = JSON.parseJsonElement(strJson);
      let digitalCrownSensitivity: string = obj.getElement('$attrs').getString('digitalCrownSensitivity');
      expect(digitalCrownSensitivity).assertEqual('0');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002
     * @tc.desc     Set the digitalCrownSensitivity property to undefined via modifier, verify default value MEDIUM
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_DIGITALCROWNSENSITIVITY_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker27');
      let obj = JSON.parseJsonElement(strJson);
      let digitalCrownSensitivity: string = obj.getElement('$attrs').getString('digitalCrownSensitivity');
      expect(digitalCrownSensitivity).assertEqual('1');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_MODIFIER_0001
     * @tc.name     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_MODIFIER_0001
     * @tc.desc     Set the selectedBackgroundStyle property with custom color and borderRadius via modifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_MODIFIER_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_MODIFIER_0001 START');
      let strJson = inspector.getInspectorByKey('textPicker28');
      let obj = JSON.parseJsonElement(strJson);
      let selectedBackgroundStyle = obj.getElement('$attrs').getElement('selectedBackgroundStyle');
      expect(selectedBackgroundStyle.getString('color')).assertEqual('#FFD5D5D5');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_MODIFIER_0002
     * @tc.name     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_MODIFIER_0002
     * @tc.desc     Set the selectedBackgroundStyle property to undefined via modifier, verify default values
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_MODIFIER_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_MODIFIER_0002 START');
      let strJson = inspector.getInspectorByKey('textPicker29');
      let obj = JSON.parseJsonElement(strJson);
      let selectedBackgroundStyle = obj.getElement('$attrs').getElement('selectedBackgroundStyle');
      let color: string = selectedBackgroundStyle.getString('color');
      expect(color).assertContain('#');
      done();
    });
  })
}
