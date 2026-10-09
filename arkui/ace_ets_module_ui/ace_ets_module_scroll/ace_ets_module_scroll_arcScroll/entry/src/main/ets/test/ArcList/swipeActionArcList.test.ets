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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function swipeActionArcList() {
  describe('swipeActionArcList', () => {
    beforeEach(async (done: Function) => {
      console.info("swipeActionArcList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcList/swipeActionArcList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swipeActionArcList state pages:" + JSON.stringify(pages));
        if (!("swipeActionArcList" == pages.name)) {
          console.info("get swipeActionArcList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swipeActionArcList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swipeActionArcList page error:" + err);
      }
      console.info("swipeActionArcList beforeEach end");
      done();
    });

    /**
     * @tc.name   swipeActionArcList_0100
     * @tc.number swipeActionArcList_001
     * @tc.desc   The swipeAction attribute 'end' of the ArcList component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('swipeActionArcList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[swipeActionArcList_0100] START');
      let driver = await Driver.create()
      let swipeListComponent = await driver.findComponent(ON.id('arcListItem_0'));
      let swipeList = await swipeListComponent.getBounds();
      let displayId = await swipeListComponent.getDisplayId();
      let top = swipeList.top;
      let right = swipeList.right;
      let left = swipeList.left;
      let bottom = swipeList.bottom;
      console.info("swipeActionArcList_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipeBetween(
        { x: Math.round(left + width*0.8), y: Math.round(top + height/2), displayId: displayId },
        { x: Math.round(left + width*0.2), y: Math.round(top + height/2), displayId: displayId });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('arcList_listItemOffset');
      console.info("[swipeActionArcList_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[swipeActionArcList_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('swipe end');

      let strJson2 = getInspectorByKey('arcList_listItemState');
      console.info("[swipeActionArcList_0100] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[swipeActionArcList_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('end EXPANDED');

      await driver.swipeBetween(
        { x: Math.round(left + width*0.4), y: Math.round(top + height/2), displayId: displayId },
        { x: Math.round(left + width*0.9), y: Math.round(top + height/2), displayId: displayId });
      await CommonFunc.sleep(2000);
      console.info('[swipeActionArcList_0100] END');
      done();
    });

    /**
     * @tc.name   swipeActionArcList_0200
     * @tc.number swipeActionArcList_002
     * @tc.desc   The swipeAction attribute 'start' of the ArcList component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('swipeActionArcList_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[swipeActionArcList_0200] START');
      let driver = await Driver.create()
      let swipeListComponent = await driver.findComponent(ON.id('arcListItem_0'));
      let swipeList = await swipeListComponent.getBounds();
      let displayId = await swipeListComponent.getDisplayId();
      let top = swipeList.top;
      let right = swipeList.right;
      let left = swipeList.left;
      let bottom = swipeList.bottom;
      console.info("swipeActionArcList_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipeBetween(
        { x: Math.round(left + width*0.4), y: Math.round(top + height/2), displayId: displayId },
        { x: Math.round(left + width*0.9), y: Math.round(top + height/2), displayId: displayId });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('arcList_listItemOffset');
      console.info("[swipeActionArcList_0200] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[swipeActionArcList_0200] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('swipe start');

      let strJson2 = getInspectorByKey('arcList_listItemState');
      console.info("[swipeActionArcList_0200] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[swipeActionArcList_0200] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('start EXPANDED');

      await driver.swipeBetween(
        { x: Math.round(left + width*0.7), y: Math.round(top + height/2), displayId: displayId },
        { x: Math.round(left + width*0.2), y: Math.round(top + height/2), displayId: displayId });
      await CommonFunc.sleep(2000);
      console.info('[swipeActionArcList_0200] END');
      done();
    });
  })
}
