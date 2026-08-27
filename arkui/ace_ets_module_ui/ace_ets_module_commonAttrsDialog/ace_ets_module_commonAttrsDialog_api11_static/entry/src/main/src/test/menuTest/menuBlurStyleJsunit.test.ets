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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function menuBlurStyleJsunit() {
  describe('menuBlurStyleJsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("menuBlurStyleJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/menu/menuBlurStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get menuBlurStyleJsunit state pages:" + JSON.stringify(pages));
        if (!("menuBlurStyle" == pages.name)) {
          console.info("get menuBlurStyleJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menuBlurStyleJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuBlurStyleJsunit page error:" + err);
      }
      console.info("menuBlurStyleJsunit beforeEach end");
    });

       afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuBlurStyle after each sleep err: ' + JSON.stringify(err));
      }
      console.info("menuBlurStyle after each called");
    });

    
    
    /**
     * @tc.number   menuBlurStyleJsunit_static_0100
     * @tc.name     menuBlurStyleJsunit_static_0100
     * @tc.desc     menuBlurStyleJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('menuBlurStyleJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuBlurStyleJsunit_0100] START');
      let driver =  Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuBlurStyleJsunit_0100 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('menu_blurStyle'));
       button?.longClick();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuBlurStyleJsunit_0100 sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('menu_blurStyle');
      console.info("[menuBlurStyleJsunit_0100] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[menuBlurStyleJsunit_0100] menuText is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("menuBlurStyle");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuBlurStyleJsunit_0100 sleep err: ' + JSON.stringify(err));
      }
      try {
        await driver.triggerKey(2070);
      } catch (err) {
        console.info('menuBlurStyleJsunit_0100 triggerKey err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuBlurStyleJsunit_0100 sleep err: ' + JSON.stringify(err));
      }
      console.info('[menuBlurStyleJsunit_0100] END');
      done();
    });
  })
}