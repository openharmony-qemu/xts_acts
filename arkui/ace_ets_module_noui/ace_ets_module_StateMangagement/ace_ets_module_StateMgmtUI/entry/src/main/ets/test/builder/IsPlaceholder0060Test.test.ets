/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function IsPlaceholder0060Test() {
  describe('IsPlaceholder0060Test', () => {
    beforeEach(async (done: Function) => {
      console.info("IsPlaceholder0060Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/builder/IsPlaceholder0060",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IsPlaceholder0060Test state pages:" + JSON.stringify(pages));
        if (!("IsPlaceholder0060" == pages.name)) {
          console.info("get IsPlaceholder0060Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IsPlaceholder0060Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IsPlaceholder0060Test page error:" + err);
      }
      console.info("IsPlaceholder0060Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IsPlaceholder0060Test after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0100
     * @tc.number SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0100
     * @tc.desc   Global builder decorated with @Builder({ isPlaceholder: false }) renders the same as a bare @Builder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0100] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tvIsPlaceholder0060False');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloBuilder');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0200
     * @tc.number SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0200
     * @tc.desc   Global builder decorated with @Builder({ isPlaceholder: false }) refreshes the same as a bare @Builder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0200] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btnIsPlaceholder0060Change'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvIsPlaceholder0060False');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloWorld');
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_FALSE_0200] END');
      done();
    });
  })
}
