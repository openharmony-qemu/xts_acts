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


// import {Driver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from "@ohos.arkui.inspector";
import { Color } from '@ohos.arkui.component'
import { ProgressPage1 } from "../../../ets/MainAbility/pages/Progress/ProgressPage";
import { ProgressStyle } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function ProgressJsunit() {
  describe('ProgressJsunit', () => {
    beforeAll(() => {
      console.info("ProgressJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0100
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Get the information of the Progress component
      console.info('[ProgressJsunit_static_static_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_static_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual('20.000000');
      expect(obj.getElement('$attrs').getElement('total')).assertEqual('100.000000');
      expect(obj.getElement('$attrs').getElement('type')).assertEqual('ProgressStyle.Linear');
      expect(obj.getElement('$attrs').getElement('color')).assertEqual('#FF808080');
      expect(obj.getElement('$attrs').getElement('backgroundColor')).assertEqual('#FFFF0000');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('pro3');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ProgressJsunit_static_static_static_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      expect(obj1.getElement('$attrs').getElement('strokeWidth')).assertEqual('15.00vp');
      expect(obj1.getElement('$attrs').getElement('scaleCount')).assertEqual('15');
      expect(obj1.getElement('$attrs').getElement('scaleWidth')).assertEqual('5.00vp');
      await CommonFunc.sleep(1000);
      console.info('[ProgressJsunit_static_static_static_0100] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0200
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the total value of the Progress component
      console.info('[ProgressJsunit_static_static_static_0200] START');
      let progressPage1 = AppStorage.get<ProgressPage1>("ProgressPage", Type.from<ProgressPage1>()) as ProgressPage1
      progressPage1.message.notify({name:'progressTotal',value:200})

      await CommonFunc.sleep(2000);
      // Get the total value of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_static_static_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getElement('total')).assertEqual('200.000000');
      console.info('[ProgressJsunit_static_static_static_0200] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0300
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the type of the Progress component
      console.info('[ProgressJsunit_static_static_static_0300] START');
      let progressPage1 = AppStorage.get<ProgressPage1>("ProgressPage", Type.from<ProgressPage1>()) as ProgressPage1
      progressPage1.message.notify({name:'ProgressType',value:ProgressStyle.Capsule})
      await CommonFunc.sleep(2000);
      // Get the type of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_static_static_0300] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('type')).assertEqual('ProgressStyle.Capsule');
      console.info('[ProgressJsunit_static_static_static_0300] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0400
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the color of the Progress component
      console.info('[ProgressJsunit_static_static_static_0400] START');
      let progressPage1 = AppStorage.get<ProgressPage1>("ProgressPage", Type.from<ProgressPage1>()) as ProgressPage1
      progressPage1.message.notify({name:'ProgressColor',value:Color.Blue})
      await CommonFunc.sleep(2000);
      // Get the color of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_static_static_0400] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('color')).assertEqual('#FF808080');
      await CommonFunc.sleep(1000);
      console.info('[ProgressJsunit_static_static_static_0400] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0500
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the backgroundColor of the Progress component
      console.info('[ProgressJsunit_static_static_static_0500] START');
      let progressPage1 = AppStorage.get<ProgressPage1>("ProgressPage", Type.from<ProgressPage1>()) as ProgressPage1
      progressPage1.message.notify({name:'backgroundColor',value:Color.Black})
      await CommonFunc.sleep(2000);
      // Get the backgroundColor of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_static_static_0500] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('backgroundColor')).assertEqual('#FF000000');
      console.info('[ProgressJsunit_static_static_static_0500] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0600
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the style of the Progress component
      console.info('[ProgressJsunit_static_static_static_0600] START');
      let progressPage1 = AppStorage.get<ProgressPage1>("ProgressPage", Type.from<ProgressPage1>()) as ProgressPage1
      progressPage1.message.notify({name:'ProgressType',value:ProgressStyle.ScaleRing})
      await CommonFunc.sleep(2000);

      // Get the value of the modified style attribute
      let strJson = inspector.getInspectorByKey('pro3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunProgressJsunit_static_static_static_0600it_0500] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('type')).assertEqual('ProgressStyle.ScaleRing');
      console.info('[ProgressJsunit_static_static_static_0600] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0700
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the value of the Progress component
      console.info('[ProgressJsunit_static_static_static_0700] START');
      let progressPage1 = AppStorage.get<ProgressPage1>("ProgressPage", Type.from<ProgressPage1>()) as ProgressPage1
      progressPage1.message.notify({name:'progressValue',value:20})
      await CommonFunc.sleep(2000);
      // Get the value of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_static_static_0700] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual('20.000000');
      console.info('[ProgressJsunit_static_static_static_0700] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0800
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0800', Level.LEVEL1,  async (done: () => void): Promise<void> => {
      // Illegal modification of the value of the Progress component
      console.info('[ProgressJsunit_static_static_static_0800] START');
      let progressPage1 = AppStorage.get<ProgressPage1>("ProgressPage", Type.from<ProgressPage1>()) as ProgressPage1
      progressPage1.message.notify({name:'progressValue',value:-20})
      await CommonFunc.sleep(1500);
      // Get the value of Progress component after illegal modification
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_static_static_0800] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('value')).assertEqual('0.000000');

      // globalThis.value.message.notify({name:'progressValue',value:400})
      let progressPage2 = AppStorage.get<ProgressPage1>("ProgressPage", Type.from<ProgressPage1>()) as ProgressPage1
      progressPage2.message.notify({name:'progressValue',value:400})
      await CommonFunc.sleep(1500);
      // Get the value of the Progress component after illegal modification again
      let strJson1 = inspector.getInspectorByKey('pro1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ProgressJsunit_static_static_static_0800] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      expect(obj1.getElement('$attrs').getElement('value')).assertEqual('200.000000');
      console.info('[ProgressJsunit_static_static_static_0800] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name ProgressJsunit_static_static_static_0900
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ProgressJsunit_static_static_static_0900', Level.LEVEL1,  async (done: () => void): Promise<void> => {
      // Get the default value of the Progress component
      console.info('[ProgressJsunit_static_static_static_0900] START');
      let strJson = inspector.getInspectorByKey('pro2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_static_static_0900] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getElement('value')).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getElement('total')).assertEqual('100.000000');
      expect(obj.getElement('$attrs').getElement('type')).assertEqual('ProgressStyle.Linear');
      console.info('[ProgressJsunit_static_static_static_0900] END');
      done();
    });
  })
}