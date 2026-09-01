'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import events_emitter from '@ohos.events.emitter';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function listAniAdd() {
  describe('listAniAdd', () => {

    beforeEach(async (): Promise<void> => {
      console.info("listAniAdd beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listAniAdd",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get listAniAdd state pages:" + JSON.stringify(pages));
        if (!("listAniAdd" == pages.name)) {
          console.info("get listAniAdd pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push listAniAdd page error:" + err);
      }
      console.info("listAniAdd beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listAniAdd after each called");
    });

  


    
    /**
     * @tc.number   listAniAdd_static_0100
     * @tc.name     listAniAdd_static_0100
     * @tc.desc     listAniAdd_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listAniAdd_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listAniAdd_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('list_add_btn')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list_add_mess');
      console.info("[listAniAdd_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[listAniAdd_static_0100] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('add: onReachStart-onScrollStart-onReachEnd-onScrollStop');
      console.info('[listAniAdd_static_0100] END');
      done();
    });
  })
}
