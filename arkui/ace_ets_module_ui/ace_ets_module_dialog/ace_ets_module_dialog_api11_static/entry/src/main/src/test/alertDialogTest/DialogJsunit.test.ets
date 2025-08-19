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

export default function DialogJsunit() {
  describe('DialogJsunit', () => {
    beforeAll(() => {
      console.info("DialogJsunit beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("DialogJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/DialogPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DialogJsunit state pages:" + JSON.stringify(pages));
        if (!("DialogPage" == pages.name)) {
          console.info("get DialogJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push DialogJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DialogJsunit page error:" + err);
      }
      console.info("DialogJsunit beforeEach end");
    });

    /**
     * @tc.number    DialogJsunit_static_0100
     * @tc.name      DialogJsunit_static_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('DialogJsunit_static_0100', Level.LEVEL2,async (done: () => void): Promise<void> => {

      console.info('[DialogJsunit_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('buttonDialogPage'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('buttonDialogPage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[DialogJsunit_static_0100] button component obj is: ' + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('threeButtonHor:succ');
      await driver.pressBack();
      await CommonFunc.sleep(500);

      let button1 = await driver.findComponent(ON.id('button1'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('button1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[DialogJsunit_static_0100] button1 component obj is: ' + obj1.getElement('$attrs').getString('label'));
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('threeButtonVer:succ');
      await driver.pressBack();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('button2'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('button2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[DialogJsunit_static_0100] button2 component obj is: ' + obj2.getElement('$attrs').getString('label'));
      expect(obj2.getElement('$attrs').getString('label')).assertEqual('threeButtonAuto:succ');
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[DialogJsunit_static_0100] END');
      done();
    });
  })
}