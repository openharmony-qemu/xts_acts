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

// version encode X*10000+Y*100+Z, '5.0.0' -> 50000, '6.0.0' -> 60000; -1 means unbounded
function inRange(dist: number, minEnc: number, maxEnc: number): boolean {
  return (minEnc < 0 || dist >= minEnc) && (maxEnc < 0 || dist < maxEnc);
}

export default function Extend0050TestJsunit() {
  describe('Extend0050TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Extend0050TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Extend/Extend0050",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Extend0050TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Extend0050" == pages.name)) {
          console.info("get Extend0050TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Extend0050TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Extend0050TestJsunit page error:" + err);
      }
      console.info("Extend0050TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Extend0050TestJsunit after each called");
    });

    /**
     * @tc.name   SUB_ACE_STATUSMANAGER_EXTEND_MULTICALL_0100
     * @tc.number SUB_ACE_STATUSMANAGER_EXTEND_MULTICALL_0100
     * @tc.desc   Test one conditional @Extend declaration takes effect for all its call sites at once
     *            with each call site's params passthrough unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_STATUSMANAGER_EXTEND_MULTICALL_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MULTICALL_0100] START');
      await CommonFunc.sleep(2000);
      let dist: number = deviceInfo.distributionOSApiVersion;
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MULTICALL_0100] distributionOSApiVersion: ' + dist);
      let applied: boolean = inRange(dist, 50000, 60000);
      let expectedFirst: string = applied ? '#FFFF0000' : '#FF0000FF';
      let expectedSecond: string = applied ? '#FF008000' : '#FF808080';
      let objFirst: ESObject = JSON.parse(getInspectorByKey('tv_extend0050_first'));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MULTICALL_0100] first fontColor is: ' + JSON.stringify(objFirst.$attrs.fontColor));
      expect(objFirst.$attrs.fontColor).assertEqual(expectedFirst);
      let objSecond: ESObject = JSON.parse(getInspectorByKey('tv_extend0050_second'));
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MULTICALL_0100] second fontColor is: ' + JSON.stringify(objSecond.$attrs.fontColor));
      expect(objSecond.$attrs.fontColor).assertEqual(expectedSecond);
      console.info('[SUB_ACE_STATUSMANAGER_EXTEND_MULTICALL_0100] END');
      done();
    });
  })
}
