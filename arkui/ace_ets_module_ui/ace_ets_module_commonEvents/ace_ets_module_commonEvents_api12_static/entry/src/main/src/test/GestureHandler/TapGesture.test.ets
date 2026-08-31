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
import { Driver, ON, Component } from '@ohos.UiTest';
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
const uiContext = new UIContext();


export default function TapGestureHandlerTest() {

  describe('TapGestureHandlerTest', () => {
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/TapGestureHandler',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get TapGestureHandler state pages: " + JSON.stringify(pages));
        if (!("TapGestureHandler" == pages.name)) {
          console.info("get TapGestureHandler state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TapGestureHandler page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      try {
            await CommonFunc.sleep(1000);
            console.info("TapGestureHandler after each called");
      } catch (err) {
        console.error("afterEach error: " + err);
      }
    });

    
    
    
/**
     * @tc.number   TapGestureHandler_static_0010
     * @tc.name     TapGestureHandler_static_0010
     * @tc.desc     TapGestureHandler_static_0010
     * @tc.level    Level.LEVEL0
     */
it('TapGestureHandler_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TapGestureHandler_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('TapGestureHandlerColumn'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TapGestureHandler1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('label')).assertEqual('tap succ');
      console.info('[TapGestureHandler_0010] END');
      done();
    });
  })
}