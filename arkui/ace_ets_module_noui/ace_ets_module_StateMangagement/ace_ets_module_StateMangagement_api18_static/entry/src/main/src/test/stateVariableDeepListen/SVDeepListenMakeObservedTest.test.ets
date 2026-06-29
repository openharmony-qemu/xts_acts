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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
import { UIUtils } from '@kit.ArkUI';

export default function SVDeepListenMakeObservedTest(): void {
  describe('SVDeepListenMakeObservedTest', () => {
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/stateVariableDeepListen/SVDeepListenMakeObserved",
      }
      try {
        const svDeepListenTest = AppStorage.get<Router>("router") as Router;
        svDeepListenTest.clear();
        let pages: router.RouterState = svDeepListenTest.getState();
        if (!("SVDeepListenMakeObserved" == pages.name)) {
          svDeepListenTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SVDeepListenMakeObserved page error:" + err);
      }
    });

    beforeEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   SUB_ARKUI_SVDeepListenMakeObservedTest_static_0100
     * @tc.number SUB_ARKUI_SVDeepListenMakeObservedTest_static_0100
     * @tc.desc   Test makeObserved deep listener - verify second level property change triggers UI update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_SVDeepListenMakeObservedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_SVDeepListenMakeObservedTest_static_0100] START');

      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);

      // Step1: Verify initial state - info.name is 'Jack'
      let strJson = inspector.getInspectorByKey('allowDeep_true_infoNameText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('allowDeep(true)info.name: Jack');

      // Step2: Click changNameButton to change second level property info.name from 'Jack' to 'Jackson'
      // This should trigger UI update due to deep listener
      let button = await driver.findComponent(ON.id('allowDeep_true_changNameButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('allowDeep_true_infoNameText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('allowDeep(true)info.name: Jackson');

      // Step3: Click replaceInfoButton to replace first level property info
      // This should trigger UI update - info becomes { name: 'Tom', age: 25 }
      button = await driver.findComponent(ON.id('replaceInfoButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('allowDeep_true_infoNameText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('allowDeep(true)info.name: Tom');

      let res1 = UIUtils.makeObserved(2); // 非对象类型入参，实际无作用，返回2
      expect(res1).assertEqual(2);
      let res2 = UIUtils.makeObserved(undefined); // 非对象类型入参，实际无作用，返回undefined
      expect(res2).assertEqual(undefined);
      let res3 = UIUtils.makeObserved(null); // 非对象类型入参，实际无作用，返回null
      expect(res3).assertEqual(null);

      console.info('[SUB_ARKUI_SVDeepListenMakeObservedTest_static_0100] END');
      done();
    });

  });
}