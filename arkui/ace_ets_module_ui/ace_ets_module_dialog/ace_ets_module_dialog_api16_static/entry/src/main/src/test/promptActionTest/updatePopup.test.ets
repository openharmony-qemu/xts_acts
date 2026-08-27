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
import { describe, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import deviceInfo from "@ohos.deviceInfo"

export default function updatePopupTest() {
  describe('updatePopupTest', () => {

    beforeEach(async () => {
      console.info("updatePopupTesttions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/updatePopup',
      }
      try {
        const updatePopupTesttions = AppStorage.get<Router>("router") as Router
        updatePopupTesttions.clear();
        let pages: router.RouterState = updatePopupTesttions.getState();
        console.info("get updatePopupTesttions state pages: " + JSON.stringify(pages));
        if (!("updatePopup" == pages.name)) {
          console.info("get updatePopupTesttions state pages.name: " + JSON.stringify(pages.name));
          // let result = await updatePopupTesttions.pushUrl(options);
          updatePopupTesttions.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push updatePopupTesttions success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push updatePopupTesttions page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   updatePopupTest_static_0100
     * @tc.name     updatePopupTest_static_0100
     * @tc.desc     updatePopupTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('updatePopupTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'updatePopupTest_static_0100';
      console.info('[' + tagName + '] START============================');
      try {
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(3500);
        let updatePopup = inspector.getInspectorByKey('updatePopup');
        console.info("[updatePopupTest_static_0100] attrs is: " +
        JSON.stringify(JSON.parseJsonElement(updatePopup).getElement('$attrs')));
        expect(JSON.parseJsonElement(updatePopup).getElement('$attrs').getString('content')).assertEqual('updatePopup');
      } catch (err) {
        console.info('[' + tagName + '] err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}