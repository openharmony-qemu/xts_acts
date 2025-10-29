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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
 
export default function setOverlayManagerOptionsReturnTest() {
  describe('setOverlayManagerOptionsReturnTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setOverlayManagerOptionsReturnTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/setOverlayManagerOptionsReturn",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setOverlayManagerOptionsReturn state pages:" + JSON.stringify(pages));
        if (!("setOverlayManagerOptionsReturn" == pages.name)) {
          console.info("get setOverlayManagerOptionsReturn pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setOverlayManagerOptionsReturn page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setOverlayManagerOptionsReturn page error:" + err);
      }
      console.info("setOverlayManagerOptionsReturn beforeEach end");
      done();
    });
 
    it('setOverlayManagerOptionsReturnTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[getDialogControllerReturnTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();

      let btn1: Component = await driver.findComponent(ON.id('setOverlayManagerOptionsReturnBoolean'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info("[setOverlayManagerOptionsReturnTest_0100] setOverlayManagerOptionsReturnBoolean: " + AppStorage.get('setOverlayManagerOptionsReturnBoolean'));
      expect(AppStorage.get('setOverlayManagerOptionsReturnBoolean')).assertDeepEquals(true);

      let btn2: Component = await driver.findComponent(ON.id('setOverlayManagerOptionsReturnBoolean'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      console.info("[setOverlayManagerOptionsReturnTest_0100] setOverlayManagerOptionsReturnBoolean: " + AppStorage.get('setOverlayManagerOptionsReturnBoolean'));
      expect(AppStorage.get('setOverlayManagerOptionsReturnBoolean')).assertDeepEquals(false);

      AppStorage.delete('setOverlayManagerOptionsReturnBoolean')
      console.info('[setOverlayManagerOptionsReturnTest_0100] END');
      done();
    });

  })
}