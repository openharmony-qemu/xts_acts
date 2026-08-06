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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { uiMaterial } from '@kit.ArkUI';

export default function MenuSystemMaterialTest() {
    describe('MenuSystemMaterialTest', () => {
      beforeEach(async (done: Function) => {
        console.info("MenuSystemMaterialTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/MenuSystemMaterial/MenuSystemMaterialTestPage',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get MenuSystemMaterialTest state pages: " + JSON.stringify(pages));
          if (!("MenuSystemMaterialTestPage" == pages.name)) {
            console.info("get MenuSystemMaterialTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            await CommonFunc.sleep(2000);
            console.info("push MenuSystemMaterialTest success: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push MenuSystemMaterialTest page error: " + err);
          expect().assertFail();
        }
        done();
      });

      /**
      * @tc.name   MenuSystemMaterialTest_MaterialType_0100
      * @tc.number SUB_ARKUI_API_MenuSystemMaterial_MaterialType_0100
      * @tc.desc   Test MaterialType enum values and getMaterialInfo
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
      it('MenuSystemMaterialTest_MaterialType_0100', Level.LEVEL0, async (done: Function) => {
        console.info('MenuSystemMaterialTest_MaterialType_0100 START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);

        let btn = await driver.findComponent(ON.id('btn_check_type'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(1000);

        let resultText = getInspectorByKey('result_text');
        expect(JSON.parse(resultText).$attrs.content).assertContain('MaterialType.IMMERSIVE=2');
        console.info('MenuSystemMaterialTest_MaterialType_0100 result: ' + resultText);

        console.info('MenuSystemMaterialTest_MaterialType_0100 END');
        done();
      });

        /**
        * @tc.name   MenuSystemMaterialTest_Enum_0100
        * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Enum_0100
        * @tc.desc   Test ImmersiveStyle enum values via UI button
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('MenuSystemMaterialTest_Enum_0100', Level.LEVEL0, async (done: Function) => {
          console.info('MenuSystemMaterialTest_Enum_0100 START');
          let driver = await Driver.create()
          await CommonFunc.sleep(1000);

          let btn = await driver.findComponent(ON.id('btn_check_style'));
          expect(btn).not().assertUndefined();
          await btn.click();
          await CommonFunc.sleep(1000);
          await btn.click();
          // let resultText = await driver.findComponent(ON.id('result_text'));
          // expect(resultText).not().assertUndefined();
          // let text = await resultText.getText();
          let resultText = getInspectorByKey('result_text');
          expect(JSON.parse(resultText).$attrs.content).assertContain('ULTRA_THIN=0');
          expect(JSON.parse(resultText).$attrs.content).assertContain('THIN=1');
          expect(JSON.parse(resultText).$attrs.content).assertContain('REGULAR=2');
          expect(JSON.parse(resultText).$attrs.content).assertContain('THICK=3');
          expect(JSON.parse(resultText).$attrs.content).assertContain('ULTRA_THICK=4');

          // expect(text.indexOf('ULTRA_THIN=0')).assertLarger(-1);
          // expect(text.indexOf('THIN=1')).assertLarger(-1);
          // expect(text.indexOf('REGULAR=2')).assertLarger(-1);
          // expect(text.indexOf('THICK=3')).assertLarger(-1);
          // expect(text.indexOf('ULTRA_THICK=4')).assertLarger(-1);
          // console.info('MenuSystemMaterialTest_Enum_0100 result: ' + text);

          console.info('MenuSystemMaterialTest_Enum_0100 END');
          done();
        });

      /**
      * @tc.name   MenuSystemMaterialTest_Empty_0100
      * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Empty_0100
      * @tc.desc   Test uiMaterial.Material.empty is valid empty material object
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
      it('MenuSystemMaterialTest_Empty_0100', Level.LEVEL0, async (done: Function) => {
        console.info('MenuSystemMaterialTest_Empty_0100 START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);

        let btn = await driver.findComponent(ON.id('btn_check_empty'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(500);
        await btn.click();
        let resultText = getInspectorByKey('result_text');
        expect(JSON.parse(resultText).$attrs.content).assertContain('Material.empty is unknown');
        console.info('MenuSystemMaterialTest_Empty_0100 result: ' + resultText);
        console.info('MenuSystemMaterialTest_Empty_0100 END');
        done();
      });

      /**
      * @tc.name   MenuSystemMaterialTest_MaterialState_0100
      * @tc.number SUB_ARKUI_API_MenuSystemMaterial_MaterialState_0100
      * @tc.desc   Test MaterialState enum values and getMaterialInfo
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
      it('MenuSystemMaterialTest_MaterialState_0100', Level.LEVEL0, async (done: Function) => {
        console.info('MenuSystemMaterialTest_MaterialState_0100 START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);

        let btn = await driver.findComponent(ON.id('btn_check_state'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(500);

        let resultText = getInspectorByKey('result_text');
        expect(JSON.parse(resultText).$attrs.content).assertContain('MaterialState.DEFAULT=0');
        expect(JSON.parse(resultText).$attrs.content).assertContain('ENABLE=1');
        expect(JSON.parse(resultText).$attrs.content).assertContain('DISABLE=2');
        
        console.info('MenuSystemMaterialTest_MaterialState_0100 result: ' + resultText);

        console.info('MenuSystemMaterialTest_MaterialState_0100 END');
        done();
      });

      /**
      * @tc.name   MenuSystemMaterialTest_ImmersiveStyle_0100
      * @tc.number SUB_ARKUI_API_MenuSystemMaterial_ImmersiveStyle_0100
      * @tc.desc   Test ImmersiveStyle.ULTRA_THIN enum value equals 0
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
      it('MenuSystemMaterialTest_ImmersiveStyle_0100', Level.LEVEL0, async (done: Function) => {
       console.info('MenuSystemMaterialTest_ImmersiveStyle_0100 START');
       expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
       console.info('ImmersiveStyle.ULTRA_THIN = ' + uiMaterial.ImmersiveStyle.ULTRA_THIN);
       done();
      });

      /**
     * @tc.name   MenuSystemMaterialTest_ImmersiveStyle_0200
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_ImmersiveStyle_0200
     * @tc.desc   Test ImmersiveStyle.THIN enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_ImmersiveStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_ImmersiveStyle_0200 START');
      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
      console.info('ImmersiveStyle.THIN = ' + uiMaterial.ImmersiveStyle.THIN);
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_ImmersiveStyle_0300
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_ImmersiveStyle_0300
     * @tc.desc   Test ImmersiveStyle.REGULAR enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_ImmersiveStyle_0300', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_ImmersiveStyle_0300 START');
      expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
      console.info('ImmersiveStyle.REGULAR = ' + uiMaterial.ImmersiveStyle.REGULAR);
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_ImmersiveStyle_0400
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_ImmersiveStyle_0400
     * @tc.desc   Test ImmersiveStyle.THICK enum value equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_ImmersiveStyle_0400', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_ImmersiveStyle_0400 START');
      expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
      console.info('ImmersiveStyle.THICK = ' + uiMaterial.ImmersiveStyle.THICK);
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_ImmersiveStyle_0500
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_ImmersiveStyle_0500
     * @tc.desc   Test ImmersiveStyle.ULTRA_THICK enum value equals 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_ImmersiveStyle_0500', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_ImmersiveStyle_0500 START');
      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      console.info('ImmersiveStyle.ULTRA_THICK = ' + uiMaterial.ImmersiveStyle.ULTRA_THICK);
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_MaterialLevel_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_MaterialLevel_0100
     * @tc.desc   Test MaterialLevel.EXQUISITE enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_MaterialLevel_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_MaterialLevel_0100 START');
      expect(uiMaterial.MaterialLevel.EXQUISITE).assertEqual(0);
      console.info('MaterialLevel.EXQUISITE = ' + uiMaterial.MaterialLevel.EXQUISITE);
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_MaterialLevel_0200
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_MaterialLevel_0200
     * @tc.desc   Test MaterialLevel.GENTLE enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_MaterialLevel_0200', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_MaterialLevel_0200 START');
      expect(uiMaterial.MaterialLevel.GENTLE).assertEqual(1);
      console.info('MaterialLevel.GENTLE = ' + uiMaterial.MaterialLevel.GENTLE);
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_MaterialLevel_0300
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_MaterialLevel_0300
     * @tc.desc   Test MaterialLevel.SMOOTH enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_MaterialLevel_0300', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_MaterialLevel_0300 START');
      expect(uiMaterial.MaterialLevel.SMOOTH).assertEqual(2);
      console.info('MaterialLevel.SMOOTH = ' + uiMaterial.MaterialLevel.SMOOTH);
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_getGlobalMaterialLevel_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_getGlobalMaterialLevel_0100
     * @tc.desc   Test getGlobalMaterialLevel returns a valid MaterialLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_getGlobalMaterialLevel_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_getGlobalMaterialLevel_0100 START');
      let level: uiMaterial.MaterialLevel = uiMaterial.getGlobalMaterialLevel();
      console.info('getGlobalMaterialLevel = ' + level);
      expect(level === uiMaterial.MaterialLevel.EXQUISITE ||
        level === uiMaterial.MaterialLevel.GENTLE ||
        level === uiMaterial.MaterialLevel.SMOOTH).assertTrue();
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_isImmersiveMaterialSupported_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_isImmersiveMaterialSupported_0100
     * @tc.desc   Test isImmersiveMaterialSupported returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_isImmersiveMaterialSupported_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_isImmersiveMaterialSupported_0100 START');
      let supported: boolean = uiMaterial.isImmersiveMaterialSupported();
      console.info('isImmersiveMaterialSupported = ' + supported);
      expect(supported === true || supported === false).assertTrue();
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Select_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Select_0100
     * @tc.desc   Test Select with menuSystemMaterial ULTRA_THIN style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Select_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Select_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_ultra_thin'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Select_0100 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Select_0200
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Select_0200
     * @tc.desc   Test Select with menuSystemMaterial THIN style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Select_0200', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Select_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_thin'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Select_0200 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Select_0300
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Select_0300
     * @tc.desc   Test Select with menuSystemMaterial REGULAR style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Select_0300', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Select_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_regular'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Select_0300 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Select_0400
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Select_0400
     * @tc.desc   Test Select with menuSystemMaterial THICK style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Select_0400', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Select_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_thick'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Select_0400 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Select_0500
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Select_0500
     * @tc.desc   Test Select with menuSystemMaterial ULTRA_THICK style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Select_0500', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Select_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_ultra_thick'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Select_0500 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Select_0600
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Select_0600
     * @tc.desc   Test Select with menuSystemMaterial default ImmersiveMaterial constructor (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Select_0600', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Select_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_default_options'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Select_0600 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Options_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Options_0100
     * @tc.desc   Test menuSystemMaterial with materialColor parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Options_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Options_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_material_color'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Options_0100 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Options_0200
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Options_0200
     * @tc.desc   Test menuSystemMaterial with colorInvert=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Options_0200', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Options_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_color_invert_true'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Options_0200 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Options_0300
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Options_0300
     * @tc.desc   Test menuSystemMaterial with colorInvert=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Options_0300', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Options_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_color_invert_false'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Options_0300 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Options_0400
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Options_0400
     * @tc.desc   Test menuSystemMaterial with applyShadow=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Options_0400', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Options_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_apply_shadow_true'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Options_0400 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Options_0500
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Options_0500
     * @tc.desc   Test menuSystemMaterial with applyShadow=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Options_0500', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Options_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_apply_shadow_false'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Options_0500 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Options_0600
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Options_0600
     * @tc.desc   Test menuSystemMaterial with all ImmersiveOptions params combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Options_0600', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Options_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_all_options'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Options_0600 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Special_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Special_0100
     * @tc.desc   Test menuSystemMaterial with undefined (no material effect per docs)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Special_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Special_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_undefined'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Special_0100 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Special_0200
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Special_0200
     * @tc.desc   Test menuSystemMaterial with Material.empty (close system material effect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Special_0200', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Special_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let selectComp = await driver.findComponent(ON.id('select_empty'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Special_0200 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_Return_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_Return_0100
     * @tc.desc   Test menuSystemMaterial returns SelectAttribute for chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_Return_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_Return_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_check_return'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = getInspectorByKey('result_text');
      expect(JSON.parse(resultText).$attrs.content).assertContain('SelectAttribute');
      
      console.info('MenuSystemMaterialTest_Return_0100 result: ' + resultText);

      let selectComp = await driver.findComponent(ON.id('select_chain'));
      expect(selectComp).not().assertUndefined();
      await selectComp.click();
      await CommonFunc.sleep(1500);

      console.info('MenuSystemMaterialTest_Return_0100 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_getMaterialInfo_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_getMaterialInfo_0100
     * @tc.desc   Test uiMaterial.getMaterialInfo returns MaterialInfo object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_getMaterialInfo_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_getMaterialInfo_0100 START');
      let info = uiMaterial.getMaterialInfo();
      expect(info).not().assertUndefined();
      expect(info.state).not().assertUndefined();
      expect(info.type).not().assertUndefined();
      console.info('getMaterialInfo: state=' + info.state + ', type=' + info.type);
      console.info('MenuSystemMaterialTest_getMaterialInfo_0100 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_ImmersiveMaterial_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_ImmersiveMaterial_0100
     * @tc.desc   Test ImmersiveMaterial constructor with default options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_ImmersiveMaterial_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_ImmersiveMaterial_0100 START');
      let mat = new uiMaterial.ImmersiveMaterial();
      expect(mat).not().assertUndefined();
      console.info('ImmersiveMaterial default constructor: ' + JSON.stringify(mat));
      console.info('MenuSystemMaterialTest_ImmersiveMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_ImmersiveMaterial_0200
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_ImmersiveMaterial_0200
     * @tc.desc   Test ImmersiveMaterial constructor with style option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_ImmersiveMaterial_0200', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_ImmersiveMaterial_0200 START');
      let mat = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THICK
      });
      expect(mat).not().assertUndefined();
      console.info('MenuSystemMaterialTest_ImmersiveMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_ImmersiveMaterial_0300
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_ImmersiveMaterial_0300
     * @tc.desc   Test ImmersiveMaterial constructor with all options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_ImmersiveMaterial_0300', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_ImmersiveMaterial_0300 START');
      let mat = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.REGULAR,
        materialColor: '#33FF0000',
        colorInvert: true,
        applyShadow: false
      });
      expect(mat).not().assertUndefined();
      console.info('MenuSystemMaterialTest_ImmersiveMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_MaterialStateEnum_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_MaterialStateEnum_0100
     * @tc.desc   Test MaterialState enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_MaterialStateEnum_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_MaterialStateEnum_0100 START');
      expect(uiMaterial.MaterialState.DEFAULT).assertEqual(0);
      expect(uiMaterial.MaterialState.ENABLE).assertEqual(1);
      expect(uiMaterial.MaterialState.DISABLE).assertEqual(2);
      console.info('MenuSystemMaterialTest_MaterialStateEnum_0100 END');
      done();
    });

    /**
     * @tc.name   MenuSystemMaterialTest_MaterialTypeEnum_0100
     * @tc.number SUB_ARKUI_API_MenuSystemMaterial_MaterialTypeEnum_0100
     * @tc.desc   Test MaterialType enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuSystemMaterialTest_MaterialTypeEnum_0100', Level.LEVEL0, async (done: Function) => {
      console.info('MenuSystemMaterialTest_MaterialTypeEnum_0100 START');
      expect(uiMaterial.MaterialType.IMMERSIVE).assertEqual(2);
      console.info('MenuSystemMaterialTest_MaterialTypeEnum_0100 END');
      done();
    });

    }) 
}

