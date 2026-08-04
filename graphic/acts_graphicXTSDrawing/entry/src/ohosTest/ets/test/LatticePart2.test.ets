/*
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image';

export default function DrawingTsLatticePart2Test() {
  describe('DrawingTsLatticePart2Test', () => {
    let pixel: image.PixelMap;
    
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })

    /**
     * @tc.name   testLatticeBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_0200
     * @tc.desc   Test createImageLattice with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeBoundaryValue';
      
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
        let lattice = drawing.Lattice.createImageLattice([Number.MAX_VALUE], [Number.MAX_VALUE], 1, 1, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with MAX_VALUE succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([Number.MIN_VALUE], [Number.MIN_VALUE], 1, 1, null, null, null);
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
     * @tc.name   testLatticeAllRectTypes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_0300
     * @tc.desc   Test createImageLattice with all RectType enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeAllRectTypes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeAllRectTypes';
      
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
     * @tc.name   testLatticeInvalidRectType
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_0400
     * @tc.desc   Test createImageLattice with invalid RectType values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLatticeInvalidRectType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testLatticeInvalidRectType';
      
      try {
        let fRectTypes: Array<number> = [-1, -1, -1, -1, -1, -1, -1, -1, -1];
        drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, fRectTypes as any, null);
        console.info(msg + ' createImageLattice with -1 RectType succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let fRectTypes: Array<number> = [10, 10, 10, 10, 10, 10, 10, 10, 10];
        drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, fRectTypes as any, null);
        console.info(msg + ' createImageLattice with 10 RectType succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let fRectTypes: Array<number> = [100, 100, 100, 100, 100, 100, 100, 100, 100];
        drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, fRectTypes as any, null);
        console.info(msg + ' createImageLattice with 100 RectType succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testLatticeColorArrayNumberType
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_0500
     * @tc.desc   Test createImageLattice with color array of number type (API 18+).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeColorArrayNumberType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeColorArrayNumberType';
      
      try {
        let colorArray: Array<number> = [0xffffffff, 0x44444444, 0x99999999, 0xffffffff, 0x44444444, 0x99999999, 0xffffffff, 0x44444444, 0x99999999];
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, colorArray);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with number color array succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorArray: Array<number> = [0x00000000, 0xFF000000, 0x00FFFFFF, 0x00000000, 0xFF000000, 0x00FFFFFF, 0x00000000, 0xFF000000, 0x00FFFFFF];
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, colorArray);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with edge color values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorArray: Array<number> = [0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFF0000, 0xFF00FF00, 0xFF0000FF];
        let fRectTypes: Array<drawing.RectType> = [
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR, drawing.RectType.FIXEDCOLOR
        ];
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, fRectTypes, colorArray);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with FIXEDCOLOR and color array succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeColorArrayInvalidSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_0600
     * @tc.desc   Test createImageLattice with color array of invalid size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLatticeColorArrayInvalidSize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testLatticeColorArrayInvalidSize';
      
      try {
        let colorArray: Array<number> = [0xffffffff];
        drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, colorArray);
        console.info(msg + ' createImageLattice with 1 color succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 1 errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let colorArray: Array<number> = [0xffffffff, 0x44444444, 0x99999999];
        drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, colorArray);
        console.info(msg + ' createImageLattice with 3 colors succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 2 errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let colorArray: Array<number> = [0xffffffff, 0x44444444, 0x99999999, 0xffffffff, 0x44444444, 0x99999999, 0xffffffff, 0x44444444, 0x99999999, 0xffffffff];
        drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, colorArray);
        console.info(msg + ' createImageLattice with 10 colors succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 3 errorCode: ${e.code}, message: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorArray: Array<number> = [];
        drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, null, colorArray);
        console.info(msg + ' createImageLattice with empty color array succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeColorObjectArray
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_0700
     * @tc.desc   Test createImageLattice with Color object array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeColorObjectArray', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeColorObjectArray';
      
      try {
        let colorArray: Array<common2D.Color> = [];
        for (let i = 0; i < 9; i++) {
          colorArray.push({alpha: 255, red: Math.floor(Math.random() * 256), green: Math.floor(Math.random() * 256), blue: Math.floor(Math.random() * 256)});
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
     * @tc.name   testLatticeEmptyArrays
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_0800
     * @tc.desc   Test createImageLattice with empty arrays.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLatticeEmptyArrays', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testLatticeEmptyArrays';
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
     * @tc.name   testLatticeReturnValueValidation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_0900
     * @tc.desc   Test createImageLattice return value validation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeReturnValueValidation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeReturnValueValidation';
      
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

      try {
        let fRectTypes: Array<drawing.RectType> = [
          drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT, drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT
        ];
        let colorArray: Array<number> = [0xffffffff, 0x44444444, 0x99999999, 0xffffffff, 0x44444444, 0x99999999, 0xffffffff, 0x44444444, 0x99999999];
        let lattice = drawing.Lattice.createImageLattice([100, 200], [100, 200], 2, 2, null, fRectTypes, colorArray);
        expect(typeof lattice === 'object').assertTrue();
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' return value with all parameters validated');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLatticeBoundsBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_1000
     * @tc.desc   Test createImageLattice with boundary bounds values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLatticeBoundsBoundary', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testLatticeBoundsBoundary';
      
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
     * @tc.name   testLatticeMultipleCombinations
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_1100
     * @tc.desc   Test createImageLattice with multiple parameter combinations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLatticeMultipleCombinations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testLatticeMultipleCombinations';
      
      for (let xCount = 1; xCount <= 5; xCount++) {
        for (let yCount = 1; yCount <= 5; yCount++) {
          try {
            let xDivs: Array<number> = [];
            let yDivs: Array<number> = [];
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
     * @tc.name   testLatticeDifferentGridSizes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_1200
     * @tc.desc   Test createImageLattice with different grid sizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeDifferentGridSizes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testLatticeDifferentGridSizes';
      
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

    /**
     * @tc.name   testLatticeFloatCoordinateValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_LATTICE_1300
     * @tc.desc   Test createImageLattice with float coordinate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLatticeFloatCoordinateValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testLatticeFloatCoordinateValues';
      
      try {
        let lattice = drawing.Lattice.createImageLattice([50.5, 100.3], [50.5, 100.3], 2, 2, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with float coordinates succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([0.1, 0.2, 0.3], [0.1, 0.2, 0.3], 3, 3, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with small float coordinates succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }

      try {
        let lattice = drawing.Lattice.createImageLattice([100.999, 200.999], [100.999, 200.999], 2, 2, null, null, null);
        expect(lattice !== null && lattice !== undefined).assertTrue();
        console.info(msg + ' createImageLattice with large float coordinates succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode: ${e.code}, message: ${e.message}`);
        expect().assertFail();
      }
    });
  });
}