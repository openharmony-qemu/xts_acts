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

export default function customListLayoutTest() {
  describe('customListLayoutTest', () => {
    beforeEach(async (done: Function) => {
      console.info("customListLayoutTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyDynamicLayout/customListLayoutTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get customListLayoutTest state pages:" + JSON.stringify(pages));
        if (!("customListLayoutTest" == pages.name)) {
          console.info("get customListLayoutTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push customListLayoutTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customListLayoutTest page error:" + err);
      }
      console.info("customListLayoutTest beforeEach end");
      done();
    });

    /**
     * @tc.name   customListLayoutTest_0100
     * @tc.number SUB_ARKUI_LAZYDYNAMICLAYOUT_SPACE_PARAM_0100
     * @tc.desc   Test LazyDynamicLayout space property with normal value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('customListLayoutTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[customListLayoutTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let item1 = await driver.findComponent(ON.id('lazyDynamicLayout_item1'));
      let rect = await item1.getBounds();
      let itemTop = rect.top;
      console.info('[customListLayoutTest_0100] item1_top: '+ itemTop)

      let spaceBtn = await driver.findComponent(ON.id('lazyDynamicLayout_space_btn'));
      await spaceBtn.click();
      console.info('customListLayoutTest_0100 pushBtn clicked');
      await CommonFunc.sleep(1500);

      let itemNew1 = await driver.findComponent(ON.id('lazyDynamicLayout_item1'));
      let rectNew = await itemNew1.getBounds();
      let itemNewTop = rectNew.top;
      console.info('[customListLayoutTest_0100] item1_top new: '+ itemNewTop)
      expect(itemTop < itemNewTop).assertTrue();
      console.info('[customListLayoutTest_0100] END');
      done();
    });
  });
}