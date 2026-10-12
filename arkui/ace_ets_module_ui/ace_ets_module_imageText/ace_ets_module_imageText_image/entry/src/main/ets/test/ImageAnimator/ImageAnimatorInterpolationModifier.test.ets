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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic'
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageAnimatorInterpolationModifierTest() {
  describe('ImageAnimatorInterpolationModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAnimatorInterpolationModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/ImageAnimatorInterpolationModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageAnimatorInterpolationModifierTest state pages:' + JSON.stringify(pages));
        if (!('ImageAnimatorInterpolationModifierPage' == pages.name)) {
          console.info('get ImageAnimatorInterpolationModifierTest state pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push ImageAnimatorInterpolationModifierTest success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAnimatorInterpolationModifierTest page error:' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageAnimatorInterpolationModifierTest afterEach called');
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0100
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0100
     * @tc.desc   Test interpolation property initial value set via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0100] initial interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.None');
        console.info('[ImageAnimatorInterpolationModifierTest_0100] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0100] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0200
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0200
     * @tc.desc   Test interpolation property set to ImageInterpolation.Low via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0200] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0200] initial interpolation: ' + obj.$attrs.interpolation);

        let btnLow = await driver.findComponent(ON.id('btn_low'));
        expect(btnLow != null).assertTrue();
        await btnLow.click();
        await CommonFunc.sleep(1000);

        let strJson2 = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorInterpolationModifierTest_0200] after click interpolation: ' + obj2.$attrs.interpolation);
        expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationModifierTest_0200] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0200] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0300
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0300
     * @tc.desc   Test interpolation property set to ImageInterpolation.Medium via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0300] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0300] initial interpolation: ' + obj.$attrs.interpolation);

        let btnMedium = await driver.findComponent(ON.id('btn_medium'));
        expect(btnMedium != null).assertTrue();
        await btnMedium.click();
        await CommonFunc.sleep(1000);

        let strJson2 = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorInterpolationModifierTest_0300] after click interpolation: ' + obj2.$attrs.interpolation);
        expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.Medium');
        console.info('[ImageAnimatorInterpolationModifierTest_0300] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0300] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0400
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0400
     * @tc.desc   Test interpolation property set to ImageInterpolation.High via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0400] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0400] initial interpolation: ' + obj.$attrs.interpolation);

        let btnHigh = await driver.findComponent(ON.id('btn_high'));
        expect(btnHigh != null).assertTrue();
        await btnHigh.click();
        await CommonFunc.sleep(1000);

        let strJson2 = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorInterpolationModifierTest_0400] after click interpolation: ' + obj2.$attrs.interpolation);
        expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.High');
        console.info('[ImageAnimatorInterpolationModifierTest_0400] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0400] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0500
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0500
     * @tc.desc   Test dynamic switch of interpolation from High to None via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0500] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);

        let btnHigh = await driver.findComponent(ON.id('btn_high'));
        expect(btnHigh != null).assertTrue();
        await btnHigh.click();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0500] after High click interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.High');

        let btnNone = await driver.findComponent(ON.id('btn_none'));
        expect(btnNone != null).assertTrue();
        await btnNone.click();
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorInterpolationModifierTest_0500] after None click interpolation: ' + obj2.$attrs.interpolation);
        expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.None');
        console.info('[ImageAnimatorInterpolationModifierTest_0500] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0500] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0600
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0600
     * @tc.desc   Test interpolation property with invalid enum value 99 via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0600] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0600] initial interpolation: ' + obj.$attrs.interpolation);

        let btnInvalidEnum = await driver.findComponent(ON.id('btn_invalidEnum'));
        expect(btnInvalidEnum != null).assertTrue();
        await btnInvalidEnum.click();
        await CommonFunc.sleep(1000);

        let strJson2 = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorInterpolationModifierTest_0600] after invalid enum click interpolation: ' + obj2.$attrs.interpolation);
        expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationModifierTest_0600] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0600] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0700
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0700
     * @tc.desc   Test interpolation property with invalid negative value -1 via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0700] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0700] initial interpolation: ' + obj.$attrs.interpolation);

        let btnInvalidNegative = await driver.findComponent(ON.id('btn_invalidNegative'));
        expect(btnInvalidNegative != null).assertTrue();
        await btnInvalidNegative.click();
        await CommonFunc.sleep(1000);

        let strJson2 = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorInterpolationModifierTest_0700] after invalid negative click interpolation: ' + obj2.$attrs.interpolation);
        expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationModifierTest_0700] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0700] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0800
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0800
     * @tc.desc   Test interpolation property with undefined value via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0800] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0800] initial interpolation: ' + obj.$attrs.interpolation);

        let btnUndefined = await driver.findComponent(ON.id('btn_undefined'));
        expect(btnUndefined != null).assertTrue();
        await btnUndefined.click();
        await CommonFunc.sleep(1000);

        let strJson2 = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorInterpolationModifierTest_0800] after undefined click interpolation: ' + obj2.$attrs.interpolation);
        expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationModifierTest_0800] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0800] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationModifierTest_0900
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_MODIFIER_0900
     * @tc.desc   Test interpolation property with null value via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationModifierTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationModifierTest_0900] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationModifierTest_0900] initial interpolation: ' + obj.$attrs.interpolation);

        let btnNull = await driver.findComponent(ON.id('btn_null'));
        expect(btnNull != null).assertTrue();
        await btnNull.click();
        await CommonFunc.sleep(1000);

        let strJson2 = getInspectorByKey('imageAnimatorInterpolationModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorInterpolationModifierTest_0900] after null click interpolation: ' + obj2.$attrs.interpolation);
        expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationModifierTest_0900] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationModifierTest_0900] ERR ' + JSON.stringify(err));
      }
      done();
    });
  })
}
