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

export default function getScrollItemRect4() {
  describe('getScrollItemRect4', () => {
    beforeAll(() => {
      console.info("getScrollItemRect4 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(()  => {
      console.info("getScrollItemRect4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/scroll/getScrollItemRect4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getScrollItemRect4 state pages: " + JSON.stringify(pages));
        if (!("getScrollItemRect4" == pages.name)) {
          console.info("get getScrollItemRect4 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // await CommonFunc.sleep(2000);
          // console.info("push getScrollItemRect4 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getScrollItemRect4 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const getScrollItemRect4 = AppStorage.get<Router>("getScrollItemRect4", Type.from<Router>()) as Router;
      getScrollItemRect4.back({
        url: 'MainAbility/pages/index/index'
      })
      console.info("BadgeFocus after each called");
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getScrollItemRect4_static_0100
    * @tc.name  : getScrollItemRect4_static_0100
    * @tc.desc  : set index to 0,set Visibility of column to Visibility.Visible
    * @tc.level : Level 2
    */
    it('getScrollItemRect4_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getScrollItemRect4_static_0100] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      // globalThis.value.message.notify({
      //   name: 'visibility1', value: Visibility.Visible
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getScrollItemRect4_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getScrollItemRect4_text1');
      let text2 = CommonFunc.getComponentRect('getScrollItemRect4_text2');
      let text3 = CommonFunc.getComponentRect('getScrollItemRect4_text3');
      let text4 = CommonFunc.getComponentRect('getScrollItemRect4_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getScrollItemRect4_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getScrollItemRect4_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getScrollItemRect4_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getScrollItemRect4_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));

      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')

      expect(Math.round(width)).assertEqual(Math.round(200));

      expect(Math.round(height)).assertEqual(Math.round(600));

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getScrollItemRect4_static_0200
    * @tc.name  : getScrollItemRect4_static_0200
    * @tc.desc  : set index to 0,set Visibility of column to Visibility.Hidden
    * @tc.level : Level 2
    */
    it('getScrollItemRect4_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getScrollItemRect4_static_0200] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      // globalThis.value.message.notify({
      //   name: 'visibility1', value: Visibility.Hidden
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getScrollItemRect4_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getScrollItemRect4_text1');
      let text2 = CommonFunc.getComponentRect('getScrollItemRect4_text2');
      let text3 = CommonFunc.getComponentRect('getScrollItemRect4_text3');
      let text4 = CommonFunc.getComponentRect('getScrollItemRect4_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getScrollItemRect4_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getScrollItemRect4_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getScrollItemRect4_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getScrollItemRect4_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')

      expect(Math.round(width)).assertEqual(Math.round(200));
      expect(Math.round(height)).assertEqual(Math.round(600));

      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getScrollItemRect4_static_0300
    * @tc.name  : getScrollItemRect4_static_0300
    * @tc.desc  : set index to 0,set Visibility of column to Visibility.None
    * @tc.level : Level 2
    */
    it('getScrollItemRect4_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getScrollItemRect4_static_0300] START');
      // globalThis.value.message.notify({
      //   name: 'index', value: 0
      // });
      // globalThis.value.message.notify({
      //   name: 'visibility1', value: Visibility.None
      // });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getScrollItemRect4_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getScrollItemRect4_text1');
      let text2 = CommonFunc.getComponentRect('getScrollItemRect4_text2');
      let text3 = CommonFunc.getComponentRect('getScrollItemRect4_text3');
      let text4 = CommonFunc.getComponentRect('getScrollItemRect4_text4');

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getScrollItemRect4_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getScrollItemRect4_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getScrollItemRect4_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getScrollItemRect4_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(100));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(0));
      expect(Math.round(height)).assertEqual(Math.round(0));

      done();
    });


  })
}
