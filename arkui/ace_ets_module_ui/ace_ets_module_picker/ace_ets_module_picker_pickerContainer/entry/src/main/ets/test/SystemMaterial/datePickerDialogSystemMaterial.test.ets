import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import CommonFunc from '../../MainAbility/common/Common';
import { uiMaterial } from '@kit.ArkUI';

let isSupported: boolean = uiMaterial.isImmersiveMaterialSupported(); // 是否支持沉浸式材质由设备决定，应用运行后不会改变

export default function DatePickerDialogSystemMaterialTest() {
  describe('DatePickerDialogSystemMaterialTest', () => {

    beforeAll(async () => {
      console.info('DatePickerDialogSystemMaterialTest beforeAll start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SystemMaterial/datePickerDialogSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('datePickerDialogSystemMaterial' == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push DatePickerDialogSystemMaterialTest page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('DatePickerDialogSystemMaterialTest afterEach called');
    });

    /**
     * @tc.name   DatePickerDialogSystemMaterialTest_001
     * @tc.number DatePickerDialogSystemMaterialTest_001
     * @tc.desc   To test the DatePickerDialog systemMaterial with ImmersiveStyle.ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogSystemMaterialTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerDialogSystemMaterialTest_001 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ultraThickID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];

      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('DatePickerDialogSystemMaterialTest_001 systemMaterial: ' + JSON.stringify(systemMaterial));

      if(isSupported){
        let retValue: ESObject = column.$attrs.systemMaterial.material.immersiveOptions.style;
 	      console.info('DatePickerDialogSystemMaterialTest_001 retValue: ' + JSON.stringify(retValue));
      }

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      console.info('DatePickerDialogSystemMaterialTest_001 END');
      done();
    })

    /**
     * @tc.name   DatePickerDialogSystemMaterialTest_002
     * @tc.number DatePickerDialogSystemMaterialTest_002
     * @tc.desc   To test the DatePickerDialog systemMaterial with ImmersiveStyle.ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogSystemMaterialTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerDialogSystemMaterialTest_002 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ultraThinID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];

      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('DatePickerDialogSystemMaterialTest_002 systemMaterial: ' + JSON.stringify(systemMaterial));

      if(isSupported){
        let retValue: ESObject = column.$attrs.systemMaterial.material.immersiveOptions.style;
 	      console.info('DatePickerDialogSystemMaterialTest_002 retValue: ' + JSON.stringify(retValue));
      }

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      console.info('DatePickerDialogSystemMaterialTest_002 END');
      done();
    })

    /**
     * @tc.name   DatePickerDialogSystemMaterialTest_003
     * @tc.number DatePickerDialogSystemMaterialTest_003
     * @tc.desc   To test the DatePickerDialog systemMaterial with undefined (default ULTRA_THICK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogSystemMaterialTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerDialogSystemMaterialTest_003 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];

      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('DatePickerDialogSystemMaterialTest_003 systemMaterial: ' + JSON.stringify(systemMaterial));

      if(isSupported){
        let retValue: ESObject = column.$attrs.systemMaterial.material.immersiveOptions.style;
 	      console.info('DatePickerDialogSystemMaterialTest_003 retValue: ' + JSON.stringify(retValue));
      }

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      console.info('DatePickerDialogSystemMaterialTest_003 END');
      done();
    })

    /**
     * @tc.name   DatePickerDialogSystemMaterialTest_004
     * @tc.number DatePickerDialogSystemMaterialTest_004
     * @tc.desc   To test the DatePickerDialog systemMaterial with null (default ULTRA_THICK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogSystemMaterialTest_004', Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerDialogSystemMaterialTest_004 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];

      let systemMaterial: ESObject = column.$attrs.systemMaterial;
      console.info('DatePickerDialogSystemMaterialTest_004 systemMaterial: ' + JSON.stringify(systemMaterial));

      if(isSupported){
        let retValue: ESObject = column.$attrs.systemMaterial.material.immersiveOptions.style;
 	      console.info('DatePickerDialogSystemMaterialTest_004 retValue: ' + JSON.stringify(retValue));
      }

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
	    expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
	    expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
	    expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
	    expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      console.info('DatePickerDialogSystemMaterialTest_004 END');
      done();
    })
  })
}
