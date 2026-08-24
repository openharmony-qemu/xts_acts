'use static';
/*
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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function onTouchIntercept() {
  describe('onTouchIntercept', () => {
    beforeEach(async (): Promise<void> => {
      console.info("onTouchIntercept beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onTouchIntercept state pages:" + JSON.stringify(pages));
        if (!("onTouchIntercept" == pages.name)) {
          console.info("get  onTouchIntercept pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/onTouchIntercept/onTouchIntercept"
          })
        }
      } catch (err) {
        console.error("push onTouchIntercept page error:" + err);
      }
      console.info("onTouchIntercept foreEach end");
    });
    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("onTouchIntercept after each called");
    });

    /**
     * @tc.number onTouchIntercept_static_001
     * @tc.name   onTouchIntercept_static_001
     * @tc.desc onTouchIntercept test
     * @tc.level Level 3
     * @tc.type
     */
    it('onTouchIntercept_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onTouchIntercept_static_001] START');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('onTouchIntercept')) as Promise<Component>);
      await button.click();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('onTouchInterceptText');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[onTouchIntercept_static_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content') != '').assertTrue();
      console.info('[onTouchIntercept_static_001] END');
      done();
    });

  })
}