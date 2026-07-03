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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function LazyForEachDataReloadTest() {
  describe('LazyForEachDataReloadTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyForEachDataReloadTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/LazyForEachDataReload",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyForEachDataReload state pages: " + JSON.stringify(pages));
        if (!("LazyForEachDataReload" == pages.name)) {
          console.info("get LazyForEachDataReload state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyForEachDataReload success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachDataReload page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   LazyForEachDataReloadTest_0100
     * @tc.number SUB_ARKUI_API_LazyForEachDataReloadTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LazyForEachDataReloadTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[LazyForEachDataReloadTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('ReuseImmediatelyString');

      let button1 = await driver.findComponent(ON.id('ReuseImmediately'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ReuseImmediatelyString');

      let button2 = await driver.findComponent(ON.id('InitRecyclePool'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('LazyForEachNewReloadString');

      let button3 = await driver.findComponent(ON.id('NewReload'));
      await button3.click();
      await CommonFunc.sleep(2000);
      let strJson3 = getInspectorByKey('LazyForEachNewReloadString');

      let button4 = await driver.findComponent(ON.id('OriginReload'));
      await button4.click();
      await CommonFunc.sleep(2000);
      let strJson4 = getInspectorByKey('LazyForEachNewReloadString');

      let button5 = await driver.findComponent(ON.id('SetReloadUndefined'));
      await button5.click();
      await CommonFunc.sleep(2000);
      let strJson5 = getInspectorByKey('LazyForEachNewReloadString');

      let button6 = await driver.findComponent(ON.id('SetReloadNull'));
      await button6.click();
      await CommonFunc.sleep(2000);
      let strJson6 = getInspectorByKey('LazyForEachNewReloadString');

      let button7 = await driver.findComponent(ON.id('AddNoOne'));
      await button7.click();
      await CommonFunc.sleep(2000);
      let strJson7 = getInspectorByKey('LazyForEachNewReloadString');

      let button8 = await driver.findComponent(ON.id('DeleteNoThree'));
      await button8.click();
      await CommonFunc.sleep(2000);
      let strJson8 = getInspectorByKey('LazyForEachNewReloadString');

      let button9 = await driver.findComponent(ON.id('ChangeNoFive'));
      await button9.click();
      await CommonFunc.sleep(2000);
      let strJson9 = getInspectorByKey('LazyForEachNewReloadString');

      let button10 = await driver.findComponent(ON.id('DuplicateReload'));
      await button10.click();
      await CommonFunc.sleep(2000);
      let strJson10 = getInspectorByKey('LazyForEachNewReloadString');

      let button11 = await driver.findComponent(ON.id('MixOperateAndReload'));
      await button11.click();
      await CommonFunc.sleep(2000);
      let strJson11 = getInspectorByKey('LazyForEachNewReloadString');

      expect(JSON.parse(strJson).$attrs.content).assertEqual('ReuseImmediately_true');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('ReuseImmediately_false');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('InitRecyclePool');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('NewReload');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('OriginReload');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('SetReloadUndefined');
      expect(JSON.parse(strJson6).$attrs.content).assertEqual('SetReloadNull');
      expect(JSON.parse(strJson7).$attrs.content).assertEqual('AddNoOne');
      expect(JSON.parse(strJson8).$attrs.content).assertEqual('DeleteNoThree');
      expect(JSON.parse(strJson9).$attrs.content).assertEqual('ChangeNoFive');
      expect(JSON.parse(strJson10).$attrs.content).assertEqual('DuplicateReload');
      expect(JSON.parse(strJson11).$attrs.content).assertEqual('MixOperateAndReload');
      
      console.info('[LazyForEachDataReloadTest_0100] END');
      done();
    });
  })
}

