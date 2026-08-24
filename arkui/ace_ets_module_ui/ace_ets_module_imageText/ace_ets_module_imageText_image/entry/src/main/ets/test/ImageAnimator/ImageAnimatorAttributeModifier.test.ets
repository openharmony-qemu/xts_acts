/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function ImageAnimatorAttributeModifierTest() {
  describe('ImageAnimatorAttributeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAnimatorAttributeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/ImageAnimatorAttributeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageAnimatorAttributeModifierTest state pages:' + JSON.stringify(pages));
        if (!('ImageAnimatorAttributeModifierPage' == pages.name)) {
          console.info('get ImageAnimatorAttributeModifierTest state pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push ImageAnimatorAttributeModifierTest success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAnimatorAttributeModifierTest page error:' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageAnimatorAttributeModifierTest afterEach called');
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0100
     * @tc.number ImageAnimatorAttributeModifierTest_0100
     * @tc.desc   Test state property set via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0100] initial state: ' + obj.$attrs.state);
        expect(obj.$attrs.state).assertEqual('AnimationStatus.Initial');

        globalThis.value.message.notify({
          name: 'state', value: AnimationStatus.Running
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_0100] changed state: ' + obj2.$attrs.state);
        expect(obj2.$attrs.state).assertEqual('AnimationStatus.Running');
        console.info('[ImageAnimatorAttributeModifierTest_0100] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0100] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0200
     * @tc.number ImageAnimatorAttributeModifierTest_0200
     * @tc.desc   Test duration property set via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0200] initial duration: ' + obj.$attrs.duration);
        expect(obj.$attrs.duration).assertEqual('1000');

        globalThis.value.message.notify({
          name: 'duration', value: 5000
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_0200] changed duration: ' + obj2.$attrs.duration);
        expect(obj2.$attrs.duration).assertEqual('5000');
        console.info('[ImageAnimatorAttributeModifierTest_0200] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0200] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0300
     * @tc.number ImageAnimatorAttributeModifierTest_0300
     * @tc.desc   Test reverse property set via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0300] initial reverse: ' + obj.$attrs.reverse);
        expect(obj.$attrs.reverse).assertEqual('false');

        globalThis.value.message.notify({
          name: 'reverse', value: true
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_0300] changed reverse: ' + obj2.$attrs.reverse);
        expect(obj2.$attrs.reverse).assertEqual('true');
        console.info('[ImageAnimatorAttributeModifierTest_0300] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0300] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0400
     * @tc.number ImageAnimatorAttributeModifierTest_0400
     * @tc.desc   Test fixedSize property set via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0400] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0400] initial fixedSize: ' + obj.$attrs.fixedSize);
        expect(obj.$attrs.fixedSize).assertEqual('true');

        globalThis.value.message.notify({
          name: 'fixedSize', value: false
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_0400] changed fixedSize: ' + obj2.$attrs.fixedSize);
        expect(obj2.$attrs.fixedSize).assertEqual('false');
        console.info('[ImageAnimatorAttributeModifierTest_0400] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0400] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0500
     * @tc.number ImageAnimatorAttributeModifierTest_0500
     * @tc.desc   Test fillMode property set via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0500] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0500] initial fillMode: ' + obj.$attrs.fillMode);
        expect(obj.$attrs.fillMode).assertEqual('FillMode.Forwards');

        globalThis.value.message.notify({
          name: 'fillMode', value: FillMode.None
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_0500] changed fillMode: ' + obj2.$attrs.fillMode);
        expect(obj2.$attrs.fillMode).assertEqual('FillMode.None');
        console.info('[ImageAnimatorAttributeModifierTest_0500] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0500] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0600
     * @tc.number ImageAnimatorAttributeModifierTest_0600
     * @tc.desc   Test iterations property set via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0600] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0600] initial iterations: ' + obj.$attrs.iterations);
        expect(obj.$attrs.iterations).assertEqual('1');

        globalThis.value.message.notify({
          name: 'iterations', value: -1
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_0600] changed iterations: ' + obj2.$attrs.iterations);
        expect(obj2.$attrs.iterations).assertEqual('-1');
        console.info('[ImageAnimatorAttributeModifierTest_0600] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0600] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0700
     * @tc.number ImageAnimatorAttributeModifierTest_0700
     * @tc.desc   Test monitorInvisibleArea property set via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0700] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0700] initial monitorInvisibleArea: ' + obj.$attrs.monitorInvisibleArea);
        expect(obj.$attrs.monitorInvisibleArea).assertEqual('false');

        globalThis.value.message.notify({
          name: 'monitorInvisibleArea', value: true
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_0700] changed monitorInvisibleArea: ' + obj2.$attrs.monitorInvisibleArea);
        expect(obj2.$attrs.monitorInvisibleArea).assertEqual('true');
        console.info('[ImageAnimatorAttributeModifierTest_0700] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0700] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0800
     * @tc.number ImageAnimatorAttributeModifierTest_0800
     * @tc.desc   Test multiple properties change simultaneously via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0800] START');
      try {
        await CommonFunc.sleep(1000);
        globalThis.value.message.notify({
          name: 'state', value: AnimationStatus.Running
        })
        await CommonFunc.sleep(500);
        globalThis.value.message.notify({
          name: 'duration', value: 3000
        })
        await CommonFunc.sleep(500);
        globalThis.value.message.notify({
          name: 'reverse', value: true
        })
        await CommonFunc.sleep(500);
        globalThis.value.message.notify({
          name: 'fixedSize', value: false
        })
        await CommonFunc.sleep(500);
        globalThis.value.message.notify({
          name: 'fillMode', value: FillMode.Both
        })
        await CommonFunc.sleep(500);
        globalThis.value.message.notify({
          name: 'iterations', value: 3
        })
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0800] state: ' + obj.$attrs.state);
        console.info('[ImageAnimatorAttributeModifierTest_0800] duration: ' + obj.$attrs.duration);
        console.info('[ImageAnimatorAttributeModifierTest_0800] reverse: ' + obj.$attrs.reverse);
        console.info('[ImageAnimatorAttributeModifierTest_0800] fixedSize: ' + obj.$attrs.fixedSize);
        console.info('[ImageAnimatorAttributeModifierTest_0800] fillMode: ' + obj.$attrs.fillMode);
        console.info('[ImageAnimatorAttributeModifierTest_0800] iterations: ' + obj.$attrs.iterations);
        expect(obj.$attrs.state).assertEqual('AnimationStatus.Running');
        expect(obj.$attrs.duration).assertEqual('3000');
        expect(obj.$attrs.reverse).assertEqual('true');
        expect(obj.$attrs.fixedSize).assertEqual('false');
        expect(obj.$attrs.fillMode).assertEqual('FillMode.Both');
        expect(obj.$attrs.iterations).assertEqual('3');
        console.info('[ImageAnimatorAttributeModifierTest_0800] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0800] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_0900
     * @tc.number ImageAnimatorAttributeModifierTest_0900
     * @tc.desc   Test state change to Paused via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_0900] START');
      try {
        await CommonFunc.sleep(1000);
        globalThis.value.message.notify({
          name: 'state', value: AnimationStatus.Running
        })
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_0900] running state: ' + obj.$attrs.state);
        expect(obj.$attrs.state).assertEqual('AnimationStatus.Running');

        globalThis.value.message.notify({
          name: 'state', value: AnimationStatus.Paused
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_0900] paused state: ' + obj2.$attrs.state);
        expect(obj2.$attrs.state).assertEqual('AnimationStatus.Paused');
        console.info('[ImageAnimatorAttributeModifierTest_0900] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_0900] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1000
     * @tc.number ImageAnimatorAttributeModifierTest_1000
     * @tc.desc   Test state change to Stopped via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1000] START');
      try {
        await CommonFunc.sleep(1000);
        globalThis.value.message.notify({
          name: 'state', value: AnimationStatus.Running
        })
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1000] running state: ' + obj.$attrs.state);
        expect(obj.$attrs.state).assertEqual('AnimationStatus.Running');

        globalThis.value.message.notify({
          name: 'state', value: AnimationStatus.Stopped
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1000] stopped state: ' + obj2.$attrs.state);
        expect(obj2.$attrs.state).assertEqual('AnimationStatus.Stopped');
        console.info('[ImageAnimatorAttributeModifierTest_1000] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1000] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1100
     * @tc.number ImageAnimatorAttributeModifierTest_1100
     * @tc.desc   Test fillMode change to Backwards via applyNormalAttribute of AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1100] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1100] initial fillMode: ' + obj.$attrs.fillMode);
        expect(obj.$attrs.fillMode).assertEqual('FillMode.Forwards');

        globalThis.value.message.notify({
          name: 'fillMode', value: FillMode.Backwards
        })
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1100] changed fillMode: ' + obj2.$attrs.fillMode);
        expect(obj2.$attrs.fillMode).assertEqual('FillMode.Backwards');
        console.info('[ImageAnimatorAttributeModifierTest_1100] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1100] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1200
     * @tc.number ImageAnimatorAttributeModifierTest_1200
     * @tc.desc   Test button click triggers modifier state change to Running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1200] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1200] initial state: ' + obj.$attrs.state);
        expect(obj.$attrs.state).assertEqual('AnimationStatus.Initial');

        let btnStart = await driver.findComponent(ON.id('btn_start'));
        expect(btnStart != null).assertTrue();
        await btnStart.click();
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1200] after click state: ' + obj2.$attrs.state);
        expect(obj2.$attrs.state).assertEqual('AnimationStatus.Running');
        console.info('[ImageAnimatorAttributeModifierTest_1200] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1200] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1300
     * @tc.number ImageAnimatorAttributeModifierTest_1300
     * @tc.desc   Test button click triggers modifier reverse change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1300] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1300] initial reverse: ' + obj.$attrs.reverse);
        expect(obj.$attrs.reverse).assertEqual('false');

        let btnReverse = await driver.findComponent(ON.id('btn_reverse'));
        expect(btnReverse != null).assertTrue();
        await btnReverse.click();
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1300] after click reverse: ' + obj2.$attrs.reverse);
        expect(obj2.$attrs.reverse).assertEqual('true');
        console.info('[ImageAnimatorAttributeModifierTest_1300] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1300] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1400
     * @tc.number ImageAnimatorAttributeModifierTest_1400
     * @tc.desc   Test button click triggers modifier fixedSize change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1400] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1400] initial fixedSize: ' + obj.$attrs.fixedSize);
        expect(obj.$attrs.fixedSize).assertEqual('true');

        let btnFixedSize = await driver.findComponent(ON.id('btn_fixedSize'));
        expect(btnFixedSize != null).assertTrue();
        await btnFixedSize.click();
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1400] after click fixedSize: ' + obj2.$attrs.fixedSize);
        expect(obj2.$attrs.fixedSize).assertEqual('false');
        console.info('[ImageAnimatorAttributeModifierTest_1400] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1400] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1500
     * @tc.number ImageAnimatorAttributeModifierTest_1500
     * @tc.desc   Test button click triggers modifier iterations change to infinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1500', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1500] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1500] initial iterations: ' + obj.$attrs.iterations);
        expect(obj.$attrs.iterations).assertEqual('1');

        let btnInfinite = await driver.findComponent(ON.id('btn_infinite'));
        expect(btnInfinite != null).assertTrue();
        await btnInfinite.click();
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1500] after click iterations: ' + obj2.$attrs.iterations);
        expect(obj2.$attrs.iterations).assertEqual('-1');
        console.info('[ImageAnimatorAttributeModifierTest_1500] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1500] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1600
     * @tc.number ImageAnimatorAttributeModifierTest_1600
     * @tc.desc   Test button click triggers modifier fillMode change to None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1600', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1600] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1600] initial fillMode: ' + obj.$attrs.fillMode);
        expect(obj.$attrs.fillMode).assertEqual('FillMode.Forwards');

        let btnFillNone = await driver.findComponent(ON.id('btn_fillNone'));
        expect(btnFillNone != null).assertTrue();
        await btnFillNone.click();
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1600] after click fillMode: ' + obj2.$attrs.fillMode);
        expect(obj2.$attrs.fillMode).assertEqual('FillMode.None');
        console.info('[ImageAnimatorAttributeModifierTest_1600] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1600] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1700
     * @tc.number ImageAnimatorAttributeModifierTest_1700
     * @tc.desc   Test button click triggers modifier duration change to 5000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1700', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1700] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1700] initial duration: ' + obj.$attrs.duration);
        expect(obj.$attrs.duration).assertEqual('1000');

        let btnDuration = await driver.findComponent(ON.id('btn_duration'));
        expect(btnDuration != null).assertTrue();
        await btnDuration.click();
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1700] after click duration: ' + obj2.$attrs.duration);
        expect(obj2.$attrs.duration).assertEqual('5000');
        console.info('[ImageAnimatorAttributeModifierTest_1700] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1700] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorAttributeModifierTest_1800
     * @tc.number ImageAnimatorAttributeModifierTest_1800
     * @tc.desc   Test button click triggers modifier monitorInvisibleArea change to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorAttributeModifierTest_1800', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorAttributeModifierTest_1800] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorModifier');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorAttributeModifierTest_1800] initial monitorInvisibleArea: ' + obj.$attrs.monitorInvisibleArea);
        expect(obj.$attrs.monitorInvisibleArea).assertEqual('false');

        let btnMonitor = await driver.findComponent(ON.id('btn_monitor'));
        expect(btnMonitor != null).assertTrue();
        await btnMonitor.click();
        await CommonFunc.sleep(1000);
        let strJson2 = getInspectorByKey('imageAnimatorModifier');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info('[ImageAnimatorAttributeModifierTest_1800] after click monitorInvisibleArea: ' + obj2.$attrs.monitorInvisibleArea);
        expect(obj2.$attrs.monitorInvisibleArea).assertEqual('true');
        console.info('[ImageAnimatorAttributeModifierTest_1800] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorAttributeModifierTest_1800] ERR ' + JSON.stringify(err));
      }
      done();
    });
  })
}
