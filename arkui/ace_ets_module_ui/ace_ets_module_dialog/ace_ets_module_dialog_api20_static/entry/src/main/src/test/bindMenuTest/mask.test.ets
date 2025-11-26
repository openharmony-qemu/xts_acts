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
const SLEEP_TIME_2000 = 2000;
const SLEEP_TIME_500 = 500;
const CHILD_ONE = 1;
const CHILD_ZERO = 0;

export default function maskTest() {
  describe('maskTest', () => {
    beforeAll(() => {
      console.info("maskTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindMenu/mask',
      }
      try {
  const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get maskTest state success ' + JSON.stringify(pages));
        if (!('maskTest' == pages.name)) {
          console.info('get maskTest state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_2000);
        }
      } catch (err) {
        console.error('push maskTest page error ' + JSON.stringify(err));
      }
    });

    
    /*
     * @tc.number   bindMenu_mask_static_0001
     * @tc.name     bindMenu_mask_static_0001
     * @tc.desc     bindMenu_mask_static_0001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_mask_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("bindMenu_mask_0001 START============================");
      let driver: Driver = Driver.create();
      let btn1:Component= await driver.findComponent(ON.id('button1')) as Component;
      await btn1.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      let close:Component = await driver.findComponent(ON.id('close')) as Component;
      await close.click();
      await Utils.sleep(SLEEP_TIME_500);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      console.info("bindMenu_mask_0001 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_mask_static_0002
     * @tc.name     bindMenu_mask_static_0002
     * @tc.desc     bindMenu_mask_static_0002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_mask_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("bindMenu_mask_0002 START============================");
      let driver: Driver = Driver.create();
      let btn2:Component = await driver.findComponent(ON.id('button2')) as Component;
      await btn2.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      let close:Component = await driver.findComponent(ON.id('close')) as Component;
      await close.click();
      await Utils.sleep(SLEEP_TIME_500);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      console.info("bindMenu_mask_0002 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_mask_static_0003
     * @tc.name     bindMenu_mask_static_0003
     * @tc.desc     bindMenu_mask_static_0003
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_mask_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("bindMenu_mask_0003 START============================");
      let driver: Driver = Driver.create();
      let btn3:Component = await driver.findComponent(ON.id('button3')) as Component;
      await btn3.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      let close:Component = await driver.findComponent(ON.id('close')) as Component;
      await close.click();
      await Utils.sleep(SLEEP_TIME_500);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      console.info("bindMenu_mask_0003 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_mask_static_0004
     * @tc.name     bindMenu_mask_static_0004
     * @tc.desc     bindMenu_mask_static_0004
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_mask_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("bindMenu_mask_0004 START============================");
      let driver: Driver = Driver.create();
      let btn4:Component = await driver.findComponent(ON.id('button4')) as Component;
      await btn4.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      let close:Component = await driver.findComponent(ON.id('close')) as Component;
      await close.click();
      await Utils.sleep(SLEEP_TIME_500);
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      console.info("bindMenu_mask_0004 END============================");
      done();
    });
  })
}