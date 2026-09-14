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
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function unicodeTest() {
  describe('unicodeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("unicodeTest beforeEach start");
      const searchRouter = AppStorage.get<Router>("router") as Router
      console.info("unicodeTest beforeEach start222");
      try {
        searchRouter.pushUrl({
          url: 'MainAbility/pages/onKeyEvent/unicode',
        });
        await CommonFunc.sleep(2000);
        console.info("push unicodeTest success: ");
      } catch (err) {
        console.error("push unicodeTest page error: " + err);
        expect().assertFail();
      }
    });
    
    
    
/**
     * @tc.number   ArkUI_KeyEvent_UnicodeTest_static_1000
     * @tc.name     ArkUI_KeyEvent_UnicodeTest_static_1000
     * @tc.desc     ArkUI_KeyEvent_UnicodeTest_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_KeyEvent_UnicodeTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      console.info('[ArkUI_KeyEvent_UnicodeTest_static_1000] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('unicode_KeyEvent');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_KeyEvent_UnicodeTest_static_1000] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('true');
      console.info('[ArkUI_KeyEvent_UnicodeTest_static_1000] END');
      } catch (err) {
        console.error('[ArkUI_KeyEvent_UnicodeTest_static_1000] error: ' + err);
        expect().assertFail();
      }
      done();
    });
  })
}