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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function nullAlphabet() {
  describe('nullAlphabet', () => {
    beforeEach(async (done: Function) => {
      console.info("nullAlphabet beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/nullAlphabet",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nullAlphabet state pages:" + JSON.stringify(pages));
        if (!("nullAlphabet" == pages.name)) {
          console.info("get nullAlphabet pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push nullAlphabet page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nullAlphabet page error:" + err);
      }
      console.info("nullAlphabet beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("nullAlphabet after each called");
    });

    /**
     * @tc.name   nullAlphabet_0100
     * @tc.number SUB_ACE_ACE_ETS_MODULE_SCROLL_NULL_ALPHABET_0100
     * @tc.desc   Test AlphabetIndexer behavior when arrayValue is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nullAlphabet_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[nullAlphabet_0100] START');
      let strJson = getInspectorByKey('alp_outliers_value');
      console.info("[nullAlphabet_0100] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[nullAlphabet_0100] selected: " + JSON.stringify(JSON.parse(strJson).$attrs.selected));
      expect(JSON.parse(strJson).$attrs.selected).assertEqual('0');
      console.info('[nullAlphabet_0100] END');
      done();
    });
  })
}
