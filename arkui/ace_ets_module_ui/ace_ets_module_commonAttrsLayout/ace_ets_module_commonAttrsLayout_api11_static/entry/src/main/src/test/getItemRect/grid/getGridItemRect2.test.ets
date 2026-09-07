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
import { Driver, ON } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';



export default function getGridItemRect2() {
  describe('getGridItemRect2', () => {
    beforeEach(() => {
      console.info("getGridItemRect2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/grid/getGridItemRect2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getGridItemRect2 state pages: " + JSON.stringify(pages));
        if (!("getGridItemRect2" == pages.name)) {
          console.info("get getGridItemRect2 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push getGridItemRect2 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      const getGridItemRect2 = AppStorage.get<Router>("router") as Router
      getGridItemRect2.back({
        url: 'MainAbility/pages/index/index'
      })
      console.info("BadgeFocus after each called");
    });

    
    /**
     * @tc.number   getGridItemRect2_static_0100
     * @tc.name     getGridItemRect2_static_0100
     * @tc.desc     getGridItemRect2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getGridItemRect2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect2_static_0100] START');
      const message: MessageManager<number> = AppStorage.get<MessageManager<number>>("messageManager")!
      message.notify({ name: 'index', value: 0 })
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let driver = Driver.create();
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      console.log('button2 click')
      let btn2 = await driver.findComponent(ON.id('getGridItemRect2_button2'));
      try {
        await (btn2?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect2_button'));
      try {
        await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect2_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect2_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect2_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect2_text4')
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
