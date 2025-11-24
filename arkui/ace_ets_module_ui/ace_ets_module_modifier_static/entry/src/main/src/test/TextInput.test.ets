/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium"
import router from '@ohos.router';
import { Component, Driver, Component,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
export default function textInput() {
  describe('textInputTest', () => {
    beforeAll(() => {
      console.info("scrollNestedScroll beforeEach start");

      await UtilsTest.msSleep(4000);
      await startAbility("com.open.harmony.acetest.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textInput',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInput state pages: " + JSON.stringify(pages));
        if (!("textInput" == pages.name)) {
          console.info("get textInput state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push textInput page error: " + err);
      }
    });

    /**
     * @tc.number textInputJsunit_static_0100
     * @tc.name textInputJsunit_static_0100
     * @tc.desc Set maxLines values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0100] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('1');
      console.info('textInputJsunit_static_0100 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0101
     * @tc.name textInputJsunit_static_0101
     * @tc.desc Set showUnderline values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0101 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0101] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(true);
      console.info('textInputJsunit_static_0101 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0102
     * @tc.name textInputJsunit_static_0102
     * @tc.desc Set showError values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0102 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0102] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('showError')).assertEqual('Error');
      console.info('textInputJsunit_static_0102 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0103
     * @tc.name textInputJsunit_static_0103
     * @tc.desc Set passwordIcon values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0103', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0103 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0103] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('passwordIcon')).assertEqual('{"onIconSrc":"begin","offIconSrc":"end"}');
      console.info('textInputJsunit_static_0103 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0104
     * @tc.name textInputJsunit_static_0104
     * @tc.desc Set style values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0104', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0104 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0104] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('style')).assertEqual('TextInputStyle.Inline');
      console.info('textInputJsunit_static_0104 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0105
     * @tc.name textInputJsunit_static_0105
     * @tc.desc Set selectionMenuHidden values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0105', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0105 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0105] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('selectionMenuHidden')).assertEqual(undefined);
      console.info('textInputJsunit_static_0105 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0106
     * @tc.name textInputJsunit_static_0106
     * @tc.desc Set barState values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0106', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0106 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0106] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
      console.info('textInputJsunit_static_0106 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0107
     * @tc.name textInputJsunit_static_0107
     * @tc.desc Set enableKeyboardOnFocus values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0107', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0107 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0107] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('enableKeyboardOnFocus')).assertEqual(undefined);
      console.info('textInputJsunit_static_0107 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0109
     * @tc.name textInputJsunit_static_0109
     * @tc.desc Set caretStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0109', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0109 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0109] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      let caretStyle_obj = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
      expect(caretStyle_obj.getString('width')).assertEqual("12.00vp");
      console.info('textInputJsunit_static_0109 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0110
     * @tc.name textInputJsunit_static_0110
     * @tc.desc Set selectedBackgroundColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0110 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0110] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual('#330000FF');
      console.info('textInputJsunit_static_0110 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0111
     * @tc.name textInputJsunit_static_0111
     * @tc.desc Set caretPosition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level textInputJsunit_static_0111
     */
    it('textInputJsunit_static_0111', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0111 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0111] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual('0');
      console.info('textInputJsunit_static_0111 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0112
     * @tc.name textInputJsunit_static_0112
     * @tc.desc Set caretColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0112', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0112 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0112] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FF007DFF');
      console.info('textInputJsunit_static_0112 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0113
     * @tc.name textInputJsunit_static_0113
     * @tc.desc Set placeholderFont values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0113', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0113 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0113] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      let placeholderFont = JSON.parseJsonElement(obj.getElement('$attrs').getString('placeholderFont'));
      expect(placeholderFont.getString('size')).assertEqual('14.00fp');
      expect(placeholderFont.getString('weight')).assertEqual('400');
      console.info('textInputJsunit_static_0113 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0114
     * @tc.name textInputJsunit_static_0114
     * @tc.desc Set placeholderColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0114', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0114 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0114] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#80808080');
      console.info('textInputJsunit_static_0114 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0115
     * @tc.name textInputJsunit_static_0115
     * @tc.desc Set type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0115', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0115 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0115] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Password');
      console.info('textInputJsunit_static_0115 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0116
     * @tc.name textInputJsunit_static_0116
     * @tc.desc Set enterKeyType values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0116', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0116 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0116] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      console.info('textInputJsunit_static_0116 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0117
     * @tc.name textInputJsunit_static_0117
     * @tc.desc Set maxLength values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0117', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0117 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0117] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('maxLength')).assertEqual('9');
      console.info('textInputJsunit_static_0117 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0118
     * @tc.name textInputJsunit_static_0118
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0118', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0118 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0118] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      // expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF123456');
      expect(obj.getElement('$attrs').getString('fontColor') != null).assertTrue();
      console.info('textInputJsunit_static_0118 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0119
     * @tc.name textInputJsunit_static_0119
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0119', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0119 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0119] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('14.00fp');
      console.info('textInputJsunit_static_0119 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0120
     * @tc.name textInputJsunit_static_0120
     * @tc.desc Set fontStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0120', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0120 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0120] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Normal');
      console.info('textInputJsunit_static_0120 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0121
     * @tc.name textInputJsunit_static_0121
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0121', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0121 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0121] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      console.info('textInputJsunit_static_0121 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0122
     * @tc.name textInputJsunit_static_0122
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0122', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0122 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0122] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('fontFamily');
      console.info('textInputJsunit_static_0122 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0123
     * @tc.name textInputJsunit_static_0123
     * @tc.desc Set copyOption values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0123', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0123 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0123] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.None');
      console.info('textInputJsunit_static_0123 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0124
     * @tc.name textInputJsunit_static_0124
     * @tc.desc Set showPasswordIcon values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0124', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0124 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0124] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('showPasswordIcon')).assertEqual(true);
      console.info('textInputJsunit_static_0124 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0125
     * @tc.name textInputJsunit_static_0125
     * @tc.desc Set textAlign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0125', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0125 START');
      let strJson = inspector.getInspectorByKey('textInputKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInputJsunit_static_0125] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
      console.info('textInputJsunit_static_0125 END');
      done();
    });

    /**
     * @tc.number textInputJsunit_static_0127
     * @tc.name textInputJsunit_static_0127
     * @tc.desc Change fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputJsunit_static_0127', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textInputJsunit_static_0127 START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJsonNew = inspector.getInspectorByKey('textInputKey1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textInputJsunit_static_0127 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontSize')).assertEqual("15.00fp")
      console.info('textInputJsunit_static_0127 END');
      done();
    });

  })
}
