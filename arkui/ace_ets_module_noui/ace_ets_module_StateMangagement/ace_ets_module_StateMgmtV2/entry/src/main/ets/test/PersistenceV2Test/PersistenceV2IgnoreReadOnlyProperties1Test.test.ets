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
import { PersistenceV2 } from '@kit.ArkUI';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function persistenceV2IgnoreReadOnlyProperties1Test() {
  describe('PersistenceV2IgnoreReadOnlyProperties1Test', () => {

    beforeEach(async (done: Function) => {
      console.info("PersistenceV2IgnoreReadOnlyProperties1Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistenceV2/PersistenceV2IgnoreReadOnlyProperties1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("PersistenceV2IgnoreReadOnlyProperties1" == pages.name)) {
          console.info("get PersistenceV2IgnoreReadOnlyProperties1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistenceV2IgnoreReadOnlyProperties1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistenceV2IgnoreReadOnlyProperties1 page error:" + err);
      }
      console.info("PersistenceV2IgnoreReadOnlyProperties1Test beforeEach end");
      done();
    });

    afterEach(async () => {
      PersistenceV2.remove('IgnoreReadOnlyProperties1');
      console.info('[PersistenceV2IgnoreReadOnlyProperties1Test] afterEach called');
    });

    afterAll(() => {
      console.info('[PersistenceV2IgnoreReadOnlyProperties1Test] afterAll called');
    });

    /**
     * @tc.name   SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0100
     * @tc.desc   Test PersistenceV2.globalConnect with ignoreReadOnlyProperties option succeeds and @Computed property renders correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[PersistenceV2IgnoreReadOnlyProperties1Test_001] START');

      try {
        await CommonFunc.sleep(1000);
        // Verify the page loaded successfully and @Computed property renders correctly
        let strJson: string = getInspectorByKey('IgnoreReadOnlyProperties1_001');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('[PersistenceV2IgnoreReadOnlyProperties1Test_001] component obj: ' + JSON.stringify(obj));
        let content: string = obj.$attrs.content as string;
        console.info('[PersistenceV2IgnoreReadOnlyProperties1Test_001] content: ' + JSON.stringify(content));
        // value=1, doubled=1*2=2, expected text: "doubled value is 2"
        expect(content).assertEqual('doubled value is 2');
        console.info('[PersistenceV2IgnoreReadOnlyProperties1Test_001] END');
      } catch (err) {
        console.error('[PersistenceV2IgnoreReadOnlyProperties1Test_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[PersistenceV2IgnoreReadOnlyProperties1Test_001] END');
      done();
    });

  });
}
