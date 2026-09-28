/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function offsetEdgeTop() {
  describe('offsetEdgeTop', () => {
    beforeEach(async (done: Function) => {
      console.info("offsetEdgeTop beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/contentOffset/offsetEdgeTop",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get offsetEdgeTop state pages:" + JSON.stringify(pages));
        if (!("offsetEdgeTop" == pages.name)) {
          console.info("get offsetEdgeTop pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push offsetEdgeTop page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push offsetEdgeTop page error:" + err);
      }
      console.info("offsetEdgeTop beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("offsetEdgeTop after each called");
    });

    /**
     * @tc.name   offsetEdgeTop_0100
     * @tc.number offsetEdgeTop_001
     * @tc.desc   Controller scrollEdge scrolls to the top of the list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('offsetEdgeTop_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[offsetEdgeTop_0100] START');
      let driver = await Driver.create()
      let swiperListComponent = await driver.findComponent(ON.id('edge_endOffset_top'));
      let swiperList = await swiperListComponent.getBounds();
      let displayId = await swiperListComponent.getDisplayId();
      let top = swiperList.top;
      let right = swiperList.right;
      let left = swiperList.left;
      let bottom = swiperList.bottom;
      console.info("offsetEdgeTop value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipeBetween(
        { x: Math.round(left + width/2), y: Math.round(top + height*0.8), displayId: displayId },
        { x: Math.round(left + width/2), y: Math.round(top + height*0.2), displayId: displayId });
      await CommonFunc.sleep(3000);

      let btn: Component = await driver.findComponent(ON.id('offset_scrollEdge_top'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let listComponent = await driver.findComponent(ON.id('edge_endOffset_top'));
      let list = await listComponent.getBounds();
      let listItemComponent = await driver.findComponent(ON.id('edge_endOffset_top_0'));
      let listItem = await listItemComponent.getBounds();
      console.info('[offsetEdgeTop_0100] list.top: ' + list.top);
      console.info('[offsetEdgeTop_0100] listItem.top: ' + listItem.top);
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(listItem.top - list.top) - Math.round(vp2px(10))) <= 1 ).assertTrue();
      console.info('[offsetEdgeTop_0100] END');
      done();
    });
  })
}
