'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
import { UIUtils } from '@kit.ArkUI';

export default function SVDeepListenMakeObservedFalseTest(): void {
  describe('SVDeepListenMakeObservedFalseTest', () => {
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/stateVariableDeepListen/SVDeepListenMakeObservedFalse",
      }
      try {
        const svDeepListenTest = AppStorage.get<Router>("router") as Router;
        svDeepListenTest.clear();
        let pages: router.RouterState = svDeepListenTest.getState();
        if (!("SVDeepListenMakeObservedFalse" == pages.name)) {
          svDeepListenTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SVDeepListenMakeObservedFalse page error:" + err);
      }
    });

    beforeEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   SUB_ARKUI_SVDeepListenMakeObservedTest_static_0200
     * @tc.number SUB_ARKUI_SVDeepListenMakeObservedTest_static_0200
     * @tc.desc   Test makeObserved deep listener - verify second level property change triggers UI update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_SVDeepListenMakeObservedTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_SVDeepListenMakeObservedTest_static_0200] START');

      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(2000);

      // Step1: Verify initial state - info.name is 'Jack'
      let strJson = inspector.getInspectorByKey('allowDeep_false_infoNameText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('allowDeep(false)info.name: Jack');


      let button = await driver.findComponent(ON.id('allowDeep_false_changNameButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('allowDeep_false_infoNameText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('allowDeep(false)info.name: Jack');

      console.info('[SUB_ARKUI_SVDeepListenMakeObservedTest_static_0200] END');
      done();
    });
  });
}