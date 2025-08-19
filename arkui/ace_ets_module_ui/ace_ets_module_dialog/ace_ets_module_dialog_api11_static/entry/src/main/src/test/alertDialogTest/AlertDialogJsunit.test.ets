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


export default function AlertDialogJsunit() {
  describe('AlertDialogJsunit', () => {
    beforeAll(() => {
      console.info("AlertDialogJsunit beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("AlertDialogJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/AlertDialogParam',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlertDialogJsunit state pages:" + JSON.stringify(pages));
        if (!("AlertDialogParam" == pages.name)) {
          console.info("get AlertDialogJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AlertDialogJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlertDialogJsunit page error:" + err);
      }
      console.info("AlertDialogJsunit beforeEach end");
    });

    /**
     * @tc.number    AlertDialogJsunit_static_0100
     * @tc.name      AlertDialogJsunit_static_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */

    it('AlertDialogJsunit_static_0100', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('AlertDialogJsunit_static_0100 START');
	    let driver = Driver.create()
      let button = await driver.findComponent(ON.id('AlertDialogJsunit_static_0100'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('AlertDialogJsunit_static_0100');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[AlertDialogJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("one button dialog");
	    await driver.pressBack();
	    await CommonFunc.sleep(500);
	  
      let button2 = await driver.findComponent(ON.id('AlertDialog2'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
	    let strJson2 = inspector.getInspectorByKey('AlertDialog2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[AlertDialogJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('label')).assertEqual("two button dialog");
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('[AlertDialogJsunit_static_0100] END');
      done();
    });

  })
}
