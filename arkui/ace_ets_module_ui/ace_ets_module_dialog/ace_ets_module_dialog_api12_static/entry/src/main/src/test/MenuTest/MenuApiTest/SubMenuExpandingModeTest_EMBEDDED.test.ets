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
import { describe, beforeEach, afterEach, it, expect, Level, TestType, Size } from '../../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function SubMenuExpandingModeTest_EMBEDDED() {
  describe('SubMenuExpandingModeTest_EMBEDDED', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SubMenuExpandingModeTest_EMBEDDED beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/MenuApi/SubMenuExpandingMode_EMBEDDED",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SubMenuExpandingModeTest_EMBEDDED state pages:" + JSON.stringify(pages));
        if (!("SubMenuExpandingMode" == pages.name)) {
          console.info("get SubMenuExpandingModeTest_EMBEDDED pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SubMenuExpandingModeTest_EMBEDDED page error:" + err);
      }
      console.info("SubMenuExpandingModeTest_EMBEDDED beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SubMenuExpandingModeTest_EMBEDDED after each called");
    });

    
    
/**
     * @tc.number   SubMenuExpandingModeTest_EMBEDDED_static_001
     * @tc.name     SubMenuExpandingModeTest_EMBEDDED_static_001
     * @tc.desc     SubMenuExpandingModeTest_EMBEDDED_static_001
     * @tc.level    Level.LEVEL2
     */
it('SubMenuExpandingModeTest_EMBEDDED_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SubMenuExpandingModeTest_EMBEDDED_001] START');
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>('winLeft') == 0) {
        let driver: Driver = Driver.create();
        let btn: Component = await driver.findComponent(ON.id("btn")) as Component;
        await btn.click();
        await CommonFunc.sleep(1000);
        let menu = inspector.getInspectorByKey('menu');
        console.info("$attrs--" + JSON.stringify(JSON.parseJsonElement(menu).getElement('$attrs')));
        await CommonFunc.sleep(1000);
        expect(JSON.parseJsonElement(menu).getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.EMBEDDED');
      }
      console.info('[SubMenuExpandingModeTest_EMBEDDED_001] END');
      done();
    });
  })
}
