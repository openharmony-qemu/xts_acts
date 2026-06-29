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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
const loop_times = 20;

export default function drawingTsMatrixPart3Test() {
  describe('drawingTsMatrixPart3Test', () => {
    /**
     * @tc.name   testMatrixCopyConstructorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_0100
     * @tc.desc   testMatrixCopyConstructorNormal - test constructor(matrix: Matrix) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixCopyConstructorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixCopyConstructorNormal';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix(matrix1);
        expect(matrix2 != null).assertTrue();
        let result = matrix1.isEqual(matrix2);
        expect(result).assertEqual(true);
        console.info(msg + ' copy constructor successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixIsAffineNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_0300
     * @tc.desc   testMatrixIsAffineNormal - test isAffine() API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsAffineNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixIsAffineNormal2';
      try {
        let matrix = new drawing.Matrix();
        let result = matrix.isAffine();
        expect(result).assertEqual(true);
        console.info(msg + ' isAffine unit matrix result: ' + result);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 0.5, 1, 0.5, 1, 1, 1, 1, 1]);
        let result = matrix.isAffine();
        console.info(msg + ' isAffine non-affine result: ' + result);
        expect(result).assertEqual(false);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 100);
        let result = matrix.isAffine();
        expect(result).assertEqual(true);
        console.info(msg + ' isAffine rotation result: ' + result);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 100, 100);
        let result = matrix.isAffine();
        expect(result).assertEqual(true);
        console.info(msg + ' isAffine scale result: ' + result);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, 100);
        let result = matrix.isAffine();
        expect(result).assertEqual(true);
        console.info(msg + ' isAffine translation result: ' + result);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixRectStaysRectNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_0500
     * @tc.desc   testMatrixRectStaysRectNormal - test rectStaysRect() API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixRectStaysRectNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixRectStaysRectNormal2';
      try {
        let matrix = new drawing.Matrix();
        let result = matrix.rectStaysRect();
        expect(result).assertEqual(true);
        console.info(msg + ' unit matrix result: ' + result);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 100, 100);
        let result = matrix.rectStaysRect();
        expect(result).assertEqual(true);
        console.info(msg + ' scale matrix result: ' + result);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, 100);
        let result = matrix.rectStaysRect();
        expect(result).assertEqual(true);
        console.info(msg + ' translation matrix result: ' + result);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 100);
        let result = matrix.rectStaysRect();
        console.info(msg + ' rotation matrix result: ' + result);
        expect(result).assertEqual(true);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let result = matrix.rectStaysRect();
        console.info(msg + ' complex matrix result: ' + result);
        expect(result).assertEqual(false);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixSetSkewNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_0700
     * @tc.desc   testMatrixSetSkewNormal - test setSkew(kx, ky, px, py) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetSkewNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetSkewNormal2';
      try {
        let matrix = new drawing.Matrix();
        matrix.setSkew(2, 0.5, 0.5, 2);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setSkew successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setSkew(0, 0, 0, 0);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' zero skew successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setSkew(-2, -0.5, -0.5, -2);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' negative skew successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setSkew(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' max value skew successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setSkew(0.001, 0.001, 0.001, 0.001);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' min value skew successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixSetSkewMultipleCalls2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_0900
     * @tc.desc   testMatrixSetSkewMultipleCalls - test setSkew multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetSkewMultipleCalls2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetSkewMultipleCalls2';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setSkew(Math.random() * 10, Math.random() * 10, 
            Math.random() * 100, Math.random() * 100);
        }
        console.info(msg + ' successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixSetSinCosNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_1000
     * @tc.desc   testMatrixSetSinCosNormal - test setSinCos(sinValue, cosValue, px, py) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetSinCosNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetSinCosNormal2';
      try {
        let matrix = new drawing.Matrix();
        matrix.setSinCos(0, 1, 1, 0);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' sin=0, cos=1 successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setSinCos(1, 0, 100, 100);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' sin=1, cos=0 successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setSinCos(0.707, 0.707, 50, 50);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' sin=0.707, cos=0.707 successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setSinCos(-0.707, 0.707, -50, -50);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' negative values successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setSinCos(0.5, 0.5, Number.MAX_VALUE, Number.MAX_VALUE);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' max values successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixSetSinCosMultipleCalls2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_1200
     * @tc.desc   testMatrixSetSinCosMultipleCalls - test setSinCos multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetSinCosMultipleCalls2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetSinCosMultipleCalls2';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setSinCos(Math.random(), Math.random(), 
            Math.random() * 100, Math.random() * 100);
        }
        console.info(msg + ' successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixSetMatrixWithMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_1300
     * @tc.desc   testMatrixSetMatrixWithMatrixNormal - test setMatrix(matrix: Matrix) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetMatrixWithMatrixNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetMatrixWithMatrixNormal';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix1.setMatrix(matrix2);
        let result = matrix1.isEqual(matrix2);
        expect(result).assertEqual(true);
        console.info(msg + ' setMatrix with Matrix successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixSetConcatNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_1400
     * @tc.desc   testMatrixSetConcatNormal - test setConcat(matrixA, matrixB) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetConcatNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetConcatNormal2';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        let matrixResult = new drawing.Matrix();
        matrixResult.setConcat(matrix1, matrix2);
        let values = matrixResult.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' setConcat successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixPostConcatNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_1600
     * @tc.desc   testMatrixPostConcatNormal - test postConcat(matrix: Matrix) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostConcatNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPostConcatNormal2';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        matrix1.postConcat(matrix2);
        let values = matrix1.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' postConcat successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixPostSkewNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_1800
     * @tc.desc   testMatrixPostSkewNormal - test postSkew(kx, ky, px, py) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostSkewNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPostSkewNormal2';
      try {
        let matrix = new drawing.Matrix();
        matrix.postSkew(2.0, 1.0, 2.0, 1.0);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postSkew successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.postSkew(0, 0, 0, 0);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' zero values successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.postSkew(-2.0, -1.0, -2.0, -1.0);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' negative values successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.postSkew(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' max values successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixPreSkewNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_2000
     * @tc.desc   testMatrixPreSkewNormal - test preSkew(kx, ky, px, py) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreSkewNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPreSkewNormal2';
      try {
        let matrix = new drawing.Matrix();
        matrix.preSkew(2.0, 1.0, 2.0, 1.0);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preSkew successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.preSkew(0, 0, 0, 0);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' zero values successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.preSkew(-2.0, -1.0, -2.0, -1.0);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' negative values successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.preSkew(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' max values successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixMapRadiusNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_2200
     * @tc.desc   testMatrixMapRadiusNormal - test mapRadius(radius: number) API 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapRadiusNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixMapRadiusNormal2';
      try {
        let matrix = new drawing.Matrix();
        let radius = matrix.mapRadius(10);
        expect(radius).assertEqual(10);
        console.info(msg + ' unit matrix radius: ' + radius);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let radius = matrix.mapRadius(10);
        expect(radius > 0).assertTrue();
        console.info(msg + ' complex matrix radius: ' + radius);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 100, 100);
        let radius = matrix.mapRadius(10);
        console.info(msg + ' scale matrix radius: ' + radius);
        expect(radius).assertEqual(20);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        let radius = matrix.mapRadius(-10);
        console.info(msg + ' negative radius: ' + radius);
        expect(radius).assertEqual(10);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        let radius = matrix.mapRadius(0);
        expect(radius).assertEqual(0);
        console.info(msg + ' zero radius: ' + radius);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        let radius = matrix.mapRadius(Number.MAX_VALUE);
        console.info(msg + ' max radius: ' + radius);
        expect(radius).assertEqual(Infinity);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        let radius = matrix.mapRadius(Number.MIN_VALUE);
        console.info(msg + ' min radius: ' + radius);
        expect(radius).assertEqual(0);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixCombinedOperationsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_2400
     * @tc.desc   testMatrixCombinedOperationsNormal - test combined operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixCombinedOperationsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixCombinedOperationsNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, 100);
        matrix.postRotate(45, 100, 100);
        matrix.postScale(2, 2, 100, 100);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        let isAffine = matrix.isAffine();
        expect(isAffine).assertEqual(true);
        console.info(msg + ' combined operations successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixCombinedSkewAndRotate
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_2500
     * @tc.desc   testMatrixCombinedSkewAndRotate - test skew and rotate combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixCombinedSkewAndRotate', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixCombinedSkewAndRotate';
      try {
        let matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0.5, 100, 100);
        matrix.postRotate(30, 100, 100);
        let values = matrix.getAll();
        expect(values.length == 9).assertTrue();
        console.info(msg + ' skew and rotate successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixConcatAndInvert
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_2600
     * @tc.desc   testMatrixConcatAndInvert - test concat and invert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixConcatAndInvert', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixConcatAndInvert';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setScale(2, 3, 100, 100);
        let matrix2 = new drawing.Matrix();
        matrix2.setTranslation(50, 50);
        let matrixResult = new drawing.Matrix();
        matrixResult.setConcat(matrix1, matrix2);
        let matrixInverse = new drawing.Matrix();
        let result = matrixResult.invert(matrixInverse);
        expect(result).assertEqual(true);
        console.info(msg + ' concat and invert successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixMapPointsWithScale
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_2700
     * @tc.desc   testMatrixMapPointsWithScale - test mapPoints with scaled matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapPointsWithScale', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixMapPointsWithScale';
      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        let src: Array<common2D.Point> = [{x: 10, y: 10}, {x: 20, y: 20}];
        let dst: Array<common2D.Point> = matrix.mapPoints(src);
        expect(dst.length == 2).assertTrue();
        console.info(msg + ' mapPoints with scale successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixMapRectWithRotation
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_2800
     * @tc.desc   testMatrixMapRectWithRotation - test mapRect with rotated matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapRectWithRotation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixMapRectWithRotation';
      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(45, 100, 100);
        let dst: common2D.Rect = { left: 0, top: 0, right: 0, bottom: 0 };
        let src: common2D.Rect = { left: 100, top: 100, right: 200, bottom: 200 };
        let result = matrix.mapRect(dst, src);
        expect(result).assertEqual(false);
        console.info(msg + ' mapRect with rotation successed, result: ' + result);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixGetValueBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_2900
     * @tc.desc   testMatrixGetValueBoundary - test getValue with boundary indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixGetValueBoundary', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixGetValueBoundary';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < 9; i++) {
          let value = matrix.getValue(i);
          expect(typeof value === 'number').assertTrue();
        }
        console.info(msg + ' boundary indices successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_MATRIX_3000
     * @tc.desc   testMatrixSetPolyToPolyBoundary - test setPolyToPoly with boundary counts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetPolyToPolyBoundary', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetPolyToPolyBoundary';
      try {
        let matrix = new drawing.Matrix();
        let src: Array<common2D.Point> = [{x: 10, y: 10}];
        let dst: Array<common2D.Point> = [{x: 20, y: 20}];
        let result = matrix.setPolyToPoly(src, dst, 1);
        expect(result).assertEqual(true);
        console.info(msg + ' count=1 successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        let src: Array<common2D.Point> = [];
        let dst: Array<common2D.Point> = [];
        let result = matrix.setPolyToPoly(src, dst, 0);
        expect(result).assertEqual(true);
        console.info(msg + ' count=0 successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        let src: Array<common2D.Point> = [{x: 10, y: 10}, {x: 20, y: 20}, 
          {x: 30, y: 30}, {x: 40, y: 40}];
        let dst: Array<common2D.Point> = [{x: 15, y: 15}, {x: 25, y: 25}, 
          {x: 35, y: 35}, {x: 45, y: 45}];
        let result = matrix.setPolyToPoly(src, dst, 4);
        expect(result).assertEqual(false);
        console.info(msg + ' count=4 successed');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code}, errorMsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}