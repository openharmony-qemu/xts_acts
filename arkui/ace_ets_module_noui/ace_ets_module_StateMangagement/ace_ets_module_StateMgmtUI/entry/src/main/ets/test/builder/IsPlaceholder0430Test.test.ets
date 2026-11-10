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

export default function IsPlaceholder0430Test() {
  describe('IsPlaceholder0430Test', () => {
    beforeEach(async (done: Function) => {
      console.info("IsPlaceholder0430Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/builder/IsPlaceholder0430",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IsPlaceholder0430Test state pages:" + JSON.stringify(pages));
        if (!("IsPlaceholder0430" == pages.name)) {
          console.info("get IsPlaceholder0430Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IsPlaceholder0430Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IsPlaceholder0430Test page error:" + err);
      }
      console.info("IsPlaceholder0430Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IsPlaceholder0430Test after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0600
     * @tc.number SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0600
     * @tc.desc   Global placeholder @Builder used with @BuilderParam renders normally and data refreshes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0600] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tvIsPlaceholder0430BuilderParam');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloBuilderParam');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvIsPlaceholder0430ChildMessage');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0600] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('HelloChild');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btnIsPlaceholder0430ChildChange'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvIsPlaceholder0430ChildMessage');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0600] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('HelloWorld');
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0600] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0700
     * @tc.number SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0700
     * @tc.desc   Global placeholder @Builder used with wrapBuilder renders normally and data refreshes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0700] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tvIsPlaceholder0430WrapBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloWrapBuilder');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvIsPlaceholder0430WrapRefresh');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0700] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('HelloBuilder');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btnIsPlaceholder0430WrapChange'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvIsPlaceholder0430WrapRefresh');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0700] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('HelloWorld');
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0700] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0800
     * @tc.number SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0800
     * @tc.desc   Global placeholder @Builder used with mutableBuilder renders normally and switches correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0800] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tvIsPlaceholder0430MutableA');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloMutableA');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btnIsPlaceholder0430MutableChange'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvIsPlaceholder0430MutableB');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0800] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('HelloMutableB');
      console.info('[SUB_ACE_STATUSMANAGER_BUILDER_ISPLACEHOLDER_0800] END');
      done();
    });
  })
}
