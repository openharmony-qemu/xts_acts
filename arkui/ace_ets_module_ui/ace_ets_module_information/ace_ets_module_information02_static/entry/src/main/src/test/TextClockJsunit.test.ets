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

import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { MessageManager, Callback } from '../../ets/MainAbility/utils/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import CommonFunc from '../../ets/MainAbility/common/Common'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from './Utils.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextClockJsunit() {
  describe('textClockTest', () => {
    beforeAll(() => {
      console.info("TextClockJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/textClockPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    /**
     * @tc.number TextClock_0100
     * @tc.name TextClock_static_0100
     * @tc.desc Set format values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextClock_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0100] START');

      let strJson =  inspector.getInspectorByKey('TextClockKey1')

      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0100] obj :" + obj.getElement('$attrs').getString('format'));
      expect(obj.getElement('$attrs').getString('format')).assertEqual('hh:mm:ss');
      console.info('[TextClock_static_0100] END');
      done();
    });

    /**
     * @tc.number TextClock_0200
     * @tc.name TextClock_static_0200
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextClock_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0200] START');
      let strJson =  inspector.getInspectorByKey('TextClockKey1')
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0300] obj :" + obj.getElement('$attrs').getString('fontColor'));

      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF123456');
      console.info('[TextClock_static_0200] END');
      done();
    });

    /**
     * @tc.number TextClock_0300
     * @tc.name TextClock_static_0300
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextClock_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0300] START');
      let strJson =  inspector.getInspectorByKey('TextClockKey1')
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0300] obj :" +  obj.getElement('$attrs').getString('fontSize'));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('15.00fp');
      console.info('[TextClock_static_0400] END');
      done();
    });

    /**
     * @tc.number TextClock_0400
     * @tc.name TextClock_static_0400
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextClock_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0400] START');

      let strJson =  inspector.getInspectorByKey('TextClockKey1')
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0300] obj :" + obj.getElement('$attrs').getString('fontWeight'));

      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[TextClock_static_0400] END');
      done();
    });

    /**
     * @tc.number TextClock_0500
     * @tc.name TextClock_static_0500
     * @tc.desc Set fontStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextClock_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0500] START');

      let strJson =  inspector.getInspectorByKey('TextClockKey1')
      let obj = JSON.parseJsonElement(strJson);

      console.info("[TextClock_static_0300] obj :" + obj.getElement('$attrs').getString('fontStyle'));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      console.info('[TextClock_static_0500] END');
      done();
    });

    /**
     * @tc.number TextClock_0600
     * @tc.name TextClock_static_0600
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextClock_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info('[TextClock_static_0600] START');
      let strJson =  inspector.getInspectorByKey('TextClockKey1')
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0300] obj :" + obj.getElement('$attrs').getString('fontFamily'));
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      console.info('[TextClock_static_0600] END');
      done();
    });

    /**
     * @tc.number TextClock_0601
     * @tc.name TextClock_static_0601
     * @tc.desc Change fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('TextClock_static_0601', 0, async (done: () => void): Promise<void> => {
      console.info('TextClock_static_0601 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJsonNew =  inspector.getInspectorByKey('TextClockKey1')//测试组件的key名称
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("TextClock_static_0601 component  is: " + obj.getElement('$attrs').getString('fontSize'));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('15.00fp');
      console.info('TextClock_static_0601 END');
      done();
    });
  })
}
