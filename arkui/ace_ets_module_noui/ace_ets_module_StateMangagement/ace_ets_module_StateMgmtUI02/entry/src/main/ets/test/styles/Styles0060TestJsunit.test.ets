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

// version encode X*10000+Y*100+Z, 15 -> 50003, 17 -> 50005, 18 -> 50100, 20 -> 60000, 22 -> 60002, 24 -> 60101
function inRange(dist: number, minEnc: number, maxEnc: number): boolean {
  return (minEnc < 0 || dist >= minEnc) && (maxEnc < 0 || dist < maxEnc);
}

export default function Styles0060TestJsunit() {
  describe('Styles0060TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Styles0060TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/styles/Styles0060",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Styles0060TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Styles0060" == pages.name)) {
          console.info("get Styles0060TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Styles0060TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Styles0060TestJsunit page error:" + err);
      }
      console.info("Styles0060TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Styles0060TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100
     * @tc.number SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100
     * @tc.desc   Test three-layer nested @Styles A->B->C conditions are applied as interval intersection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100] START');
      await CommonFunc.sleep(2000);
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100] distributionOSApiVersion: ' + dist);
      let condA: boolean = inRange(dist, 50003, 60101);
      let condB: boolean = inRange(dist, 50005, 60002);
      let condC: boolean = inRange(dist, 50100, 60000);
      let expectedBg: string = condA ? '#FFFF0000' : '#FF808080';
      let expectedHeight: string = (condA && condB) ? '200.00vp' : '5.00%';
      let expectedBorderWidth: string = (condA && condB && condC) ? '2.00vp' : '0.00vp';
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_styles0060'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100] backgroundColor is: ' + JSON.stringify(obj.$attrs.backgroundColor));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100] height is: ' + JSON.stringify(obj.$attrs.height));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100] borderWidth is: ' + JSON.stringify(obj.$attrs.borderWidth));
      expect(obj.$attrs.backgroundColor).assertEqual(expectedBg);
      expect(obj.$attrs.height).assertEqual(expectedHeight);
      expect(obj.$attrs.borderWidth).assertEqual(expectedBorderWidth);
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_NESTED_0100] END');
      done();
    });
  })
}
