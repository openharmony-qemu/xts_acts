/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { BusinessError } from '@ohos.base';

export default function drawingTsPath9Test(): void {
  describe('drawingTsPath9Test', () => {
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_0100
     * @tc.name      testPathSetNormal2
     * @tc.desc      testPathSetNormal - test set(src: Path) API 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathSetNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetNormal2';
      let path = new drawing.Path();
      let src = new drawing.Path();
      try {
        src.moveTo(0, 0);
        src.lineTo(0, 700);
        src.lineTo(700, 0);
        src.close();
        path.set(src);
        let result = path.isEqual(src);
        expect(result).assertTrue();
        console.info(msg + ' set successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` set errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_0200
     * @tc.name      testPathSetEmptyPath
     * @tc.desc      testPathSetEmptyPath - test set with empty source path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathSetEmptyPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetEmptyPath';
      let path = new drawing.Path();
      let src = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.set(src);
        let result = path.isEqual(src);
        expect(result).assertTrue();
        console.info(msg + ' set empty path successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` set errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_0300
     * @tc.name      testPathSetComplexPath
     * @tc.desc      testPathSetComplexPath - test set with complex source path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathSetComplexPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathSetComplexPath';
      let path = new drawing.Path();
      let src = new drawing.Path();
      try {
        src.moveTo(10, 10);
        src.lineTo(50, 50);
        src.quadTo(80, 80, 100, 100);
        src.cubicTo(120, 120, 140, 140, 160, 160);
        src.conicTo(180, 180, 200, 200, 1.5);
        src.close();
        path.set(src);
        let result = path.isEqual(src);
        expect(result).assertTrue();
        console.info(msg + ' set complex path successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` set errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_0600
     * @tc.name      testPathSetMultipleCalls2
     * @tc.desc      testPathSetMultipleCalls - test set multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathSetMultipleCalls2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathSetMultipleCalls2';
      let path = new drawing.Path();
      try {
        for (let i = 0; i < 20; i++) {
          let src = new drawing.Path();
          src.moveTo(i * 10, i * 10);
          src.lineTo(i * 20, i * 20);
          path.set(src);
        }
        console.info(msg + ' set multiple calls successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` set errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_0800
     * @tc.name      testPathRewindEmptyPath
     * @tc.desc      testPathRewindEmptyPath - test rewind on empty path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathRewindEmptyPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathRewindEmptyPath';
      let path = new drawing.Path();
      try {
        path.rewind();
        let empty = path.isEmpty();
        expect(empty).assertTrue();
        console.info(msg + ' rewind empty path successes, empty: ' + empty);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` rewind errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_0900
     * @tc.name      testPathRewindComplexPath
     * @tc.desc      testPathRewindComplexPath - test rewind on complex path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathRewindComplexPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathRewindComplexPath';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(50, 50);
        path.quadTo(80, 80, 100, 100);
        path.cubicTo(120, 120, 140, 140, 160, 160);
        path.rewind();
        let empty = path.isEmpty();
        expect(empty).assertTrue();
        console.info(msg + ' rewind complex path successes, empty: ' + empty);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` rewind errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1000
     * @tc.name      testPathRewindMultipleCalls2
     * @tc.desc      testPathRewindMultipleCalls - test rewind multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathRewindMultipleCalls2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathRewindMultipleCalls2';
      let path = new drawing.Path();
      try {
        for (let i = 0; i < 20; i++) {
          path.moveTo(i * 10, i * 10);
          path.lineTo(i * 20, i * 20);
          path.rewind();
        }
        let empty = path.isEmpty();
        expect(empty).assertTrue();
        console.info(msg + ' rewind multiple calls successes, empty: ' + empty);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` rewind errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1100
     * @tc.name      testPathRewindVersusReset
     * @tc.desc      testPathRewindVersusReset - test difference between rewind and reset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathRewindVersusReset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathRewindVersusReset';
      let path1 = new drawing.Path();
      let path2 = new drawing.Path();
      try {
        path1.moveTo(10, 10);
        path1.lineTo(100, 100);
        path2.moveTo(10, 10);
        path2.lineTo(100, 100);
        path1.rewind();
        path2.reset();
        let empty1 = path1.isEmpty();
        let empty2 = path2.isEmpty();
        expect(empty1).assertTrue();
        expect(empty2).assertTrue();
        console.info(msg + ' rewind vs reset successes, empty1: ' + empty1 + ', empty2: ' + empty2);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1200
     * @tc.name      testPathIsEmptyEmpty
     * @tc.desc      testPathIsEmptyEmpty - test isEmpty() on empty path API 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsEmptyEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsEmptyEmpty';
      let path = new drawing.Path();
      try {
        let result = path.isEmpty();
        expect(result).assertTrue();
        console.info(msg + ' isEmpty successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1300
     * @tc.name      testPathIsEmptyWithMoveTo
     * @tc.desc      testPathIsEmptyWithMoveTo - test isEmpty after moveTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsEmptyWithMoveTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsEmptyWithMoveTo';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        let result = path.isEmpty();
        expect(result).assertFalse();
        console.info(msg + ' isEmpty successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1400
     * @tc.name      testPathIsEmptyWithLineTo
     * @tc.desc      testPathIsEmptyWithLineTo - test isEmpty after lineTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEmptyWithLineTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsEmptyWithLineTo';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result = path.isEmpty();
        expect(result).assertFalse();
        console.info(msg + ' isEmpty successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1500
     * @tc.name      testPathIsEmptyAfterReset
     * @tc.desc      testPathIsEmptyAfterReset - test isEmpty after reset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEmptyAfterReset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsEmptyAfterReset';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.reset();
        let result = path.isEmpty();
        expect(result).assertTrue();
        console.info(msg + ' isEmpty successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1600
     * @tc.name      testPathIsEmptyAfterRewind
     * @tc.desc      testPathIsEmptyAfterRewind - test isEmpty after rewind
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEmptyAfterRewind', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsEmptyAfterRewind';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.rewind();
        let result = path.isEmpty();
        expect(result).assertTrue();
        console.info(msg + ' isEmpty successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1700
     * @tc.name      testPathIsEmptyWithShapes
     * @tc.desc      testPathIsEmptyWithShapes - test isEmpty after adding shapes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEmptyWithShapes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsEmptyWithShapes';
      let path = new drawing.Path();
      try {
        path.addCircle(100, 100, 50, drawing.PathDirection.CLOCKWISE);
        let result = path.isEmpty();
        expect(result).assertFalse();
        console.info(msg + ' isEmpty successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1800
     * @tc.name      testPathIsEmptyMultipleCalls2
     * @tc.desc      testPathIsEmptyMultipleCalls - test isEmpty multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEmptyMultipleCalls2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEmptyMultipleCalls2';
      let path = new drawing.Path();
      try {
        let result1 = path.isEmpty();
        path.moveTo(10, 10);
        let result2 = path.isEmpty();
        path.lineTo(100, 100);
        let result3 = path.isEmpty();
        expect(result1).assertTrue();
        expect(result2).assertFalse();
        expect(result3).assertFalse();
        console.info(msg + ' isEmpty multiple calls successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_1900
     * @tc.name      testPathIsRectTrue
     * @tc.desc      testPathIsRectTrue - test isRect() returns true API 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsRectTrue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsRectTrue';
      let path = new drawing.Path();
      let rect: common2D.Rect = { left: 100, top: 100, right: 400, bottom: 500 };
      try {
        path.moveTo(10, 10);
        path.lineTo(20, 10);
        path.lineTo(20, 20);
        path.lineTo(10, 20);
        path.lineTo(10, 10);
        let result = path.isRect(rect);
        expect(result).assertTrue();
        console.info(msg + ' isRect successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isRect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2000
     * @tc.name      testPathIsRectFalse
     * @tc.desc      testPathIsRectFalse - test isRect() returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsRectFalse', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsRectFalse';
      let path = new drawing.Path();
      let rect: common2D.Rect = { left: 100, top: 100, right: 400, bottom: 500 };
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result = path.isRect(rect);
        expect(result).assertFalse();
        console.info(msg + ' isRect successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isRect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2200
     * @tc.name      testPathIsRectWithNull
     * @tc.desc      testPathIsRectWithNull - test isRect with null rect parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsRectWithNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsRectWithNull';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(20, 10);
        path.lineTo(20, 20);
        path.lineTo(10, 20);
        path.lineTo(10, 10);
        let result = path.isRect(null);
        expect(result).assertTrue();
        console.info(msg + ' isRect with null successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isRect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2300
     * @tc.name      testPathIsRectWithValidRect
     * @tc.desc      testPathIsRectWithValidRect - test isRect with valid rect parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsRectWithValidRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsRectWithValidRect';
      let path = new drawing.Path();
      let rect: common2D.Rect = { left: 0, top: 0, right: 0, bottom: 0 };
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 10);
        path.lineTo(100, 100);
        path.lineTo(10, 100);
        path.lineTo(10, 10);
        let result = path.isRect(rect);
        expect(result).assertTrue();
        expect(rect.left).assertEqual(10);
        expect(rect.top).assertEqual(10);
        expect(rect.right).assertEqual(100);
        expect(rect.bottom).assertEqual(100);
        console.info(msg + ' isRect successes, result: ' + result + ', rect: ' + JSON.stringify(rect));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isRect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2400
     * @tc.name      testPathIsRectWithCurve
     * @tc.desc      testPathIsRectWithCurve - test isRect on path with curves
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsRectWithCurve', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsRectWithCurve';
      let path = new drawing.Path();
      let rect: common2D.Rect = { left: 100, top: 100, right: 400, bottom: 500 };
      try {
        path.moveTo(10, 10);
        path.quadTo(50, 50, 100, 100);
        let result = path.isRect(rect);
        expect(result).assertFalse();
        console.info(msg + ' isRect successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isRect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2500
     * @tc.name      testPathIsRectAfterAddRect
     * @tc.desc      testPathIsRectAfterAddRect - test isRect after addRect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsRectAfterAddRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsRectAfterAddRect';
      let path = new drawing.Path();
      let rect: common2D.Rect = { left: 0, top: 0, right: 0, bottom: 0 };
      let srcRect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 500 };
      try {
        path.addRect(srcRect, drawing.PathDirection.CLOCKWISE);
        let result = path.isRect(rect);
        expect(result).assertTrue();
        expect(rect.left).assertEqual(100);
        expect(rect.top).assertEqual(100);
        expect(rect.right).assertEqual(500);
        expect(rect.bottom).assertEqual(500);
        console.info(msg + ' isRect successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isRect errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2600
     * @tc.name      testPathSetLastPointNormal2
     * @tc.desc      testPathSetLastPointNormal - test setLastPoint() API 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathSetLastPointNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetLastPointNormal2';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.setLastPoint(50, 50);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(50);
        expect(result.y).assertEqual(50);
        console.info(msg + ' setLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2700
     * @tc.name      testPathSetLastPointEmptyPath
     * @tc.desc      testPathSetLastPointEmptyPath - test setLastPoint on empty path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathSetLastPointEmptyPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetLastPointEmptyPath';
      let path = new drawing.Path();
      try {
        path.setLastPoint(50, 50);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(50);
        expect(result.y).assertEqual(50);
        console.info(msg + ' setLastPoint on empty path successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2800
     * @tc.name      testPathSetLastPointWithZero
     * @tc.desc      testPathSetLastPointWithZero - test setLastPoint with zero coordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathSetLastPointWithZero', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathSetLastPointWithZero';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.setLastPoint(0, 0);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(0);
        expect(result.y).assertEqual(0);
        console.info(msg + ' setLastPoint successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_2900
     * @tc.name      testPathSetLastPointWithNegative
     * @tc.desc      testPathSetLastPointWithNegative - test setLastPoint with negative coordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathSetLastPointWithNegative', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathSetLastPointWithNegative';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.setLastPoint(-50, -50);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(-50);
        expect(result.y).assertEqual(-50);
        console.info(msg + ' setLastPoint successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3000
     * @tc.name      testPathSetLastPointWithLarge
     * @tc.desc      testPathSetLastPointWithLarge - test setLastPoint with large coordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathSetLastPointWithLarge', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathSetLastPointWithLarge';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.setLastPoint(1000000, 1000000);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(1000000);
        expect(result.y).assertEqual(1000000);
        console.info(msg + ' setLastPoint successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3100
     * @tc.name      testPathSetLastPointWithFloat
     * @tc.desc      testPathSetLastPointWithFloat - test setLastPoint with float coordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathSetLastPointWithFloat', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathSetLastPointWithFloat';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.setLastPoint(50.5, 50.5);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertClose(50.5, 0.01);
        expect(result.y).assertClose(50.5, 0.01);
        console.info(msg + ' setLastPoint successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3200
     * @tc.name      testPathSetLastPointMultipleCalls2
     * @tc.desc      testPathSetLastPointMultipleCalls - test setLastPoint multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathSetLastPointMultipleCalls2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathSetLastPointMultipleCalls2';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        for (let i = 0; i < 20; i++) {
          path.setLastPoint(i * 10, i * 10);
        }
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(190);
        expect(result.y).assertEqual(190);
        console.info(msg + ' setLastPoint multiple calls successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3300
     * @tc.name      testPathGetFillTypeDefault
     * @tc.desc      testPathGetFillTypeDefault - test getFillType() default value API 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetFillTypeDefault', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetFillTypeDefault';
      let path = new drawing.Path();
      try {
        let result = path.getFillType();
        expect(result).assertEqual(drawing.PathFillType.WINDING);
        console.info(msg + ' getFillType successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getFillType errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3400
     * @tc.name      testPathGetFillTypeAfterSet
     * @tc.desc      testPathGetFillTypeAfterSet - test getFillType after setFillType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetFillTypeAfterSet', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetFillTypeAfterSet';
      let path = new drawing.Path();
      try {
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        let result = path.getFillType();
        expect(result).assertEqual(drawing.PathFillType.EVEN_ODD);
        console.info(msg + ' getFillType successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getFillType errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3500
     * @tc.name      testPathGetFillTypeAllTypes
     * @tc.desc      testPathGetFillTypeAllTypes - test getFillType with all fill types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetFillTypeAllTypes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetFillTypeAllTypes';
      let path = new drawing.Path();
      try {
        let fillTypes = [
          drawing.PathFillType.WINDING,
          drawing.PathFillType.EVEN_ODD,
          drawing.PathFillType.INVERSE_WINDING,
          drawing.PathFillType.INVERSE_EVEN_ODD
        ];
        for (let fillType of fillTypes) {
          path.setFillType(fillType);
          let result = path.getFillType();
          expect(result).assertEqual(fillType);
          console.info(msg + ' getFillType successes, fillType: ' + fillType + ', result: ' + result);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getFillType errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3600
     * @tc.name      testPathGetFillTypeMultipleCalls2
     * @tc.desc      testPathGetFillTypeMultipleCalls - test getFillType multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetFillTypeMultipleCalls2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetFillTypeMultipleCalls2';
      let path = new drawing.Path();
      path.setFillType(drawing.PathFillType.EVEN_ODD);
      try {
        let result1 = path.getFillType();
        let result2 = path.getFillType();
        let result3 = path.getFillType();
        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        expect(result1).assertEqual(drawing.PathFillType.EVEN_ODD);
        console.info(msg + ' getFillType multiple calls successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getFillType errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3700
     * @tc.name      testPathGetFillTypeAfterReset
     * @tc.desc      testPathGetFillTypeAfterReset - test getFillType after reset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetFillTypeAfterReset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetFillTypeAfterReset';
      let path = new drawing.Path();
      try {
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.reset();
        let result = path.getFillType();
        expect(result).assertEqual(drawing.PathFillType.WINDING);
        console.info(msg + ' getFillType after reset successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getFillType errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3800
     * @tc.name      testPathCombinedOperations
     * @tc.desc      testPathCombinedOperations - test combined set/get operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathCombinedOperations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathCombinedOperations';
      let path1 = new drawing.Path();
      let path2 = new drawing.Path();
      try {
        path1.moveTo(0, 0);
        path1.lineTo(0, 700);
        path1.lineTo(700, 0);
        path1.close();
        path1.setFillType(drawing.PathFillType.EVEN_ODD);
        path2.set(path1);
        let fillType = path2.getFillType();
        expect(fillType).assertEqual(drawing.PathFillType.EVEN_ODD);
        let isEqual = path1.isEqual(path2);
        expect(isEqual).assertTrue();
        console.info(msg + ' combined operations successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATH_3900
     * @tc.name      testPathSetAndTransform
     * @tc.desc      testPathSetAndTransform - test set and transform combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathSetAndTransform', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathSetAndTransform';
      let path1 = new drawing.Path();
      let path2 = new drawing.Path();
      let matrix = new drawing.Matrix();
      try {
        path1.moveTo(0, 0);
        path1.lineTo(0, 700);
        path1.lineTo(700, 0);
        path1.close();
        path2.set(path1);
        matrix.setScale(2, 2, 0, 0);
        path2.transform(matrix);
        let bounds = path2.getBounds();
        expect(bounds.right).assertEqual(1400);
        expect(bounds.bottom).assertEqual(1400);
        console.info(msg + ' set and transform successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}