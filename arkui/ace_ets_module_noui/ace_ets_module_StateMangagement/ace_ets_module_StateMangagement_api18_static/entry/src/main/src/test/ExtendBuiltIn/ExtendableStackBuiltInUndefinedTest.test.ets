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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ExtendableStackBuiltInUndefinedTest() {
  describe('ExtendableStackBuiltInUndefinedTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableStackBuiltInUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableStackBuiltInUndefined",
      }
      try {
        const ExtendableStackBuiltInUndefinedTest = AppStorage.get<Router>("router") as Router
        ExtendableStackBuiltInUndefinedTest.clear();
        let pages: router.RouterState = ExtendableStackBuiltInUndefinedTest.getState();
        console.info("get ExtendableStackBuiltInUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableStackBuiltInUndefined" == pages.name)) {
          console.info("get ExtendableStackBuiltInUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableStackBuiltInUndefinedTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableStackBuiltInUndefinedTest page error:" + err);
      }
      console.info("ExtendableStackBuiltInUndefinedTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableStackBuiltInUndefinedTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableStackBuiltInUndefinedTest afterAll: all tests finished');
    });

    /**
     * @tc.name: ExtendableStackBuiltIn_Undefined_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_STACK_Undefined_0100
     * @tc.desc: SUB_ARKUI_EXTENDABLE_STACK_Undefined_0100
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableStackBuiltIn_Undefined_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableStackBuiltIn_Undefined_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableStack_undefined_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let alignContent = obj.getString('alignContent');
      console.info("[ExtendableStackBuiltIn_Undefined_0100] alignContent is: " + alignContent);
      expect(alignContent).assertEqual('Alignment.Center');
      console.info('[ExtendableStackBuiltIn_Undefined_0100] END');
      done();
    });
  });
}