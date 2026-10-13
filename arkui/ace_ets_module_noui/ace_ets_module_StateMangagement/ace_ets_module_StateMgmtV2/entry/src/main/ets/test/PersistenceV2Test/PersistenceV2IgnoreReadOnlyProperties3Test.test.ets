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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import { PersistenceV2 } from '@kit.ArkUI';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function persistenceV2IgnoreReadOnlyProperties3Test() {
  describe('PersistenceV2IgnoreReadOnlyProperties3Test', () => {

    beforeEach(async (done: Function) => {
      console.info("PersistenceV2IgnoreReadOnlyProperties3Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistenceV2/PersistenceV2IgnoreReadOnlyProperties3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("PersistenceV2IgnoreReadOnlyProperties3" == pages.name)) {
          console.info("get PersistenceV2IgnoreReadOnlyProperties3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistenceV2IgnoreReadOnlyProperties3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistenceV2IgnoreReadOnlyProperties3 page error:" + err);
      }
      console.info("PersistenceV2IgnoreReadOnlyProperties3Test beforeEach end");
      done();
    });

    afterEach(async () => {
      // Cleanup persisted data
      PersistenceV2.remove('ac41');
      console.info('[PersistenceV2IgnoreReadOnlyProperties3Test] afterEach called');
    });

    afterAll(() => {
      console.info('[PersistenceV2IgnoreReadOnlyProperties3Test] afterAll called');
    });

    /**
     * @tc.name   SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0300
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0300
     * @tc.desc   Test PersistenceV2.globalConnect with ignoreReadOnlyProperties recursively filters nested @Computed read-only properties and renders correct initial values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_001] START');

      try {
        await CommonFunc.sleep(1000);
        // Verify outerVal renders correctly (default 7)
        let strJson1: string = getInspectorByKey('IgnoreReadOnlyProperties3_001');
        let obj1: Record<string, ESObject> = JSON.parse(strJson1);
        console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_001] obj1: ' + JSON.stringify(obj1));
        let content1: string = obj1.$attrs.content as string;
        expect(content1).assertEqual('outerVal = 7');

        // Verify nested.innerVal renders correctly (default 3)
        let strJson2: string = getInspectorByKey('IgnoreReadOnlyProperties3_002');
        let obj2: Record<string, ESObject> = JSON.parse(strJson2);
        console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_001] obj2: ' + JSON.stringify(obj2));
        let content2: string = obj2.$attrs.content as string;
        expect(content2).assertEqual('nested.innerVal = 3');

        // Verify nested.innerComputed renders correctly (3 * 10 = 30)
        let strJson3: string = getInspectorByKey('IgnoreReadOnlyProperties3_003');
        let obj3: Record<string, ESObject> = JSON.parse(strJson3);
        console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_001] obj3: ' + JSON.stringify(obj3));
        let content3: string = obj3.$attrs.content as string;
        expect(content3).assertEqual('nested.innerComputed = 30');

        console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_001] END');
      } catch (err) {
        console.error('[PersistenceV2IgnoreReadOnlyProperties3Test_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0400
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0400
     * @tc.desc   Test PersistenceV2.save after modifying nested @Trace properties persists values and nested @Computed recomputes correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIES_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_002] START');

      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        // Click the button to set outerVal=100, innerVal=5 and save
        let btn = await driver.findComponent(ON.id('IgnoreReadOnlyProperties3_004'));
        await btn.click();
        await CommonFunc.sleep(1000);

        // Verify outerVal updated to 100
        let strJson1: string = getInspectorByKey('IgnoreReadOnlyProperties3_001');
        let obj1: Record<string, ESObject> = JSON.parse(strJson1);
        console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_002] obj1: ' + JSON.stringify(obj1));
        let content1: string = obj1.$attrs.content as string;
        expect(content1).assertEqual('outerVal = 100');

        // Verify nested.innerVal updated to 5
        let strJson2: string = getInspectorByKey('IgnoreReadOnlyProperties3_002');
        let obj2: Record<string, ESObject> = JSON.parse(strJson2);
        console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_002] obj2: ' + JSON.stringify(obj2));
        let content2: string = obj2.$attrs.content as string;
        expect(content2).assertEqual('nested.innerVal = 5');

        // Verify nested.innerComputed recomputed (5 * 10 = 50)
        let strJson3: string = getInspectorByKey('IgnoreReadOnlyProperties3_003');
        let obj3: Record<string, ESObject> = JSON.parse(strJson3);
        console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_002] obj3: ' + JSON.stringify(obj3));
        let content3: string = obj3.$attrs.content as string;
        expect(content3).assertEqual('nested.innerComputed = 50');

        console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_002] END');
      } catch (err) {
        console.error('[PersistenceV2IgnoreReadOnlyProperties3Test_002] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[PersistenceV2IgnoreReadOnlyProperties3Test_002] END');
      done();
    });

  });
}
