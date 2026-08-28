'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';


export default function menuEnabledJsunit() {
  describe('menuEnabledJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("menuEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuEnabled',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get menuEnabledJsunit state pages: " + JSON.stringify(pages));
        if (!("menuEnabled" == pages.name)) {
          console.info("get menuEnabledJsunit state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menuEnabledJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuEnabledJsunit page error: " + err);
        expect().assertFail();
      }

    });


    
    
/**
     * @tc.number   menuEnabledJsunit_static_0100
     * @tc.name     menuEnabledJsunit_static_0100
     * @tc.desc     menuEnabledJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('menuEnabledJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('menuEnabledJsunit_static_0100 START');
      let driver: Driver = Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('bindMenuEnd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuEnabledJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[menuEnabledJsunit_static_0100] enabled: " +
      JSON.stringify(obj.getElement('$attrs').getBoolean('enabled')));
      expect(obj.getElement('$attrs').getBoolean('enabled')).assertEqual(false);
      console.info('[menuEnabledJsunit_static_0100] END');
      done();
    });


    
    
/**
     * @tc.number   menuEnabledJsunit_static_0200
     * @tc.name     menuEnabledJsunit_static_0200
     * @tc.desc     menuEnabledJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
it('menuEnabledJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('menuEnabledJsunit_static_0200 START');
      let driver = Driver.create()
      let button: Component | undefined;
      try {
        button = await driver.findComponent(ON.id('cmEnd'));
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      let menuEnabled: Component | undefined;
      try {
        menuEnabled = await driver.findComponent(ON.id('menuEnabled'));
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await (menuEnabled?.click() as Promise<void>);
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await driver.triggerKey(2070)
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      let change: Component | undefined;
      try {
        change = await driver.findComponent(ON.id('change'));
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await (change?.click() as Promise<void>);
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuEnabledJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('menuEnabled' + '_text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuEnabledJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[menuEnabledJsunit_static_0200] enabled: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('enabled');
      console.info('[menuEnabledJsunit_static_0200] END');
      done();
    });

  })
}
