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
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath4Test() {
  describe('DrawingTsPath4Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2300
     * @tc.name      : testPathGetMatrixNormalStatic
     * @tc.desc      : testPathGetMatrixNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathGetMatrixNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetMatrixNormalStatic';
      let itemList: drawing.PathMeasureMatrixFlags[] = [
        drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX,
        drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX,
        drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX
      ];
      try {
        const path = new drawing.Path();
        let matrix: drawing.Matrix;
        let flag: boolean;
        for (let i = 0; i < itemList.length; i += 1) {
          matrix = new drawing.Matrix();
          let flag = path.getMatrix(false, 10, matrix, itemList[i]);
          console.info(msg + 'getMatrix 1 successes flag is: ' + flag + ' step is: ' + i);
          expect(flag).assertFalse();
        }

        for (let i = 0; i < itemList.length; i += 1) {
          matrix = new drawing.Matrix();
          let flag = path.getMatrix(true, 10.1, matrix, itemList[i]);
          console.info(msg + 'getMatrix 2 successes flag is: ' + flag + ' step is: ' + i);
          expect(flag).assertFalse();
        }

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + 'getMatrix 3 successes flag is: ' + flag );
        expect(flag).assertFalse();
        let flag2: boolean;
        flag2 = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 4 successes flag2 is: ' + flag2 );
        expect(flag2).assertFalse();
        let flag3: boolean;
        flag3 = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 5 successes flag3 is: ' + flag3 );
        expect(flag3).assertFalse();

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + 'getMatrix 6 successes flag is: ' + flag );
        expect(flag).assertFalse();
        let flag4: boolean;
        flag4 = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 7 successes flag4 is: ' + flag4 );
        expect(flag4).assertFalse();
        let flag5: boolean;
        flag5 = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 8 successes flag5 is: ' + flag5 );
        expect(flag5).assertFalse();

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + 'getMatrix 9 successes flag is: ' + flag );
        expect(flag).assertFalse();
        let flag6: boolean;
        flag6 = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 10 successes flag6 is: ' + flag6 );
        expect(flag6).assertFalse();
        let flag7: boolean;
        flag7 = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 11 successes flag7 is: ' + flag7 );
        expect(flag7).assertFalse();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2301
     * @tc.name      : testPathGetMatrixMultipleCallsStatic
     * @tc.desc      : testPathGetMatrixMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetMatrixMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetMatrixMultipleCallsStatic';
      const path = new drawing.Path();
      let itemList: drawing.PathMeasureMatrixFlags[] = [
        drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX,
        drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX,
        drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(3 * Math.random()).toInt();
          const matrix = new drawing.Matrix()
          path.getMatrix(false, Math.random(), matrix, itemList[randomEnum])
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2400
     * @tc.name      : testPathConicToNormalStatic
     * @tc.desc      : testPathConicToNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConicToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToNormalStatic';
      const path = new drawing.Path();
      const maxVal = Number.MAX_VALUE;

      try {
        path.conicTo(600, 400, 200, 600, 1);
        path.conicTo(200, 400, 100, 200, 0);
        path.conicTo(300.4, 400.1, 200.1, 200.1, 0.5);
        path.conicTo(-600, -400, 200, 600, 1);
        path.conicTo(600, 400, -200, -600, 0);
        path.conicTo(maxVal, maxVal, maxVal, maxVal, 1);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2401
     * @tc.name      : testPathConicToMultipleCallsStatic
     * @tc.desc      : testPathConicToMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConicToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.conicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random())
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2404
     * @tc.name      : testPathConicToAbNormalStatic
     * @tc.desc      : testPathConicToAbNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConicToAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToAbNormalStatic';
      const path = new drawing.Path();

      try {
        path.conicTo(600, 400, 200, 600, -1);
        console.info(msg + `test error`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        path.conicTo(600, 400, 200, 600, 2);
        console.info(msg + `test error`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2500
     * @tc.name      : testPathrConicToNormalStatic
     * @tc.desc      : testPathrConicToNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathrConicToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrConicToNormalStatic';
      const path = new drawing.Path();
      const maxVal = Number.MAX_VALUE;

      try {
        path.rConicTo(600, 400, 200, 600, 1);
        path.rConicTo(200, 400, 100, 200, 0);
        path.rConicTo(300.4, 400.1, 200.1, 200.1, 0.5);
        path.rConicTo(-600, -400, 200, 600, 1);
        path.rConicTo(600, 400, -200, -600, 0);
        path.rConicTo(maxVal, maxVal, maxVal, maxVal, 1);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2501
     * @tc.name      : testPathrConicToMultipleCallsStatic
     * @tc.desc      : testPathrConicToMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrConicToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrConicToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rConicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2504
     * @tc.name      : testPathrConicToAbNormalStatic
     * @tc.desc      : testPathrConicToAbNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrConicToAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrConicToAbNormalStatic';
      const path = new drawing.Path();

      try {
        path.rConicTo(600, 400, 200, 600, -1);
        console.info(msg + `test error`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        path.rConicTo(600, 400, 200, 600, 2);
        console.info(msg + `test error`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2600
     * @tc.name      : testPathrMoveToNormalStatic
     * @tc.desc      : testPathrMoveToNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathrMoveToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrMoveToNormalStatic';
      const path = new drawing.Path();
      try {
        path.rMoveTo(10, 10);
        path.rMoveTo(10.1, 10.1);
        path.rMoveTo(-1, -1);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2603
     * @tc.name      : testPathrMoveToMultipleCallsStatic
     * @tc.desc      : testPathrMoveToMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrMoveToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrMoveToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rMoveTo(Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2700
     * @tc.name      : testPathrLinetoNormalStatic
     * @tc.desc      : testPathrLinetoNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrLinetoNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrLinetoNormalStatic';
      const path = new drawing.Path();

      try {
        path.rLineTo(10, 10);
        path.rLineTo(10.1, 10.1);
        path.rLineTo(-1, -1);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2703
     * @tc.name      : testPathrLinetoMultipleCallsStatic
     * @tc.desc      : testPathrLinetoMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrLinetoMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrLinetoMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rLineTo(Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2800
     * @tc.name      : testPathrQuadToNormalStatic
     * @tc.desc      : testPathrQuadToNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathrQuadToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrQuadToNormalStatic';
      const path = new drawing.Path();

      try {
        path.rQuadTo(10, 15, 10, 10);
        path.rQuadTo(10.2, 15.3, 10.4, 10.5);
        path.rQuadTo(-10, -15, 10, 10);
        path.rQuadTo(10, 15, -10, -10)
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2803
     * @tc.name      : testPathrQuadToMultipleCallsStatic
     * @tc.desc      : testPathrQuadToMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrQuadToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrQuadToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rQuadTo(Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2900
     * @tc.name      : testPathrCubicToNormalStatic
     * @tc.desc      : testPathrCubicToNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrCubicToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrCubicToNormalStatic';
      const path = new drawing.Path();

      try {
        path.rCubicTo(10, 15, 10, 10, 10, 10);
        path.rCubicTo(10.2, 15.3, 10.4, 10.5, 10.3, 60.3);
        path.rCubicTo(-10, -15, 10, 10, 90, 180);
        path.rCubicTo(10, 15, -10, -10, 90, 180);
        path.rCubicTo(10, 15, 10, 10, -10, -10);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2903
     * @tc.name      : testPathrCubicToMultipleCallsStatic
     * @tc.desc      : testPathrCubicToMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrCubicToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrCubicToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rCubicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3000
     * @tc.name      : testPathOffsetNormalStatic
     * @tc.desc      : testPathOffsetNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOffsetNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOffsetNormalStatic';
      const maxVal = Number.MAX_VALUE;
      try {
        const path = new drawing.Path();
        const dst = new drawing.Path();
        path.offset(200, 200);
        path.moveTo(200, 200);
        path.lineTo(300, 300);
        path.offset(200, 200);
        path.offset(100.1, 100.1);
        path.offset(-200, 200);
        path.offset(200, -200);
        path.offset(maxVal, maxVal);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3003
     * @tc.name      : testPathOffsetMultipleCallsStatic
     * @tc.desc      : testPathOffsetMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOffsetMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOffsetMultipleCallsStatic';

      try {
        for (let i = 0; i < 20; i += 1) {
          const path = new drawing.Path();
          path.moveTo(200, 200);
          path.lineTo(300, 300);
          path.offset(Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3100
     * @tc.name      : testPathAddPolygonNormalStatic
     * @tc.desc      : testPathAddPolygonNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddPolygonNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPolygonNormalStatic';
      const path1 = new drawing.Path();

      try {
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], false);
        path1.addPolygon([{
          x: 200.1, y: 200.1
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], true);
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], false);
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], false);
        path1.addPolygon([{
          x: -200, y: 200
        }, {
          x: -400, y: -200
        }, {
          x: 100, y: -400
        }], false);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3103
     * @tc.name      : testPathAddPolygonMultipleCallsStatic
     * @tc.desc      : testPathAddPolygonMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddPolygonMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPolygonMultipleCallsStatic';
      const path1 = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const len = Math.floor(10 * Math.random())
          const points: common2D.Point[] = []
          for (let j = 0; j < len; j += 1) {
            points.push({
              x: Math.random(),
              y: Math.random(),
            })
          }
          path1.addPolygon(points, false)
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3200
     * @tc.name      : testPathOpNormalStatic
     * @tc.desc      : testPathOpNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathOpNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathOpNormalStatic';
      const path = new drawing.Path();
      let itemList: drawing.PathOp[] = [
        drawing.PathOp.DIFFERENCE,
        drawing.PathOp.UNION,
        drawing.PathOp.XOR,
        drawing.PathOp.REVERSE_DIFFERENCE,
        drawing.PathOp.INTERSECT
      ];
      try {
        for (let i = 0; i < itemList.length; i += 1) {
          let result = path.op(path, itemList[i]);
          console.info(msg + " path.op-----result:  " + result + " step is: " + i);
          expect(result).assertEqual(true);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3203
     * @tc.name      : testPathOpMultipleCallsStatic
     * @tc.desc      : testPathOpMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOpMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOpMultipleCallsStatic';
      const path = new drawing.Path();
      let itemList: drawing.PathOp[] = [
        drawing.PathOp.DIFFERENCE,
        drawing.PathOp.UNION,
        drawing.PathOp.XOR,
        drawing.PathOp.REVERSE_DIFFERENCE,
        drawing.PathOp.INTERSECT
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          const dst = new drawing.Path();
          const randomEnum = Math.floor(5 * Math.random()).toInt();
          let result =  path.op(dst, itemList[randomEnum]);
          console.info(msg + " path.op-----result:  " + result + " step is: " + i);
          expect(result).assertEqual(true);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}