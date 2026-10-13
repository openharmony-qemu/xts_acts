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

export default function ImageAnimatorInterpolationTest() {
  describe('ImageAnimatorInterpolationTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAnimatorInterpolationTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/ImageAnimatorInterpolation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageAnimatorInterpolationTest state pages:' + JSON.stringify(pages));
        if (!('ImageAnimatorInterpolationPage' == pages.name)) {
          console.info('get ImageAnimatorInterpolationTest state pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push ImageAnimatorInterpolationTest success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAnimatorInterpolationTest page error:' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageAnimatorInterpolationTest afterEach called');
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0100
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0100
     * @tc.desc   Test default value of interpolation property (not set), expect ImageInterpolation.Low
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorDefault');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationTest_0100] default interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationTest_0100] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0100] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0200
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0200
     * @tc.desc   Test interpolation property set to ImageInterpolation.None (boundary - min)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorNone');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationTest_0200] interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.None');
        console.info('[ImageAnimatorInterpolationTest_0200] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0200] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0300
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0300
     * @tc.desc   Test interpolation property set to ImageInterpolation.Low (default value explicitly set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorLow');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationTest_0300] interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationTest_0300] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0300] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0400
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0400
     * @tc.desc   Test interpolation property set to ImageInterpolation.Medium
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0400] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorMedium');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationTest_0400] interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Medium');
        console.info('[ImageAnimatorInterpolationTest_0400] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0400] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0500
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0500
     * @tc.desc   Test interpolation property set to ImageInterpolation.High (boundary - max)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0500] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorHigh');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationTest_0500] interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.High');
        console.info('[ImageAnimatorInterpolationTest_0500] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0500] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0600
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0600
     * @tc.desc   Test interpolation property values of None, High and Low components simultaneously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0600] START');
      try {
        await CommonFunc.sleep(1000);
        let strJsonNone = getInspectorByKey('imageAnimatorNone');
        let objNone: ESObject = JSON.parse(strJsonNone);
        console.info('[ImageAnimatorInterpolationTest_0600] None interpolation: ' + objNone.$attrs.interpolation);
        expect(objNone.$attrs.interpolation).assertEqual('ImageInterpolation.None');

        let strJsonHigh = getInspectorByKey('imageAnimatorHigh');
        let objHigh: ESObject = JSON.parse(strJsonHigh);
        console.info('[ImageAnimatorInterpolationTest_0600] High interpolation: ' + objHigh.$attrs.interpolation);
        expect(objHigh.$attrs.interpolation).assertEqual('ImageInterpolation.High');

        let strJsonLow = getInspectorByKey('imageAnimatorLow');
        let objLow: ESObject = JSON.parse(strJsonLow);
        console.info('[ImageAnimatorInterpolationTest_0600] Low interpolation: ' + objLow.$attrs.interpolation);
        expect(objLow.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationTest_0600] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0600] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0700
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0700
     * @tc.desc   Test interpolation property with invalid enum value 99 (exception value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0700] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInvalidEnum');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationTest_0700] invalid enum 99 interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationTest_0700] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0700] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0800
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0800
     * @tc.desc   Test interpolation property with invalid negative value -1 (exception value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0800] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorInvalidNegative');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationTest_0800] invalid negative -1 interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationTest_0800] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0800] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorInterpolationTest_0900
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_0900
     * @tc.desc   Test interpolation property with undefined value (exception value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAnimatorInterpolationTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageAnimatorInterpolationTest_0900] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('imageAnimatorUndefined');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorInterpolationTest_0900] undefined interpolation: ' + obj.$attrs.interpolation);
        expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
        console.info('[ImageAnimatorInterpolationTest_0900] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorInterpolationTest_0900] ERR ' + JSON.stringify(err));
      }
      done();
    });
  })
}
