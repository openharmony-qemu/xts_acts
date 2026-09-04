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
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';

interface ParamsData {
  data3: number[];
}

interface MyParams {
  data1: string;
  data2: ParamsData;
}

export default function getWaterFlowItemRect5() {
  describe('getWaterFlowItemRect5', () => {
    beforeEach(async (): Promise<void> => {
      console.info("getWaterFlowItemRect5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/waterFlow/getWaterFlowItemRect5',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getWaterFlowItemRect5 state pages: " + JSON.stringify(pages));
        if (!("getWaterFlowItemRect5" == pages.name)) {
          console.info("get getWaterFlowItemRect5 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getWaterFlowItemRect5 page error: " + err);
        expect().assertFail();
      }
    });


    
    
/**
     * @tc.number   getWaterFlowItemRect5_static_0100
     * @tc.name     getWaterFlowItemRect5_static_0100
     * @tc.desc     getWaterFlowItemRect5_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect5_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect5_static_0100] START');
      const message: MessageManager<Double> = AppStorage.get<MessageManager<Double>>("messageManager")!
      const message1: MessageManager<Int> = AppStorage.get<MessageManager<Int>>("messageManagerInt")!
      message1.notify({ name: 'index', value: 0 })
      message.notify({ name: 'padding1', value: 20 as Double })
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect5 sleep err: ' + JSON.stringify(err)); }

      let driver = Driver.create();
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect5 sleep err: ' + JSON.stringify(err)); }

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect5_button'));
      try { await (btn?.click() as Promise<void>); } catch (err) { console.info('getWaterFlowItemRect5 click err: ' + JSON.stringify(err)); }
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect5 sleep err: ' + JSON.stringify(err)); }

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect5_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect5_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect5_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect5_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(20));
      expect(Math.round(y)).assertEqual(Math.round(20));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(170));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });

    
    
/**
     * @tc.number   getWaterFlowItemRect5_static_0200
     * @tc.name     getWaterFlowItemRect5_static_0200
     * @tc.desc     getWaterFlowItemRect5_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect5_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect5_static_0200] START');
      const ohosrouter = AppStorage.get<Router>("router") as Router
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect5 sleep err: ' + JSON.stringify(err)); }
      try {
        ohosrouter.back({
          url: 'MainAbility/pages/index/index'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("getWaterFlowItemRect5 " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/getItemRect/waterFlow/getWaterFlowItemRect5',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as MyParams
        }).then(() => {
          // success
        })
          .catch((err: Error) => {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("push getScrollItemRect5 page error: " + err);
      }
      const message: MessageManager<Double> = AppStorage.get<MessageManager<Double>>("messageManager")!
      const message1: MessageManager<Int> = AppStorage.get<MessageManager<Int>>("messageManagerInt")!
      message1.notify({ name: 'index', value: 0 })
      try { await CommonFunc.sleep(500); } catch (err) { console.info('getWaterFlowItemRect5 sleep err: ' + JSON.stringify(err)); }
      message.notify({ name: 'margin1', value: 20 as Double })
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('getWaterFlowItemRect5 sleep err: ' + JSON.stringify(err)); }

      let driver = Driver.create();
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect5 sleep err: ' + JSON.stringify(err)); }

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect5_button'));
      try { await (btn?.click() as Promise<void>); } catch (err) { console.info('getWaterFlowItemRect5 click err: ' + JSON.stringify(err)); }
      try { await CommonFunc.sleep(2000); } catch (err) { console.info('getWaterFlowItemRect5 sleep err: ' + JSON.stringify(err)); }

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect5_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect5_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect5_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect5_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(20));
      expect(Math.round(y)).assertEqual(Math.round(20));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(170));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });


  })
}
