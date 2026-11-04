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

// version encode X*10000+Y*100+Z, 15 -> 50003, 17 -> 50005, 20 -> 60000, 24 -> 60101
function inRange(dist: number, minEnc: number, maxEnc: number): boolean {
  return (minEnc < 0 || dist >= minEnc) && (maxEnc < 0 || dist < maxEnc);
}

export default function Extend0080TestJsunit() {
  describe('Extend0080TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Extend0080TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Extend/Extend0080",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Extend0080TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Extend0080" == pages.name)) {
          console.info("get Extend0080TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Extend0080TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Extend0080TestJsunit page error:" + err);
      }
      console.info("Extend0080TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Extend0080TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_EXTEND_OVERLAP_0100
     * @tc.number SUB_ACE_STATUSMANAGER_EXTEND_OVERLAP_0100
     * @tc.desc   Test nested @Extend a [15,24) calling b [17,20) with partially overlapped intervals:
     *            each condition takes effect in its own generated style function body and the effective
     *            interval is the intersection [17,20)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_EXTEND_OVERLAP_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_OVERLAP_0100] START');
      await CommonFunc.sleep(2000);
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_OVERLAP_0100] distributionOSApiVersion: ' + dist);
      let condA: boolean = inRange(dist, 50003, 60101);
      let condB: boolean = inRange(dist, 50005, 60000);
      let expectedFontColor: string = condA ? '#FFFF0000' : '#FF0000FF';
      let expectedFontStyle: string = (condA && condB) ? 'FontStyle.Italic' : 'FontStyle.Normal';
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_extend0080'));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_OVERLAP_0100] fontColor is: ' + JSON.stringify(obj.$attrs.fontColor));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_OVERLAP_0100] fontStyle is: ' + JSON.stringify(obj.$attrs.fontStyle));
      expect(obj.$attrs.fontColor).assertEqual(expectedFontColor);
      expect(obj.$attrs.fontStyle).assertEqual(expectedFontStyle);
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_OVERLAP_0100] END');
      done();
    });
  })
}
