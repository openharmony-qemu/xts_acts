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

export default function UpdateCustomDialogTest() {
  describe('UpdateCustomDialogTest', () => {

    beforeEach(async () => {
      console.info("UpdateCustomDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CustomDialog/UIContext/UpdateCustomDialog",
      }
      try {
        const UpdateCustomDialogTest = AppStorage.get<Router>("router") as Router
        UpdateCustomDialogTest.clear();
        let pages:router.RouterState = UpdateCustomDialogTest.getState();
        console.info("get UpdateCustomDialogTest state pages: " + JSON.stringify(pages));
        if (!("UpdateCustomDialogTest" == pages.name)) {
          console.info("get UpdateCustomDialogTest state pages.name: " + JSON.stringify(pages.name));
          
          UpdateCustomDialogTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push UpdateCustomDialogTest page error: " + err);
        expect().assertFail();
      }
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UpdateCustomDialogTest after each called");
    });

    
    
/**
     * @tc.number   UpdateCustomDialogTest_static_001
     * @tc.name     UpdateCustomDialogTest_static_001
     * @tc.desc     UpdateCustomDialogTest_static_001
     * @tc.level    Level.LEVEL2
     */
it('UpdateCustomDialogTest_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[UpdateCustomDialogTest_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component|null = (await driver.findComponent(ON.id('btn'))) ;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let UpdateCustomDialog = inspector.getInspectorByKey('UpdateCustomDialog');
      console.info('return log-----' + JSON.parseJsonElement(UpdateCustomDialog).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(UpdateCustomDialog).getElement('$attrs').getString('content')).assertEqual('7');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      console.info('[UpdateCustomDialogTest_static_001] END');
      done();
    });
  })
}
