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
import deviceInfo from '@ohos.deviceInfo';
import CommonFunc from '../../MainAbility/common/Common';

// version encode X*10000+Y*100+Z, maxApiVersion 18 -> [5,1,0] -> 50100; -1 means unbounded
function inRange(dist: number, minEnc: number, maxEnc: number): boolean {
  return (minEnc < 0 || dist >= minEnc) && (maxEnc < 0 || dist < maxEnc);
}

export default function Styles0030TestJsunit() {
  describe('Styles0030TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Styles0030TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/styles/Styles0030",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Styles0030TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Styles0030" == pages.name)) {
          console.info("get Styles0030TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Styles0030TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Styles0030TestJsunit page error:" + err);
      }
      console.info("Styles0030TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Styles0030TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_STYLES_MAXAPIVERSION_0100
     * @tc.number SUB_ACE_STATUSMANAGER_STYLES_MAXAPIVERSION_0100
     * @tc.desc   Test @Styles with maxApiVersion only generates max-boundary version condition wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_STYLES_MAXAPIVERSION_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MAXAPIVERSION_0100] START');
      await CommonFunc.sleep(2000);
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MAXAPIVERSION_0100] distributionOSApiVersion: ' + dist);
      let expectedHeight: string = inRange(dist, -1, 50100) ? '60.00vp' : '5.00%';
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_styles0030'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MAXAPIVERSION_0100] height is: ' + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual(expectedHeight);
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MAXAPIVERSION_0100] END');
      done();
    });
  })
}
