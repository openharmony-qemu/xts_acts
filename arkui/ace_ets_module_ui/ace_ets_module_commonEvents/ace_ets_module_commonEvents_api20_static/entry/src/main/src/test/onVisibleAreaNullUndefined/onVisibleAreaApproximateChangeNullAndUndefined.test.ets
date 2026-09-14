'use static';
/**
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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest(): void {
  describe('commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onVisibleAreaNullUndefined/onVisibleAreaApproximateChangeNullAndUndefined',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest] get state pages: " + JSON.stringify(pages));
        if (!("onVisibleAreaApproximateChangeNullAndUndefined" == pages.name)) {
          console.info("[commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest] page name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("[commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest] push page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest afterEach sleep error: ' + err);
      }
      console.info("[commonMethodOnVisibleAreaApproximateChangeNullAndUndefinedTest] afterEach called");
    });

    /**
     * @tc.name     commonMethodOnVisibleAreaApproximateChangeNull_static_001
     * @tc.number   SUB_ARKUI_COMMONMETHOD_ONVISIBLEAREAAPPROXIMATECHANGE_PARAM_001
     * @tc.desc     Test CommonMethod onVisibleAreaApproximateChange with null/undefined parameter
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('commonMethodOnVisibleAreaApproximateChangeNull_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('commonMethodOnVisibleAreaApproximateChangeNull_static_001 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      await scrollBar?.scrollToBottom();
      await CommonFunc.sleep(3000);

      let strJson = inspector.getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info('onVisibleAreaApproximateChange_column_id content is :' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('test');

      strJson = inspector.getInspectorByKey('onVisibleAreaApproximateChange_row_id');
      obj = JSON.parseJsonElement(strJson);
      console.info('onVisibleAreaApproximateChange_row_id content is :' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('test');

      await scrollBar?.scrollToTop();
      await CommonFunc.sleep(3000);

      strJson = inspector.getInspectorByKey('onVisibleAreaApproximateChange_column_id');
      obj = JSON.parseJsonElement(strJson);
      console.info('onVisibleAreaApproximateChange_column_id2 content is :' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('test');

      strJson = inspector.getInspectorByKey('onVisibleAreaApproximateChange_row_id');
      obj = JSON.parseJsonElement(strJson);
      console.info('onVisibleAreaApproximateChange_row_id content is :' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('test');

      console.info('[commonMethodOnVisibleAreaApproximateChangeNull_static_001] END');
      done();
    });
  });
}