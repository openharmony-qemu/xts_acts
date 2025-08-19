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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';


export default function CustomDialogJsunit() {
  describe('CustomDialogJsunit', () => {
    beforeAll(() => {
      console.info("CustomDialogJsunit beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("CustomDialogJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/CustomDialogControllerOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomDialogJsunit state pages:" + JSON.stringify(pages));
        if (!("CustomDialogControllerOptions" == pages.name)) {
          console.info("get CustomDialogJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CustomDialogJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomDialogJsunit page error:" + err);
      }
      console.info("CustomDialogJsunit beforeEach end");
    });
    /**
     * @tc.number    CustomDialogJsunit_static_0100
     * @tc.name      CustomDialogJsunit_static_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */

    it('CustomDialogJsunit_static_0100', Level.LEVEL2,async (done: () => void): Promise<void> => {

      console.info('CustomDialogJsunit_static_0100 START');
	    let driver = Driver.create()
      let button = await driver.findComponent(ON.id('CustomDialog'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('CustomDialog');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CustomDialogJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("click me");
      console.info('[CustomDialogJsunit_static_0100] END');
	    await driver.pressBack();
      await CommonFunc.sleep(3000);
      done();
    });

  })
}
