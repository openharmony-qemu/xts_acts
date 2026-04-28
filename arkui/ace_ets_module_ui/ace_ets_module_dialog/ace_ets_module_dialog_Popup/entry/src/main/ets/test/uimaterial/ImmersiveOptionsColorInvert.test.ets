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

export default function ImmersiveOptionsColorInvertTest() {
  describe('ImmersiveOptionsColorInvertTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveOptionsColorInvert',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImmersiveOptionsColorInvert state success ' + JSON.stringify(pages));
        if (!('ImmersiveOptionsColorInvert' == pages.name)) {
          console.info('get ImmersiveOptionsColorInvert state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push ImmersiveOptionsColorInvert page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImmersiveOptionsColorInvert page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      console.info("ImmersiveOptionsColorInvertTest after each called");
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0100
     * @tc.number SUB_ACE_ImmersiveOptionsColorInvertTest_0100
     * @tc.desc   Test ImmersiveOptions.colorInvert with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          colorInvert: undefined
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsColorInvertTest_0100 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsColorInvertTest_0100 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsColorInvertTest_0100 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0100 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0200
     * @tc.number SUB_ACE_ImmersiveOptionsColorInvertTest_0200
     * @tc.desc   Test ImmersiveOptions.colorInvert with true parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          colorInvert: true
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsColorInvertTest_0200 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsColorInvertTest_0200 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsColorInvertTest_0200 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0200 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0300
     * @tc.number SUB_ACE_ImmersiveOptionsColorInvertTest_0300
     * @tc.desc   Test ImmersiveOptions.colorInvert with false parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          colorInvert: false
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsColorInvertTest_0300 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsColorInvertTest_0300 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsColorInvertTest_0300 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0300 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0400
     * @tc.number SUB_ACE_ImmersiveOptionsColorInvertTest_0400
     * @tc.desc   Test ImmersiveMaterial without colorInvert parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess = false;
      try {
        let material = new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN
        });
        constructorSuccess = true;
        console.info('ImmersiveOptionsColorInvertTest_0400 ImmersiveMaterial created successfully');
      } catch (err) {
        console.error('ImmersiveOptionsColorInvertTest_0400 constructor failed: ' + JSON.stringify(err));
      }
      expect(constructorSuccess).assertTrue();

      let strJson = getInspectorByKey('default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsColorInvertTest_0400 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0400 END');
      done();
    });

    /**
     * @tc.name   ImmersiveOptionsColorInvertTest_0500
     * @tc.number SUB_ACE_ImmersiveOptionsColorInvertTest_0500
     * @tc.desc   Test ImmersiveMaterial with empty options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsColorInvertTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ImmersiveOptionsColorInvertTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let constructorSuccess1 = false;
      let constructorSuccess2 = false;

      try {
        let material1 = new uiMaterial.ImmersiveMaterial();
        constructorSuccess1 = true;
        console.info('ImmersiveOptionsColorInvertTest_0500 ImmersiveMaterial created without options');
      } catch (err) {
        console.error('ImmersiveOptionsColorInvertTest_0500 constructor1 failed: ' + JSON.stringify(err));
      }

      try {
        let material2 = new uiMaterial.ImmersiveMaterial({});
        constructorSuccess2 = true;
        console.info('ImmersiveOptionsColorInvertTest_0500 ImmersiveMaterial created with empty options');
      } catch (err) {
        console.error('ImmersiveOptionsColorInvertTest_0500 constructor2 failed: ' + JSON.stringify(err));
      }

      expect(constructorSuccess1).assertTrue();
      expect(constructorSuccess2).assertTrue();

      let strJson = getInspectorByKey('empty');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImmersiveOptionsColorInvertTest_0500 systemMaterial: ' + JSON.stringify(obj.$attrs.systemMaterial));
      expect(obj.$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');

      console.info('ImmersiveOptionsColorInvertTest_0500 END');
      done();
    });
  })
}