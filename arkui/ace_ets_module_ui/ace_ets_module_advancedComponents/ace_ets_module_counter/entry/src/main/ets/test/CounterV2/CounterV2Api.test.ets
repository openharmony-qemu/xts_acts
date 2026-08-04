/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../Utils';

import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function CounterV2Api() {
  describe('CounterV2Api', () => {
    beforeEach(async (done: Function) => {
      console.info("CounterV2Api beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CounterV2Api state pages:" + JSON.stringify(pages));
        if (!("CounterV2Api" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/CounterV2/CounterV2Api"
          })
          await Utils.sleep(2000);
          console.info("push CounterV2Api page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CounterV2Api page error:" + err);
      }
      console.info("CounterV2Api foreEach end");
      done();
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("CounterV2Api after each called");
    });


    /**
     * @tc.name   SUB_ARKUI_API_CounterV2Api_0100
     * @tc.number SUB_ARKUI_API_CounterV2Api_0100
     * @tc.desc   SUB_ARKUI_API_CounterV2Api_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_API_CounterV2Api_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_API_CounterV2Api_0100] START');
      await Utils.sleep(1000);
      // press tab
      let driver = await Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('CounterV2ApiText2');
      await Utils.sleep(1000);
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[SUB_ARKUI_API_CounterV2Api_0100] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(1000);
      expect(obj.$attrs.content).assertEqual('onFocusDecrease');
      console.info('[SUB_ARKUI_API_CounterV2Api_0100] END');
      done();

    });


    /**
     * @tc.name   SUB_ARKUI_API_CounterV2Api_0200
     * @tc.number SUB_ARKUI_API_CounterV2Api_0200
     * @tc.desc   SUB_ARKUI_API_CounterV2Api_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_API_CounterV2Api_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_API_CounterV2Api_0200] START');
      await Utils.sleep(1000);
      // press tab
      let driver = await Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('CounterV2ApiText1');
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('CounterV2ApiText2');
      await Utils.sleep(1000);
      console.info("[SUB_ARKUI_API_CounterV2Api_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SUB_ARKUI_API_CounterV2Api_0200] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      await Utils.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onFocusIncrease');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onBlurDecrease');
      console.info('[SUB_ARKUI_API_CounterV2Api_0200] END');
      done();
    });


    /**
     * @tc.name   SUB_ARKUI_API_CounterV2Api_0300
     * @tc.number SUB_ARKUI_API_CounterV2Api_0300
     * @tc.desc   SUB_ARKUI_API_CounterV2Api_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_API_CounterV2Api_0300', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_API_CounterV2Api_0300] START');
      await Utils.sleep(1000);
      // press tab
      let driver = await Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('CounterV2ApiText1');
      await Utils.sleep(1000);
      console.info("[SUB_ARKUI_API_CounterV2Api_0300] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      await Utils.sleep(1000);
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onBlurIncrease');
      console.info('[SUB_ARKUI_API_CounterV2Api_0300] END');
      done();
    });
  })
}
