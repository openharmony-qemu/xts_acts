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


export default function ToastShowMode() {
  describe('ToastShowMode', () => {
    beforeAll(() => {
      console.info("ToastShowMode beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("ToastShowMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/ToastShowMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ToastShowMode state pages:" + JSON.stringify(pages));
        if (!("ToastShowMode" == pages.name)) {
          console.info("get ToastShowMode pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ToastShowMode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToastShowMode page error:" + err);
      }
      console.info("ToastShowMode beforeEach end");
    });
    /* *
    * @tc.number: SUB_ACE_PROMPTACTION_BLURSTYLE_0010
    * @tc.name  : ToastShowMode_static_0100
    * @tc.desc  : Set whether the pop-up window is displayed on the app.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ToastShowMode_static_0100', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('ToastShowMode_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ShowMode_p1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('mess_mode');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToastShowMode_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('Message DEFAULT');
      console.info('[ToastShowMode_static_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_PROMPTACTION_BLURSTYLE_0020
    * @tc.name  : ToastShowMode_static_0200
    * @tc.desc  : Set whether the pop-up window is displayed on the app.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ToastShowMode_static_0200', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('ToastShowMode_static_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ShowMode_p2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('mess_mode');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToastShowMode_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('Message TOP_MOST');
      console.info('[ToastShowMode_static_0200] END');
      done();
    });

  })
}