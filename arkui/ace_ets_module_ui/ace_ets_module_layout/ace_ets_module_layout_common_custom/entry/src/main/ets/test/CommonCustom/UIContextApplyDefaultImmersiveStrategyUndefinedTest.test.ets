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

export default function UIContextApplyDefaultImmersiveStrategyUndefinedTest() {
  describe('UIContextApplyDefaultImmersiveStrategyUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextApplyDefaultImmersiveStrategyUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonCustom/UIContextApplyDefaultImmersiveStrategyUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextApplyDefaultImmersiveStrategyUndefined state pages: " + JSON.stringify(pages));
        if (!("UIContextApplyDefaultImmersiveStrategyUndefined" == pages.name)) {
          console.info("get UIContextApplyDefaultImmersiveStrategyUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push UIContextApplyDefaultImmersiveStrategyUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextApplyDefaultImmersiveStrategyUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   UIContextApplyDefaultImmersiveStrategyUndefined_0100
     * @tc.number SUB_ARKUI_API_UIContextApplyDefaultImmersiveStrategyUndefined_0100
     * @tc.desc   verify applyDefaultImmersiveStrategy with undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIContextApplyDefaultImmersiveStrategyUndefined_0100', Level.LEVEL0, async (done: Function) => {
      console.info('UIContextApplyDefaultImmersiveStrategyUndefined_0100 START');
      try {
        let strJson = getInspectorByKey('undefined_param_content');
        console.info('[UIContextApplyDefaultImmersiveStrategyUndefined_0100] strJson:' + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        let rect: RectValue = CommonFunc.getComponentRect('undefined_param_content');
        console.info('[UIContextApplyDefaultImmersiveStrategyUndefined_0100] rect:' + JSON.stringify(rect));

        expect(strJson).assertContain('undefined_param_content');
        expect(obj.$type).assertEqual('Column');
        expect(rect.right > rect.left).assertTrue();
        expect(rect.bottom > rect.top).assertTrue();
      } catch (err) {
        console.error('[UIContextApplyDefaultImmersiveStrategyUndefined_0100] error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[UIContextApplyDefaultImmersiveStrategyUndefined_0100 ] END');
      done();
    });
  })
}
