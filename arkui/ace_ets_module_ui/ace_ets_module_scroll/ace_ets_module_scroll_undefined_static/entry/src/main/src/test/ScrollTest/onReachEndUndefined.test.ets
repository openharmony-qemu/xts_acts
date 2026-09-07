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

import { describe, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
export default function onReachEndUndefinedTest() {
  describe('onReachEndUndefinedTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("onReachEndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/onReachEndUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onReachEndUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("onReachEndUndefined" == pages.name)) {
          console.info("get onReachEndUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onReachEndUndefinedTest page error:" + err);
      }
      console.info("onReachEndUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    onReachEndUndefinedTest_static_0100
     * @tc.name      onReachEndUndefinedTest_static_0100
     * @tc.desc      onReachEndUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('onReachEndUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[onReachEndUndefinedTest_static_0100] START.');
        await CommonFunc.sleep(500);

        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let btn2 = await driver.findComponent(ON.id('flingTop')) as Component;
        let btn3 = await driver.findComponent(ON.id('flingBottom')) as Component;
        await btn3.click();
      
        let strJson1 = inspector.getInspectorByKey('common_onReachEnd');
        let onReachEndValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
        console.info('$onReachEnd: ' +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
        expect(onReachEndValue1.asString()).assertEqual('Count2');
        await btn2.click();
        await CommonFunc.sleep(1000);
      
        let btn1 = await driver.findComponent(ON.id('button_onReachEnd')) as Component;
        await btn1.click();
        await CommonFunc.sleep(500);
        await btn3.click();
        await CommonFunc.sleep(1000);

        let strJson2 = inspector.getInspectorByKey('common_onReachEnd');
        let onReachEndValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content');
        console.info('$onReachEnd: ' +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content')));
        expect(onReachEndValue2.asString()).assertEqual('Count2');

        console.info('[onReachEndUndefinedTest_static_0100] END');
        done();
      } catch (error) {
        console.error('[onReachEndUndefinedTest_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}