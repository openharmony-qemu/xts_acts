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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, MouseButton, ON } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Visibility } from '@ohos.arkui.component';
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';

export default function getWaterFlowItemRect4() {
  describe('getWaterFlowItemRect4', () => {
    beforeEach(() => {
      console.info("getWaterFlowItemRect4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/waterFlow/getWaterFlowItemRect4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getWaterFlowItemRect4 state pages: " + JSON.stringify(pages));
        if (!("getWaterFlowItemRect4" == pages.name)) {
          console.info("get getWaterFlowItemRect4 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push getWaterFlowItemRect4 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async () => {
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }
      console.info("BadgeFocus after each called");
    });


    
    /**
     * @tc.number   getWaterFlowItemRect4_static_0100
     * @tc.name     getWaterFlowItemRect4_static_0100
     * @tc.desc     getWaterFlowItemRect4_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect4_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect4_static_0100] START');
      const message: MessageManager<Int> = AppStorage.get<MessageManager<Int>>("messageManager")!
      const message1: MessageManager<Visibility> =
        AppStorage.get<MessageManager<Visibility>>("messageManagerVisibility")!
      message.notify({ name: 'index', value: 0 })
      message1.notify({ name: 'visibility1', value: Visibility.Visible })
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      let driver = Driver.create();
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect4_button'));
      try { await (btn?.click() as Promise<void>); } catch (err) { console.info('getWaterFlowItemRect4 click err: ' + JSON.stringify(err)); };
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect4_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect4_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect4_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect4_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(170));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });


    
    /**
     * @tc.number   getWaterFlowItemRect4_static_0200
     * @tc.name     getWaterFlowItemRect4_static_0200
     * @tc.desc     getWaterFlowItemRect4_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect4_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect4_static_0200] START');
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      let driver = Driver.create();
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      console.log('button click')
      let btn2 = await driver.findComponent(ON.id('getWaterFlowItemRect4_button2'));
      try { await (btn2?.click() as Promise<void>); } catch (err) { console.info('getWaterFlowItemRect4 click err: ' + JSON.stringify(err)); };
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect4_button'));
      try { await (btn?.click() as Promise<void>); } catch (err) { console.info('getWaterFlowItemRect4 click err: ' + JSON.stringify(err)); };
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect4_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect4_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect4_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect4_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(170));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });


    
    /**
     * @tc.number   getWaterFlowItemRect4_static_0300
     * @tc.name     getWaterFlowItemRect4_static_0300
     * @tc.desc     getWaterFlowItemRect4_static_0300
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect4_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect4_static_0300] START');
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      let driver = Driver.create();
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      console.log('button click')
      let btn3 = await driver.findComponent(ON.id('getWaterFlowItemRect4_button3'));
      try { await (btn3?.click() as Promise<void>); } catch (err) { console.info('getWaterFlowItemRect4 click err: ' + JSON.stringify(err)); };
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect4_button'));
      try { await (btn?.click() as Promise<void>); } catch (err) { console.info('getWaterFlowItemRect4 click err: ' + JSON.stringify(err)); };
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect4 sleep err: ' + JSON.stringify(err)); }

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect4_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect4_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect4_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect4_text4')
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

  })
}
