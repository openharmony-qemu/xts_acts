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
export default function menuSubMenuExpandSymbolTest() {
  describe('menuSubMenuExpandSymbolTest', () => {
    beforeAll(() => {
      console.info("menuSubMenuExpandSymbolTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/subMenuExpandSymbol',
      }
      try {
  const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get subMenuExpandSymbol state success ' + JSON.stringify(pages));
        if (!('subMenuExpandSymbol' == pages.name)) {
          console.info('get subMenuExpandSymbol state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error('push subMenuExpandSymbol page error ' + JSON.stringify(err));
      }
    });

    
    /*
     * @tc.number   menuSubMenuExpandSymbolTest_static_0010
     * @tc.name     menuSubMenuExpandSymbolTest_static_0010
     * @tc.desc     menuSubMenuExpandSymbolTest_static_0010
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('menuSubMenuExpandSymbolTest_static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'menuSubMenuExpandSymbolTest_0010';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn:Component = await driver.findComponent(ON.id("btn1")) as Component;
      await btn.click();
      await Utils.sleep(1000);
      let btn1:Component= await driver.findComponent(ON.id("MenuItem1")) as Component;
      btn1.click();
      await Utils.sleep(2000);
      let obj = inspector.getInspectorByKey('text1');
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(obj).getElement('$attrs').getString('content')).assertEqual('sys.symbol.chevron_forward');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    /*
     * @tc.number   menuSubMenuExpandSymbolTest_static_0020
     * @tc.name     menuSubMenuExpandSymbolTest_static_0020
     * @tc.desc     menuSubMenuExpandSymbolTest_static_0020
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('menuSubMenuExpandSymbolTest_static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'menuSubMenuExpandSymbolTest_0020';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn:Component = await driver.findComponent(ON.id("btn2")) as Component;
      await btn.click();
      await Utils.sleep(1000);
      let btn1:Component= await driver.findComponent(ON.id("MenuItem2")) as Component;
      btn1.click();
      await Utils.sleep(2000);
      let obj = inspector.getInspectorByKey('text2');
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(obj).getElement('$attrs').getString('content')).assertEqual('sys.symbol.chevron_forward');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    /*
     * @tc.number   menuSubMenuExpandSymbolTest_static_0030
     * @tc.name     menuSubMenuExpandSymbolTest_static_0030
     * @tc.desc     menuSubMenuExpandSymbolTest_static_0030
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('menuSubMenuExpandSymbolTest_static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'menuSubMenuExpandSymbolTest_0030';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn:Component = await driver.findComponent(ON.id("btn3")) as Component;
      await btn.click();
      await Utils.sleep(1000);
      let btn1:Component= await driver.findComponent(ON.id("MenuItem3")) as Component;
      btn1.click();
      await Utils.sleep(2000);
      let obj = inspector.getInspectorByKey('text3');
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(obj).getElement('$attrs').getString('content')).assertEqual('sys.symbol.chevron_forward');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    /*
     * @tc.number   menuSubMenuExpandSymbolTest_static_0040
     * @tc.name     menuSubMenuExpandSymbolTest_static_0040
     * @tc.desc     menuSubMenuExpandSymbolTest_static_0040
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('menuSubMenuExpandSymbolTest_static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'menuSubMenuExpandSymbolTest_0040';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn:Component = await driver.findComponent(ON.id("btn4")) as Component;
      await btn.click();
      await Utils.sleep(1000);
      let btn1:Component= await driver.findComponent(ON.id("MenuItem4")) as Component;
      btn1.click();
      await Utils.sleep(2000);
      let obj = inspector.getInspectorByKey('text4');
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(obj).getElement('$attrs').getString('content')).assertEqual('sys.symbol.chevron_down');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    /*
     * @tc.number   menuSubMenuExpandSymbolTest_static_0050
     * @tc.name     menuSubMenuExpandSymbolTest_static_0050
     * @tc.desc     menuSubMenuExpandSymbolTest_static_0050
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('menuSubMenuExpandSymbolTest_static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'menuSubMenuExpandSymbolTest_0050';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn:Component = await driver.findComponent(ON.id("btn5")) as Component;
      await btn.click();
      await Utils.sleep(1000);
      let btn1:Component= await driver.findComponent(ON.id("MenuItem5")) as Component;
      btn1.click();
      await Utils.sleep(2000);
      let obj = inspector.getInspectorByKey('text5');
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(obj).getElement('$attrs').getString('content')).assertEqual('sys.symbol.chevron_down');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    /*
     * @tc.number   menuSubMenuExpandSymbolTest_static_0060
     * @tc.name     menuSubMenuExpandSymbolTest_static_0060
     * @tc.desc     menuSubMenuExpandSymbolTest_static_0060
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('menuSubMenuExpandSymbolTest_static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'menuSubMenuExpandSymbolTest_0060';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn:Component = await driver.findComponent(ON.id("btn6")) as Component;
      await btn.click();
      await Utils.sleep(1000);
      let btn1:Component= await driver.findComponent(ON.id("MenuItem6")) as Component;
      btn1.click();
      await Utils.sleep(2000);
      let obj = inspector.getInspectorByKey('text6');
      await Utils.sleep(2000);
      expect(JSON.parseJsonElement(obj).getElement('$attrs').getString('content')).assertEqual('sys.symbol.chevron_down');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });
  })
}