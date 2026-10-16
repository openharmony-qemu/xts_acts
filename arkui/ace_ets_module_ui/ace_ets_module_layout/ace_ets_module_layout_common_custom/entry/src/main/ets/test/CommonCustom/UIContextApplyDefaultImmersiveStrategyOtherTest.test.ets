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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium-dynamic"
import router from '@ohos.router';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function UIContextApplyDefaultImmersiveStrategyOtherTest() {
  describe('UIContextApplyDefaultImmersiveStrategyOtherTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextApplyDefaultImmersiveStrategyOtherTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonCustom/UIContextApplyDefaultImmersiveStrategyOther",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextApplyDefaultImmersiveStrategyOther state pages: " + JSON.stringify(pages));
        if (!("UIContextApplyDefaultImmersiveStrategyOther" == pages.name)) {
          console.info("get UIContextApplyDefaultImmersiveStrategyOther state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push UIContextApplyDefaultImmersiveStrategyOther success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextApplyDefaultImmersiveStrategyOther page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   UIContextApplyDefaultImmersiveStrategyOther_0100
     * @tc.number SUB_ARKUI_API_UIContextApplyDefaultImmersiveStrategyOther_0100
     * @tc.desc   verify applyDefaultImmersiveStrategy with ImmersiveStrategy.AVOID_FLOAT_NAV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIContextApplyDefaultImmersiveStrategyOther_0100', Level.LEVEL0, async (done: Function) => {
      console.info('UIContextApplyDefaultImmersiveStrategyOther_0100 START');
      try {
        let strJson = getInspectorByKey('other_main_content');
        console.info('[UIContextApplyDefaultImmersiveStrategyOther_0100] strJson:' + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        let rect: RectValue = CommonFunc.getComponentRect('other_main_content');
        console.info('[UIContextApplyDefaultImmersiveStrategyOther_0100] rect:' + JSON.stringify(rect));

        expect(strJson).assertContain('other_main_content');
        expect(obj.$type).assertEqual('Column');
        expect(rect.right > rect.left).assertTrue();
        expect(rect.bottom > rect.top).assertTrue();
      } catch (err) {
        console.error('[UIContextApplyDefaultImmersiveStrategyOther_0100] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[UIContextApplyDefaultImmersiveStrategyOther_0100 ] END');
      done();
    });
  })
}
