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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
export default function headerListJsunit() {
  describe('headerListJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("headerListJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/headerList",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get headerListJsunit state pages:" + JSON.stringify(pages));
        if (!("headerList" == pages.name)) {
          console.info("get headerListJsunit pages.name:" + '');


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push headerListJsunit page error:" + err);
      }
      console.info("headerListJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("headerListJsunit after each called");
    });



    
    /**
     * @tc.number   headerListJsunit_static_0100
     * @tc.name     headerListJsunit_static_0100
     * @tc.desc     headerListJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('headerListJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>{

      console.info('[headerListJsunit_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('list_header'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let text01 = await driver.findComponent(ON.text("美术"))
        let texContent = await (text01?.getText() as Promise<string>);
        expect(texContent).assertEqual("美术");

        let strJson = inspector.getInspectorByKey('list_title');
        console.info("[headerListJsunit_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
        console.info("[headerListJsunit_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
        await CommonFunc.sleep(1000);
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('title: Monday');
        console.info('[headerListJsunit_0100] END');
        done();
      } catch (error) {
        console.error('[headerListJsunit_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
