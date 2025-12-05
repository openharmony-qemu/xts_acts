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
export default function selectModalModeTest() {
  describe('selectModalModeTest', () => {
    beforeAll(() => {
      console.info("selectModalModeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/selectModalMode',
      }
      try {
  const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get selectModalMode state success ' + JSON.stringify(pages));
        if (!('selectModalMode' == pages.name)) {
          console.info('get selectModalMode state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error('push selectModalMode page error ' + JSON.stringify(err));
      }
    });

    
    /*
     * @tc.number   selectModalModeTest_static_0010
     * @tc.name     selectModalModeTest_static_0010
     * @tc.desc     selectModalModeTest_static_0010
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('selectModalModeTest_static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('selectModalModeTest_0010 START');
      let driver =  Driver.create()
      await Utils.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('selectmode')) as Component;
      await button.click();
      await Utils.sleep(1000);

      let menu:Component = await driver.findComponent(ON.id('menu')) as Component;
      await menu.click();
      await Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('text1');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('0');
      
      console.info('selectModalModeTest_0010 END');
      done();
    });

     
    /*
     * @tc.number   selectModalModeTest_static_0020
     * @tc.name     selectModalModeTest_static_0020
     * @tc.desc     selectModalModeTest_static_0020
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('selectModalModeTest_static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('selectModalModeTest_0020 START');
      let driver =  Driver.create()
      await Utils.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('selectmode1')) as Component;
      await button.click();
      await Utils.sleep(1000);

      let menu:Component = await driver.findComponent(ON.id('menu1')) as Component;
      await menu.click();
      await Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('text2');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('1');
      await Utils.sleep(2000);
      console.info('selectModalModeTest_0020 END');
      done();
    });

    
    /*
     * @tc.number   selectModalModeTest_static_0030
     * @tc.name     selectModalModeTest_static_0030
     * @tc.desc     selectModalModeTest_static_0030
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('selectModalModeTest_static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('selectModalModeTest_0030 START');
      let driver =  Driver.create()
      await Utils.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('selectmode2')) as Component;
      await button.click();
      await Utils.sleep(1000);

      let menu:Component = await driver.findComponent(ON.id('menu2')) as Component;
      await menu.click();
      await Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('text3');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('2');
      await Utils.sleep(2000);
      console.info('selectModalModeTest_0030 END');
      done();
    });

  })
}