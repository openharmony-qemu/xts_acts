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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color,ResourceColor} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function NavDestinationJsunit() {
  describe('navDestinationJsunit', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavDestination beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/NavDestinationPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavDestination state pages: " + JSON.stringify(pages));
        if (!("NavDestinationPage" == pages.name)) {
          console.info("get NavDestination state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          console.info("push NavDestination page result: ");
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push NavDestination page error: " + err);
        expect().assertFail();
      }
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0100
     * @tc.name     NavDestinationJsunit_static_0100
     * @tc.desc     NavDestinationJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get title name of NavDestination component
      console.info('[NavDestinationJsunit_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let textComponent = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
      await textComponent.click();
      await CommonFunc.sleep(2000);
  let strJsonNew2 = inspector.getInspectorByKey('NavDestination1');
  await CommonFunc.sleep(2000);
  let objNew2 = JSON.parseJsonElement(strJsonNew2);
      console.info("[NavDestinationJsunit_static_0100] text: " + objNew2.getElement('$attrs').getString('title'));

      expect(objNew2.getElement('$attrs').getString('title') == 'NavDestination1').assertTrue();
      console.info('[NavDestinationJsunit_static_0100] END');
      done();
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0200
     * @tc.name     NavDestinationJsunit_static_0200
     * @tc.desc     NavDestinationJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get backgroundColor of NavDestination component
      console.info('[NavDestinationJsunit_static_0200] START');
  let driver = Driver.create()
  let textComponent = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
  await textComponent.click();
  await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('NavDestination1');

      console.info("[NavDestinationJsunit_static_0200] component JSON.parseJsonElement(strJson) is: " + strJson);
      console.info("[NavDestinationJsunit_static_0200] backgroundColor: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF808080');
      console.info('[NavDestinationJsunit_static_0200] END');
      done();
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0300
     * @tc.name     NavDestinationJsunit_static_0300
     * @tc.desc     NavDestinationJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify title name of NavDestination component
      console.info('[NavDestinationJsunit_static_0300] START');
  AppStorage.setOrCreate<string>('navTitle','NavDestinationTitle')
      await CommonFunc.sleep(2000);
  let driver = Driver.create()
  let navRouter1Component = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
  await navRouter1Component.click();
  await CommonFunc.sleep(2000);
  let strJsonNew2 = inspector.getInspectorByKey('NavDestination1');
  await CommonFunc.sleep(2000);
  let objNew2 = JSON.parseJsonElement(strJsonNew2);
  console.info("[NavDestinationJsunit_static_0100] text: " + objNew2.getElement('$attrs').getString('title'));

  expect(objNew2.getElement('$attrs').getString('title') == 'NavDestinationTitle1').assertTrue();
      console.info('[NavDestinationJsunit_static_0300] END');
      done();
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0400
     * @tc.name     NavDestinationJsunit_static_0400
     * @tc.desc     NavDestinationJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify backgroundColor of NavDestination component
      console.info('[NavDestinationJsunit_static_0400] START');

  AppStorage.setOrCreate<Color>('backColor',Color.Green)
      await CommonFunc.sleep(2000);
    let driver = Driver.create()
      let navRouter1Component = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
      await navRouter1Component.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('NavDestination1');

      console.info("[NavDestinationJsunit_static_0400] component JSON.parseJsonElement(strJson) is: " + strJson);
      console.info("[NavDestinationJsunit_static_0400] backgroundColor: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF008000');
      console.info('[NavDestinationJsunit_static_0400] END');
      done();
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0500
     * @tc.name     NavDestinationJsunit_static_0500
     * @tc.desc     NavDestinationJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // illegal modify title name of NavDestination component
      console.info('[NavDestinationJsunit_static_0500] START');

  AppStorage.setOrCreate<string>('navTitle','123')
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
          let navRouter1Component = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
          await navRouter1Component.click();
          await CommonFunc.sleep(2000);
  let strJsonNew2 = inspector.getInspectorByKey('NavDestination1');

  await CommonFunc.sleep(2000);
  let objNew2 = JSON.parseJsonElement(strJsonNew2);
  console.info("[NavDestinationJsunit_static_0100] text: " + objNew2.getElement('$attrs').getString('title'));

  expect(objNew2.getElement('$attrs').getString('title') == '1231').assertTrue();

      console.info('[NavDestinationJsunit_static_0500] END');
      done();
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0600
     * @tc.name     NavDestinationJsunit_static_0600
     * @tc.desc     NavDestinationJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // illegal modify backgroundColor of NavDestination component
      console.info('[NavDestinationJsunit_static_0600] START');

  AppStorage.setOrCreate<string>('backColor','#FF00007B')
      await CommonFunc.sleep(2000);
    let driver = Driver.create()
    let navRouter1Component = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
    await navRouter1Component.click();
    await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('NavDestination1');

      console.info("[NavDestinationJsunit_static_0600] component JSON.parseJsonElement(strJson) is: " + strJson);
      console.info("[NavDestinationJsunit_static_0600] backgroundColor: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00007B');
      console.info('[NavDestinationJsunit_static_0600] END');
      done();
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0700
     * @tc.name     NavDestinationJsunit_static_0700
     * @tc.desc     NavDestinationJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get hideTitleBar value of NavDestination component
      console.info('[NavDestinationJsunit_static_0700] START');
      await CommonFunc.sleep(1000);
  let driver = Driver.create()
  let navRouter1Component = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
  await navRouter1Component.click();
  await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('NavDestination1');

      console.info("[NavDestinationJsunit_static_0700] component JSON.parseJsonElement(strJson) is: " + strJson);
      console.info("[NavDestinationJsunit_static_0700] hideTitleBar: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('hideTitleBar')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('hideTitleBar')).assertTrue();
      console.info('[NavDestinationJsunit_static_0700] END');
      done();
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0800
     * @tc.name     NavDestinationJsunit_static_0800
     * @tc.desc     NavDestinationJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Modify hideTitleBar value of NavDestination component
      console.info('[NavDestinationJsunit_static_0700] START');

  AppStorage.setOrCreate<boolean>('hideTitleBar',true)
      await CommonFunc.sleep(2000);
  let driver = Driver.create()
  let navRouter1Component = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
  await navRouter1Component.click();
  await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('NavDestination1');

      console.info("[NavDestinationJsunit_static_0700] component JSON.parseJsonElement(strJson) is: " + strJson);
      console.info("[NavDestinationJsunit_static_0700] hideTitleBar: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('hideTitleBar')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('hideTitleBar')).assertTrue();
      console.info('[NavDestinationJsunit_static_0700] END');
      done();
    });

    /*
     * @tc.number   NavDestinationJsunit_static_0900
     * @tc.name     NavDestinationJsunit_static_0900
     * @tc.desc     NavDestinationJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // illegal modify hideTitleBar value of NavDestination component
      console.info('[NavDestinationJsunit_static_0900] START');

  AppStorage.setOrCreate<boolean>('hideTitleBar',true)
      await CommonFunc.sleep(2000);
  let driver = Driver.create()
  let navRouter1Component = await (driver.findComponent(ON.id('NavRouter1')) as Promise<Component>);
  await navRouter1Component.click();
  await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('NavDestination1');

      console.info("[NavDestinationJsunit_static_0900] component JSON.parseJsonElement(strJson) is: " + strJson);
      console.info("[NavDestinationJsunit_static_0900] hideTitleBar: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('hideTitleBar')).assertTrue();
      console.info('[NavDestinationJsunit_static_0900] END');
      done();
    });
  })
}
