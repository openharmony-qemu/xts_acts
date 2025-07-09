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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { GlobalContext } from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/utils/MessageManager';
import inspector from '@ohos.arkui.inspector'
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
let testAbilityContext:common.UIAbilityContext;
export default function blankUIJsunit() {
  describe('blankUIJsunit', () => {
    beforeAll(() => {
      console.info("blankUIJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("blankJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blank/blankParentWidth',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get blankJsunit state pages:" + "");
        if (!("blankParentWidth" == pages.name)) {
          console.info("get blankJsunit state pages.name:" + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000)
          // console.info("push blankJsunit success " + "");
        }
      } catch (err) {
          console.error("push blankJsunit page error:" + err);
	        expect().assertFail();
      }
    });

    /**
     * @tc.number     SUB_ARKUI_BLANK_JSAPI_001
     * @tc.name       blankJsunit_static_0100
     * @tc.desc       Test blank attribute
    */
    it('blankJsunit_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'blankColor',value:'#FCAE5394'})
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('bl2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0100'] component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#FCAE5394');
      done();
    });

    /**
     * @tc.number     SUB_ARKUI_BLANK_JSAPI_002
     * @tc.name       blankJsunit_static_0200
     * @tc.desc       Test blank attribute
     */
   it('blankJsunit_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
       // 动态修改Blank组件的minwidth
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'minWith',value:'80'})
      await CommonFunc.sleep(3000);
      // 获取动态修改后的组件的minwidth
      let strJson = inspector.getInspectorByKey('bl2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0200'] component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('min')).assertEqual('80.00vp');
      done();
    });

    it('blankJsunit_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
       // 动态非法修改Blank组件的minwidth
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'minWith',value:'-30'})
      await CommonFunc.sleep(2000);
      // 获取默认的minWidth值
      let strJson = inspector.getInspectorByKey('bl2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0300'] component obj is: " + obj.getElement('$attrs').getString('min'));
     // return not the default value to confirm ?
     expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

    it('blankJsunit_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
       // 动态非法修改Blank组件的颜色
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'blankColor',value:'#AE53'})
      await CommonFunc.sleep(3000);
       // 获取非法动态修改后默认组件的颜色
      let strJson = inspector.getInspectorByKey('bl2');
      console.info("[blankJsunit_static_0400'] component obj is: " + strJson);
     let obj = JSON.parseJsonElement(strJson);
     // add enum color test case and  confirm the the color  ?
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#AAEE5533');
      done();
    });

    it('blankJsunit_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0500 START');
      await CommonFunc.sleep(1000);
       // 验证父组件不设置宽度，blank失效
      let text1_rect = CommonFunc.getComponentRect('text1');
      let toggle1_rect = CommonFunc.getComponentRect('toggle1');
      let bl1_rect = CommonFunc.getComponentRect('bl1');
      console.info("[blankJsunit_static_0500'] text1_rect is " + JSON.stringify(text1_rect) + "toggle1_rect is " + JSON.stringify(toggle1_rect) + "bl1.rect is " + JSON.stringify(bl1_rect));
      // 判断blank不显示
      expect(bl1_rect.left - bl1_rect.right).assertEqual(0)
      let strJson = inspector.getInspectorByKey('blankUIJsunit_blank');
     let obj = JSON.parseJsonElement(strJson);
       console.info("[blankJsunit_static_0500'] component obj is: " + strJson);
     expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

    it('blankJsunit_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
       // 验证父组件为row/coloumn 且宽度有，blank平分
      let strJson = inspector.getInspectorByKey('blankUIJsunit_blank');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0600'] component obj is: " + JSON.stringify(obj));
      let text_rect = CommonFunc.getComponentRect('text');
      let toggle_rect = CommonFunc.getComponentRect('toggle');
      console.info("[blankJsunit_static_0600'] text_rect is " + JSON.stringify(text_rect) + "toggle_rect is " + JSON.stringify(toggle_rect));
      // 判断blank平分显示
      let gaps = toggle_rect.left - text_rect.right;
      expect(gaps > 0).assertTrue();
     expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

   it('blankJsunit_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0700 START');
      await CommonFunc.sleep(1000);
       // 直接判断组件的属性
      let strJson = inspector.getInspectorByKey('blankUIJsunit_blank');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0700'] component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual('Blank');
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#00000000');
     expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

    it('blankJsunit_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0800 START');
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'minWith',value:'rr'})
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey('bl2');
     let obj2 = JSON.parseJsonElement(strJson2);
     console.info("[blankJsunit_static_0800'] component obj2 is: " + JSON.stringify(obj2));
     expect(obj2.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();

    });


  })
}