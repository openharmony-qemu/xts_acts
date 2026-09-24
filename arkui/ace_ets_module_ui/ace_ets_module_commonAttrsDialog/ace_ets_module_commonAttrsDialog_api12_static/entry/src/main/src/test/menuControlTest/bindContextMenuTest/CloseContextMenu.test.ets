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
import { beforeEach, describe, expect, it, Level } from '../../../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function CloseContextMenu() {
  describe('CloseContextMenu', () => {
    beforeEach(async (): Promise<void> => {
      console.info("CloseContextMenu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenu/CloseContextMenu',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CloseContextMenu state pages: " + JSON.stringify(pages));
        if (!("CloseContextMenu" == pages.name)) {
          console.info("get CloseContextMenu state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CloseContextMenu page error: " + err);
      }

    });

    
    
    /**
     * @tc.number   CloseContextMenu_static_0100
     * @tc.name     CloseContextMenu_static_0100
     * @tc.desc     CloseContextMenu_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CloseContextMenu_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CloseContextMenu_0100 START');
      try {
        await CommonFunc.sleep(1000);
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let Button = await driver.findComponent(ON.id('CloseContextMenu'));
        await (Button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let text = await driver.findComponent(ON.id('CloseContextMenuClick'));
        await (text?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CloseContextMenu_0100 err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('CloseContextMenuText');
      console.info("[CloseContextMenu_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[CloseContextMenu_0100] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("true");
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CloseContextMenu_0100 err: ' + JSON.stringify(err));
      }
      console.info('[CloseContextMenu_0100] END');
      done();
    });


  })
}
