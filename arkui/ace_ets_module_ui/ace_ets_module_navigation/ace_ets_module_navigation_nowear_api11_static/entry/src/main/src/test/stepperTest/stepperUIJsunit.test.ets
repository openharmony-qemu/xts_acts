'use static';
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
import events_emitter from '@ohos.events.emitter';
import {Color,$r,ItemState} from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;

export default function stepperUIJsunit() {
  describe('stepperUIJsunit',  () =>{
    beforeAll(() => {
      console.info("stepperUIJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("stepperUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stepperUIJsunit state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/stepper/stepperUI" == pages.name)) {
          console.info("get stepperUIJsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
          console.error("push stepperUIJsunit page error:" + err);
	        expect().assertFail();
      }
    });

    
/*
     * @tc.number   stepperUIJsunit_static_0100
     * @tc.name     stepperUIJsunit_static_0100
     * @tc.desc     stepperUIJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('stepperUIJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
       console.info('stepperUIJsunit_0100');
       await CommonFunc.sleep(1000);
       // get the stepperItem component and test attribute
       let strJson: string = inspector.getInspectorByKey('stepperTwo');
       let obj = JSON.parseJsonElement(strJson);
       console.info('stepperUIJsunit_0100 component obj is: ' + obj.getElement('$attrs').getString('nextLabel') + "---" + obj.getElement('$attrs').getString('prevLabel') + "---" + obj.getElement('$attrs').getString('status'));
       expect(obj.getElement('$attrs').getString('nextLabel')).assertEqual('下一步');
       expect(obj.getElement('$attrs').getString('prevLabel')).assertEqual('返回');
       expect(obj.getElement('$attrs').getString('status')).assertEqual('ItemState.Normal');
       done();
    });

   
/*
     * @tc.number   stepperUIJsunit_static_0200
     * @tc.name     stepperUIJsunit_static_0200
     * @tc.desc     stepperUIJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('stepperUIJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperUIJsunit_0200 START');
      // modify the normal value of stepperItem dynamically
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'nextLabel',value:'hhe'});
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'prevLabel',value:'hha'});
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ItemState>>('messageManager')?.notify({name:'status',value:ItemState.Waiting});
      await CommonFunc.sleep(2000);
      // check the parameter value
      let strJson: string = inspector.getInspectorByKey('stepperTwo');
      let obj = JSON.parseJsonElement(strJson);
      console.info('stepperUIJsunit_0200 component obj is: ' + obj.getElement('$attrs').getString('nextLabel') + "---" + obj.getElement('$attrs').getString('prevLabel') + "---" + obj.getElement('$attrs').getString('status'));
      expect(obj.getElement('$attrs').getString('nextLabel')).assertEqual('hhe');
      expect(obj.getElement('$attrs').getString('prevLabel')).assertEqual('hha');
      done();
    });

    
/*
     * @tc.number   stepperUIJsunit_static_0300
     * @tc.name     stepperUIJsunit_static_0300
     * @tc.desc     stepperUIJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('stepperUIJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperUIJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // test the status of enum value dynamically
      AppStorage.get<MessageManager<ItemState>>('messageManager')?.notify({name:'status',value:ItemState.Disabled})
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('stepperTwo');
      let obj = JSON.parseJsonElement(strJson);
      console.info('stepperUIJsunit_0300 component obj is: ' + obj.getElement('$attrs').getString('status'));
      // expect(obj.getElement('$attrs').getString('status')).assertEqual('ItemState.Disabled');  //源代码注释
      AppStorage.get<MessageManager<ItemState>>('messageManager')?.notify({name:'status',value:ItemState.Skip})
      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('stepperTwo');
      let obj2  = JSON.parseJsonElement(strJson2);
      console.info('stepperUIJsunit_0300 component obj2 is: ' + obj2.getElement('$attrs').getString('status'));
      // expect(obj2.getElement('$attrs').getString('status')).assertEqual('ItemState.Skip'); //源代码注释
      done();
   });

    
/*
     * @tc.number   stepperUIJsunit_static_0400
     * @tc.name     stepperUIJsunit_static_0400
     * @tc.desc     stepperUIJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('stepperUIJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperUIJsunit_0400 START');
       await CommonFunc.sleep(1000);
      // test the status of illegal enum value dynamically
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({name:'status',value:7})
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('stepperTwo');
      let obj = JSON.parseJsonElement(strJson);
      console.info('stepperUIJsunit_0400 component obj is: ' + obj.getElement('$attrs').getString('status'));
      expect(obj.getElement('$attrs').getString('status')).assertEqual('ItemState.Normal');
      done();
    });

    
/*
     * @tc.number   stepperUIJsunit_static_0500
     * @tc.name     stepperUIJsunit_static_0500
     * @tc.desc     stepperUIJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('stepperUIJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
       console.info('stepperUIJsunit_0500 START');
      // get the stepper component and test attribute
       await CommonFunc.sleep(1000);
       // get the stepperItem component and test attribute
       let strJson: string = inspector.getInspectorByKey('stepkey');
       let obj = JSON.parseJsonElement(strJson);
       console.info('stepperUIJsunit_0500 component obj is: ' + obj.getElement('$attrs').getString('index'));
       expect(obj.getElement('$attrs').getString('index')).assertEqual('0');
       done();
    });

    
/*
     * @tc.number   stepperUIJsunit_static_0600
     * @tc.name     stepperUIJsunit_static_0600
     * @tc.desc     stepperUIJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('stepperUIJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperUIJsunit_0600 START');
      AppStorage.get<MessageManager<ItemState>>('messageManager')?.notify({name:'status',value:ItemState.Normal});
      // test the stepper onChange onNext onPrevious event
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button:Component = await driver.findComponent(ON.text('Next')) as Component;
      await button.click();
      console.info('stepperUIJsunit_0600 button click succ');
      await CommonFunc.sleep(1000);
      // reset the component init status
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'nextLabel',value:'下一步'});
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({name:'prevLabel',value:'返回'});
      await CommonFunc.sleep(1000);
      let button2:Component = await driver.findComponent(ON.text('下一步')) as Component;
      await button2.click();
      console.info('stepperUIJsunit_0600 button2 click succ');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('pageThree');
      let obj = JSON.parseJsonElement(strJson);
      console.info('stepperUIJsunit_0600 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Page Three');
      // test the previous
      let button3:Component = await driver.findComponent(ON.text('返回')) as Component;
      await button3.click();
      await CommonFunc.sleep(1000);
      console.info('stepperUIJsunit_0600 button3 click succ');
      let strJson1 = inspector.getInspectorByKey('pageTwo');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('stepperUIJsunit_0600 component obj1 is: ' + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Page Two');
      done();
    });

    
/*
     * @tc.number   stepperUIJsunit_static_0700
     * @tc.name     stepperUIJsunit_static_0700
     * @tc.desc     stepperUIJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('stepperUIJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperUIJsunit_0700 START');
      // test the stepper onFinish event
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let button2:Component = await driver.findComponent(ON.text('下一步')) as Component;
      await button2.click();
      console.info('stepperUIJsunit_0700 button2 click succ');
      await CommonFunc.sleep(2000);
      let button3:Component = await driver.findComponent(ON.text('下一步')) as Component;
      await button3.click();
      console.info('stepperUIJsunit_0700 button3 click succ');
      await CommonFunc.sleep(2000);
      let button4:Component = await driver.findComponent(ON.text('开始')) as Component;
      await button4.click();
      console.info('stepperUIJsunit_0700 button4 click succ');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('pageOne');
      let obj = JSON.parseJsonElement(strJson);
      console.info('stepperUIJsunit_0700 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Page One');
      done();
    });

    
/*
     * @tc.number   stepperUIJsunit_static_0800
     * @tc.name     stepperUIJsunit_static_0800
     * @tc.desc     stepperUIJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('stepperUIJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperUIJsunit_0800');
      // test the stepper onSkip event
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button:Component = await driver.findComponent(ON.text('Next')) as Component;
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('pageTwo');
      let obj = JSON.parseJsonElement(strJson);
      console.info('stepperUIJsunit_0800 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Page Two');
      done();
    });
  })
}
