/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'
import { uiMaterial } from '@kit.ArkUI';

export default function ImmersiveOptionsMaterialColorTest() {
  describe('ImmersiveOptionsMaterialColorTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveOptionsMaterialColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImmersiveOptionsMaterialColor state success ' + JSON.stringify(pages));
        if (!('ImmersiveOptionsMaterialColor' == pages.name)) {
          console.info('get ImmersiveOptionsMaterialColor state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push ImmersiveOptionsMaterialColor page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImmersiveOptionsMaterialColor page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      console.info("ImmersiveOptionsMaterialColorTest after each called");
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0100
     * @tc.number SUB_ACE_ImmersiveOptionsMaterialColorTest_0100
     * @tc.desc   Test ImmersiveOptions.materialColor with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: undefined
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsMaterialColorTest_0100 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0100 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsMaterialColorTest_0100 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0100 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0200
     * @tc.number SUB_ACE_ImmersiveOptionsMaterialColorTest_0200
     * @tc.desc   Test ImmersiveOptions.materialColor with Color.Transparent parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: Color.Transparent
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsMaterialColorTest_0200 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0200 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('transparent');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsMaterialColorTest_0200 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0200 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0300
     * @tc.number SUB_ACE_ImmersiveOptionsMaterialColorTest_0300
     * @tc.desc   Test ImmersiveOptions.materialColor with string '#80FF0000' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: '#80FF0000'
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsMaterialColorTest_0300 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0300 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('string_red');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsMaterialColorTest_0300 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0300 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0400
     * @tc.number SUB_ACE_ImmersiveOptionsMaterialColorTest_0400
     * @tc.desc   Test ImmersiveOptions.materialColor with string 'rgba(0,255,0,0.5)' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: 'rgba(0,255,0,0.5)'
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsMaterialColorTest_0400 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0400 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('string_rgba');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsMaterialColorTest_0400 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0400 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0500
     * @tc.number SUB_ACE_ImmersiveOptionsMaterialColorTest_0500
     * @tc.desc   Test ImmersiveOptions.materialColor with number 0x800000FF parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: 0x800000FF
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsMaterialColorTest_0500 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0500 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('number_color');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsMaterialColorTest_0500 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0500 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0600
     * @tc.number SUB_ACE_ImmersiveOptionsMaterialColorTest_0600
     * @tc.desc   Test ImmersiveOptions.materialColor with Color.Blue parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0600 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: Color.Blue
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsMaterialColorTest_0600 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0600 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('color_enum');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsMaterialColorTest_0600 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0600 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0700
     * @tc.number SUB_ACE_ImmersiveOptionsMaterialColorTest_0700
     * @tc.desc   Test ImmersiveOptions.materialColor with string '#80FFFFFF' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0700 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: '#80FFFFFF'
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsMaterialColorTest_0700 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0700 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('color_white');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsMaterialColorTest_0700 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0700 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0800
     * @tc.number SUB_ACE_ImmersiveOptionsMaterialColorTest_0800
     * @tc.desc   Test ImmersiveMaterial without materialColor parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsMaterialColorTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsMaterialColorTest_0800 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess1 = false;
      let constructorSuccess2 = false;
      let constructorSuccess3 = false;

      try {
        let material1 = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN
        });
        constructorSuccess1 = true;
        console.info('ImmersiveOptionsMaterialColorTest_0800 ImmersiveMaterial created without materialColor');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0800 constructor1 failed: ' + JSON.stringify(err));
      }

      try {
        let material2 = new uiMaterial.ImmersiveMaterial();
        constructorSuccess2 = true;
        console.info('ImmersiveOptionsMaterialColorTest_0800 ImmersiveMaterial created without options');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0800 constructor2 failed: ' + JSON.stringify(err));
      }

      try {
        let material3 = new uiMaterial.ImmersiveMaterial({});
        constructorSuccess3 = true;
        console.info('ImmersiveOptionsMaterialColorTest_0800 ImmersiveMaterial created with empty options');
      } catch (err) {
        console.error('ImmersiveOptionsMaterialColorTest_0800 constructor3 failed: ' + JSON.stringify(err));
      }

      expect(constructorSuccess1).assertTrue();
      expect(constructorSuccess2).assertTrue();
      expect(constructorSuccess3).assertTrue();

      let strJson = getInspectorByKey('default_info');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsMaterialColorTest_0800 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsMaterialColorTest_0800 END');
      done();
    });
  })
}