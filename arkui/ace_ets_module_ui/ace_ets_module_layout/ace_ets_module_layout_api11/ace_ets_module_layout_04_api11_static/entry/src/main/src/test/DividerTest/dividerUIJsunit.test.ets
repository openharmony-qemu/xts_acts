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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { GlobalContext } from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/utils/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { LineCapStyle } from '@ohos.arkui.component'
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

const waitUiReadyMs = 1000;

export default function dividerUIJsunit() {
  describe('dividerUIJsunit', () => {
    beforeAll(() => {
      console.info("dividerUIJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("dividerUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/dividerUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dividerUIJsunit state pages:" + "");
        if (!("dividerUI" == pages.name)) {
          console.info("get dividerUIJsunit state pages.name:" + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000)
          // console.info("push dividerUIJsunit success " + "");
        }
      } catch (err) {
          console.error("push dividerUIJsunit page error:" + err);
	        expect().assertFail();
      }
    });

    it('dividerUIJsunit_static_0100', 0, async (done: () => void): Promise<void> => {
       console.info('dividerUIJsunit_static_0100 START');
       await CommonFunc.sleep(1000);
       // get the dividerUIJsunit_0100 component and test attribute
       let strJson = inspector.getInspectorByKey('divider');
      let obj = JSON.parseJsonElement(strJson);
      console.info("dividerUIJsunit_static_0100'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('vertical')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('20.00vp');
      // to confirm
       expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('LineCapStyle.Butt');
      expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('BUTT');
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFACBDEF');
       done();
    });

   it('dividerUIJsunit_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute normal value of divider dynamically
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'strokeWidth',value:'30'})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<LineCapStyle>>()!) as MessageManager<LineCapStyle>).notify({name:'lineCapStyle',value:LineCapStyle.Round})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'color',value:'#FFFFFF'})
      await CommonFunc.sleep(200);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0200'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('30.00vp');
     expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('ROUND');
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFFFFFF');
      done();
    });

    it('dividerUIJsunit_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
      // modify the lineCapStyle attribute normal value of divider dynamically
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<LineCapStyle>>()!) as MessageManager<LineCapStyle>).notify({name:'lineCapStyle',value:LineCapStyle.Square})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
     let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0300'] component obj is: " + obj.getElement('$attrs').getString('lineCap'));
     expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('SQUARE');
      done();
    });

    it('dividerUIJsunit_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute illegal value of divider dynamically
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'strokeWidth',value:'-30'})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'lineCapStyle',value:'4'})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'color',value:'#FF'})
      await CommonFunc.sleep(200);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('-30.00vp');
     expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('BUTT');
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#33182431');
      done();
    });

    it('dividerUIJsunit_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0500 START');
      await CommonFunc.sleep(1000);
      // test the common attribute
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>()!) as MessageManager<string>).notify({name:'widthK',value:'1.0'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0500'] component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('width')).assertEqual('1.00vp')
      done();
    });

    it('dividerUIJsunit_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute normal value of divider dynamically
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<boolean>>()!) as MessageManager<boolean>).notify({name:'vertical',value:true})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0600'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('vertical')));
     expect(obj.getElement('$attrs').getString('vertical')).assertEqual('true');
      done();
    });  
    
  })
}