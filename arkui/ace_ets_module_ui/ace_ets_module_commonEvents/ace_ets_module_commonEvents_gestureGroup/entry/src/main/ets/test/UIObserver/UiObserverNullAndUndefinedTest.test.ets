/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function uiObserverNullAndUndefinedTest() {
  describe('uiObserverNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("uiObserverNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/UIObserver/UIObserverNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uiObserverNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("UIObserverNullAndUndefined" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push uiObserverNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uiObserverNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   removeGlobalGestureListenerNullV3001
     * @tc.number SUB_ARKUI_UIOBSERVER_REMOVEGLOBALGESTURELISTENER_PARAM_0001
     * @tc.desc   Test UIObserver.removeGlobalGestureListener with null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeGlobalGestureListenerNullV3001', Level.LEVEL0, async () => {
      console.info('[removeGlobalGestureListenerNullV3001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnRemoveGestureNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('observerResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[removeGlobalGestureListenerNullV3001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[removeGlobalGestureListenerNullV3001] END');
    });

    /**
     * @tc.name   removeGlobalGestureListenerUndefinedV3002
     * @tc.number SUB_ARKUI_UIOBSERVER_REMOVEGLOBALGESTURELISTENER_PARAM_0002
     * @tc.desc   Test UIObserver.removeGlobalGestureListener with undefined type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeGlobalGestureListenerUndefinedV3002', Level.LEVEL0, async () => {
      console.info('[removeGlobalGestureListenerUndefinedV3002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnRemoveGestureUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('observerResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[removeGlobalGestureListenerUndefinedV3002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[removeGlobalGestureListenerUndefinedV3002] END');
    });

    /**
     * @tc.name   removeGlobalGestureListenerOutOfRangeV3003
     * @tc.number SUB_ARKUI_UIOBSERVER_REMOVEGLOBALGESTURELISTENER_PARAM_0003
     * @tc.desc   Test UIObserver.removeGlobalGestureListener with out of range enum type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeGlobalGestureListenerOutOfRangeV3003', Level.LEVEL0, async () => {
      console.info('[removeGlobalGestureListenerOutOfRangeV3003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnRemoveGestureOutOfRange'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('observerResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[removeGlobalGestureListenerOutOfRangeV3003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[removeGlobalGestureListenerOutOfRangeV3003] END');
    });

    /**
     * @tc.name   nodeRenderStateMultiCallbackRenderInV3004
     * @tc.number SUB_ARKUI_UIOBSERVER_NODERENDERSTATE_MULTI_CALLBACK_0004
     * @tc.desc   Test UIObserver.on nodeRenderState multi callback fire RENDER_IN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nodeRenderStateMultiCallbackRenderInV3004', Level.LEVEL0, async () => {
      console.info('[nodeRenderStateMultiCallbackRenderInV3004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnAddMultiCallback'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('observerNoticeText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nodeRenderStateMultiCallbackRenderInV3004] notice: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('CB1_RENDER_IN');
      expect(obj.$attrs.content).assertContain('CB2_RENDER_IN');
      expect(obj.$attrs.content).assertContain('CB3_RENDER_IN');
      console.info('[nodeRenderStateMultiCallbackRenderInV3004] END');
    });

    /**
     * @tc.name   nodeRenderStateMultiCallbackRenderOutV3005
     * @tc.number SUB_ARKUI_UIOBSERVER_NODERENDERSTATE_MULTI_CALLBACK_0005
     * @tc.desc   Test UIObserver.on nodeRenderState multi callback fire RENDER_OUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nodeRenderStateMultiCallbackRenderOutV3005', Level.LEVEL0, async () => {
      console.info('[nodeRenderStateMultiCallbackRenderOutV3005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let addBtn = await scrollBar.scrollSearch(ON.id('btnAddMultiCallback'));
      await addBtn.click();
      await CommonFunc.sleep(2000);
      let blueTab = await driver.findComponent(ON.text('blue'));
      await blueTab.click();
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('observerNoticeText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nodeRenderStateMultiCallbackRenderOutV3005] notice: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('CB1_RENDER_OUT');
      expect(obj.$attrs.content).assertContain('CB2_RENDER_OUT');
      expect(obj.$attrs.content).assertContain('CB3_RENDER_OUT');
      console.info('[nodeRenderStateMultiCallbackRenderOutV3005] END');
    });

    /**
     * @tc.name   nodeRenderStateOffAllV3006
     * @tc.number SUB_ARKUI_UIOBSERVER_NODERENDERSTATE_OFF_ALL_0006
     * @tc.desc   Test UIObserver.off nodeRenderState remove all callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nodeRenderStateOffAllV3006', Level.LEVEL0, async () => {
      console.info('[nodeRenderStateOffAllV3006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let addBtn = await scrollBar.scrollSearch(ON.id('btnAddMultiCallback'));
      await addBtn.click();
      await CommonFunc.sleep(2000);
      let offBtn = await scrollBar.scrollSearch(ON.id('btnOffAllNodeRenderState'));
      await offBtn.click();
      await CommonFunc.sleep(1000);
      let blueTab = await driver.findComponent(ON.text('blue'));
      await blueTab.click();
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('observerNoticeText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nodeRenderStateOffAllV3006] notice: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content.indexOf('RENDER_OUT')).assertEqual(4);
      console.info('[nodeRenderStateOffAllV3006] END');
    });
  })
}
