/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { Driver, Component, ON } from '@ohos.UiTest'

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from "@ohos.arkui.inspector";
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

export default function progressStyleJsunit() {
  describe('progressTest', () => {
    beforeAll(() => {
      console.info("progressTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    /**
     * @tc.number testProgressStyle0001
     * @tc.name testProgressStyle_static_0001
     * @tc.desc Set color values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgressStyle_static_0001', 0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyle0001 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyle0001] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('color')).assertEqual("#FF123456");

      console.info('testProgressStyle0001 END');
      done();
    });

    /**
     * @tc.number testProgressStyle0002
     * @tc.name testProgressStyle_static_0002
     * @tc.desc Set value values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgressStyle_static_0002', 0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyle0002 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyle0002] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('value')).assertEqual("12.000000");

      console.info('testProgressStyle0002 END');
      done();
    });

    /**
     * @tc.number testProgressStyle0003
     * @tc.name testProgressStyle_static_0003
     * @tc.desc Set style values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgressStyle_static_0003', 0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyle0003 START');
      let strJson = inspector.getInspectorByKey('ProgressKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressStyle0003] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('style')).assertEqual('{"strokeWidth":"20.00vp","scaleCount":"30","scaleWidth":"20.00vp"}');
      console.info('testProgressStyle0003 END');
      done();
    });
    /**
     * @tc.number testProgressStyle0004
     * @tc.name testProgressStyle_static_0004
     * @tc.desc Change value values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testProgressStyle_static_0004', 0, async (done: () => void): Promise<void> => {
      console.info('testProgressStyle0004 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000)

      let strJsonNew = inspector.getInspectorByKey('ProgressKey1'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testProgressStyle0004 component  is: " + JSON.stringifyJsonElement(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('value')).assertEqual('5.000000');
      console.info('testProgressStyle0004 END');
      done();
    });
  })
}
