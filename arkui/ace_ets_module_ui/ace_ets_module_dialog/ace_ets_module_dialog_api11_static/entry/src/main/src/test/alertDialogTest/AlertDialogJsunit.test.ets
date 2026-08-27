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
import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';


export default function AlertDialogJsunit() {
  describe('AlertDialogJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("AlertDialogJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/AlertDialogParam',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get AlertDialogJsunit state pages: " + JSON.stringify(pages));
        if (!("AlertDialogParam" == pages.name)) {
          console.info("get AlertDialogJsunit state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AlertDialogJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlertDialogJsunit page error: " + err);
        expect().assertFail();
      }
      // done()
    });


    
    
/**
     * @tc.number   AlertDialogJsunit_static_0100
     * @tc.name     AlertDialogJsunit_static_0100
     * @tc.desc     AlertDialogJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('AlertDialogJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('AlertDialogJsunit_static_0100 START');
      let driver = Driver.create()
      let button;
      try {
        button = await driver.findComponent(ON.id('AlertDialogJsunit_0100'));
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>)
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('AlertDialogJsunit_0100');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[AlertDialogJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("one button dialog");
      try {
        await driver.pressBack();
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }

      let button2;
      try {
        button2 = await driver.findComponent(ON.id('AlertDialogParam' + '_AlertDialog2'));
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('AlertDialogParam' + '_AlertDialog2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[AlertDialogJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('label')).assertEqual("two button dialog");
      try {
        await driver.triggerKey(2070)
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('AlertDialogJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info('[AlertDialogJsunit_static_0100] END');
      done();
    });

  })
}
