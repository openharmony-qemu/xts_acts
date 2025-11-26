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

export default function maskBackgroundBlurStyleTest() {
  describe('maskBackgroundBlurStyleTest', () => {
    beforeAll(() => {
      console.info("maskTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindMenu/maskBackgroundBlurStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get maskBackgroundBlurStyleTest state success ' + JSON.stringify(pages));
        if (!('maskBackgroundBlurStyleTest' == pages.name)) {
          console.info('get maskBackgroundBlurStyleTest state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_2000);
        }
      } catch (err) {
        console.error('push maskBackgroundBlurStyleTest page error ' + JSON.stringify(err));
      }
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0001
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0001
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("bindMenu_maskBackgroundBlurStyle_0001 START============================");
      let driver: Driver = Driver.create();
      let btn10:Component = await driver.findComponent(ON.id('button10')) as Component;
      await btn10.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.Thin');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn10.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0001 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0002
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0002
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("bindMenu_maskBackgroundBlurStyle_0002 START============================");
      const SLEEP_TIME_500 = 1000;
      let driver: Driver = Driver.create();
      let btn11:Component = await driver.findComponent(ON.id('button11')) as Component;
      await btn11.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.Regular');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn11.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0002 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0003
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0003
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0003
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0003 START============================');
      let driver: Driver = Driver.create();
      let btn12:Component = await driver.findComponent(ON.id('button12')) as Component;
      await btn12.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.Thick');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn12.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0003 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0004
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0004
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0004
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0004 START============================');
      let driver: Driver = Driver.create();
      let btn13:Component = await driver.findComponent(ON.id('button13')) as Component;
      await btn13.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.BACKGROUND_THIN');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn13.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0004 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0005
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0005
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0005
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0005 START============================');
      let driver: Driver = Driver.create();
      let btn14:Component = await driver.findComponent(ON.id('button14')) as Component;
      await btn14.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn14.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0005 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0006
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0006
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0006
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0006 START============================');
      let driver: Driver = Driver.create();
      let btn15:Component = await driver.findComponent(ON.id('button15')) as Component;
      await btn15.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.BACKGROUND_THICK');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn15.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0006 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0007
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0007
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0007
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0007 START============================');
      let driver: Driver = Driver.create();
      let btn16:Component = await driver.findComponent(ON.id('button16')) as Component;
      await btn16.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn16.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0007 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0008
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0008
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0008
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0008 START============================');
      let driver: Driver = Driver.create();
      let btn17:Component = await driver.findComponent(ON.id('button17')) as Component;
      await btn17.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.NONE');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn17.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0008 END============================");
      done();
    });
    
    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0009
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0009
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0009
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0009 START============================');
      let driver: Driver = Driver.create();
      let btn18:Component = await driver.findComponent(ON.id('button18')) as Component;
      await btn18.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn18.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0009 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0010
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0010
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0010
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0010 START============================');
      let driver: Driver = Driver.create();
      let btn19:Component = await driver.findComponent(ON.id('button19')) as Component;
      await btn19.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.COMPONENT_THIN');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn19.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0010 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0011
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0011
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0011
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0011 START============================');
      let driver: Driver = Driver.create();
      let btn20:Component = await driver.findComponent(ON.id('button20')) as Component;
      await btn20.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.COMPONENT_REGULAR');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn20.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0011 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0012
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0012
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0012
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0012 START============================');
      let driver: Driver = Driver.create();
      let btn21:Component = await driver.findComponent(ON.id('button21')) as Component;
      await btn21.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.COMPONENT_THICK');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn21.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0012 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0013
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0013
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0013
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0013 START============================');
      let driver: Driver = Driver.create();
      let btn22:Component = await driver.findComponent(ON.id('button22')) as Component;
      await btn22.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn22.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0013 END============================");
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0014
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0014
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0014
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0014 START============================');
      let driver: Driver = Driver.create();
      let btn23:Component = await driver.findComponent(ON.id('button23')) as Component;
      await btn23.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.BACKGROUND_THIN');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn23.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0014 END============================");
      done();
    });
    
    /*
     * @tc.number   bindMenu_maskBackgroundBlurStyle_static_0015
     * @tc.name     bindMenu_maskBackgroundBlurStyle_static_0015
     * @tc.desc     bindMenu_maskBackgroundBlurStyle_static_0015
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskBackgroundBlurStyle_static_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskBackgroundBlurStyle_0015 START============================');
      let driver: Driver = Driver.create();
      let btn24:Component = await driver.findComponent(ON.id('button24')) as Component;
      await btn24.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getElement('backgroundBlurStyle').getString('value'));
        expect(JSON.parseJsonElement(text01)).assertEqual('BlurStyle.BACKGROUND_THIN');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn24.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info("bindMenu_maskBackgroundBlurStyle_0015 END============================");
      done();
    });
  })
}