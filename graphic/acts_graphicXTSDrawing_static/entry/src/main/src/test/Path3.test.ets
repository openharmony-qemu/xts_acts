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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath3Test() {
  describe('DrawingTsPath3Test', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1600
     * @tc.name      : testPathSetFillTypeNormalStatic
     * @tc.desc      : testPathSetFillTypeNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathSetFillTypeNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetFillTypeNormalStatic';
      let path = new drawing.Path();

      try {
        path.setFillType(drawing.PathFillType.WINDING);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        console.info(msg + 'reset successes');
      } catch (e: BusinessError) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1601
     * @tc.name      : testPathSetFillTypeMultipleCallsStatic
     * @tc.desc      : testPathSetFillTypeMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathSetFillTypeMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetFillTypeMultipleCallsStatic';
      let itemList: drawing.PathFillType[] = [
        drawing.PathFillType.WINDING,
        drawing.PathFillType.INVERSE_WINDING,
        drawing.PathFillType.INVERSE_EVEN_ODD,
        drawing.PathFillType.EVEN_ODD
      ];
      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(4 * Math.random()).toInt();
          path.setFillType(itemList[randomEnum]);
        }
        console.info(msg + 'reset successes');
      } catch (e: BusinessError) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1700
     * @tc.name      : testPathGetBoundsNormalStatic
     * @tc.desc      : testPathGetBoundsNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathGetBoundsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetBoundsNormalStatic';
      try {
        let rect: common2D.Rect |undefined= {
          left: 0, top: 0, right: 0, bottom: 0
        };
        const path = new drawing.Path();
        path.lineTo(50, 40)
        rect = path.getBounds();
        path.addRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, drawing.PathDirection.CLOCKWISE);
        rect = path.getBounds();

        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1701
     * @tc.name      : testPathGetBoundsMultipleCallsStatic
     * @tc.desc      : testPathGetBoundsMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetBoundsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetBoundsMultipleCallsStatic';

      try {
        const path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          const rect = path.getBounds()
        }
        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1800
     * @tc.name      : testPathGetLengthNormalStatic
     * @tc.desc      : testPathGetLengthNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathGetLengthNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetLengthNormalStatic';

      try {
        let path = new drawing.Path();
        let len = path.getLength(false);
        expect(len).assertEqual(0);

        path.moveTo(0, 0);
        path.arcTo(20, 20, 180, 180, 180, 90);
        len = path.getLength(false);
        expect(len).assertEqual(227.4411163330078);

        len = path.getLength(true);
        expect(len).assertEqual(329.4215087890625);

        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1801
     * @tc.name      : testPathGetLengthMultipleCallsStatic
     * @tc.desc      : testPathGetLengthMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetLengthMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetLengthMultipleCallsStatic';

      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          let len = path.getLength(true);
          expect(len).assertEqual(0);
        }

        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1900
     * @tc.name      : testPathGetPositionAndTangentNormalStatic
     * @tc.desc      : testPathGetPositionAndTangentNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetPositionAndTangentNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetPositionAndTangentNormalStatic';

      try {
        let path = new drawing.Path();
        let distance = path.getPositionAndTangent(false, 100, {
          x: 20, y: 20
        }, {
          x: 200, y: 200
        });
        expect(distance).assertEqual(false);
        path.moveTo(0, 0);
        path.lineTo(100, 100);
        distance = path.getPositionAndTangent(true, 30.1, {
          x: 20.1, y: 20.1
        }, {
          x: 200.1, y: 200.1
        });
        expect(distance).assertEqual(true);
        distance = path.getPositionAndTangent(true, 80, {
          x: -20.1, y: -20.1
        }, {
          x: 200.1, y: 200.1
        });
        expect(distance).assertEqual(true);
        distance = path.getPositionAndTangent(true, 100, {
          x: 200.1, y: 200.1
        }, {
          x: -200.1, y: -200.1
        })
        expect(distance).assertEqual(true);
        distance = path.getPositionAndTangent(true, -1, {
          x: 200.1, y: 200.1
        }, {
          x: 600.1, y: 600.1
        })
        expect(distance).assertEqual(true);
        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1901
     * @tc.name      : testPathGetPositionAndTangentMultipleCallsStatic
     * @tc.desc      : testPathGetPositionAndTangentMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetPositionAndTangentMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetPositionAndTangentMultipleCallsStatic';

      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          let distance = path.getPositionAndTangent(false, 100, {
            x: 20, y: 20
          }, {
            x: 200, y: 200
          });
        }
        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2000
     * @tc.name      : testPathConstructorNormalStatic
     * @tc.desc      : testPathConstructorNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConstructorNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConstructorNormalStatic';
      try {
        let path: drawing.Path = new drawing.Path();
        let newPath = new drawing.Path(path);

        path.arcTo(0, 0, 100, 100, 0, 180);
        path.close();
        newPath = new drawing.Path(path);

        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2001
     * @tc.name      : testPathConstructorMultipleCallsStatic
     * @tc.desc      : testPathConstructorMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConstructorMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConstructorMultipleCallsStatic';
      try {
        for (let i = 0; i < 20; i += 1) {
          let path = new drawing.Path();
          let newPath = new drawing.Path(path);
        }
        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2100
     * @tc.name      : testPathIsClosedNormalStatic
     * @tc.desc      : testPathIsClosedNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathIsClosedNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsClosedNormalStatic';

      try {
        let path: drawing.Path = new drawing.Path();
        let close = path.isClosed();
        expect(close).assertEqual(false);

        path.moveTo(0, 0);
        path.lineTo(0, 100);
        path.lineTo(200, 350);
        close = path.isClosed();
        expect(close).assertEqual(false);

        path.close();
        close = path.isClosed();
        expect(close).assertEqual(true);

      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2101
     * @tc.name      : testPathIsClosedMultipleCallsStatic
     * @tc.desc      : testPathIsClosedMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathIsClosedMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsClosedMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          let close = path.isClosed();
          expect(close).assertEqual(false);
        }
        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2200
     * @tc.name      : testPathBuildFromSVGStringNormalStatic
     * @tc.desc      : testPathBuildFromSVGStringNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathBuildFromSVGStringNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathBuildFromSVGStringNormalStatic';
      const path = new drawing.Path();

      try {
        path.buildFromSvgString('');
        let svgStr: string = "M150 100 L75 300 L225 300 Z";
        let flag = path.buildFromSvgString(svgStr);
        expect(flag).assertTrue();

        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let svgStr2: string = "11111111";
        let flag2 = path.buildFromSvgString(svgStr2);
        expect(flag2).assertEqual(false);
        console.info(msg + 'test 11111111 successes');
      } catch (e: BusinessError) {
        console.info(msg + `test 11111111 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2201
     * @tc.name      : testPathBuildFromSVGStringMultipleCallsStatic
     * @tc.desc      : testPathBuildFromSVGStringMultipleCallsStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathBuildFromSVGStringMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathBuildFromSVGStringMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          let svgStr: string = "M150 100 L75 300 L225 300 Z";
          let flag = path.buildFromSvgString(svgStr);
          expect(flag).assertTrue();
        }
        console.info(msg + 'test successes');
      } catch (e: BusinessError) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_001
     * @tc.name      : testPathGetSegmentNormalStatic
     * @tc.desc      : testPathGetSegmentNormalStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathGetSegmentNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetSegmentNormalStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(0, 700);
        path.lineTo(700, 0);
        console.info(msg + 'lineTo successes');
      } catch (e: BusinessError) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      let dstPath: drawing.Path = new drawing.Path();
      try {
        let result: boolean;
        result = path.getSegment(true, 10.0, 20.0, true, dstPath)
        console.info(msg + " getSegment-----result:  "+ path.getSegment(true, 10.0, 20.0, true, dstPath));
        expect(result).assertEqual(true);
      } catch (e: BusinessError) {
        console.info(msg + `test getSegment . errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      try {
        let result2: boolean;
        result2 = path.getSegment(true, 20.0, 10.0, true, dstPath)
        console.info(msg + " getSegment 2 -----result2:  "+ result2);
        expect(result2).assertEqual(false);
      } catch (e: BusinessError) {
        console.info(msg + `test getSegment 2. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
  })
}