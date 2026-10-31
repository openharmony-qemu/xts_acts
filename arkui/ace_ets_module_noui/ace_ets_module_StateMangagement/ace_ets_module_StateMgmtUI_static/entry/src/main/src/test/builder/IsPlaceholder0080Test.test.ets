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
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function IsPlaceholder0080Test() {
  describe('IsPlaceholder0080Test', () => {
    beforeEach(async (): Promise<void> => {
      console.info("IsPlaceholder0080Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/builder/IsPlaceholder0080",
      }
      try {
        const isPlaceholderRouter = AppStorage.get<Router>("router") as Router
        isPlaceholderRouter.clear();
        let pages: router.RouterState = isPlaceholderRouter.getState();
        console.info("get IsPlaceholder0080Test state pages: " + JSON.stringify(pages));
        if (!("IsPlaceholder0080" == pages.name)) {
          console.info("get IsPlaceholder0080Test pages.name: " + JSON.stringify(pages.name));
          isPlaceholderRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push IsPlaceholder0080Test page error:" + err);
      }
      console.info("IsPlaceholder0080Test beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IsPlaceholder0080Test after each called");
    });

    /**
     * @tc.name    SUB_ARKUI_BUILDER_ISPLACEHOLDER_0200
     * @tc.number  SUB_ARKUI_BUILDER_ISPLACEHOLDER_0200
     * @tc.desc    Global builder decorated with @Builder({ isPlaceholder: true }) renders normally
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_ARKUI_BUILDER_ISPLACEHOLDER_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0200] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('tvIsPlaceholder0080True');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      console.info("[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0200] content is: " + content);
      expect(content).assertEqual('HelloBuilder');
      console.info('[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0200] END');
      done();
    });
  })
}
