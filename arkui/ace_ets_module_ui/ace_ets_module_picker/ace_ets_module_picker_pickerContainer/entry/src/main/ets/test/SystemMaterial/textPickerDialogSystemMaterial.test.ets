/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';
import { uiMaterial } from '@kit.ArkUI';

export default function TextPickerDialogSystemMaterialTest() {
  describe('TextPickerDialogSystemMaterialTest', () => {

    beforeAll(async () => {
      console.info('TextPickerDialogSystemMaterialTest beforeAll start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('textPickerDialogSystemMaterial' == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TextPickerDialogSystemMaterial page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextPickerDialogSystemMaterial after each called');
    });
    /**
     * @tc.name   TextPickerDialogSystemMaterialTest_001
     * @tc.number TextPickerDialogSystemMaterialTest_001
     * @tc.desc   To test the TextPickerDialog systemMaterial with ImmersiveStyle.ULTRA_THICK and interactive:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogSystemMaterialTest_001',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ULTRA_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      
      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('TextPickerDialogSystemMaterialTest_001 systemMaterial: ' + JSON.stringify(systemMaterial));

      let retValue: string = column.$attrs.systemMaterial.material.immersiveOptions.style;
      console.info('TextPickerDialogSystemMaterialTest_001 retValue: ' + retValue);

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	  expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	  expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	  expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	  expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   TextPickerDialogSystemMaterialTest_002
     * @tc.number TextPickerDialogSystemMaterialTest_002
     * @tc.desc   To test the TextPickerDialog systemMaterial with ImmersiveStyle.ULTRA_THIN and interactive:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogSystemMaterialTest_002',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ULTRA_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      
      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('TextPickerDialogSystemMaterialTest_002 systemMaterial: ' + JSON.stringify(systemMaterial));

      let retValue: string = column.$attrs.systemMaterial.material.immersiveOptions.style;
      console.info('TextPickerDialogSystemMaterialTest_002 retValue: ' + retValue);

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	  expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	  expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	  expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	  expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   TextPickerDialogSystemMaterialTest_003
     * @tc.number TextPickerDialogSystemMaterialTest_003
     * @tc.desc   To test the TextPickerDialog systemMaterial with interactive:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogSystemMaterialTest_003',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('interactive_false_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      
      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('TextPickerDialogSystemMaterialTest_003 systemMaterial: ' + JSON.stringify(systemMaterial));

      let retValue: string = column.$attrs.systemMaterial.material.immersiveOptions.style;
      console.info('TextPickerDialogSystemMaterialTest_003 retValue: ' + retValue);

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	  expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	  expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	  expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	  expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   TextPickerDialogSystemMaterialTest_004
     * @tc.number TextPickerDialogSystemMaterialTest_004
     * @tc.desc   To test the TextPickerDialog systemMaterial set to undefined, should default to ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogSystemMaterialTest_004',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      
      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('TextPickerDialogSystemMaterialTest_004 systemMaterial: ' + JSON.stringify(systemMaterial));

      let retValue: string = column.$attrs.systemMaterial.material.immersiveOptions.style;
      console.info('TextPickerDialogSystemMaterialTest_004 retValue: ' + retValue);

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	  expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	  expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	  expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	  expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /**
     * @tc.name   TextPickerDialogSystemMaterialTest_005
     * @tc.number TextPickerDialogSystemMaterialTest_005
     * @tc.desc   To test the TextPickerDialog without setting systemMaterial, should default to ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerDialogSystemMaterialTest_005',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('defaultID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      
      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('TextPickerDialogSystemMaterialTest_005 systemMaterial: ' + JSON.stringify(systemMaterial));

      let retValue: string = column.$attrs.systemMaterial.material.immersiveOptions.style;
      console.info('TextPickerDialogSystemMaterialTest_005 retValue: ' + retValue);

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	  expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	  expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	  expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	  expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
  })
}
