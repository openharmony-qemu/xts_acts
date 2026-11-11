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

export default function waterFlowScrollSnapStrategyProvider() {
  describe('waterFlowScrollSnapStrategyProvider', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowScrollSnapStrategyProvider beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/WaterFlowScrollSnapStrategyProvider",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowScrollSnapStrategyProvider state pages:" + JSON.stringify(pages));
        if (!("WaterFlowScrollSnapStrategyProvider" == pages.name)) {
          console.info("get waterFlowScrollSnapStrategyProvider pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowScrollSnapStrategyProvider page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowScrollSnapStrategyProvider page error:" + err);
      }
      console.info("waterFlowScrollSnapStrategyProvider beforeEach end");
      done();
    });

    /**
     * @tc.name   waterFlowScrollSnapStrategy_0800
     * @tc.number SUB_ARKUI_WATERFLOW_SCROLLSNAPSTRATEGY_PARAM_0800
     * @tc.desc   Test WaterFlow scrollSnapStrategy property with ScrollSnapOffsetProvider object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowScrollSnapStrategy_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[waterFlowScrollSnapStrategy_0800] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('wf_snapStrategy_provider');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[waterFlowScrollSnapStrategy_0800] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy !== 'ScrollSnapAlign.NONE').assertTrue();
      console.info('[waterFlowScrollSnapStrategy_0800] END');
      done();
    });
  })
}
