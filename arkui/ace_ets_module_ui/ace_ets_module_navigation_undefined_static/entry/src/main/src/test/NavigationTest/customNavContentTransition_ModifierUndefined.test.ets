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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function customNavContentTransitionModifierUndefined() {
  describe('customNavContentTransitionModifierUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("customNavContentTransitionModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("customNavContentTransitionModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/customNavContentTransition_modifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get customNavContentTransitionModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("customNavContentTransition_modifier" == pages.name)) {
          console.info("get customNavContentTransitionModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push customNavContentTransitionModifierUndefined page error:" + err);
      }
      console.info("customNavContentTransitionModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   customNavContentTransitionModifierUndefined_static_0001
     * @tc.name     customNavContentTransitionModifierUndefined_static_0001
     * @tc.desc     test customNavContentTransition modifier callback - dynamic switch
     * @tc.level    Level.LEVEL1
     */
    it('customNavContentTransitionModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[customNavContentTransitionModifierUndefined_static_0001] START');
      try{

      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
     
      let toggleBtn = await driver.findComponent(ON.id('toggleButton'));
      if (toggleBtn) {
        let toggleText = await toggleBtn.getText();
        console.info('[customNavContentTransitionModifierUndefined_static_0001] Initial toggle text: ' + toggleText);
        expect(toggleText.indexOf('false') > -1).assertTrue();
      }

      let pushBtn = await driver.findComponent(ON.id('pushButton'));
      if (pushBtn) {
        await pushBtn.click();
        await CommonFunc.sleep(1500);
      }

      let strJson2 = inspector.getInspectorByKey('changeCountTextModifier');
      let obj2 = JSON.parseJsonElement(strJson2);
      let testText2 = obj2.getElement('$attrs').getString('content');
      expect(testText2).assertEqual("0");

      let backText = await driver.findComponent(ON.id('NavPathStackApi2_text_pageOne'));
      if (backText) {
      await backText.click();
      await CommonFunc.sleep(1000);
      }
      if (toggleBtn) {
        await toggleBtn.click();
        await CommonFunc.sleep(1000);
      }

      toggleBtn = await driver.findComponent(ON.id('toggleButton'));
      if (toggleBtn) {
        let toggleText = await toggleBtn.getText();
        console.info('[customNavContentTransitionModifierUndefined_static_0001] After toggle text: ' + toggleText);
        expect(toggleText.indexOf('true') > -1).assertTrue();
      }

      if (pushBtn) {
        await pushBtn.click();
        await CommonFunc.sleep(1500);
      }

      let strJson3 = inspector.getInspectorByKey('changeCountTextModifier');
      let obj3 = JSON.parseJsonElement(strJson3);
      let testText3 = obj3.getElement('$attrs').getString('content');
      expect(testText3).assertEqual("-1");

      let backText2 = await driver.findComponent(ON.id('NavPathStackApi2_text_pageOne'));
      if (backText2) {
      await backText2.click();
      await CommonFunc.sleep(1000);
      }

      }catch (err) {
        console.error('customNavContentTransitionModifierUndefined_static_0001 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[customNavContentTransitionModifierUndefined_static_0001] END');
      done();
    });

  })
}

