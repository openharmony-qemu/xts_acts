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

export default function gridScrollSnapStrategyProvider() {
  describe('gridScrollSnapStrategyProvider', () => {
    beforeEach(async (done: Function) => {
      console.info("GridScrollSnapStrategyProvider beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridOptions/GridScrollSnapStrategyProvider",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("GridScrollSnapStrategyProviderExample" == pages.name)) {
          console.info("get GridScrollSnapStrategyProvider pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridScrollSnapStrategyProvider page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridScrollSnapStrategyProvider page error:" + err);
      }
      console.info("GridScrollSnapStrategyProvider beforeEach end");
      done();
    });

    /**
     * @tc.name   gridScrollSnapStrategy_0800
     * @tc.number SUB_ARKUI_GRID_SCROLLSNAPSTRATEGY_PARAM_0800
     * @tc.desc   Test Grid scrollSnapStrategy property with ScrollSnapOffsetProvider object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollSnapStrategy_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[gridScrollSnapStrategy_0800] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_snapStrategy_provider');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridScrollSnapStrategy_0800] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy !== 'ScrollSnapAlign.NONE').assertTrue();
      console.info('[gridScrollSnapStrategy_0800] END');
      done();
    });
  })
}
