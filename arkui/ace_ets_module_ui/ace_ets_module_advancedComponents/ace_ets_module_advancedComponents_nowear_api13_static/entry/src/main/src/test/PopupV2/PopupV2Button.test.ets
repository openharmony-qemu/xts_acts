'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Component } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function PopupV2ButtonTest() {
  describe('PopupV2ButtonTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.acts.arkui.popupV2.nowear.test.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PopupV2/PopupV2Button',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PopupV2ButtonTest state pages: " + JSON.stringify(pages));
        if (!("PopupV2Button" == pages.name)) {
          console.info("get PopupV2ButtonTest pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PopupV2ButtonTest page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PopupV2ButtonTest after each called");
    });

    /**
     * @tc.name    SUB_ACE_ARKUI_POPUPV2BUTTON_STATIC_0100
     * @tc.number  SUB_ACE_ARKUI_POPUPV2BUTTON_STATIC_0100
     * @tc.desc    SUB_ACE_ARKUI_POPUPV2BUTTON_STATIC_0100
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_ACE_ARKUI_POPUPV2BUTTON_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_ARKUI_POPUPV2BUTTON_STATIC_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn1 = await driver.findComponent(ON.text('确认'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PopupV2ButtonText');
      await CommonFunc.sleep(500);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_ARKUI_POPUPV2BUTTON_STATIC_0100] content: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('确认');
      console.info('SUB_ACE_ARKUI_POPUPV2BUTTON_STATIC_0100 END');
      done();
    });
  });
}