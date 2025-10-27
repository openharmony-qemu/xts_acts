/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
import { getEnumCount, getRandomNumber } from './Util.test';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsRegionTest() {
  describe('DrawingTsRegionTest', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0600
     * @tc.name      : testRegionOpNormalStatic
     * @tc.desc      : testRegionOpNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRegionOpNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRegionOpNormalStatic';
      try {
        expect(drawing.RegionOp.DIFFERENCE + '').assertEqual('0');
        expect(drawing.RegionOp.INTERSECT + '').assertEqual('1');
        expect(drawing.RegionOp.UNION + '').assertEqual('2');
        expect(drawing.RegionOp.XOR + '').assertEqual('3');
        expect(drawing.RegionOp.REVERSE_DIFFERENCE + '').assertEqual('4');
        expect(drawing.RegionOp.REPLACE + '').assertEqual('5');
        console.info(msg + `RegionOp successed`);
      } catch (e: BusinessError) {
        console.info(msg + `RegionOp failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0800
     * @tc.name      : testRegionConstructor2NormalStatic
     * @tc.desc      : testRegionConstructor2NormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testRegionConstructor2NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionConstructor2NormalStatic';
      try {
        let region = new drawing.Region(100, 100, 200, 200);
        console.info(msg + `drawing Region success`);
        expect(region != null || region != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + `drawing Region error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region2 = new drawing.Region(-100, -100, 300, 351);
        console.info(msg + `drawing Region2 success`);
        expect(region2 != null || region2 != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + `drawing region2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region3 = new drawing.Region(150, 150, 150, 150);
        console.info(msg + `drawing region3 success`);
        expect(region3 != null || region3 != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + `drawing region3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region4 = new drawing.Region(0, 150, 150, 150);
        console.info(msg + `drawing region4 success`);
        expect(region4 != null || region4 != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + `drawing region4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region5 = new drawing.Region(100, 100, 100, 300);
        console.info(msg + `drawing region5 success`);
        expect(region5 != null || region5 != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + `drawing region5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region6 = new drawing.Region(100, 100, 800, 600);
        console.info(msg + `drawing region6 success`);
        expect(region6 != null || region6 != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + `drawing region6 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region7 = new drawing.Region(500, 900, 180, 240);
        console.info(msg + `drawing region7 success`);
        expect(region7 != null || region7 != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + `drawing region7 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region8 =
          new drawing.Region((Number.MAX_VALUE).toInt(), (Number.MAX_VALUE).toInt(), (Number.MAX_VALUE + 1).toInt(),
            (Number.MAX_VALUE + 1).toInt());
        console.info(msg + `drawing region8 success`);
        expect(region8 != null || region8 != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + `drawing region8 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0901
     * @tc.name      : testRegionConstructor3MultipleCallsStatic
     * @tc.desc      : testRegionConstructor3MultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testRegionConstructor3MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionConstructor3MultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let region = new drawing.Region((Math.random() * 100).toInt(), (Math.random() * 200).toInt(),
            (Math.random() * 100).toInt(), (Math.random() * 200).toInt())
          console.info(msg + `drawing region success step: ` + i);
          expect(region != null || region != undefined).assertTrue();
        } catch (e: BusinessError) {
          console.info(msg + `drawing region error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1000
     * @tc.name      : testRegionEmptyNormalStatic
     * @tc.desc      : testRegionEmptyNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testRegionEmptyNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionEmptyNormalStatic';
      let region = new drawing.Region();
      try {
        region.setEmpty();
      } catch (e: BusinessError) {
        console.info(msg + `RegionEmpty errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
        expect().assertFail()
      }
    })
  });
}
