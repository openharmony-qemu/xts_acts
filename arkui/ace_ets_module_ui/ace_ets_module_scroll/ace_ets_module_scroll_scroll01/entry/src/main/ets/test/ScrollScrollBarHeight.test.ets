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
import CommonFunc from '../MainAbility/common/Common';

export default function ScrollScrollBarHeight() {
  describe('ScrollScrollBarHeight', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollScrollBarHeight beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollScrollBarHeight",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("ScrollScrollBarHeight" == pages.name)) {
          console.info("get ScrollScrollBarHeight pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollScrollBarHeight page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollScrollBarHeight page error:" + err);
      }
      console.info("ScrollScrollBarHeight beforeEach end");
      done();
    });

    /**
     * @tc.number ScrollScrollBarHeight_0100
     * @tc.name   SUB_ARKUI_SCROLL_SCROLLBARHEIGHT_TEST_0100
     * @tc.desc   Set the ScrollBarHeight value return 50.00vp.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level.LEVEL0
     */
    it('ScrollScrollBarHeight_0100', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scroll_scrollBarHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ScrollScrollBarHeight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollScrollBarHeight_0100] scrollBarHeight: " + JSON.stringify(obj.$attrs.scrollBarHeight));
      expect(obj.$attrs.scrollBarHeight).assertEqual('50.00vp');
      console.info('[ScrollScrollBarHeight_0100] END');
      done();
    });
  })
}