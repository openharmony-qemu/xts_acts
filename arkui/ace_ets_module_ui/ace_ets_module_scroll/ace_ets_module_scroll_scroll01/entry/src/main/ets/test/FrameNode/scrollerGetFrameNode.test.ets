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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function scrollerGetFrameNode() {
  describe('scrollerGetFrameNode', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollerGetFrameNode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/scrollerGetFrameNode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollerGetFrameNode state pages:" + JSON.stringify(pages));
        if (!("scrollerGetFrameNode" == pages.name)) {
          console.info("get scrollerGetFrameNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollerGetFrameNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollerGetFrameNode page error:" + err);
      }
      console.info("scrollerGetFrameNode beforeEach end");
      done();
    });

    /**
     * @tc.name   scrollerGetFrameNode_0100
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_RETURN_0100
     * @tc.desc   Test unbound Scroller getFrameNode method, should return undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollerGetFrameNode_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollerGetFrameNode_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('text_unbound_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollerGetFrameNode_0100] content: " + JSON.stringify(obj.$attrs.content));

      expect(JSON.parse(strJson).$attrs.content).assertEqual('Unbound Scroller: getFrameNode returns undefined');
      console.info('[scrollerGetFrameNode_0100] END');
      done();
    });

    /**
     * @tc.name   scrollerGetFrameNode_0200
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_RETURN_0200
     * @tc.desc   Test Scroller bound to Scroll component getFrameNode method, should return FrameNode with correct type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollerGetFrameNode_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollerGetFrameNode_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('text_scroll_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollerGetFrameNode_0200] content: " + JSON.stringify(obj.$attrs.content));

      expect(JSON.parse(strJson).$attrs.content).assertEqual('Scroll Scroller: getFrameNode returns, type: Scroll');
      console.info('[scrollerGetFrameNode_0200] END');
      done();
    });

    /**
     * @tc.name   scrollerGetFrameNode_0300
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_RETURN_0300
     * @tc.desc   Test Scroller bound to List component getFrameNode method, should return FrameNode with correct type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollerGetFrameNode_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollerGetFrameNode_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('text_list_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollerGetFrameNode_0300] content: " + JSON.stringify(obj.$attrs.content));

      expect(JSON.parse(strJson).$attrs.content).assertEqual('List Scroller: getFrameNode returns, type: List');
      console.info('[scrollerGetFrameNode_0300] END');
      done();
    });

    /**
     * @tc.name   scrollerGetFrameNode_0400
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_RETURN_0400
     * @tc.desc   Test Scroller bound to Grid component getFrameNode method, should return FrameNode with correct type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollerGetFrameNode_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollerGetFrameNode_0400] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('text_grid_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollerGetFrameNode_0400] content: " + JSON.stringify(obj.$attrs.content));

      expect(JSON.parse(strJson).$attrs.content).assertEqual('Grid Scroller: getFrameNode returns, type: Grid');
      console.info('[scrollerGetFrameNode_0400] END');
      done();
    });

    /**
     * @tc.name   scrollerGetFrameNode_0500
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_RETURN_0500
     * @tc.desc   Test dynamic Scroller before binding getFrameNode method, should return undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollerGetFrameNode_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollerGetFrameNode_0500] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('text_dynamic_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollerGetFrameNode_0500] content: " + JSON.stringify(obj.$attrs.content));

      expect(JSON.parse(strJson).$attrs.content).assertEqual('Dynamic Scroller: Not tested');
      console.info('[scrollerGetFrameNode_0500] END');
      done();
    });

    /**
     * @tc.name   scrollerGetFrameNode_0600
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_RETURN_0600
     * @tc.desc   Test dynamic Scroller bind to Scroll component, getFrameNode should return FrameNode with correct type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('scrollerGetFrameNode_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[scrollerGetFrameNode_0600] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_bind_scroll'));
      await button.click();
      await CommonFunc.sleep(500);

      let strBindJson: string = getInspectorByKey('text_bind_result');
      console.info("[scrollerGetFrameNode_0600] bind result: " + JSON.parse(strBindJson).$attrs.content);
      expect(JSON.parse(strBindJson).$attrs.content).assertEqual('Bind Status: Bind success to Scroll');

      let strDynamicJson: string = getInspectorByKey('text_dynamic_result');
      console.info("[scrollerGetFrameNode_0600] dynamic result: " + JSON.parse(strDynamicJson).$attrs.content);
      expect(JSON.parse(strDynamicJson).$attrs.content).assertEqual('Dynamic Scroller: getFrameNode returns, type: Scroll');

      console.info('[scrollerGetFrameNode_0600] END');
      done();
    });

    /**
     * @tc.name   scrollerGetFrameNode_0700
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_RETURN_0700
     * @tc.desc   Test dynamic Scroller bind to List component, getFrameNode should return FrameNode with correct type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('scrollerGetFrameNode_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[scrollerGetFrameNode_0700] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_bind_list'));
      await button.click();
      await CommonFunc.sleep(500);

      let strBindJson: string = getInspectorByKey('text_bind_result');
      console.info("[scrollerGetFrameNode_0700] bind result: " + JSON.parse(strBindJson).$attrs.content);
      expect(JSON.parse(strBindJson).$attrs.content).assertEqual('Bind Status: Bind success to List');

      let strDynamicJson: string = getInspectorByKey('text_dynamic_result');
      console.info("[scrollerGetFrameNode_0700] dynamic result: " + JSON.parse(strDynamicJson).$attrs.content);
      expect(JSON.parse(strDynamicJson).$attrs.content).assertEqual('Dynamic Scroller: getFrameNode returns, type: List');

      console.info('[scrollerGetFrameNode_0700] END');
      done();
    });

    /**
     * @tc.name   scrollerGetFrameNode_0800
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_RETURN_0800
     * @tc.desc   Test dynamic Scroller bind to Grid component, getFrameNode should return FrameNode with correct type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('scrollerGetFrameNode_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[scrollerGetFrameNode_0800] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_bind_grid'));
      await button.click();
      await CommonFunc.sleep(500);

      let strBindJson: string = getInspectorByKey('text_bind_result');
      console.info("[scrollerGetFrameNode_0800] bind result: " + JSON.parse(strBindJson).$attrs.content);
      expect(JSON.parse(strBindJson).$attrs.content).assertEqual('Bind Status: Bind success to Grid');

      let strDynamicJson: string = getInspectorByKey('text_dynamic_result');
      console.info("[scrollerGetFrameNode_0800] dynamic result: " + JSON.parse(strDynamicJson).$attrs.content);
      expect(JSON.parse(strDynamicJson).$attrs.content).assertEqual('Dynamic Scroller: getFrameNode returns, type: Grid');

      console.info('[scrollerGetFrameNode_0800] END');
      done();
    });
  })
}