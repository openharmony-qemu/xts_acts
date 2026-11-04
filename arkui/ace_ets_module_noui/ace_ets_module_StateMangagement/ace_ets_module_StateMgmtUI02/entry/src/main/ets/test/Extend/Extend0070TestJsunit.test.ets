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

export default function Extend0070TestJsunit() {
  describe('Extend0070TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Extend0070TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Extend/Extend0070",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Extend0070TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Extend0070" == pages.name)) {
          console.info("get Extend0070TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Extend0070TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Extend0070TestJsunit page error:" + err);
      }
      console.info("Extend0070TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Extend0070TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_EXTEND_EQUIVALENTFORM_0100
     * @tc.number SUB_ACE_STATUSMANAGER_EXTEND_EQUIVALENTFORM_0100
     * @tc.desc   Test string key '12' and number key 24 of minApiVersion/maxApiVersion are
     *            normalized equivalently and generate both-bounds version condition wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_EXTEND_EQUIVALENTFORM_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_EQUIVALENTFORM_0100] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_extend0070'));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_EQUIVALENTFORM_0100] content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Extend0070 key 12 24');
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_EQUIVALENTFORM_0100] END');
      done();
    });
  })
}
