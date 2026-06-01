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
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function ChipV2localizedLabelMargin() {
  describe('ChipV2localizedLabelMargin', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipV2localizedLabelMargin beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/chipV2/ChipV2LocalizedLabelMargin",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipV2localizedLabelMargin state pages: " + JSON.stringify(pages));
        if (!("ChipV2LocalizedLabelMargin" == pages.name)) {
          console.info("get ChipV2LocalizedLabelMargin state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipV2LocalizedLabelMargin success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2localizedLabelMargin page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipV2localizedLabelMargin_0100
     * @tc.number SUB_ARKUI_API_ChipV2localizedLabelMargin_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2localizedLabelMargin_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipV2localizedLabelMargin_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('LocalizedLabelMargin_start'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let mBtn = getInspectorByKey('LocalizedLabelMargin_start');
      console.info("[SUB_ARKUI_API_ChipV2localizedLabelMargin_0100] attrs is: " + JSON.stringify(JSON.parse(mBtn).$attrs));
      expect(JSON.parse(mBtn).$attrs.label).assertEqual('start:{"unit":1,"value":20}');
      console.info('[SUB_ARKUI_API_ChipV2localizedLabelMargin_0100] END');
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_API_ChipV2localizedLabelMargin_0200
     * @tc.number SUB_ARKUI_API_ChipV2localizedLabelMargin_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2localizedLabelMargin_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipV2localizedLabelMargin_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('LocalizedLabelMargin_end'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let mBtn2 = getInspectorByKey('LocalizedLabelMargin_end');
      console.info("[SUB_ARKUI_API_ChipV2localizedLabelMargin_0200] attrs is: " + JSON.stringify(JSON.parse(mBtn2).$attrs));
      expect(JSON.parse(mBtn2).$attrs.label).assertEqual('end:{"unit":1,"value":30}');
      console.info('[SUB_ARKUI_API_ChipV2localizedLabelMargin_0200] END');
      done();
    });
  })
}