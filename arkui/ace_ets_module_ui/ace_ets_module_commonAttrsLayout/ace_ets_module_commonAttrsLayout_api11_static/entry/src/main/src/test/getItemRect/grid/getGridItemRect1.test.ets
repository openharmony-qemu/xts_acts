/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { vp2px } from '@ohos.arkui.component';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../../Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function getGridItemRect1() {
  describe('getGridItemRect1', () => {
    beforeAll(() => {
      console.info("getGridItemRect1 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(()  => {
      console.info("getGridItemRect1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/grid/getGridItemRect1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get getGridItemRect1 state pages: " + JSON.stringify(pages));
        if (!("getGridItemRect1" == pages.name)) {
          console.info("get getGridItemRect1 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // await CommonFunc.sleep(2000);
          // console.info("push getGridItemRect1 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getGridItemRect1 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const getGridItemRect1 = AppStorage.get<Router>("getGridItemRect1", Type.from<Router>()) as Router;
      getGridItemRect1.back({
        url: 'MainAbility/pages/index/index'
      })
      console.info("BadgeFocus after each called");
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getGridItemRect1_static_0100
    * @tc.name  : getGridItemRect1_static_0100
    * @tc.desc  : set index to 3
    * @tc.level : Level 2
    */
    it('getGridItemRect1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect1_static_0100] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 3
      // });
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let gridItem_3 = CommonFunc.getComponentRect('getGridItemRect1_gridItem_3');

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getGridItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getGridItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getGridItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getGridItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(240));

      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(60));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getGridItemRect1_static_0200
    * @tc.name  : getGridItemRect1_static_0200
    * @tc.desc  : set index to 4
    * @tc.level : Level 2
    */
    it('getGridItemRect1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect1_static_0200] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 4
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getGridItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getGridItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getGridItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getGridItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(60));
      expect(Math.round(y)).assertEqual(Math.round(100));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(60));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getGridItemRect1_static_0400
    * @tc.name  : getGridItemRect1_static_0400
    * @tc.desc  : set index to 100
    * @tc.level : Level 2
    */
    it('getGridItemRect1_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect1_static_0400] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 100
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getGridItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getGridItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getGridItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getGridItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(0));
      expect(Math.round(height)).assertEqual(Math.round(0));
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getGridItemRect1_static_0500
    * @tc.name  : getGridItemRect1_static_0500
    * @tc.desc  : set index to 0
    * @tc.level : Level 2
    */
    it('getGridItemRect1_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect1_static_0500] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getGridItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getGridItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getGridItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getGridItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(60));
      expect(Math.round(height)).assertEqual(Math.round(200));
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getGridItemRect1_static_0600
    * @tc.name  : getGridItemRect1_static_0600
    * @tc.desc  : set index to 1
    * @tc.level : Level 2
    */
    it('getGridItemRect1_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect1_static_0600] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 1
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getGridItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getGridItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getGridItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getGridItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(60));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(120));
      expect(Math.round(height)).assertEqual(Math.round(100));
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getGridItemRect1_static_0700
    * @tc.name  : getGridItemRect1_static_0700
    * @tc.desc  : set index to 0,set the padding of grid to 20
    * @tc.level : Level 2
    */
    it('getGridItemRect1_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect1_static_0700] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      // globalThis.value.message.notify({
      //   name: 'padding1', value: 20
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getGridItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getGridItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getGridItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getGridItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(20));
      expect(Math.round(y)).assertEqual(Math.round(20));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(52));
      expect(Math.round(height)).assertEqual(Math.round(184));
      done();
    });

  })
}
