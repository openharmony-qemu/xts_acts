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

// version encode X*10000+Y*100+Z, '5.0.0' -> 50000; -1 means unbounded
function inRange(dist: number, minEnc: number, maxEnc: number): boolean {
  return (minEnc < 0 || dist >= minEnc) && (maxEnc < 0 || dist < maxEnc);
}

export default function Extend0030TestJsunit() {
  describe('Extend0030TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Extend0030TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Extend/Extend0030",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Extend0030TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Extend0030" == pages.name)) {
          console.info("get Extend0030TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Extend0030TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Extend0030TestJsunit page error:" + err);
      }
      console.info("Extend0030TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Extend0030TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_EXTEND_MINAPIVERSION_0100
     * @tc.number SUB_ACE_STATUSMANAGER_EXTEND_MINAPIVERSION_0100
     * @tc.desc   Test @Extend(Text, { minApiVersion: '5.0.0' }) generates min-boundary version
     *            condition wrapping with params passthrough unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_EXTEND_MINAPIVERSION_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MINAPIVERSION_0100] START');
      await CommonFunc.sleep(2000);
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MINAPIVERSION_0100] distributionOSApiVersion: ' + dist);
      let expectedFontColor: string = inRange(dist, 50000, -1) ? '#FFFF0000' : '#FF0000FF';
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_extend0030'));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MINAPIVERSION_0100] fontColor is: ' + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual(expectedFontColor);
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MINAPIVERSION_0100] END');
      done();
    });
  })
}
