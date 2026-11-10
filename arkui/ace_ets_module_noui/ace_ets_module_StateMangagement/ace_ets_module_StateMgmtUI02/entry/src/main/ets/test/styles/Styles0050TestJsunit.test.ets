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

export default function Styles0050TestJsunit() {
  describe('Styles0050TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Styles0050TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/styles/Styles0050",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Styles0050TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Styles0050" == pages.name)) {
          console.info("get Styles0050TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Styles0050TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Styles0050TestJsunit page error:" + err);
      }
      console.info("Styles0050TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Styles0050TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100
     * @tc.number SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100
     * @tc.desc   Test number 12, string '12' and OS version string '5.0.0' forms of minApiVersion
     *            are normalized to the same version condition wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] START');
      await CommonFunc.sleep(2000);
      let objNumber: ESObject = JSON.parse(getInspectorByKey('tv_styles0050_number'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] number form text is: ' + JSON.stringify(objNumber.$attrs.content));
      expect(objNumber.$attrs.content).assertEqual('Styles0050 number 12');
      let objString: ESObject = JSON.parse(getInspectorByKey('tv_styles0050_string'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] string key form text is: ' + JSON.stringify(objString.$attrs.content));
      expect(objString.$attrs.content).assertEqual('Styles0050 stringKey 12');
      let objOs: ESObject = JSON.parse(getInspectorByKey('tv_styles0050_os'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] os string form text is: ' + JSON.stringify(objOs.$attrs.content));
      expect(objOs.$attrs.content).assertEqual('Styles0050 osString 5.0.0');
      let objMixed: ESObject = JSON.parse(getInspectorByKey('tv_styles0050_mixed'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] mixed form text is: ' + JSON.stringify(objMixed.$attrs.content));
      expect(objMixed.$attrs.content).assertEqual('Styles0050 mixed 13 20');
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] END');
      done();
    });
  })
}
