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

export default function TimePickerDialogSystemMaterialTest() {
  describe('TimePickerDialogSystemMaterialTest', () => {
    beforeAll(async () => {
      console.info('TimePickerDialogSystemMaterialTest beforeAll start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerDialog/timePickerDialogSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('TimePickerDialogSystemMaterial' == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TimePickerDialogSystemMaterial page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TimePickerDialogSystemMaterial after each called');
    });
    /**
     * @tc.name   TimePickerDialogSystemMaterialTest_001
     * @tc.number SUB_ARKUI_TIMEPICKERDIALOG_SYSTEMMATERIAL_PARAM_001
     * @tc.desc   To test the TimePickerDialog systemMaterial with ImmersiveStyle.ULTRA_THICK and interactive=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TimePickerDialogSystemMaterialTest_001', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ImmersiveStyleUltraThickID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      
      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('TimePickerDialogSystemMaterialTest_001 systemMaterial: ' + JSON.stringify(systemMaterial));

      let retValue: string = column.$attrs.systemMaterial.material.immersiveOptions.style;
      console.info('TimePickerDialogSystemMaterialTest_001 retValue: ' + retValue);

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
     * @tc.name   TimePickerDialogSystemMaterialTest_002
     * @tc.number SUB_ARKUI_TIMEPICKERDIALOG_SYSTEMMATERIAL_PARAM_002
     * @tc.desc   To test the TimePickerDialog systemMaterial with ImmersiveStyle.ULTRA_THIN and interactive=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TimePickerDialogSystemMaterialTest_002', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ImmersiveStyleThinID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];

      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('TimePickerDialogSystemMaterialTest_002 systemMaterial: ' + JSON.stringify(systemMaterial));

      let retValue: string = column.$attrs.systemMaterial.material.immersiveOptions.style;
      console.info('TimePickerDialogSystemMaterialTest_002 retValue: ' + retValue);

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
     * @tc.name   TimePickerDialogSystemMaterialTest_003
     * @tc.number SUB_ARKUI_TIMEPICKERDIALOG_SYSTEMMATERIAL_PARAM_003
     * @tc.desc   To test the TimePickerDialog systemMaterial with undefined (default behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TimePickerDialogSystemMaterialTest_003', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SystemMaterialUndefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      
      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('TimePickerDialogSystemMaterialTest_003 systemMaterial: ' + JSON.stringify(systemMaterial));

      let retValue: string = column.$attrs.systemMaterial.material.immersiveOptions.style;
      console.info('TimePickerDialogSystemMaterialTest_003 retValue: ' + retValue);

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
