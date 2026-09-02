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
import { describe, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

export default function UIObserverDensityUpdateTest() {
  describe('UIObserverDensityUpdateTest', () => {
    beforeEach(async () => {
      console.info("UIObserverDensityUpdateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/UIObserverDensityUpdateTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        // let result = await router.replaceUrl(options);
        router.pushUrl(options);
        console.info("get UIObserverDensityUpdateTest state pages:" + JSON.stringify(pages));
        if (!("UIObserverDensityUpdateTest" == pages.name)) {
          console.info("get UIObserverDensityUpdateTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push UIObserverDensityUpdateTest page error:" + err);
      }
      console.info("UIObserverDensityUpdateTest beforeEach end");
    });


    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('UIObserverDensityUpdateTest sleep err: ' + JSON.stringify(err));
      }
      console.info("UIObserverDensityUpdateTest after each called");
    });




    /**
     * @tc.number   UIObserverDensityUpdateTest_static_0100
     * @tc.name     UIObserverDensityUpdateTest_static_0100
     * @tc.desc     UIObserverDensityUpdateTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('UIObserverDensityUpdateTest_static_0100', Level.LEVEL2, async (done: ()=>void) => {

      console.info('UIObserverDensityUpdateTest_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('UIObserverDensityUpdateTest sleep err: ' + JSON.stringify(err));
      }
  console.info('++++++++++++++++++++++++1');
      let button1 = await driver.findComponent(ON.id('densityUpdate_on_id'));
  console.info('++++++++++++++++++++++++2');
      try {
        await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('UIObserverDensityUpdateTest click err: ' + JSON.stringify(err));
      }
  console.info('++++++++++++++++++++++++3');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('UIObserverDensityUpdateTest sleep err: ' + JSON.stringify(err));
      }
      let button2 = await driver.findComponent(ON.id('densityUpdate_off_id'));
      try {
        await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('UIObserverDensityUpdateTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('UIObserverDensityUpdateTest sleep err: ' + JSON.stringify(err));
      }
      let strJson1: string = inspector.getInspectorByKey('densityUpdate1_value_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2: string = inspector.getInspectorByKey('densityUpdate2_value_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[UIObserverDensityUpdateTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[UIObserverDensityUpdateTest_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[UIObserverDensityUpdateTest_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[UIObserverDensityUpdateTest_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('DensityInfo succ');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('DensityInfo succ');
      done();
    });

  })
}
