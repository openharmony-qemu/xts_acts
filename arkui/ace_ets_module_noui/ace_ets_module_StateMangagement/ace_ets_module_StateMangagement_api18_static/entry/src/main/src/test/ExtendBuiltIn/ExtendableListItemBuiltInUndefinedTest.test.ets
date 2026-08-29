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
import { Component, Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ExtendableListItemBuiltInUndefinedTest() {
  describe('ExtendableListItemBuiltInUndefinedTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableListItemBuiltInUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableListItemBuiltInUndefined",
      }
      try {
        const ExtendableListItemBuiltInUndefinedTest = AppStorage.get<Router>("router") as Router
        ExtendableListItemBuiltInUndefinedTest.clear();
        let pages: router.RouterState = ExtendableListItemBuiltInUndefinedTest.getState();
        console.info("get ExtendableListItemBuiltInUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableListItemBuiltInUndefined" == pages.name)) {
          console.info("get ExtendableListItemBuiltInUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableListItemBuiltInUndefinedTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableListItemBuiltInUndefinedTest page error:" + err);
      }
      console.info("ExtendableListItemBuiltInUndefinedTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableListItemBuiltInUndefinedTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableListItemBuiltInUndefinedTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableListItemBuiltInUndefined_CustomAttribute_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_LIST_ITEM_UNDEFINED_0100
     * @tc.desc: SUB_ARKUI_EXTENDABLE_LIST_ITEM_UNDEFINED_0100
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableListItemBuiltInUndefined_CustomAttribute_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableListItemBuiltInUndefined_CustomAttribute_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableListItem_002');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let sticky = obj.getString('sticky');
      expect(sticky).assertEqual('Sticky.None');
      console.info('[ExtendableListItemBuiltInUndefined_CustomAttribute_0100] END');
      done();
    });
  });
}