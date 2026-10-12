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
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { PersistenceV2 } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/common/Common';

export default function IgnoreReadOnlyTrueTest() {
  describe('IgnoreReadOnlyTrueTest', () => {

    beforeEach(async (done: Function) => {
      console.info('[IgnoreReadOnlyTrueTest] beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PersistenceV2/IgnoreReadOnlyTrue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages: ' + JSON.stringify(pages));
        if (!('IgnoreReadOnlyTrue' == pages.name)) {
          console.info('get IgnoreReadOnlyTrueTest pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push IgnoreReadOnlyTrueTest page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push IgnoreReadOnlyTrueTest page error: ' + err);
      }
      console.info('[IgnoreReadOnlyTrueTest] beforeEach end');
      done();
    });

    afterEach(async () => {
      PersistenceV2.remove('IgnoreTrueGetter');
      PersistenceV2.remove('IgnoreTrueComputed');
      PersistenceV2.remove('IgnoreTrueChild');
      await CommonFunc.sleep(500);
      console.info('[IgnoreReadOnlyTrueTest] afterEach called');
    });

    afterAll(() => {
      console.info('[IgnoreReadOnlyTrueTest] afterAll called');
    });

    /**
     * @tc.name   IgnoreReadOnlyTrue_Getter_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYTRUE_GETTER_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=true for class with getter only (no setter)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyTrue_Getter_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyTrue_Getter_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_true_getter'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_true_getter'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyTrue_Getter_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('value=10');
      expect(content).assertContain('readOnly=20');

      console.info('[IgnoreReadOnlyTrue_Getter_0100] END');
    });

    /**
     * @tc.name   IgnoreReadOnlyTrue_Computed_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYTRUE_COMPUTED_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=true for class with @Computed property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyTrue_Computed_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyTrue_Computed_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_true_computed'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_true_computed'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyTrue_Computed_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('value=5');
      expect(content).assertContain('computed=15');

      console.info('[IgnoreReadOnlyTrue_Computed_0100] END');
    });

    /**
     * @tc.name   IgnoreReadOnlyTrue_Inheritance_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYTRUE_INHERITANCE_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=true for class A extends B, A has getter, B has setter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyTrue_Inheritance_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyTrue_Inheritance_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_true_derived'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_true_derived'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyTrue_Inheritance_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('child=200');
      expect(content).assertContain('base=100');
      expect(content).assertContain('readOnly=300');

      console.info('[IgnoreReadOnlyTrue_Inheritance_0100] END');
    });
  });
}
