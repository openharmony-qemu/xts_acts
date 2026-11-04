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

// version encode X*10000+Y*100+Z, minApiVersion 12 -> 50000, maxApiVersion 18 -> 50100; -1 means unbounded
function inRange(dist: number, minEnc: number, maxEnc: number): boolean {
  return (minEnc < 0 || dist >= minEnc) && (maxEnc < 0 || dist < maxEnc);
}

export default function Styles0040TestJsunit() {
  describe('Styles0040TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Styles0040TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/styles/Styles0040",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Styles0040TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Styles0040" == pages.name)) {
          console.info("get Styles0040TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Styles0040TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Styles0040TestJsunit page error:" + err);
      }
      console.info("Styles0040TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Styles0040TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_STYLES_MINMAX_0100
     * @tc.number SUB_ACE_STATUSMANAGER_STYLES_MINMAX_0100
     * @tc.desc   Test @Styles with both minApiVersion and maxApiVersion generates left-closed right-open interval wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_STYLES_MINMAX_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MINMAX_0100] START');
      await CommonFunc.sleep(2000);
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MINMAX_0100] distributionOSApiVersion: ' + dist);
      let expectedBg: string = inRange(dist, 50000, 50100) ? '#FFFF0000' : '#FF808080';
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_styles0040'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MINMAX_0100] backgroundColor is: ' + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual(expectedBg);
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_MINMAX_0100] END');
      done();
    });
  })
}
