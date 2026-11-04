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

export default function Extend0060TestJsunit() {
  describe('Extend0060TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Extend0060TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Extend/Extend0060",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Extend0060TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Extend0060" == pages.name)) {
          console.info("get Extend0060TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Extend0060TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Extend0060TestJsunit page error:" + err);
      }
      console.info("Extend0060TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Extend0060TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_EXTEND_OSVERSION_0100
     * @tc.number SUB_ACE_STATUSMANAGER_EXTEND_OSVERSION_0100
     * @tc.desc   Test @Extend with OS version string bounds '5.0.0' and '6.1.1' generates
     *            both-bounds version condition wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_EXTEND_OSVERSION_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_OSVERSION_0100] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_extend0060'));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_OSVERSION_0100] content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Extend0060 os 5.0.0 6.1.1');
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_OSVERSION_0100] END');
      done();
    });
  })
}
