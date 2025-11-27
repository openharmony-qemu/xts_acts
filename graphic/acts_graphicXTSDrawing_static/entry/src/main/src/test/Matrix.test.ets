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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import { BusinessError } from '@ohos.base';

const loop_times = 20;

export default function drawingTsMatrixTest() {
  describe('drawingTsMatrixTest', () => {
    const DEFAULT = 0;
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0100
     * @tc.name      : testMatrixConstructorNormalStatic
     * @tc.desc      : testMatrixConstructorNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixConstructorNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixConstructorNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        console.info(msg + ' Matrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` Matrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0103
     * @tc.name      : testMatrixConstructorMultipleCallsStatic
     * @tc.desc      : testMatrixConstructorMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixConstructorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixConstructorMultipleCallsStatic';
      try {
        for (let i = 0; i < loop_times; i++) {
          let matrix = new drawing.Matrix();
        }
        console.info(msg + ' Matrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` Matrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0200
     * @tc.name      : testMatrixSetRotationNormalStatic
     * @tc.desc      : testMatrixSetRotationNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixSetRotationNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetRotationNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90.1, 100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(-90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, -100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, -100);
        let widths: number[] | undefined = matrix.getAll();
        matrix.setRotation(90.1, 100.1, 100.1);
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(361, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0203
     * @tc.name      : testMatrixSetRotationMultipleCallsStatic
     * @tc.desc      : testMatrixSetRotationMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetRotationMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetRotationMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setRotation(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setRotation successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0300
     * @tc.name      : testMatrixSetScaleNormalStatic
     * @tc.desc      : testMatrixSetScaleNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixSetScaleNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetScaleNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(0.2, 0.2, 0.5, 0.5);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(-100, -100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, -150, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0303
     * @tc.name      : testMatrixSetScaleMultipleCallsStatic
     * @tc.desc      : testMatrixSetScaleMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetScaleMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetScaleMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setScale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setScale successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0400
     * @tc.name      : testMatrixSetTranslationNormalStatic
     * @tc.desc      : testMatrixSetTranslationNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixSetTranslationNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetTranslationNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(-100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0403
     * @tc.name      : testMatrixSetTranslationMultipleCallsStatic
     * @tc.desc      : testMatrixSetTranslationMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetTranslationMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetTranslationMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setTranslation(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setTranslation successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0500
     * @tc.name      : testMatrixSetAndGetMatrixNormalStatic
     * @tc.desc      : testMatrixSetAndGetMatrixNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixSetAndGetMatrixNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetAndGetMatrixNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        matrix.getValue(0);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1]);
        matrix.getValue(0);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([0, -1, 2.1, 2.1, 42.1, 2.1, 2., 1 - 2.1, 10]);
        matrix.getValue(0);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE,
          Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE]);
        matrix.getValue(0);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0501
     * @tc.name      : testMatrixSetAndGetMatrixNullStatic
     * @tc.desc      : testMatrixSetAndGetMatrixNullStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetAndGetMatrixNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixNullStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([]);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0503
     * @tc.name      : testMatrixSetAndGetMatrixMultipleCallsStatic
     * @tc.desc      : testMatrixSetAndGetMatrixMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetAndGetMatrixMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE]);
        for (let i = 0; i < loop_times; i++) {
          matrix.getValue(0);
          matrix.getAll();
        }
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        }
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        for (let i = 0; i < loop_times; i++) {
          matrix.getValue(0);
        }
        for (let i = 0; i < loop_times; i++) {
          matrix.getAll();
        }
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0504
     * @tc.name      : testMatrixSetAndGetMatrixAbNormalStatic
     * @tc.desc      : testMatrixSetAndGetMatrixAbNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetAndGetMatrixAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixAbNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8]);
        matrix.getValue(9);
        console.info(msg + ' SetAndGetMatrix 1 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 8, 8])
        matrix.getValue(-1);
        console.info(msg + ' SetAndGetMatrix 2 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.getValue(-1);
        console.info(msg + ' SetAndGetMatrix 3 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.getValue(9);
        console.info(msg + ' SetAndGetMatrix 4 successed');
      } catch (e: BusinessError) {
        console.info(msg + ` SetAndGetMatrix 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0600
     * @tc.name      : testMatrixPreConcatNormalStatic
     * @tc.desc      : testMatrixPreConcatNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixPreConcatNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPreConcatNormalStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        matrix1.preConcat(matrix2);
        matrix1.getAll();
        console.info(msg + ' preConcat successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preConcat errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0603
     * @tc.name      : testMatrixPreConcatMultipleCallsStatic
     * @tc.desc      : testMatrixPreConcatMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPreConcatMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPreConcatMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preConcat(matrix);
        }
        console.info(msg + ' preConcat successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preConcat errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0700
     * @tc.name      : testMatrixIsEqualNormalStatic
     * @tc.desc      : testMatrixIsEqualNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixIsEqualNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixIsEqualNormalStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        matrix1.isEqual(matrix2);
        console.info(msg + ' isEqual successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        matrix1.isEqual(matrix2)
        console.info(msg + ' isEqual successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0703
     * @tc.name      : testMatrixIsEqualMultipleCallsStatic
     * @tc.desc      : testMatrixIsEqualMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixIsEqualMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixIsEqualMultipleCallsStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        console.info(msg + ' isEqual successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        for (let i = 0; i < loop_times; i++) {
          matrix1.isEqual(matrix2);
        }
        console.info(msg + ' isEqual successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0800
     * @tc.name      : testMatrixInvertNormalStatic
     * @tc.desc      : testMatrixInvertNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixInvertNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixInvertNormalStatic';
      try {
        let matrix1 = new drawing.Matrix();
        let matrix2 = new drawing.Matrix();
        matrix2.setScale(0, 0, 0.5, 0.5);
        matrix1.invert(matrix2);
        console.info(msg + ' invert successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        let matrix2 = new drawing.Matrix();
        matrix1.setScale(0, 0, 0.5, 0.5);
        matrix1.invert(matrix2);
        console.info(msg + ' invert successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0803
     * @tc.name      : testMatrixInvertMultipleCallsStatic
     * @tc.desc      : testMatrixInvertMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixInvertMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixInvertMultipleCallsStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        console.info(msg + ' invert successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        for (let i = 0; i < loop_times; i++) {
          matrix1.invert(matrix2);
        }
        console.info(msg + ' invert successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0900
     * @tc.name      : testMatrixIsIdentityNormalStatic
     * @tc.desc      : testMatrixIsIdentityNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixIsIdentityNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixIsIdentityNormalStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.isIdentity();
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        matrix1.isIdentity();
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0902
     * @tc.name      : testMatrixIsIdentityMultipleCallsStatic
     * @tc.desc      : testMatrixIsIdentityMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixIsIdentityMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixIsIdentityMultipleCallsStatic';
      try {
        let matrix1 = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix1.isIdentity();
        }
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1000
     * @tc.name      : testMatrixPostRotateNormalStatic
     * @tc.desc      : testMatrixPostRotateNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixPostRotateNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPostRotateNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90.1, 100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(-90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, -100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, 100, -100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(361, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1003
     * @tc.name      : testMatrixPostRotateMultipleCallsStatic
     * @tc.desc      : testMatrixPostRotateMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPostRotateMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPostRotateMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.postRotate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' postRotate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1100
     * @tc.name      : testMatrixPostScaleNormalStatic
     * @tc.desc      : testMatrixPostScaleNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixPostScaleNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPostScaleNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(0.2, 0.2, 0.5, 0.5);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(-100, -100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, -150, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1103
     * @tc.name      : testMatrixPostScaleMultipleCallsStatic
     * @tc.desc      : testMatrixPostScaleMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPostScaleMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPostScaleMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.postScale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' postScale successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}