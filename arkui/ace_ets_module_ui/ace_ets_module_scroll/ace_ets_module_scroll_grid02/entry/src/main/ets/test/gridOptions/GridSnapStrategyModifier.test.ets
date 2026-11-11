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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function gridSnapStrategyModifier() {
  describe('gridSnapStrategyModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("GridSnapStrategyModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridOptions/GridSnapStrategyModifier",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("GridSnapStrategyModifier" == pages.name)) {
          console.info("get GridSnapStrategyModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridSnapStrategyModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridSnapStrategyModifier page error:" + err);
      }
      console.info("GridSnapStrategyModifier beforeEach end");
      done();
    });

    /**
     * @tc.name   gridSnapStrategyModifier_0100
     * @tc.number SUB_ARKUI_GRID_SCROLLSNAPSTRATEGY_MODIFIER_0100
     * @tc.desc   Test Grid scrollSnapStrategy set to ScrollSnapAlign.CENTER by attributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridSnapStrategyModifier_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridSnapStrategyModifier_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_snapStrategy_modifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridSnapStrategyModifier_0100] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy).assertEqual('ScrollSnapAlign.CENTER');
      console.info('[gridSnapStrategyModifier_0100] END');
      done();
    });
  })
}
