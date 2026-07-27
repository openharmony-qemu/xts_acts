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
import events_emitter from '@ohos.events.emitter';

export default function swiperIgnoreHiddenItem() {
  describe('swiperIgnoreHiddenItem', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperIgnoreHiddenItem beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/swiper/swiperIgnoreHiddenItem",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperIgnoreHiddenItem state pages:" + JSON.stringify(pages));
        if (!("swiperIgnoreHiddenItem" == pages.name)) {
          console.info("get swiperIgnoreHiddenItem pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperIgnoreHiddenItem page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperIgnoreHiddenItem page error:" + err);
      }
      console.info("swiperIgnoreHiddenItem beforeEach end");
      done();
    });

    /**
     * @tc.name   swiperIgnoreHiddenItem_0100
     * @tc.number SUB_ARKUI_SWIPER_SYS_IGNOREHIDDENITEM_0100
     * @tc.desc   Test ignoreHiddenItem(true) with one child Visibility.None, verify hidden item not displayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperIgnoreHiddenItem_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperIgnoreHiddenItem_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('swiper_ignoreHiddenItem_true');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperIgnoreHiddenItem_0100 ignoreHiddenItem: ', obj?.$attrs?.ignoreHiddenItem);
      expect(obj.$attrs?.ignoreHiddenItem).assertEqual("true");
      console.info('[swiperIgnoreHiddenItem_0100] END');
      done();
    });

    /**
     * @tc.name   swiperIgnoreHiddenItem_0200
     * @tc.number SUB_ARKUI_SWIPER_SYS_IGNOREHIDDENITEM_0200
     * @tc.desc   Test ignoreHiddenItem(false), hidden child still occupies space in viewport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperIgnoreHiddenItem_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperIgnoreHiddenItem_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('swiper_ignoreHiddenItem_false');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperIgnoreHiddenItem_0200 ignoreHiddenItem: ', obj?.$attrs?.ignoreHiddenItem);
      expect(obj.$attrs?.ignoreHiddenItem).assertEqual("false");
      console.info('[swiperIgnoreHiddenItem_0200] END');
      done();
    });

    /**
     * @tc.name   swiperIgnoreHiddenItem_0300
     * @tc.number SUB_ARKUI_SWIPER_SYS_IGNOREHIDDENITEM_0300
     * @tc.desc   Test ignoreHiddenItem(undefined), hidden child still occupies space in viewport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperIgnoreHiddenItem_0300', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperIgnoreHiddenItem_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('swiper_ignoreHiddenItem_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperIgnoreHiddenItem_0300 ignoreHiddenItem: ', obj?.$attrs?.ignoreHiddenItem);
      expect(obj.$attrs?.ignoreHiddenItem).assertEqual("false");
      console.info('[swiperIgnoreHiddenItem_0300] END');
      done();
    });

    /**
     * @tc.name   swiperIgnoreHiddenItem_0400
     * @tc.number SUB_ARKUI_SWIPER_SYS_IGNOREHIDDENITEM_0400
     * @tc.desc   Test ignoreHiddenItem(null), hidden child still occupies space in viewport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperIgnoreHiddenItem_0400', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperIgnoreHiddenItem_0400] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('swiper_ignoreHiddenItem_null');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperIgnoreHiddenItem_0400 ignoreHiddenItem: ', obj?.$attrs?.ignoreHiddenItem);
      expect(obj.$attrs?.ignoreHiddenItem).assertEqual("false");
      console.info('[swiperIgnoreHiddenItem_0400] END');
      done();
    });
  })
}
