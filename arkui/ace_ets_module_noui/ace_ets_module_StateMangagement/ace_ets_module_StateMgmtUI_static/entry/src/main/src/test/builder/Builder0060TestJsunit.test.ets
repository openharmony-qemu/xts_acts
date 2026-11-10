'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { Component, Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function Builder0060TestJsunit() {
  describe('Builder0060TestJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("Builder0060TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/builder/Builder0060",
      }
      try {
        const builder0060Router = AppStorage.get<Router>("router") as Router
        builder0060Router.clear();
        let pages: router.RouterState = builder0060Router.getState();
        console.info("get Builder0060TestJsunit state pages: " + JSON.stringify(pages));
        if (!("Builder0060" == pages.name)) {
          console.info("get Builder0060TestJsunit pages.name: " + JSON.stringify(pages.name));
          builder0060Router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Builder0060TestJsunit page error:" + err);
      }
      console.info("Builder0060TestJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Builder0060TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_STATUSMANAGER_BUILDER_0100
     * @tc.number SUB_ARKUI_STATUSMANAGER_BUILDER_0100
     * @tc.desc   Verify @Builder with interface parameter renders button label from state
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('SUB_ARKUI_STATUSMANAGER_BUILDER_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_STATUSMANAGER_BUILDER_0100] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('builder0060');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let label = obj.getString('label');
      console.info("[SUB_ARKUI_STATUSMANAGER_BUILDER_0100] label is: " + label);
      expect(label).assertEqual('Hello World');
      console.info('[SUB_ARKUI_STATUSMANAGER_BUILDER_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_STATUSMANAGER_BUILDER_0200
     * @tc.number SUB_ARKUI_STATUSMANAGER_BUILDER_0200
     * @tc.desc   Verify @Builder onClick callback updates state and Text content
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('SUB_ARKUI_STATUSMANAGER_BUILDER_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_STATUSMANAGER_BUILDER_0200] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let btn = await driver.findComponent(ON.id('builder0060'));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('builder0060_text1');
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      console.info("[SUB_ARKUI_STATUSMANAGER_BUILDER_0200] content is: " + content);
      expect(content).assertEqual('Button clicked');
      console.info('[SUB_ARKUI_STATUSMANAGER_BUILDER_0200] END');
      done();
    });
  })
}
