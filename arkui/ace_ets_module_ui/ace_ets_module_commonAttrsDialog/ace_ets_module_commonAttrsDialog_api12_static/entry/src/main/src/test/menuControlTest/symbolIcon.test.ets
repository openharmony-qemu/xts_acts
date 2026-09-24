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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { MessageManager, Callback } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function symbolIcon() {
  describe('symbolIcon',  () =>{
    beforeEach(async (): Promise<void> => {
      console.info("symbolIcon beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/menuControl/symbolIcon',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get symbolIcon state pages:" + JSON.stringify(pages));
        if (!("symbolIcon" == pages.name)) {
          console.info("get symbolIcon pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push symbolIcon page error:" + err);
      }
      console.info("symbolIcon beforeEach end");
    });

    
    
    /**
     * @tc.number   symbolIcon_static_0100
     * @tc.name     symbolIcon_static_0100
     * @tc.desc     symbolIcon_static_0100
     * @tc.level    Level.LEVEL0
     */
it('symbolIcon_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('symbolIcon_0100 START');
      let driver =  Driver.create()
      try {
        await CommonFunc.sleep(1000);
        let Column = await driver.findComponent(ON.id('symbolIcon'));
        await (Column?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let Column1 = await driver.findComponent(ON.text('Menu1'));
        await (Column1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('symbolIcon_0100 err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('symbolIconValue');

      console.info("[symbolIcon_0100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[symbolIcon_0100] title: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("set symbolIcon success");
      try {
        await driver.triggerKey(2070);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('symbolIcon_0100 err: ' + JSON.stringify(err));
      }
      console.info('[symbolIcon_0100] END');
      done();
    });
  })
}
