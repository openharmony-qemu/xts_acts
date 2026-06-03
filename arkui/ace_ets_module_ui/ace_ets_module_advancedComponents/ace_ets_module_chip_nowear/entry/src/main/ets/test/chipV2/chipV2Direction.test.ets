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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';


export default function chipV2DirectionTest() {
  describe('chipV2DirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("chipV2DirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chipV2/ChipV2Direction',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get chipV2DirectionTest state pages: " + JSON.stringify(pages));
        if (!('ChipDirection' == pages.name)) {
          console.info("get chipV2DirectionTest pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push chipV2DirectionTest page result successful");
        }
      }
      catch (err) {
        console.error("push chipV2DirectionTest page error: " + err);
        expect().assertFail();
      }
      await CommonFunc.sleep(1000);
      console.info('chipV2DirectionTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('chipV2DirectionTest after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_ChipV2_Direction_0100
     * @tc.number SUB_ARKUI_ChipV2_Direction_0100
     * @tc.desc   Test chip page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_ChipV2_Direction_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log("[SUB_ARKUI_ChipV2_Direction_0100] START");
      const driver = await Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await buttonAuto.click();
      await driver.delayMs(1000);
      console.log("[SUB_ARKUI_ChipV2_Direction_0100] click Auto");
      const lable = await driver.findComponent(ON.text("操作块").type('Text'));
      const rect1 = await lable.getBounds();
      console.log("[SUB_ARKUI_ChipV2_Direction_0100]", " lable rect1:" + JSON.stringify(rect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await buttonRtl.click();
      console.log("[SUB_ARKUI_ChipV2_Direction_0100]", "click Rtl");
      await driver.delayMs(1000);
      let lable2 = await driver.findComponent(ON.text("操作块").type('Text'));
      const rect2 = await lable2.getBounds();
      console.log("[SUB_ARKUI_ChipV2_Direction_0100]", " lable2 rect:" + JSON.stringify(rect2));
      expect(rect1.left == rect2.left).assertFalse();
      console.log("[SUB_ARKUI_ChipV2_Direction_0100] END");
      done();
    });
  })
}