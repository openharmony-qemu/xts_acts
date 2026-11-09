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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function Styles0080TestJsunit() {
  describe('Styles0080TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Styles0080TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/styles/Styles0080",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Styles0080TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Styles0080" == pages.name)) {
          console.info("get Styles0080TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Styles0080TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Styles0080TestJsunit page error:" + err);
      }
      console.info("Styles0080TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Styles0080TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_STYLES_MULTICALL_0100
     * @tc.number SUB_ACE_STATUSMANAGER_STYLES_MULTICALL_0100
     * @tc.desc   Test @Styles A calling the same @Styles B at two statement positions,
     *            both call sites expand independently with consistent wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_STYLES_MULTICALL_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MULTICALL_0100] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_styles0080'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MULTICALL_0100] text is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Styles0080 two call sites');
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MULTICALL_0100] END');
      done();
    });
  })
}
