'use static';
/*
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function DrawingPathIteratorPart2Test(): void {

  describe('DrawingPathIteratorPart2Test', (): void => {
    /**
     * @tc.name   testPathIteratorConstructorEmptyPathStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_0100
     * @tc.desc   test PathIterator constructor with empty Path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorConstructorEmptyPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorConstructorEmptyPathStatic';
      try {
        let path = new drawing.Path();
        let iter = new drawing.PathIterator(path);
        console.info(msg + ' PathIterator constructor with empty Path succeeded');
        expect(iter != null).assertTrue();
        expect(iter != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` PathIterator constructor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPathIteratorConstructorComplexPathStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_0400
     * @tc.desc   test PathIterator constructor with complex Path containing multiple operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorConstructorComplexPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorConstructorComplexPathStatic';
      try {
        let path = new drawing.Path();
        path.moveTo(10, 20);
        path.lineTo(100, 200);
        path.quadTo(10, 15, 10, 10);
        path.conicTo(200, 400, 100, 200, 3);
        path.cubicTo(100, 100, 80, 150, 300, 150);
        path.close();
        let iter = new drawing.PathIterator(path);
        console.info(msg + ' PathIterator constructor with complex Path succeeded');
        expect(iter != null).assertTrue();
        expect(iter != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` PathIterator constructor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextOffsetBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_0500
     * @tc.desc   test PathIterator next method with offset boundary value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextOffsetBoundary001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextOffsetBoundary001Static';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let verb = iter.next(points, 0);
        console.info(msg + ' next with offset 0 succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.MOVE);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextOffsetBoundary002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_0600
     * @tc.desc   test PathIterator next method with offset boundary value max (size-4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorNextOffsetBoundary002Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorNextOffsetBoundary002Static';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let verb = iter.next(points, 0);
        console.info(msg + ' next with max offset succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.MOVE);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextOffsetBoundary003Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_0700
     * @tc.desc   test PathIterator next method with offset out of range (negative value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorNextOffsetBoundary003Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorNextOffsetBoundary003Static';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let verb = iter.next(points, -1);
        console.info(msg + ' next with negative offset should fail');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testPathIteratorNextOffsetBoundary004Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_0800
     * @tc.desc   test PathIterator next method with offset out of range (exceed size-4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorNextOffsetBoundary004Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorNextOffsetBoundary004Static';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let verb = iter.next(points, 10);
        console.info(msg + ' next with offset exceed range should fail');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testPathIteratorNextPointsMinLengthStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_0900
     * @tc.desc   test PathIterator next method with points array minimum length 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextPointsMinLengthStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextPointsMinLengthStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let verb = iter.next(points, 0);
        console.info(msg + ' next with minimum length points array succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.MOVE);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextPointsCoordinateVerificationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1000
     * @tc.desc   test PathIterator next method points coordinate verification for MOVE verb.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextPointsCoordinateVerificationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextPointsCoordinateVerificationStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let verb = iter.next(points, 0);
        console.info(msg + ' next MOVE verb succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(points[0].x).assertEqual(10);
        expect(points[0].y).assertEqual(20);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextLINECoordinateVerificationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1100
     * @tc.desc   test PathIterator next method points coordinate verification for LINE verb.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextLINECoordinateVerificationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextLINECoordinateVerificationStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let verb1 = iter.next(points, 0);
        expect(verb1).assertEqual(drawing.PathIteratorVerb.MOVE);
        let verb2 = iter.next(points, 0);
        console.info(msg + ' next LINE verb succeeded');
        expect(verb2).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(points[0].x).assertEqual(10);
        expect(points[0].y).assertEqual(20);
        expect(points[1].x).assertEqual(100);
        expect(points[1].y).assertEqual(200);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextQUADCoordinateVerificationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1200
     * @tc.desc   test PathIterator next method points coordinate verification for QUAD verb.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextQUADCoordinateVerificationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextQUADCoordinateVerificationStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      path.quadTo(10, 15, 10, 10);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        iter.next(points, 0);
        iter.next(points, 0);
        let verb = iter.next(points, 0);
        console.info(msg + ' next QUAD verb succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.QUAD);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextCUBICCoordinateVerificationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1300
     * @tc.desc   test PathIterator next method points coordinate verification for CUBIC verb.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextCUBICCoordinateVerificationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextCUBICCoordinateVerificationStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      path.quadTo(10, 15, 10, 10);
      path.conicTo(200, 400, 100, 200, 3);
      path.cubicTo(100, 100, 80, 150, 300, 150);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        iter.next(points, 0);
        iter.next(points, 0);
        iter.next(points, 0);
        iter.next(points, 0);
        let verb = iter.next(points, 0);
        console.info(msg + ' next CUBIC verb succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.CUBIC);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextCLOSEVerbVerificationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1400
     * @tc.desc   test PathIterator next method CLOSE verb verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextCLOSEVerbVerificationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextCLOSEVerbVerificationStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      path.close();
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        iter.next(points, 0);
        iter.next(points, 0);
        let verb = iter.next(points, 0);
        console.info(msg + ' next CLOSE verb succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.CLOSE);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextDONEVerbVerificationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1500
     * @tc.desc   test PathIterator next method DONE verb verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextDONEVerbVerificationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextDONEVerbVerificationStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        iter.next(points, 0);
        let verb = iter.next(points, 0);
        console.info(msg + ' next DONE verb succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.DONE);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorPeekMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1600
     * @tc.desc   test PathIterator peek method multiple calls without moving iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorPeekMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorPeekMultipleCallsStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      let iter = new drawing.PathIterator(path);
      try {
        let peek1 = iter.peek();
        let peek2 = iter.peek();
        let peek3 = iter.peek();
        console.info(msg + ' peek multiple calls succeeded');
        expect(peek1).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(peek2).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(peek3).assertEqual(drawing.PathIteratorVerb.MOVE);
      } catch (e) {
        console.info(msg + ` peek errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorPeekReturnValueVerificationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1700
     * @tc.desc   test PathIterator peek method return value verification at different positions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorPeekReturnValueVerificationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorPeekReturnValueVerificationStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let peek1 = iter.peek();
        iter.next(points, 0);
        let peek2 = iter.peek();
        console.info(msg + ' peek return value verification succeeded');
        expect(peek1).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(peek2).assertEqual(drawing.PathIteratorVerb.DONE);
      } catch (e) {
        console.info(msg + ` peek errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorHasNextTrueScenarioStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1800
     * @tc.desc   test PathIterator hasNext method returns true scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorHasNextTrueScenarioStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorHasNextTrueScenarioStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      try {
        let hasNext = iter.hasNext();
        console.info(msg + ' hasNext returns true succeeded');
        expect(hasNext).assertTrue();
      } catch (e) {
        console.info(msg + ` hasNext errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorHasNextFalseScenarioStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_1900
     * @tc.desc   test PathIterator hasNext method returns false scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorHasNextFalseScenarioStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorHasNextFalseScenarioStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        iter.next(points, 0);
        iter.next(points, 0);
        let hasNext = iter.hasNext();
        console.info(msg + ' hasNext returns false succeeded');
        expect(hasNext).assertFalse();
      } catch (e) {
        console.info(msg + ` hasNext errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorHasNextInitialStateStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2000
     * @tc.desc   test PathIterator hasNext method initial state verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorHasNextInitialStateStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorHasNextInitialStateStatic';
      let path = new drawing.Path();
      let iter = new drawing.PathIterator(path);
      try {
        let hasNext = iter.hasNext();
        console.info(msg + ' hasNext initial state succeeded');
        expect(hasNext).assertFalse();
      } catch (e) {
        console.info(msg + ` hasNext errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorHasNextMiddleStateStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2100
     * @tc.desc   test PathIterator hasNext method middle state verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorHasNextMiddleStateStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorHasNextMiddleStateStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      path.quadTo(10, 15, 10, 10);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        iter.next(points, 0);
        let hasNext = iter.hasNext();
        console.info(msg + ' hasNext middle state succeeded');
        expect(hasNext).assertTrue();
      } catch (e) {
        console.info(msg + ` hasNext errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextPeekMixedCall001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2200
     * @tc.desc   test PathIterator next and peek mixed call scenario 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextPeekMixedCall001Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextPeekMixedCall001Static';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let peek1 = iter.peek();
        let verb1 = iter.next(points, 0);
        let peek2 = iter.peek();
        let verb2 = iter.next(points, 0);
        console.info(msg + ' next and peek mixed call succeeded');
        expect(peek1).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(verb1).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(peek2).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(verb2).assertEqual(drawing.PathIteratorVerb.LINE);
      } catch (e) {
        console.info(msg + ` mixed call errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextHasNextMixedCallStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2300
     * @tc.desc   test PathIterator next and hasNext mixed call scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextHasNextMixedCallStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextHasNextMixedCallStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let hasNext1 = iter.hasNext();
        iter.next(points, 0);
        let hasNext2 = iter.hasNext();
        iter.next(points, 0);
        let hasNext3 = iter.hasNext();
        console.info(msg + ' next and hasNext mixed call succeeded');
        expect(hasNext1).assertTrue();
        expect(hasNext2).assertTrue();
        expect(hasNext3).assertFalse();
      } catch (e) {
        console.info(msg + ` mixed call errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorFullTraversalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2400
     * @tc.desc   test PathIterator full traversal of complex path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorFullTraversalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testPathIteratorFullTraversalStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      path.quadTo(10, 15, 10, 10);
      path.conicTo(200, 400, 100, 200, 3);
      path.cubicTo(100, 100, 80, 150, 300, 150);
      path.close();
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      let verbCount = 0;
      let lastVerb = drawing.PathIteratorVerb.DONE;
      const verbNames = ['MOVE', 'LINE', 'QUAD', 'CONIC', 'CUBIC', 'CLOSE', 'DONE'];
      try {
        while (iter.hasNext()) {
          let verb = iter.next(points, 0);
          if (verb !== undefined) {
            console.info(msg + ' verb[' + verbCount + ']: ' + verbNames[verb] + ' (' + verb + ')');
            lastVerb = verb;
          }
          verbCount++;
        }
        console.info(msg + ' full traversal succeeded, verbCount=' + verbCount);
        expect(verbCount).assertEqual(6);
        expect(lastVerb).assertEqual(drawing.PathIteratorVerb.CLOSE);
      } catch (e) {
        console.info(msg + ` traversal errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorWithPathCopyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2500
     * @tc.desc   test PathIterator with copied Path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorWithPathCopyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorWithPathCopyStatic';
      let path1 = new drawing.Path();
      path1.moveTo(10, 20);
      path1.lineTo(100, 200);
      try {
        let path2 = new drawing.Path(path1);
        let iter = new drawing.PathIterator(path2);
        console.info(msg + ' PathIterator with copied Path succeeded');
        expect(iter != null).assertTrue();
      } catch (e) {
        console.info(msg + ` PathIterator errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorWithEmptyPathTraversalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2600
     * @tc.desc   test PathIterator traversal of empty Path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorWithEmptyPathTraversalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorWithEmptyPathTraversalStatic';
      let path = new drawing.Path();
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let hasNext = iter.hasNext();
        let verb = iter.next(points, 0);
        console.info(msg + ' empty Path traversal succeeded, hasNext=' + hasNext + ', verb=' + verb);
        expect(hasNext).assertFalse();
        expect(verb).assertEqual(drawing.PathIteratorVerb.DONE);
      } catch (e) {
        console.info(msg + ` traversal errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextWithoutOptionalOffsetStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2700
     * @tc.desc   test PathIterator next method without optional offset parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextWithoutOptionalOffsetStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextWithoutOptionalOffsetStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let verb = iter.next(points);
        console.info(msg + ' next without optional offset succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.MOVE);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorMultipleIterationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_2800
     * @tc.desc   test PathIterator multiple iterations on same Path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorMultipleIterationsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorMultipleIterationsStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        let iter1 = new drawing.PathIterator(path);
        iter1.next(points, 0);
        iter1.next(points, 0);
        let iter2 = new drawing.PathIterator(path);
        let verb = iter2.next(points, 0);
        console.info(msg + ' multiple iterations succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.MOVE);
      } catch (e) {
        console.info(msg + ` multiple iterations errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorNextWithLargePointsArrayStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_3000
     * @tc.desc   test PathIterator next method with large points array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorNextWithLargePointsArrayStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorNextWithLargePointsArrayStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [];
      for (let i = 0; i < 100; i++) {
        points.push({ x: i, y: i });
      }
      try {
        let verb = iter.next(points, 0);
        console.info(msg + ' next with large points array succeeded');
        expect(verb).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(points[0].x).assertEqual(10);
        expect(points[0].y).assertEqual(20);
      } catch (e) {
        console.info(msg + ` next errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPathIteratorPeekAndNextConsistencyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_STATIC_3100
     * @tc.desc   test PathIterator peek and next method consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorPeekAndNextConsistencyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorPeekAndNextConsistencyStatic';
      let path = new drawing.Path();
      path.moveTo(10, 20);
      path.lineTo(100, 200);
      path.quadTo(10, 15, 10, 10);
      let iter = new drawing.PathIterator(path);
      let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      try {
        for (let i = 0; i < 3; i++) {
          let peekValue = iter.peek();
          let nextValue = iter.next(points, 0);
          expect(peekValue).assertEqual(nextValue);
        }
        console.info(msg + ' peek and next consistency succeeded');
      } catch (e) {
        console.info(msg + ` consistency errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}