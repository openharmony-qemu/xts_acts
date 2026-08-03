'use static';
/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image';

export default function DrawingTsLatticePart2Test(): void {
  describe('DrawingTsLatticePart2Test', () => {
    let pixel: image.PixelMap;

    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })

    /**
     * @tc.name   testLatticeBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_STATIC_0200
     * @tc.desc   Test createImageLattice with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeBoundaryValueStatic';

      try {
        let lattice = drawing.Lattice.createImageLattice([0], [0], 1, 1, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with zero values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([(Number.MAX_VALUE).toInt()], [(Number.MAX_VALUE).toInt()], 1, 1, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with MAX_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([(Number.MIN_VALUE).toInt()], [(Number.MIN_VALUE).toInt()], 1, 1, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with MIN_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([-1], [-1], 1, 1, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with negative values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([1, 2, 3, 4, 5], [1, 2, 3, 4, 5], 5, 5, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with max count 5 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6], 6, 6, null, null, null);
        console.info(msg + ' createImageLattice with count 6 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testLatticeAllRectTypesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_STATIC_0300
     * @tc.desc   Test createImageLattice with all RectType enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeAllRectTypesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeAllRectTypesStatic';

      const rectTypes: Array<drawing.RectType> = [
        drawing.RectType.DEFAULT,
        drawing.RectType.TRANSPARENT,
        drawing.RectType.FIXEDCOLOR
      ];

      for (let rectType of rectTypes) {
        try {
          let fRectTypes: Array<drawing.RectType> = [
            rectType, rectType, rectType,
            rectType, rectType, rectType,
            rectType, rectType, rectType
          ];
          let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, fRectTypes, null);
          expect(lattice !== null && lattice !== undefined).assertTrue();
          console.info(msg + ` createImageLattice with RectType(${rectType}) succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
          expect().assertFail();
        }
      }

      try {
        let fRectTypes: Array<drawing.RectType> = [
          drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT
        ];
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, fRectTypes, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with mixed RectTypes succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testLatticeColorObjectArrayStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_STATIC_0700
     * @tc.desc   Test createImageLattice with Color object array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeColorObjectArrayStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeColorObjectArrayStatic';

      try {
        let colorArray: Array<common2D.Color> = [];
        for (let i = 0; i < 9; i++) {
          colorArray.push({alpha: 255, red: Math.floor(Math.random() * 256).toInt(), green: Math.floor(Math.random() * 256).toInt(), blue: Math.floor(Math.random() * 256).toInt()});
        }
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, colorArray);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with random Color objects succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorArray: Array<common2D.Color> = [
          {alpha: 0, red: 0, green: 0, blue: 0},
          {alpha: 255, red: 255, green: 255, blue: 255},
          {alpha: 128, red: 128, green: 128, blue: 128},
          {alpha: 0, red: 0, green: 0, blue: 0},
          {alpha: 255, red: 255, green: 255, blue: 255},
          {alpha: 128, red: 128, green: 128, blue: 128},
          {alpha: 0, red: 0, green: 0, blue: 0},
          {alpha: 255, red: 255, green: 255, blue: 255},
          {alpha: 128, red: 128, green: 128, blue: 128}
        ];
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, colorArray);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with boundary Color values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeEmptyArraysStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_STATIC_0800
     * @tc.desc   Test createImageLattice with empty arrays.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLatticeEmptyArraysStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testLatticeEmptyArraysStatic';
      try {
        drawing.Lattice.createImageLattice([], [], 0, 0, null, null, null);
        console.info(msg + ' createImageLattice with empty xDivs and yDivs succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([100], [], 1, 0, null, null, null);
        console.info(msg + ' createImageLattice with empty yDivs succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.Lattice.createImageLattice([], [100], 0, 1, null, null, null);
        console.info(msg + ' createImageLattice with empty xDivs succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeReturnValueValidationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_STATIC_0900
     * @tc.desc   Test createImageLattice return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeReturnValueValidationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeReturnValueValidationStatic';

      try {
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, null);
        expect(typeof lattice === 'object').assertTrue();
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' return value validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([1, 2, 3, 4, 5], [1, 2, 3, 4, 5], 5, 5, null, null, null);
        expect(typeof lattice === 'object').assertTrue();
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' return value with max count validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeBoundsBoundaryStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_STATIC_1000
     * @tc.desc   Test createImageLattice with boundary bounds values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLatticeBoundsBoundaryStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testLatticeBoundsBoundaryStatic';

      try {
        let fBounds: common2D.Rect = {left: 0, top: 0, right: 0, bottom: 0};
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, fBounds, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with zero bounds succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let fBounds: common2D.Rect = {left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE, bottom: Number.MAX_VALUE};
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, fBounds, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with MAX_VALUE bounds succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let fBounds: common2D.Rect = {left: -100, top: -100, right: -100, bottom: -100};
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, fBounds, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with negative bounds succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let fBounds: common2D.Rect = {left: 100.5, top: 200.3, right: 300.7, bottom: 400.9};
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, fBounds, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with float bounds succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeMultipleCombinationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_STATIC_1100
     * @tc.desc   Test createImageLattice with multiple parameter combinations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLatticeMultipleCombinationsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testLatticeMultipleCombinationsStatic';

      for (let xCount = 1; xCount <= 5; xCount++) {
        for (let yCount = 1; yCount <= 5; yCount++) {
          try {
            let xDivs: Array<int> = [];
            let yDivs: Array<int> = [];
            for (let i = 0; i < xCount; i++) {
              xDivs.push(50 * (i + 1));
            }
            for (let i = 0; i < yCount; i++) {
              yDivs.push(50 * (i + 1));
            }
            let lattice = drawing.Lattice.createImageLattice(xDivs, yDivs, xCount, yCount, null, null, null);
            expect(lattice !== null && lattice !== undefined).assertTrue();
            console.info(msg + ` createImageLattice with xCount=${xCount}, yCount=${yCount} succeeded`);
          } catch (e) {
            e = e as BusinessError;
            console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
            expect().assertFail();
          }
        }
      }
    });

    /**
     * @tc.name   testLatticeDifferentGridSizesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_STATIC_1200
     * @tc.desc   Test createImageLattice with different grid sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeDifferentGridSizesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeDifferentGridSizesStatic';

      try {
        let lattice = drawing.Lattice.createImageLattice([50], [50], 1, 1, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' 2x2 grid succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([50, 100, 150], [50, 100, 150], 3, 3, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' 4x4 grid succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([10, 20, 30, 40, 50], [10, 20, 30, 40, 50], 5, 5, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' 6x6 grid succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([50, 100, 150], [50], 3, 1, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' 4x2 grid succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([50], [50, 100, 150], 1, 3, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' 2x4 grid succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
  });
}