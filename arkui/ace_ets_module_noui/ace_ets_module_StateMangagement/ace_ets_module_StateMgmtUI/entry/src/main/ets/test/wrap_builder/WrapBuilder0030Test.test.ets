/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function WrapBuilder0030Test() {
  describe('WrapBuilder0030Test', () => {
    beforeEach(async (done: Function) => {
      console.info("WrapBuilder0030Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/wrap_builder/WrapBuilder0030",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WrapBuilder0030Test state pages:" + JSON.stringify(pages));
        if (!("WrapBuilder0030" == pages.name)) {
          console.info("get WrapBuilder0030Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push WrapBuilder0030Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WrapBuilder0030Test page error:" + err);
      }
      console.info("WrapBuilder0030Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WrapBuilder0030Test after each called");
    });

    /**
     * @tc.name   WrapBuilder0030Test_001
     * @tc.number SUB_ARKUI_STATUSMANAGER_WRAPI_0100
     * @tc.desc   Verify WrappedBuilder with namespace import displays correct text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WrapBuilder0030Test_001', Level.LEVEL0, async (done: Function) => {
      console.info('[WrapBuilder0030Test_001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('wrapBuilder0030_text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[WrapBuilder0030Test_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('WrappedBuilder');
      console.info('[WrapBuilder0030Test_001] END');
      done();
    });

    /**
     * @tc.name   WrapBuilder0030Test_002
     * @tc.number SUB_ARKUI_STATUSMANAGER_WRAPI_0200
     * @tc.desc   Verify MutableBuilder with namespace import displays correct text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WrapBuilder0030Test_002', Level.LEVEL0, async (done: Function) => {
      console.info('[WrapBuilder0030Test_002] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('wrapBuilder0030_text2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[WrapBuilder0030Test_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('MutableBuilder');
      console.info('[WrapBuilder0030Test_002] END');
      done();
    });
  })
}
