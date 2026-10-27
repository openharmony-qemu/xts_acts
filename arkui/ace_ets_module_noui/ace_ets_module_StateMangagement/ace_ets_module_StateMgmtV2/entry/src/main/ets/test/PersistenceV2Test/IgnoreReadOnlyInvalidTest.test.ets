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

export default function IgnoreReadOnlyInvalidTest() {
  describe('IgnoreReadOnlyInvalidTest', () => {

    beforeEach(async (done: Function) => {
      console.info('[IgnoreReadOnlyInvalidTest] beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PersistenceV2/IgnoreReadOnlyInvalid',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages: ' + JSON.stringify(pages));
        if (!('IgnoreReadOnlyInvalid' == pages.name)) {
          console.info('get IgnoreReadOnlyInvalidTest pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push IgnoreReadOnlyInvalidTest page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push IgnoreReadOnlyInvalidTest page error: ' + err);
      }
      console.info('[IgnoreReadOnlyInvalidTest] beforeEach end');
      done();
    });

    afterEach(async () => {
      PersistenceV2.remove('IgnoreFalseNullGetter');
      PersistenceV2.remove('IgnoreFalseNullComputed');
      PersistenceV2.remove('IgnoreFalseNullChild');
      PersistenceV2.remove('IgnoreFalseUndefinedGetter');
      PersistenceV2.remove('IgnoreFalseUndefinedComputed');
      PersistenceV2.remove('IgnoreFalseUndefinedChild');
      await CommonFunc.sleep(500);
      console.info('[IgnoreReadOnlyInvalidTest] afterEach called');
    });

    afterAll(() => {
      console.info('[IgnoreReadOnlyInvalidTest] afterAll called');
    });

    /**
     * @tc.name   IgnoreReadOnlyInvalid_NullGetter_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYINVALID_NULLGETTER_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=null for class with getter only (no setter)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyInvalid_NullGetter_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyInvalid_NullGetter_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_false_null_getter'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_false_null_getter'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyInvalid_NullGetter_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('value=10');
      expect(content).assertContain('readOnly=20');

      console.info('[IgnoreReadOnlyInvalid_NullGetter_0100] END');
    });

    /**
     * @tc.name   IgnoreReadOnlyInvalid_NullComputed_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYINVALID_NULLCOMPUTED_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=null for class with @Computed property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyInvalid_NullComputed_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyInvalid_NullComputed_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_false_null_computed'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_false_null_computed'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyInvalid_NullComputed_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('value=5');
      expect(content).assertContain('computed=15');

      console.info('[IgnoreReadOnlyInvalid_NullComputed_0100] END');
    });

    /**
     * @tc.name   IgnoreReadOnlyInvalid_NullInheritance_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYINVALID_NULLINHERITANCE_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=null for class A extends B, A has getter, B has setter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyInvalid_NullInheritance_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyInvalid_NullInheritance_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_false_null_derived'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_false_null_derived'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyInvalid_NullInheritance_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('child=200');
      expect(content).assertContain('base=100');
      expect(content).assertContain('readOnly=300');

      console.info('[IgnoreReadOnlyInvalid_NullInheritance_0100] END');
    });

    /**
     * @tc.name   IgnoreReadOnlyInvalid_UndefinedGetter_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYINVALID_UNDEFINEDGETTER_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=undefined for class with getter only (no setter)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyInvalid_UndefinedGetter_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyInvalid_UndefinedGetter_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_false_undefined_getter'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_false_undefined_getter'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyInvalid_UndefinedGetter_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('value=10');
      expect(content).assertContain('readOnly=20');

      console.info('[IgnoreReadOnlyInvalid_UndefinedGetter_0100] END');
    });

    /**
     * @tc.name   IgnoreReadOnlyInvalid_UndefinedComputed_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYINVALID_UNDEFINEDCOMPUTED_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=undefined for class with @Computed property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyInvalid_UndefinedComputed_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyInvalid_UndefinedComputed_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_false_undefined_computed'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_false_undefined_computed'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyInvalid_UndefinedComputed_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('value=5');
      expect(content).assertContain('computed=15');

      console.info('[IgnoreReadOnlyInvalid_UndefinedComputed_0100] END');
    });

    /**
     * @tc.name   IgnoreReadOnlyInvalid_UndefinedInheritance_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_IGNOREREADONLYINVALID_UNDEFINEDINHERITANCE_0100
     * @tc.desc   Test globalConnect with ignoreReadOnlyProperties=undefined for class A extends B, A has getter, B has setter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IgnoreReadOnlyInvalid_UndefinedInheritance_0100', Level.LEVEL0, async () => {
      console.info('[IgnoreReadOnlyInvalid_UndefinedInheritance_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_false_undefined_derived'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('text_false_undefined_derived'));
      let content: string = obj.$attrs.content as string;
      console.info('[IgnoreReadOnlyInvalid_UndefinedInheritance_0100] result: ' + content);
      expect(content).assertContain('SUCCESS');
      expect(content).assertContain('child=200');
      expect(content).assertContain('base=100');
      expect(content).assertContain('readOnly=300');

      console.info('[IgnoreReadOnlyInvalid_UndefinedInheritance_0100] END');
    });
  });
}
