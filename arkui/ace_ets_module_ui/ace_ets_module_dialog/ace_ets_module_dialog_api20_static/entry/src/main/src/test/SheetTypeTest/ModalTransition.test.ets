'use static';
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
import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
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

export default function ModalTransitionTest(){
  describe('ModalTransitionTest',  () =>{
    beforeAll(() => {
      console.info("ModalTransitionTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("ModalTransitionTest beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/modalTransition',
      }
      try {
  const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info("get ModalTransitionTest state pages: " + JSON.stringify(pages));
        if (!("ModalTransitionTest" == pages.name)) {
          console.info("get ModalTransitionTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ModalTransitionTest page error: " + err);
        expect().assertFail();
      }
    });
    
    /*
     * @tc.number   ModalTransitionTest_static_0100
     * @tc.name     ModalTransitionTest_static_0100
     * @tc.desc     ModalTransitionTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ModalTransitionTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalTransitionTest_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(2000);
      let btn1:Component= await driver.findComponent(ON.id('DEFAULT')) as Component;
      await btn1.click()
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[ModalTransitionTest_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ModalTransitionTest_0100] title: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('0');
      await CommonFunc.sleep(2000);
      let btn3:Component = await driver.findComponent(ON.id('close')) as Component;
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info('[ModalTransitionTest_0100] END');
      done();
    });

    
    /*
     * @tc.number   ModalTransitionTest_static_0200
     * @tc.name     ModalTransitionTest_static_0200
     * @tc.desc     ModalTransitionTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ModalTransitionTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalTransitionTest_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(2000);
      let btn1:Component= await driver.findComponent(ON.id('NONE')) as Component;
      await btn1.click()
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[ModalTransitionTest_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ModalTransitionTest_0200] title: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('1');
      await CommonFunc.sleep(2000);
      let btn3:Component = await driver.findComponent(ON.id('close')) as Component;
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info('[ModalTransitionTest_0200] END');
      done();
    });
    
     
    /*
     * @tc.number   ModalTransitionTest_static_0300
     * @tc.name     ModalTransitionTest_static_0300
     * @tc.desc     ModalTransitionTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ModalTransitionTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalTransitionTest_0300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(2000);
      let btn1:Component= await driver.findComponent(ON.id('ALPHA')) as Component;
      await btn1.click()
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[ModalTransitionTest_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ModalTransitionTest_0300] title: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('2');
      await CommonFunc.sleep(2000);
      let btn3:Component = await driver.findComponent(ON.id('close')) as Component;
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info('[ModalTransitionTest_0300] END');
      done();
    });

  })
}