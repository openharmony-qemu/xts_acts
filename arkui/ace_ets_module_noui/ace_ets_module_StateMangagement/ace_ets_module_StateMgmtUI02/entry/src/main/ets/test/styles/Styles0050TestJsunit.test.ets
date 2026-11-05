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

// version encode X*10000+Y*100+Z, 12/'12'/'5.0.0' -> 50000, 13 -> 50001, '20' -> 60000; -1 means unbounded
function inRange(dist: number, minEnc: number, maxEnc: number): boolean {
  return (minEnc < 0 || dist >= minEnc) && (maxEnc < 0 || dist < maxEnc);
}

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
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] distributionOSApiVersion: ' + dist);
      let minApplied: boolean = inRange(dist, 50000, -1);
      let expectedBg: string = minApplied ? '#FFFF0000' : '#FF808080';
      let expectedMixedHeight: string = inRange(dist, 50001, 60000) ? '51.00vp' : '5.00%';
      let objNumber: ESObject = JSON.parse(getInspectorByKey('tv_styles0050_number'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] number form backgroundColor is: ' + JSON.stringify(objNumber.$attrs.backgroundColor));
      expect(objNumber.$attrs.backgroundColor).assertEqual(expectedBg);
      let objString: ESObject = JSON.parse(getInspectorByKey('tv_styles0050_string'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] string key form backgroundColor is: ' + JSON.stringify(objString.$attrs.backgroundColor));
      expect(objString.$attrs.backgroundColor).assertEqual(expectedBg);
      let objOs: ESObject = JSON.parse(getInspectorByKey('tv_styles0050_os'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] os string form backgroundColor is: ' + JSON.stringify(objOs.$attrs.backgroundColor));
      expect(objOs.$attrs.backgroundColor).assertEqual(expectedBg);
      let objMixed: ESObject = JSON.parse(getInspectorByKey('tv_styles0050_mixed'));
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] mixed form height is: ' + JSON.stringify(objMixed.$attrs.height));
      expect(objMixed.$attrs.height).assertEqual(expectedMixedHeight);
      let bgNumber: string = objNumber.$attrs.backgroundColor as string;
      let bgString: string = objString.$attrs.backgroundColor as string;
      let bgOs: string = objOs.$attrs.backgroundColor as string;
      let formsEquivalent: boolean = (bgNumber === bgString) && (bgString === bgOs);
      expect(formsEquivalent).assertTrue();
      console.info('[SUB_ACE_STATUSMANAGER_STYLES_EQUIVALENTFORM_0100] END');
      done();
    });
  })
}
