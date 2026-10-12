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

export default function persistenceV2IgnoreReadOnlyPropertiesSet1Test() {
  describe('PersistenceV2IgnoreReadOnlyPropertiesSetTest', () => {

    beforeEach(async (done: Function) => {
      console.info("PersistenceV2IgnoreReadOnlyPropertiesSetTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistenceV2/PersistenceV2IgnoreReadOnlyPropertiesSet",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("PersistenceV2IgnoreReadOnlyPropertiesSet" == pages.name)) {
          console.info("get PersistenceV2IgnoreReadOnlyPropertiesSet pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistenceV2IgnoreReadOnlyPropertiesSet page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistenceV2IgnoreReadOnlyPropertiesSet page error:" + err);
      }
      console.info("PersistenceV2IgnoreReadOnlyPropertiesSetTest beforeEach end");
      done();
    });

    afterEach(async () => {
      // Cleanup persisted data
      PersistenceV2.remove('ac81');
      await CommonFunc.sleep(500);
      console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest] afterEach called');
    });

    afterAll(() => {
      console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest] afterAll called');
    });

    /**
     * @tc.name   SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIESSET_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIESSET_0100
     * @tc.desc   Test PersistenceV2.globalConnect with ignoreReadOnlyProperties=true renders correct initial values when child getter shadows parent setter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIESSET_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_001] START');

      try {
        await CommonFunc.sleep(1000);
        // Verify other renders correctly (default 0)
        let strJson1: string = getInspectorByKey('IgnoreReadOnlyPropertiesSet_001');
        let obj1: Record<string, ESObject> = JSON.parse(strJson1);
        console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_001] obj1: ' + JSON.stringify(obj1));
        let content1: string = obj1.$attrs.content as string;
        expect(content1).assertEqual('other = 0');

        // Verify value getter renders correctly (other + 1 = 1)
        let strJson2: string = getInspectorByKey('IgnoreReadOnlyPropertiesSet_002');
        let obj2: Record<string, ESObject> = JSON.parse(strJson2);
        console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_001] obj2: ' + JSON.stringify(obj2));
        let content2: string = obj2.$attrs.content as string;
        expect(content2).assertEqual('value = 1');

        console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_001] END');
      } catch (err) {
        console.error('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIESSET_0200
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIESSET_0200
     * @tc.desc   Test PersistenceV2.save after modifying @Trace property persists value and getter recomputes correctly with ignoreReadOnlyProperties=true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYPROPERTIESSET_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_002] START');

      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        // Click the button to set other=50 and save
        let btn = await driver.findComponent(ON.id('IgnoreReadOnlyPropertiesSet_003'));
        await btn.click();
        await CommonFunc.sleep(1000);

        // Verify other updated to 50
        let strJson1: string = getInspectorByKey('IgnoreReadOnlyPropertiesSet_001');
        let obj1: Record<string, ESObject> = JSON.parse(strJson1);
        console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_002] obj1: ' + JSON.stringify(obj1));
        let content1: string = obj1.$attrs.content as string;
        expect(content1).assertEqual('other = 50');

        // Verify value getter recomputed (50 + 1 = 51)
        let strJson2: string = getInspectorByKey('IgnoreReadOnlyPropertiesSet_002');
        let obj2: Record<string, ESObject> = JSON.parse(strJson2);
        console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_002] obj2: ' + JSON.stringify(obj2));
        let content2: string = obj2.$attrs.content as string;
        expect(content2).assertEqual('value = 51');

        console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_002] END');
      } catch (err) {
        console.error('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_002] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[PersistenceV2IgnoreReadOnlyPropertiesSetTest_002] END');
      done();
    });

  });
}
