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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import { uiMaterial } from '@kit.ArkUI';

export default function CalendarPickerDialogSystemMaterialTest() {
  describe('CalendarPickerDialogSystemMaterialTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CalendarPickerDialogSystemMaterialTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SystemMaterial/calendarPickerDialogSystemMaterial',
      }
      router.clear();
      let pages = router.getState();
      console.info('get CalendarPickerDialogSystemMaterialTest state pages: ' + JSON.stringify(pages));
      if (!('calendarPickerDialogSystemMaterial' == pages.name)) {
        console.info('get CalendarPickerDialogSystemMaterialTest state pages.name: ' + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info('push CalendarPickerDialogSystemMaterialTest success: ' + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.name   calendarPickerDialogSystemMaterialTest_0100
     * @tc.number calendarPickerDialogSystemMaterialTest_0100
     * @tc.desc   test CalendarPickerDialog systemMaterial ImmersiveStyle.ULTRA_THICK with interactive:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('calendarPickerDialogSystemMaterialTest_0100', Level.LEVEL2, async (done: Function) => {
      let tagName = 'calendarPickerDialogSystemMaterialTest_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ULTRA_THICK_interactive_true_ID'));
      await button.click();
      await Utils.sleep(1000);

      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let systemMaterial: ESObject = column.$attrs.systemMaterial;

      console.info('[' + tagName + '] dialog attrs: ' + JSON.stringify(dialog.$attrs));
      console.info('[' + tagName + '] column attrs: ' + JSON.stringify(column.$attrs));
      console.info('[' + tagName + '] systemMaterial: ' + JSON.stringify(systemMaterial));

      let retvalue: string = systemMaterial.material.immersiveOptions.style;
      console.info('[' + tagName + '] retValue: ' + JSON.stringify(retValue));

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);

      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });

    /**
     * @tc.name   calendarPickerDialogSystemMaterialTest_0200
     * @tc.number calendarPickerDialogSystemMaterialTest_0200
     * @tc.desc   test CalendarPickerDialog systemMaterial ImmersiveStyle.ULTRA_THIN with interactive:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('calendarPickerDialogSystemMaterialTest_0200', Level.LEVEL2, async (done: Function) => {
      let tagName = 'calendarPickerDialogSystemMaterialTest_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ULTRA_THIN_interactive_true_ID'));
      await button.click();
      await Utils.sleep(1000);

      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let systemMaterial: ESObject = column.$attrs.systemMaterial;

      console.info('[' + tagName + '] dialog attrs: ' + JSON.stringify(dialog.$attrs));
      console.info('[' + tagName + '] column attrs: ' + JSON.stringify(column.$attrs));
      console.info('[' + tagName + '] systemMaterial: ' + JSON.stringify(systemMaterial));

      let retvalue: string = systemMaterial.material.immersiveOptions.style;
      console.info('[' + tagName + '] retValue: ' + JSON.stringify(retValue));

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);

      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });

    /**
     * @tc.name   calendarPickerDialogSystemMaterialTest_0300
     * @tc.number calendarPickerDialogSystemMaterialTest_0300
     * @tc.desc   test CalendarPickerDialog systemMaterial ImmersiveStyle.ULTRA_THICK with interactive:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('calendarPickerDialogSystemMaterialTest_0300', Level.LEVEL2, async (done: Function) => {
      let tagName = 'calendarPickerDialogSystemMaterialTest_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ULTRA_THICK_interactive_false_ID'));
      await button.click();
      await Utils.sleep(1000);

      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let systemMaterial: ESObject = column.$attrs.systemMaterial;

      console.info('[' + tagName + '] dialog attrs: ' + JSON.stringify(dialog.$attrs));
      console.info('[' + tagName + '] column attrs: ' + JSON.stringify(column.$attrs));
      console.info('[' + tagName + '] systemMaterial: ' + JSON.stringify(systemMaterial));

      let retvalue: string = systemMaterial.material.immersiveOptions.style;
      console.info('[' + tagName + '] retValue: ' + JSON.stringify(retValue));

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);

      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });

    /**
     * @tc.name   calendarPickerDialogSystemMaterialTest_0400
     * @tc.number calendarPickerDialogSystemMaterialTest_0400
     * @tc.desc   test CalendarPickerDialog systemMaterial ImmersiveStyle.ULTRA_THICK with lightEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('calendarPickerDialogSystemMaterialTest_0400', Level.LEVEL2, async (done: Function) => {
      let tagName = 'calendarPickerDialogSystemMaterialTest_0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ULTRA_THICK_lightEffect_ID'));
      await button.click();
      await Utils.sleep(1000);

      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let systemMaterial: ESObject = column.$attrs.systemMaterial;

      console.info('[' + tagName + '] dialog attrs: ' + JSON.stringify(dialog.$attrs));
      console.info('[' + tagName + '] column attrs: ' + JSON.stringify(column.$attrs));
      console.info('[' + tagName + '] systemMaterial: ' + JSON.stringify(systemMaterial));

      let retvalue: string = systemMaterial.material.immersiveOptions.style;
      console.info('[' + tagName + '] retValue: ' + JSON.stringify(retValue));

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);

      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });

    /**
     * @tc.name   calendarPickerDialogSystemMaterialTest_0500
     * @tc.number calendarPickerDialogSystemMaterialTest_0500
     * @tc.desc   test CalendarPickerDialog systemMaterial undefined default behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('calendarPickerDialogSystemMaterialTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'calendarPickerDialogSystemMaterialTest_0500';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await Utils.sleep(1000);

      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let systemMaterial: ESObject = column.$attrs.systemMaterial;

      console.info('[' + tagName + '] dialog attrs: ' + JSON.stringify(dialog.$attrs));
      console.info('[' + tagName + '] column attrs: ' + JSON.stringify(column.$attrs));
      console.info('[' + tagName + '] systemMaterial: ' + JSON.stringify(systemMaterial));

      let retvalue: string = systemMaterial.material.immersiveOptions.style;
      console.info('[' + tagName + '] retValue: ' + JSON.stringify(retValue));

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);

      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });

    /**
     * @tc.name   calendarPickerDialogSystemMaterialTest_0600
     * @tc.number calendarPickerDialogSystemMaterialTest_0600
     * @tc.desc   test CalendarPickerDialog systemMaterial null behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('calendarPickerDialogSystemMaterialTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'calendarPickerDialogSystemMaterialTest_0600';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await Utils.sleep(1000);

      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let systemMaterial: ESObject = column.$attrs.systemMaterial;

      console.info('[' + tagName + '] dialog attrs: ' + JSON.stringify(dialog.$attrs));
      console.info('[' + tagName + '] column attrs: ' + JSON.stringify(column.$attrs));
      console.info('[' + tagName + '] systemMaterial: ' + JSON.stringify(systemMaterial));

      let retvalue: string = systemMaterial.material.immersiveOptions.style;
      console.info('[' + tagName + '] retValue: ' + JSON.stringify(retValue));

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);

      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });
  })
}
