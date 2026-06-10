/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function WithEnvDirectionTest() {
  describe('WithEnvDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WithEnvDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/WithEnvDirection',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WithEnvDirection state pages:" + JSON.stringify(pages));
        if (!("WithEnvDirection" == pages.name)) {
          console.info("get WithEnvDirection pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push WithEnvDirection page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WithEnvDirection page error:" + err);
      }
      console.info("WithEnvDirection beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   WithEnvDirectionTest_0100
     * @tc.number SUB_ARKUI_API_WithEnvDirectionTest_0100
     * @tc.desc   ArkUI API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WithEnvDirectionTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[WithEnvDirectionTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let button1 = await driver.findComponent(ON.id('WithEnvDirectionButton'));
      await button1.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('WithEnvDirectionText1');
      expect(JSON.parse(strJson1).$attrs.type).assertEqual('Text');

      console.info('[WithEnvDirectionTest_0100] END');
      done();
    });
  })
}