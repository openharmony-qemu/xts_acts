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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage, LocalStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
export default function AttachDetachTest() {
  describe('AttachDetachTest', () => {
    beforeAll(() => {
      console.info("AttachDetachTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.drawAPI13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("AttachDetachTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CanvasRenderingContext2D/AttachDetachTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AttachDetachTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get AttachDetachTest pages.name:" + JSON.stringify(pages.name));
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push AttachDetachTest page error:" + err);
      }
      console.info("AttachDetachTest beforeEach end");
    }); 

    
    

/*
     * @tc.number   AttachDetachTest_static_0100
     * @tc.name     AttachDetachTest_static_0100
     * @tc.desc     AttachDetachTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('AttachDetachTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('AttachDetachTest_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);

      
      
      let strJson1 = inspector.getInspectorByKey('attach_content_1');
      let strJson2 = inspector.getInspectorByKey('detach_content_1');
      let strJson3 = inspector.getInspectorByKey('attach_content_2');
      let strJson4 = inspector.getInspectorByKey('detach_content_2');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("页面加载，触发onAttach 1回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onAttach 1');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('');

      
      let button = await driver.findComponent(ON.id('change_canvas'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('attach_content_1');
      strJson2 = inspector.getInspectorByKey('detach_content_1');
      strJson3 = inspector.getInspectorByKey('attach_content_2');
      strJson4 = inspector.getInspectorByKey('detach_content_2');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      obj3 = JSON.parseJsonElement(strJson3);
      obj4 = JSON.parseJsonElement(strJson4);
      console.info("点击按钮解绑canvas，触发onDetach 1回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onDetach 1');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('');

      
      button = await driver.findComponent(ON.id('on_onAttach'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('on_onDetach'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      
      button = await driver.findComponent(ON.id('change_canvas'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('attach_content_1');
      strJson2 = inspector.getInspectorByKey('detach_content_1');
      strJson3 = inspector.getInspectorByKey('attach_content_2');
      strJson4 = inspector.getInspectorByKey('detach_content_2');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      obj3 = JSON.parseJsonElement(strJson3);
      obj4 = JSON.parseJsonElement(strJson4);
      console.info("点击按钮绑定canvas，触发onAttach 1和onAttach 2回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onAttach 1');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('onAttach 2');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('');

      
      button = await driver.findComponent(ON.id('change_canvas'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('attach_content_1');
      strJson2 = inspector.getInspectorByKey('detach_content_1');
      strJson3 = inspector.getInspectorByKey('attach_content_2');
      strJson4 = inspector.getInspectorByKey('detach_content_2');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      obj3 = JSON.parseJsonElement(strJson3);
      obj4 = JSON.parseJsonElement(strJson4);
      console.info("点击按钮解绑canvas，触发onDetach 1和onDetach 2回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onDetach 1');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('onDetach 2');

      
      button = await driver.findComponent(ON.id('off_onAttach'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('off_onDetach'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      
      button = await driver.findComponent(ON.id('change_canvas'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('attach_content_1');
      strJson2 = inspector.getInspectorByKey('detach_content_1');
      strJson3 = inspector.getInspectorByKey('attach_content_2');
      strJson4 = inspector.getInspectorByKey('detach_content_2');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      obj3 = JSON.parseJsonElement(strJson3);
      obj4 = JSON.parseJsonElement(strJson4);
      console.info("点击按钮绑定canvas，触发onAttach 1回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onAttach 1');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('');

      
      button = await driver.findComponent(ON.id('change_canvas'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('attach_content_1');
      strJson2 = inspector.getInspectorByKey('detach_content_1');
      strJson3 = inspector.getInspectorByKey('attach_content_2');
      strJson4 = inspector.getInspectorByKey('detach_content_2');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      obj3 = JSON.parseJsonElement(strJson3);
      obj4 = JSON.parseJsonElement(strJson4);
      console.info("点击按钮解绑canvas，触发onDetach 1回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onDetach 1');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('');

      
      button = await driver.findComponent(ON.id('off_onAttach_all'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('off_onDetach_all'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      
      button = await driver.findComponent(ON.id('change_canvas'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson1 = inspector.getInspectorByKey('attach_content_1');
      strJson2 = inspector.getInspectorByKey('detach_content_1');
      strJson3 = inspector.getInspectorByKey('attach_content_2');
      strJson4 = inspector.getInspectorByKey('detach_content_2');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      obj3 = JSON.parseJsonElement(strJson3);
      obj4 = JSON.parseJsonElement(strJson4);
      console.info("点击按钮绑定canvas，不触发onAttach回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('');

      
      button = await driver.findComponent(ON.id('change_canvas'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      
      strJson1 = inspector.getInspectorByKey('attach_content_1');
      strJson2 = inspector.getInspectorByKey('detach_content_1');
      strJson3 = inspector.getInspectorByKey('attach_content_2');
      strJson4 = inspector.getInspectorByKey('detach_content_2');
      obj1 = JSON.parseJsonElement(strJson1);
      obj2 = JSON.parseJsonElement(strJson2);
      obj3 = JSON.parseJsonElement(strJson3);
      obj4 = JSON.parseJsonElement(strJson4);
      console.info("点击按钮解绑canvas，不触发onDetach回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('');

      console.info('[AttachDetachTest_0100] END');
      done();
    });
  })
}

