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

export default function getListItemRect1() {
  describe('getListItemRect1', () => {
    beforeAll(() => {
      console.info("getListItemRect1 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(()  => {
      console.info("getListItemRect1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/list/getListItemRect1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getListItemRect1 state pages: " + JSON.stringify(pages));
        if (!("getListItemRect1" == pages.name)) {
          console.info("get getListItemRect1 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // await CommonFunc.sleep(2000);
          // console.info("push getListItemRect1 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getListItemRect1 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn3 = await driver.findComponent(ON.id('getListItemRect1_button3'));
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      console.info("BadgeFocus after each called");
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getListItemRect1_static_0100
    * @tc.name  : getListItemRect1_static_0100
    * @tc.desc  : set index to 0
    * @tc.level : Level 2
    */
    it('getListItemRect1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0100] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItem_1 = CommonFunc.getComponentRect('getListItemRect1_listItem_1');

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getListItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getListItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getListItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getListItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      console.log('listItem_1.right - listItem_1.left' + (listItem_1.right - listItem_1.left))
      expect(Math.abs(vp2px(Math.round(width)) - Math.round(listItem_1.right - listItem_1.left)) <= 1).assertTrue();
      console.log('listItem_1.bottom - listItem_1.top' + (listItem_1.bottom - listItem_1.top))
      expect(Math.abs(vp2px(Math.round(height)) - Math.round(listItem_1.bottom - listItem_1.top)) <= 1).assertTrue();

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getListItemRect1_static_0200
    * @tc.name  : getListItemRect1_static_0200
    * @tc.desc  : set index to 1
    * @tc.level : Level 2
    */
    it('getListItemRect1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0200] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 1
      // });
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let listItem_2 = CommonFunc.getComponentRect('getListItemRect1_listItem_2');

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getListItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getListItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getListItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getListItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)


      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(120)) <= 1).assertTrue();

      console.log('assert size')
      console.log('listItem_2.right - listItem_2.left' + (listItem_2.right - listItem_2.left))
      expect(Math.abs(vp2px(Math.round(width)) - Math.round(listItem_2.right - listItem_2.left)) <= 1).assertTrue();
      console.log('listItem_2.bottom - listItem_2.top' + (listItem_2.bottom - listItem_2.top))
      expect(Math.abs(vp2px(Math.round(height)) - Math.round(listItem_2.bottom - listItem_2.top)) <= 1).assertTrue();

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getListItemRect1_static_0300
    * @tc.name  : getListItemRect1_static_0300
    * @tc.desc  : set index to -1
    * @tc.level : Level 2
    */
    it('getListItemRect1_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0300] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: -1
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getListItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getListItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getListItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getListItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)


      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      expect(Math.abs(Math.round(width) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(height) - Math.round(0)) <= 1).assertTrue();

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getListItemRect1_static_0400
    * @tc.name  : getListItemRect1_static_0400
    * @tc.desc  : set index to 0,The first sub component slides out of the screen
    * @tc.level : Level 2
    */
    it('getListItemRect1_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0400] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button2 click')
      let btn2 = await driver.findComponent(ON.id('getListItemRect1_button2'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getListItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getListItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getListItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getListItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      expect(Math.abs(Math.round(width) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(height) - Math.round(0)) <= 1).assertTrue();

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getListItemRect1_static_0500
    * @tc.name  : getListItemRect1_static_0500
    * @tc.desc  : set index to 100
    * @tc.level : Level 2
    */
    it('getListItemRect1_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0500] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 100
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getListItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getListItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getListItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getListItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      expect(Math.abs(Math.round(width) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(height) - Math.round(0)) <= 1).assertTrue();

      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getListItemRect1_static_0600
    * @tc.name  : getListItemRect1_static_0600
    * @tc.desc  : set index to 0,Set the padding of the list to 20
    * @tc.level : Level 2
    */
    it('getListItemRect1_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getListItemRect1_static_0600] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      // globalThis.value.message.notify({
      //   name: 'padding1', value: 20
      // });
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItem_1 = CommonFunc.getComponentRect('getListItemRect1_listItem_1');

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getListItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getListItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getListItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getListItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(20)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(20)) <= 1).assertTrue();

      console.log('assert size')
      console.log('listItem_1.right - listItem_1.left' + (listItem_1.right - listItem_1.left))
      expect(Math.floor(Math.abs(vp2px(width) - (listItem_1.right - listItem_1.left))) <= 1).assertTrue();
      console.log('listItem_1.bottom - listItem_1.top' + (listItem_1.bottom - listItem_1.top))
      expect(Math.floor(Math.abs(vp2px(height) - (listItem_1.bottom - listItem_1.top))) <= 1).assertTrue();

      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getListItemRect1_static_0700
    * @tc.name  : getListItemRect1_static_0700
    * @tc.desc  : set index to 0,Set the margin of the listItem to 20
    * @tc.level : Level 2
    */
    it('getListItemRect1_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getListItemRect1_static_0700] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      // globalThis.value.message.notify({
      //   name: 'margin1', value: 20
      // });
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItem_1 = CommonFunc.getComponentRect('getListItemRect1_listItem_1');

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getListItemRect1_text1');
      let text2 = CommonFunc.getComponentRect('getListItemRect1_text2');
      let text3 = CommonFunc.getComponentRect('getListItemRect1_text3');
      let text4 = CommonFunc.getComponentRect('getListItemRect1_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(20)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(20)) <= 1).assertTrue();

      console.log('assert size')
      expect(Math.abs(vp2px(Math.round(width)) - Math.round(listItem_1.right - listItem_1.left)) <= 1).assertTrue();
      expect(Math.abs(vp2px(Math.round(height)) - Math.round(listItem_1.bottom - listItem_1.top)) <= 1).assertTrue();

      done();
    });

  })
}
