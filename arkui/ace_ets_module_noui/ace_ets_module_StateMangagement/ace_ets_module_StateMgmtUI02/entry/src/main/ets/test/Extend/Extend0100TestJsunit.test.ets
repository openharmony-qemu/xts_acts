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

// version encode X*10000+Y*100+Z, 15 -> 50003, 17 -> 50005, 20 -> 60000, 22 -> 60002
function inRange(dist: number, minEnc: number, maxEnc: number): boolean {
  return (minEnc < 0 || dist >= minEnc) && (maxEnc < 0 || dist < maxEnc);
}

export default function Extend0100TestJsunit() {
  describe('Extend0100TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Extend0100TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Extend/Extend0100",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Extend0100TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Extend0100" == pages.name)) {
          console.info("get Extend0100TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Extend0100TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Extend0100TestJsunit page error:" + err);
      }
      console.info("Extend0100TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Extend0100TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0100
     * @tc.number SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0100
     * @tc.desc   Test scenario a: conditional @Extend a [15,20) calling unconditional b (single-param
     *            legacy form), only a produces version condition wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0100] START');
      await CommonFunc.sleep(2000);
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0100] distributionOSApiVersion: ' + dist);
      let aApplied: boolean = inRange(dist, 50003, 60000);
      let expectedFontColor: string = aApplied ? '#FFFF0000' : '#FF0000FF';
      let expectedFontStyle: string = aApplied ? 'FontStyle.Italic' : 'FontStyle.Normal';
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_extend0100_a'));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0100] fontColor is: ' + JSON.stringify(obj.$attrs.fontColor));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0100] fontStyle is: ' + JSON.stringify(obj.$attrs.fontStyle));
      expect(obj.$attrs.fontColor).assertEqual(expectedFontColor);
      expect(obj.$attrs.fontStyle).assertEqual(expectedFontStyle);
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0200
     * @tc.number SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0200
     * @tc.desc   Test scenario b: unconditional @Extend a (single-param legacy form) calling
     *            conditional b [17,22), a applies unconditionally, only b produces version condition wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0200] START');
      await CommonFunc.sleep(2000);
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0200] distributionOSApiVersion: ' + dist);
      let expectedFontColor: string = '#FFFF0000';
      let expectedFontStyle: string = inRange(dist, 50005, 60002) ? 'FontStyle.Italic' : 'FontStyle.Normal';
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_extend0100_b'));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0200] fontColor is: ' + JSON.stringify(obj.$attrs.fontColor));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0200] fontStyle is: ' + JSON.stringify(obj.$attrs.fontStyle));
      expect(obj.$attrs.fontColor).assertEqual(expectedFontColor);
      expect(obj.$attrs.fontStyle).assertEqual(expectedFontStyle);
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MIXED_0200] END');
      done();
    });
  })
}
