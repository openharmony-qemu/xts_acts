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

export default function maskColorTest() {
  describe('maskColorTest', () => {
    beforeAll(() => {
      console.info("maskColorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api20.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindMenu/maskColor',
      }
      try {
  const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get maskColorTest state success ' + JSON.stringify(pages));
        if (!('maskColorTest' == pages.name)) {
          console.info('get colorTest state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_2000);
        }
      } catch (err) {
        console.error('push maskColorTest page error ' + JSON.stringify(err));
      }
    });

    
    /*
     * @tc.number   bindMenu_maskColor_static_0001
     * @tc.name     bindMenu_maskColor_static_0001
     * @tc.desc     bindMenu_maskColor_static_0001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskColor_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskColor_0001 START============================');
      let driver: Driver = Driver.create();
      let btn5:Component = await driver.findComponent(ON.id('button5')) as Component;
      await btn5.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('color'));
        expect(JSON.parseJsonElement(text01)).assertEqual('#809B43C9');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn5.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0001 END============================');
      done();
    });
    
    /*
     * @tc.number   bindMenu_maskColor_static_0002
     * @tc.name     bindMenu_maskColor_static_0002
     * @tc.desc     bindMenu_maskColor_static_0002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskColor_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("bindMenu_maskColor_0002 START============================");
      let driver: Driver = Driver.create();
      let btn6:Component = await driver.findComponent(ON.id('button6')) as Component;
      await btn6.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('color'));
        expect(JSON.parseJsonElement(text01)).assertEqual('#FF6495ED');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn6.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0002 END============================');
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskColor_static_0003
     * @tc.name     bindMenu_maskColor_static_0003
     * @tc.desc     bindMenu_maskColor_static_0003
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskColor_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskColor_0003 START============================');
      let driver: Driver = Driver.create();
      let btn7:Component = await driver.findComponent(ON.id('button7')) as Component;
      await btn7.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('color'));
        expect(JSON.parseJsonElement(text01)).assertEqual('#FF0000FF');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn7.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0003 END============================');
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskColor_static_0004
     * @tc.name     bindMenu_maskColor_static_0004
     * @tc.desc     bindMenu_maskColor_static_0004
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskColor_static_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskColor_0004 START============================');
      let driver: Driver = Driver.create();
      let btn8:Component = await driver.findComponent(ON.id('button8')) as Component;
      await btn8.click();
      await Utils.sleep(SLEEP_TIME_500);
      let color = inspector.getInspectorByKey('resource1');
      let color4 = JSON.stringify(JSON.parseJsonElement(color).getElement('$attrs').getString('backgroundColor'));
      console.log('bindMenu_maskColor_0004' + color4);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('color'));
        expect('\"' + JSON.parseJsonElement(text01) + '\"').assertEqual(color4);
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn8.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0004 END============================');
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskColor_static_0005
     * @tc.name     bindMenu_maskColor_static_0005
     * @tc.desc     bindMenu_maskColor_static_0005
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskColor_static_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskColor_0005 START============================');
      let driver: Driver = Driver.create();
      let btn9:Component = await driver.findComponent(ON.id('button9')) as Component;
      await btn9.click();
      await Utils.sleep(SLEEP_TIME_500);
      let color = inspector.getInspectorByKey('resource1');
      let color5 = JSON.stringify(JSON.parseJsonElement(color).getElement('$attrs').getString('backgroundColor'));
      console.log('bindMenu_maskColor_0005' + color5);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('color'));
        expect('\"' + JSON.parseJsonElement(text01) + '\"').assertEqual(color5);
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn9.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0005 END============================');
      done();
    });

    
    /*
     * @tc.number   bindMenu_maskColor_static_0006
     * @tc.name     bindMenu_maskColor_static_0006
     * @tc.desc     bindMenu_maskColor_static_0006
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('bindMenu_maskColor_static_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindMenu_maskColor_0006 START============================');
      let driver: Driver = Driver.create();
      let btn25:Component = await driver.findComponent(ON.id('button25')) as Component;
      await btn25.click();
      await Utils.sleep(SLEEP_TIME_500);
      let tree = inspector.getInspectorTree();
      let resource = inspector.getInspectorByKey('resource');
      let data = JSON.stringify(JSON.parseJsonElement(resource).getElement('$attrs').getString('content'));
      if (data === '"true"') {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('true');
        let text01 = JSON.stringify(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('color'));
        expect(JSON.parseJsonElement(text01)).assertEqual('#FFFFFFFF');
      } else {
        let text = JSON.stringify(JSON.parseJsonElement(JSON.stringify(tree))
          .getElement('$children[CHILD_ONE]').getElement('$children[CHILD_ZERO]').getElement('$attrs').getElement('mask').getString('mask'));
        expect(JSON.parseJsonElement(text)).assertEqual('false');
      }
      await btn25.click();
      await Utils.sleep(SLEEP_TIME_500);
      console.info('bindMenu_maskColor_0006 END============================');
      done();
    });
  })
}