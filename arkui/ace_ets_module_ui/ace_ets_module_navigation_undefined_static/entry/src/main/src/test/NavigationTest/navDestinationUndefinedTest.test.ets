'use static';
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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function NavDestinationUndefinedTest() {
  describe('NavDestinationUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("NavDestinationUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavDestinationUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navDestinationUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get NavDestinationUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("navDestinationUndefined" == pages.name)) {
          console.info("get navDestinationUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push navDestinationUndefined page error:" + err);
      }
      console.info("NavDestinationUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   NavDestinationUndefinedTest_static_0100
     * @tc.name     NavDestinationUndefinedTest_static_0100
     * @tc.desc     NavDestinationUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('NavDestinationUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavDestinationUndefinedTest_static_0100] START');
      try{

      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let Btn_page2 = await driver.findComponent(ON.id('pageTwo'));
      await (Btn_page2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('NavDestination_systemTransition'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('NavDestination_2');
      console.info("[NavDestinationUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[NavDestinationUndefinedTest_static_0100] systemTransition: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('systemTransition')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('systemTransition'))
        .assertEqual('NavigationSystemTransitionType.FADE');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavDestinationUndefinedTest_static_0100] click NavDestination_systemTransition");
      strJson = inspector.getInspectorByKey('NavDestination_2');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('systemTransition'))
        .assertEqual('NavigationSystemTransitionType.DEFAULT');
      await CommonFunc.sleep(1000);
      }catch (err) {
        console.error('NavDestinationUndefinedTest_static_0100 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[NavDestinationUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   NavDestinationUndefinedTest_static_0200
     * @tc.name     NavDestinationUndefinedTest_static_0200
     * @tc.desc     NavDestinationUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('NavDestinationUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavDestinationUndefinedTest_static_0200] START');
      try{

      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let BtnPop = await driver.findComponent(ON.id('NavDestination2_pop'));
      await (BtnPop?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let changeBtn = await driver.findComponent(ON.id('NavDestination_onWill'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let Btn_page2 = await driver.findComponent(ON.id('pageTwo'));
      await (Btn_page2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      BtnPop = await driver.findComponent(ON.id('NavDestination2_pop'));
      await (BtnPop?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let text = await driver.findComponent(ON.id('Navigation_text'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('appear:1 disappear:1');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (Btn_page2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      BtnPop = await driver.findComponent(ON.id('NavDestination2_pop'));
      await (BtnPop?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('appear:1 disappear:1');
      }catch (err) {
        console.error('NavDestinationUndefinedTest_static_0200 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[NavDestinationUndefinedTest_static_0200] END');
      done();
    });

    /**
    * @tc.number   NavDestinationUndefinedTest_static_0300
    * @tc.name     NavDestinationUndefinedTest_static_0300
    * @tc.desc     NavDestinationUndefinedTest_static_0300
    * @tc.level    Level.LEVEL1
    */
    it('NavDestinationUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavDestinationUndefinedTest_static_0300] START');
      try{
      let driver: Driver = await Driver.create()
      let Btn_page2 = await driver.findComponent(ON.id('pageTwo'));
      await (Btn_page2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('NavDestination_mode'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('NavDestination_2');
      console.info("[NavDestinationUndefinedTest_static_0300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[NavDestinationUndefinedTest_static_0300] mode: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mode')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode'))
        .assertEqual('NavDestinationMode::DIALOG');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavDestinationUndefinedTest_static_0300] click NavDestination_mode");
      strJson = inspector.getInspectorByKey('NavDestination_2');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode'))
        .assertEqual('NavDestinationMode::STANDARD');
      await CommonFunc.sleep(1000);
      }catch (err) {
        console.error('NavDestinationUndefinedTest_static_0300 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[NavDestinationUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   NavDestinationUndefinedTest_static_0400
     * @tc.name     NavDestinationUndefinedTest_static_0400
     * @tc.desc     NavDestinationUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('NavDestinationUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavDestinationUndefinedTest_static_0400] START');
      try{
      let driver: Driver = await Driver.create()
      let BtnPop = await driver.findComponent(ON.id('NavDestination2_pop'));
      await (BtnPop?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let changeBtn = await driver.findComponent(ON.id('NavDestination_isShow'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let Btn_page2 = await driver.findComponent(ON.id('pageTwo'));
      await (Btn_page2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      BtnPop = await driver.findComponent(ON.id('NavDestination2_pop'));
      await (BtnPop?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let text = await driver.findComponent(ON.id('Navigation_text'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('appear:2 disappear:2');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (Btn_page2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      BtnPop = await driver.findComponent(ON.id('NavDestination2_pop'));
      await (BtnPop?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('appear:2 disappear:2');
      }catch (err) {
        console.error('NavDestinationUndefinedTest_static_0400 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[NavDestinationUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   NavDestinationUndefinedTest_static_0500
     * @tc.name     NavDestinationUndefinedTest_static_0500
     * @tc.desc     NavDestinationUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('NavDestinationUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavDestinationUndefinedTest_static_0500] START');
      await CommonFunc.sleep(500);
      try{
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(500);
      let BtnPop = await driver.findComponent(ON.id('NavDestination2_pop'));
      await CommonFunc.sleep(1000);
      let changeBtn = await driver.findComponent(ON.id('NavDestination_isBackAndReady'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let Btn_page2 = await driver.findComponent(ON.id('pageTwo'));
      await (Btn_page2?.click() as Promise<void>);
      console.info('[NavDestinationUndefinedTest_static_0500] POP2');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2);
      await CommonFunc.sleep(1000);
      BtnPop = await driver.findComponent(ON.id('NavDestination2_pop'));
      await CommonFunc.sleep(2000);
      console.info('[NavDestinationUndefinedTest_static_0500] POP3');
      await (BtnPop?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let text = await driver.findComponent(ON.id('Navigation_text'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('appear:3 disappear:3');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (Btn_page2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let backButton = await driver.findComponent(ON.id('backButton'));
      await (backButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      text = await driver.findComponent(ON.id('Navigation_text'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('appear:3 disappear:3');
      }catch (err) {
        console.error('NavDestinationUndefinedTest_static_0500 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[NavDestinationUndefinedTest_static_0500] END');
      done();
    });

  })
}