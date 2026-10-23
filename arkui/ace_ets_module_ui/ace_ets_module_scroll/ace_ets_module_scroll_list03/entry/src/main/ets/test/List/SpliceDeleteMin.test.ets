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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SpliceDeleteMin() {
  describe('spliceDeleteMin', () => {
    beforeEach(async (done: Function) => {
      console.info("spliceDeleteMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/spliceDeleteMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get spliceDeleteMin state pages:" + JSON.stringify(pages));
        if (!("spliceDeleteMin" == pages.name)) {
          console.info("get spliceDeleteMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push spliceDeleteMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push spliceDeleteMin page error:" + err);
      }
      console.info("spliceDeleteMin beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("spliceDeleteMin afterEach called");
    });

    /**
     * @tc.name   spliceDeleteMin_0100
     * @tc.number SUB_ARKUI_LIST_SPLICEDELETE_0100
     * @tc.desc   Test ChildrenMainSize splice with negative deleteCount, which should be treated as 0
     *            without throwing exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('spliceDeleteMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[spliceDeleteMin_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('splice_btn_delete_neg'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('splice_result_delete_neg');
      console.info("[spliceDeleteMin_0100] component obj is: " + strJson);
      console.info("[spliceDeleteMin_0100] content: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('spliceDeleteNegResult: success');
      console.info('[spliceDeleteMin_0100] END');
      done();
    });

    /**
     * @tc.name   spliceDeleteMin_0200
     * @tc.number SUB_ARKUI_LIST_SPLICEDELETE_0200
     * @tc.desc   Test ChildrenMainSize splice with zero deleteCount, which is a valid value and
     *            deletes nothing without throwing exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('spliceDeleteMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[spliceDeleteMin_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('splice_btn_delete_zero'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('splice_result_delete_zero');
      console.info("[spliceDeleteMin_0200] component obj is: " + strJson);
      console.info("[spliceDeleteMin_0200] content: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('spliceDeleteZeroResult: success');
      console.info('[spliceDeleteMin_0200] END');
      done();
    });

    /**
     * @tc.name   spliceDeleteMin_0300
     * @tc.number SUB_ARKUI_LIST_SPLICEDELETE_0300
     * @tc.desc   Test List still renders normally and splice results remain success after repeated
     *            ChildrenMainSize splice calls with edge deleteCount values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('spliceDeleteMin_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[spliceDeleteMin_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let negBtn: Component = await driver.findComponent(ON.id('splice_btn_delete_neg'));
      await negBtn.click();
      await CommonFunc.sleep(1000);
      let zeroBtn: Component = await driver.findComponent(ON.id('splice_btn_delete_zero'));
      await zeroBtn.click();
      await CommonFunc.sleep(1000);
      let listJson = getInspectorByKey('splice_delete_list');
      console.info("[spliceDeleteMin_0300] list type: " + JSON.parse(listJson).$type);
      expect(JSON.parse(listJson).$type).assertEqual('List');
      let negJson = getInspectorByKey('splice_result_delete_neg');
      console.info("[spliceDeleteMin_0300] neg content: " + JSON.parse(negJson).$attrs.content);
      expect(JSON.parse(negJson).$attrs.content).assertEqual('spliceDeleteNegResult: success');
      let zeroJson = getInspectorByKey('splice_result_delete_zero');
      console.info("[spliceDeleteMin_0300] zero content: " + JSON.parse(zeroJson).$attrs.content);
      expect(JSON.parse(zeroJson).$attrs.content).assertEqual('spliceDeleteZeroResult: success');
      console.info('[spliceDeleteMin_0300] END');
      done();
    });
  })
}
