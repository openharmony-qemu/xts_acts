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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';;
import { Component, Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function IsPlaceholder0430Test() {
  describe('IsPlaceholder0430Test', () => {
    beforeEach(async (): Promise<void> => {
      console.info("IsPlaceholder0430Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/builder/IsPlaceholder0430",
      }
      try {
        const isPlaceholderRouter = AppStorage.get<Router>("router") as Router
        isPlaceholderRouter.clear();
        let pages: router.RouterState = isPlaceholderRouter.getState();
        console.info("get IsPlaceholder0430Test state pages: " + JSON.stringify(pages));
        if (!("IsPlaceholder0430" == pages.name)) {
          console.info("get IsPlaceholder0430Test pages.name: " + JSON.stringify(pages.name));
          isPlaceholderRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push IsPlaceholder0430Test page error:" + err);
      }
      console.info("IsPlaceholder0430Test beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IsPlaceholder0430Test after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_BUILDER_ISPLACEHOLDER_0300
     * @tc.number SUB_ARKUI_BUILDER_ISPLACEHOLDER_0300
     * @tc.desc   Global placeholder @Builder used with @BuilderParam renders normally and data refreshes correctly
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('SUB_ARKUI_BUILDER_ISPLACEHOLDER_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0300] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('tvIsPlaceholder0430BuilderParam');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      console.info("[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0300] content is: " + content);
      expect(content).assertEqual('HelloBuilderParam');
      let strJson1: string = inspector.getInspectorByKey('tvIsPlaceholder0430ChildMessage');
      let obj1 = JSON.parseJsonElement(strJson1).getElement('$attrs');
      let content1 = obj1.getString('content');
      console.info("[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0300] content1 is: " + content1);
      expect(content1).assertEqual('HelloChild');
      let driver: Driver = await Driver.create();
      let btn = await driver.findComponent(ON.id('btnIsPlaceholder0430ChildChange'));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2: string = inspector.getInspectorByKey('tvIsPlaceholder0430ChildMessage');
      let obj2 = JSON.parseJsonElement(strJson2).getElement('$attrs');
      let content2 = obj2.getString('content');
      console.info("[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0300] content2 is: " + content2);
      expect(content2).assertEqual('HelloWorld');
      console.info('[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_BUILDER_ISPLACEHOLDER_0400
     * @tc.number SUB_ARKUI_BUILDER_ISPLACEHOLDER_0400
     * @tc.desc   Global placeholder @Builder used with wrapBuilder renders normally and data refreshes correctly
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('SUB_ARKUI_BUILDER_ISPLACEHOLDER_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0400] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('tvIsPlaceholder0430WrapBuilder');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      console.info("[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0400] content is: " + content);
      expect(content).assertEqual('HelloWrapBuilder');
      let strJson1: string = inspector.getInspectorByKey('tvIsPlaceholder0430WrapRefresh');
      let obj1 = JSON.parseJsonElement(strJson1).getElement('$attrs');
      let content1 = obj1.getString('content');
      console.info("[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0400] content1 is: " + content1);
      expect(content1).assertEqual('HelloBuilder');
      let driver: Driver = await Driver.create();
      let btn = await driver.findComponent(ON.id('btnIsPlaceholder0430WrapChange'));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2: string = inspector.getInspectorByKey('tvIsPlaceholder0430WrapRefresh');
      let obj2 = JSON.parseJsonElement(strJson2).getElement('$attrs');
      let content2 = obj2.getString('content');
      console.info("[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0400] content2 is: " + content2);
      expect(content2).assertEqual('HelloWorld');
      console.info('[SUB_ARKUI_BUILDER_ISPLACEHOLDER_0400] END');
      done();
    });
  })
}
