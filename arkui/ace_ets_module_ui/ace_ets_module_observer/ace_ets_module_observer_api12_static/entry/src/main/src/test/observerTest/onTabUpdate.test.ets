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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function onTabUpdate() {
  describe('onTabUpdate', () => {
    beforeEach(async (): Promise<void> => {
      console.info("onTabUpdate beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/onTabUpdate",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("onTabUpdate" == pages.name)) {
          console.info("get onTabUpdate pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onTabUpdate page error:" + err);
      }
      console.info("onTabUpdate beforeEach end");
    });



/**
     * @tc.number   onTabUpdate_static_0100
     * @tc.name     onTabUpdate_static_0100
     * @tc.desc     onTabUpdate_static_0100
     * @tc.level    Level.LEVEL0
     */
it('onTabUpdate_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[onTabUpdate_0100] START');
      try {
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let btn1 = await driver.findComponent(ON.id('change_index_1'));
        await CommonFunc.sleep(500);
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        let strJson = inspector.getInspectorByKey('tab_Index_1');
        console.info("[onTabUpdate_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
        console.info("[onTabUpdate_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('index: 1');
      } catch (err) {
        console.info('onTabUpdate_0100 err: ' + JSON.stringify(err));
      }
      console.info('[onTabUpdate_0100] END');
      done();
    });
  })
}
