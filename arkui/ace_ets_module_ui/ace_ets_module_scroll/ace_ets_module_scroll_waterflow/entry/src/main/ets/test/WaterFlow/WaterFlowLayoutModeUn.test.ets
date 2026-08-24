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

export default function WaterFlowLayoutModeUn() {
  describe('WaterFlowLayoutModeUn', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowLayoutModeUn beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/WaterFlowLayoutModeUn",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowLayoutModeUn state pages:" + JSON.stringify(pages));
        if (!("WaterFlowLayoutModeUn" == pages.name)) {
          console.info("get WaterFlowLayoutModeUn pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push WaterFlowLayoutModeUn page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowLayoutModeUn page error:" + err);
      }
      console.info("WaterFlowLayoutModeUn beforeEach end");
      done();
    });

    /**
     * @tc.name   waterFlowLayoutModeUn_0100
     * @tc.number SUB_ARKUI_WATERFLOW_LAYOUTMODE_UNDEFINED_0100
     * @tc.desc   Test WaterFlow with undefined layoutMode, verify component exists and type is WaterFlow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowLayoutModeUn_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[waterFlowLayoutModeUn_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson: string = getInspectorByKey('waterFlow_layoutMode_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('[waterFlowLayoutModeUn_0100] $type: ' + obj.$type);
        expect(obj.$type).assertEqual('WaterFlow');
        console.info('[waterFlowLayoutModeUn_0100] END');
        done();
      } catch (error) {
        console.error('[waterFlowLayoutModeUn_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   waterFlowLayoutModeUn_0200
     * @tc.number SUB_ARKUI_WATERFLOW_LAYOUTMODE_UNDEFINED_0200
     * @tc.desc   Test WaterFlow with undefined layoutMode, verify FlowItems render with correct text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowLayoutModeUn_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[waterFlowLayoutModeUn_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1000);
        let firstItem: Component = await driver.findComponent(ON.text('N0'));
        expect(firstItem !== null).assertTrue();
        console.info('[waterFlowLayoutModeUn_0200] END');
        done();
      } catch (error) {
        console.error('[waterFlowLayoutModeUn_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   waterFlowLayoutModeUn_0300
     * @tc.number SUB_ARKUI_WATERFLOW_LAYOUTMODE_NULL_0100
     * @tc.desc   Test WaterFlow with null layoutMode, verify component exists and type is WaterFlow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowLayoutModeUn_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[waterFlowLayoutModeUn_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson: string = getInspectorByKey('waterFlow_layoutMode_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('[waterFlowLayoutModeUn_0300] $type: ' + obj.$type);
        expect(obj.$type).assertEqual('WaterFlow');
        console.info('[waterFlowLayoutModeUn_0300] END');
        done();
      } catch (error) {
        console.error('[waterFlowLayoutModeUn_0300] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
