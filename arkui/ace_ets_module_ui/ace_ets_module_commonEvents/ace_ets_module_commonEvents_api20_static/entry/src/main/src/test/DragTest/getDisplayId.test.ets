'use static';
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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON , Component } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function getDisplayId() {
  describe('getDisplayIdTest', () =>{
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Drag/getDisplayId',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get getDisplayIdTest state pages: ' + JSON.stringify(pages));
        if (!('getDisplayId' == pages.name)) {
          console.info('get getDisplayIdTest state pages.name: ' + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push getDisplayIdTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getDisplayIdTest page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('getDisplayId afterEach sleep error: ' + err);
      }
      console.info('PreDragTest after each called');
    });

    
    
/**
     * @tc.number   getDisplayIdTest_static_0010
     * @tc.name     getDisplayIdTest_static_0010
     * @tc.desc     getDisplayIdTest_static_0010
     * @tc.level    Level.LEVEL1
     */
it('getDisplayIdTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('getDisplayIdTest_static_0010 START');
      let driver = Driver.create();
      let grid = await driver.findComponent(ON.id('drag'));
      let button = await driver.findComponent(ON.id('button'));
      await (grid?.dragTo(button as Component) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('drag');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      let strJson1 = inspector.getInspectorByKey('button');
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[getDisplayIdTest_static_0010] PreDrag: ' + JSON.stringify(obj));
      console.info('[getDisplayIdTest_static_0010] PreDrag: ' + JSON.stringify(obj1.getElement('$attrs')));
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('0');
      console.info('[getDisplayIdTest_static_0010] END');
      done();
    });
  })
}