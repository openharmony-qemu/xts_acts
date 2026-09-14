'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
export default function componentLifecycleDecoratorsTest(): void {
  describe('ComponentLifecycleDecorators', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ComponentLifecycleDecorators beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/ComponentLifecycleDecorators",
      }
      try {
        const ComponentLifecycleDecorators = AppStorage.get<Router>("router") as Router
        ComponentLifecycleDecorators.clear();
        let pages:router.RouterState = ComponentLifecycleDecorators.getState();
        console.info("get ComponentLifecycleDecorators state pages: " + JSON.stringify(pages));
        if (!("ComponentLifecycleDecorators" == pages.name)) {
          console.info("get ComponentLifecycleDecorators state pages.name: " + JSON.stringify(pages.name));
          // let result = await ComponentLifecycleDecorators.pushUrl(options);
          ComponentLifecycleDecorators.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ComponentLifecycleDecorators success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ComponentLifecycleDecorators page error:" + err);
      }
      console.info("ComponentLifecycleDecorators beforeEach end");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      AppStorage.delete('ComponentActiveKey');
      AppStorage.delete('ComponentInactiveKey');
      console.info("afterAll case");
    });



    /**
     * @tc.name   SUB_ARKUI_COMPONENTLIFECYCLE_COMPONENTINACTIVE_0100
     * @tc.number SUB_ARKUI_COMPONENTLIFECYCLE_COMPONENTINACTIVE_0100
     * @tc.desc   Test @ComponentInactive decorator triggers when component becomes inactive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_COMPONENTLIFECYCLE_COMPONENTINACTIVE_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'componentInactive_0100 START');
      let driver = await Driver.create();
      let scrollBtn = await driver.findComponent(ON.id('scrollToIndexBtn'));
      await (scrollBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2  = inspector.getInspectorByKey('inactiveText');
      let inactiveText = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'inactiveText: ' + inactiveText);
      let storageValueInactive:string = AppStorage.get<string>('ComponentInactiveKey') as string;
      let storageValueActive:string = AppStorage.get<string>('ComponentActiveKey') as string;
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'storageValue: ' + storageValueInactive);
      expect(storageValueInactive.length).assertEqual(13)
      expect(storageValueActive).assertEqual('ActiveItem5')
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'componentInactive_0100 END');
      done();
      
    });

  });
}