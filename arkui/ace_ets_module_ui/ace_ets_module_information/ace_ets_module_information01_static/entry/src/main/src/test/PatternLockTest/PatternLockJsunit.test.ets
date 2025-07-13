/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from "@ohos.arkui.inspector";
import { PatternLockPage1 } from "../../../ets/MainAbility/pages/PatternLock/PatternLockPage";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function PatternLockJsunit() {
  describe('PatternLockJsunit', () => {
    beforeAll(() => {
      console.info("PatternLockJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0010
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of the PatternLock component
      console.info('[PatternLockJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0100'] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('sideLength')).assertEqual('200.00vp');
      expect(obj.getElement('$attrs').getString('circleRadius')).assertEqual('9.00vp');
      expect(obj.getElement('$attrs').getString('regularColor')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual('#FF228B22');
      expect(obj.getElement('$attrs').getString('activeColor')).assertEqual('#FFB0C4DE');
      expect(obj.getElement('$attrs').getString('pathColor')).assertEqual('#FF90EE90');
      expect(obj.getElement('$attrs').getString('pathStrokeWidth')).assertEqual('18.00vp');
      expect(obj.getElement('$attrs').getString('autoReset')).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[PatternLockJsunit_0100] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0020
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify the content of the message
      let driver1 = Driver.create()
      let textComponent1 = await (driver1.findComponent(ON.id('text')) as Promise<Component | null>);
      let text1 = await (textComponent1?.getText() as Promise<String>);
      expect(text1).assertEqual('please input password!');
      console.info('[PatternLockJsunit_0200] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0030
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify that clicking the 'Reset PatternLock' button resets
      console.info('[PatternLockJsunit_0300] START');
      // Get the component of the 'Reset PatternLock' button
      let driver = Driver.create()
      let reSet = await (driver.findComponent(ON.id('reSet')) as Promise<Component | null>);
      await (reSet?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      // Verify the content of the message
      let driver1 = Driver.create()
      let curtextrentBp = await (driver1.findComponent(ON.id('text')) as Promise<Component | null>);
      let text = await (curtextrentBp?.getText() as Promise<String>);
      expect(text).assertEqual('Please input password');
      console.info('[PatternLockJsunit_0300] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0040
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the content of the message
      console.info('[PatternLockJsunit_0400] START');
      await CommonFunc.sleep(1000);
      // globalThis.value.message.notify({name:'message',value:'hello world'})
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'message', value: 'hello world'
      })
      await CommonFunc.sleep(1000);
      // Verify the content of the message
      let driver = Driver.create()
      let textComponent = await (driver.findComponent(ON.id('text')) as Promise<Component | null>);
      let text = await (textComponent?.getText() as Promise<String>);
      expect(text).assertEqual('hello world');
      console.info('[PatternLockJsunit_0400] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0050
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the sideLength value of the PatternLock component
      console.info('[PatternLockJsunit_0500] START');
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'sideLength', value: '400'
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0500'] component obj is: " + JSON.stringifyJsonElement(obj));
      // Verify the sideLength value of the PatternLock component
      expect(obj.getElement('$attrs').getElement('sideLength')).assertEqual('400.00vp');
      console.info('[PatternLockJsunit_0500] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0060
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the circleRadius value of the PatternLock component
      console.info('[PatternLockJsunit_0600] START');
      // globalThis.value.message.notify({name:'circleRadius',value:'18'})
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'circleRadius', value: '18'
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0600'] component obj is: " + JSON.stringifyJsonElement(obj));
      // Verify the circleRadius value of the PatternLock component
      expect(obj.getElement('$attrs').getElement('circleRadius')).assertEqual('18.00vp');
      console.info('[PatternLockJsunit_0600] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0070
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the regularColor value of the PatternLock component
      console.info('[PatternLockJsunit_0700] START');
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'regularColor', value: '#FF0000FF'
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0700'] component obj is: " + JSON.stringifyJsonElement(obj));
      // Verify the regularColor value of the PatternLock component
      expect(obj.getElement('$attrs').getElement('regularColor')).assertEqual('#FF0000FF');
      console.info('[PatternLockJsunit_0700] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0080
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the selectedColor value of the PatternLock component
      console.info('[PatternLockJsunit_0800] START');
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'selectedColor', value: '#FFFF0000'
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0800'] component obj is: " + JSON.stringifyJsonElement(obj));
      // Verify the selectedColor value of the PatternLock component
      expect(obj.getElement('$attrs').getElement('selectedColor')).assertEqual('#FFFF0000');
      console.info('[PatternLockJsunit_0800] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0090
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0090', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the activeColor value of the PatternLock component
      console.info('[PatternLockJsunit_0500] START');
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'activeColor', value: '#FFFF0000'
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_0500'] component obj is: " + JSON.stringifyJsonElement(obj));
      // Verify the activeColor value of the PatternLock component
      expect(obj.getElement('$attrs').getElement('activeColor')).assertEqual('#FFFF0000');
      console.info('[PatternLockJsunit_0500] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0100
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the pathColor value of the PatternLock component
      console.info('[PatternLockJsunit_1000] START');
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'pathColor', value: '#FF0000FF'
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_1000'] component obj is: " + JSON.stringifyJsonElement(obj));
      // Verify the pathColor value of the PatternLock component
      expect(obj.getElement('$attrs').getElement('pathColor')).assertEqual('#FF0000FF');
      console.info('[PatternLockJsunit_1000] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0110
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the pathStrokeWidth value of the PatternLock component
      console.info('[PatternLockJsunit_1100] START');
      await CommonFunc.sleep(1000);
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'pathStrokeWidth', value: '20'
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_1100'] component obj is: " + JSON.stringifyJsonElement(obj));
      // Verify the pathStrokeWidth value of the PatternLock component
      expect(obj.getElement('$attrs').getElement('pathStrokeWidth')).assertEqual('20.00vp');
      console.info('[PatternLockJsunit_1100] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0120
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the autoReset value of the PatternLock component
      console.info('[PatternLockJsunit_1200] START');
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("PatternLockPage", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'autoReset', value: false
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('lock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PatternLockJsunit_1200'] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);
      // Verify the autoReset value of the PatternLock component
      expect(obj.getElement('$attrs').getElement('autoReset')).assertEqual('false');
      console.info('[PatternLockJsunit_1200] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name PatternLockJsunit_static_0130
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('PatternLockJsunit_static_0130', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[PatternLockJsunit_1300] START');
      let strJson = inspector.getInspectorByKey('default');
      let obj = JSON.parseJsonElement(strJson);
      let newStrJson = inspector.getInspectorByKey('PatternLock');
      let newObj = JSON.parseJsonElement(newStrJson);
      expect(obj.getElement('$attrs').getElement('sideLength'))
        .assertEqual(newObj.getElement('$attrs').getElement('sideLength'));
      expect(obj.getElement('$attrs').getElement('circleRadius'))
        .assertEqual(newObj.getElement('$attrs').getElement('circleRadius'));
      expect(obj.getElement('$attrs').getElement('regularColor'))
        .assertEqual(newObj.getElement('$attrs').getElement('regularColor'));
      expect(obj.getElement('$attrs').getElement('selectedColor'))
        .assertEqual(newObj.getElement('$attrs').getElement('selectedColor'));
      expect(obj.getElement('$attrs').getElement('activeColor'))
        .assertEqual(newObj.getElement('$attrs').getElement('activeColor'));
      expect(obj.getElement('$attrs').getElement('pathColor'))
        .assertEqual(newObj.getElement('$attrs').getElement('pathColor'));
      expect(obj.getElement('$attrs').getElement('pathStrokeWidth'))
        .assertEqual(newObj.getElement('$attrs').getElement('pathStrokeWidth'));
      expect(obj.getElement('$attrs').getElement('autoReset'))
        .assertEqual(newObj.getElement('$attrs').getElement('autoReset'));
      console.info('[PatternLockJsunit_1300] END');
      done();
    });
  })
}

