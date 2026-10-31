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

export default function WrapBuilder0030Test() {
  describe('WrapBuilder0030Test', () => {
    beforeEach(async (): Promise<void> => {
      console.info("WrapBuilder0030Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/wrap_builder/WrapBuilder0030",
      }
      try {
        const wrapBuilder0030Router = AppStorage.get<Router>("router") as Router
        wrapBuilder0030Router.clear();
        let pages: router.RouterState = wrapBuilder0030Router.getState();
        console.info("get WrapBuilder0030Test state pages: " + JSON.stringify(pages));
        if (!("WrapBuilder0030" == pages.name)) {
          console.info("get WrapBuilder0030Test pages.name: " + JSON.stringify(pages.name));
          wrapBuilder0030Router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WrapBuilder0030Test page error:" + err);
      }
      console.info("WrapBuilder0030Test beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WrapBuilder0030Test after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_STATUSMANAGER_WRAPI_0100
     * @tc.number SUB_ARKUI_STATUSMANAGER_WRAPI_0100
     * @tc.desc   Verify WrappedBuilder with module import displays correct text
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('SUB_ARKUI_STATUSMANAGER_WRAPI_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_STATUSMANAGER_WRAPI_0100] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('wrapBuilder0030_text1');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      console.info("[SUB_ARKUI_STATUSMANAGER_WRAPI_0100] content is: " + content);
      expect(content).assertEqual('WrappedBuilder');
      console.info('[SUB_ARKUI_STATUSMANAGER_WRAPI_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_STATUSMANAGER_WRAPI_0200
     * @tc.number SUB_ARKUI_STATUSMANAGER_WRAPI_0200
     * @tc.desc   Verify MutableBuilder with module import displays correct text
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('SUB_ARKUI_STATUSMANAGER_WRAPI_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_STATUSMANAGER_WRAPI_0200] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('wrapBuilder0030_text2');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      console.info("[SUB_ARKUI_STATUSMANAGER_WRAPI_0200] content is: " + content);
      expect(content).assertEqual('MutableBuilder');
      console.info('[SUB_ARKUI_STATUSMANAGER_WRAPI_0200] END');
      done();
    });
  })
}
