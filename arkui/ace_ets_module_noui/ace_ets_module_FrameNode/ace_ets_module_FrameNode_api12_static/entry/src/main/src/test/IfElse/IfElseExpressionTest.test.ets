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

import inspector from '@ohos.arkui.inspector';
import { describe, beforeEach, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function IfElseExpressionTest() {
  describe('IfElseExpressionTest', () => {
    beforeEach(async () => {
      console.info("IfElseExpressionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/IfElse/IfElseExpression",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get IfElseExpression state pages: " + JSON.stringify(pages));
        if (!("IfElseExpression" == pages.name)) {
          console.info("get IfElseExpression state pages.name: " + JSON.stringify(pages.name));
          
          await router.pushUrl(options)
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push IfElseExpression page error: " + err);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.name   IfElseExpressionTest_0100
     * @tc.number SUB_ArkUI_Ace_IfElseExpressionTest_0100
     * @tc.desc   add ArkUI static api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IfElseExpressionTest_0100', Level.LEVEL1, async (done: ()=>void) => {
      try {
        console.info('[IfElseExpressionTest_0100] START');
        let driver = Driver.create()
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('TextStringValue1');
        let strJson2 = inspector.getInspectorByKey('TextStringValue2');

        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('value大于20');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('value小于1000');

        console.info('[IfElseExpressionTest_0100] END');
        done();
      } catch (error) {
        console.error('[IfElseExpressionTest_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });
    
  })
}