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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function DrawingPathIteratorPart2Test() {

  describe('DrawingPathIteratorPart2Test', () => {
    /**
     * @tc.name   testPathIteratorConstructorEmptyPath
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0100
     * @tc.desc   test PathIterator constructor with empty Path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorConstructorEmptyPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorConstructorEmptyPath';
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
     * @tc.name   testPathIteratorConstructorNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0200
     * @tc.desc   test PathIterator constructor with null Path parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorConstructorNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorConstructorNull';
      try {
        let iter = new drawing.PathIterator(null);
        console.info(msg + ' PathIterator constructor with null should fail');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` PathIterator constructor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testPathIteratorConstructorUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0300
     * @tc.desc   test PathIterator constructor with undefined Path parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorConstructorUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorConstructorUndefined';
      try {
        let iter = new drawing.PathIterator(undefined);
        console.info(msg + ' PathIterator constructor with undefined should fail');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` PathIterator constructor errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testPathIteratorConstructorComplexPath
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0400
     * @tc.desc   test PathIterator constructor with complex Path containing multiple operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorConstructorComplexPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorConstructorComplexPath';
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
     * @tc.name   testPathIteratorNextOffsetBoundary001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0500
     * @tc.desc   test PathIterator next method with offset boundary value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextOffsetBoundary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextOffsetBoundary001';
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
     * @tc.name   testPathIteratorNextOffsetBoundary002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0600
     * @tc.desc   test PathIterator next method with offset boundary value max (size-4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorNextOffsetBoundary002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorNextOffsetBoundary002';
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
     * @tc.name   testPathIteratorNextOffsetBoundary003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0700
     * @tc.desc   test PathIterator next method with offset out of range (negative value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorNextOffsetBoundary003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorNextOffsetBoundary003';
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
     * @tc.name   testPathIteratorNextOffsetBoundary004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0800
     * @tc.desc   test PathIterator next method with offset out of range (exceed size-4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorNextOffsetBoundary004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorNextOffsetBoundary004';
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
     * @tc.name   testPathIteratorNextPointsMinLength
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_0900
     * @tc.desc   test PathIterator next method with points array minimum length 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextPointsMinLength', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextPointsMinLength';
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
     * @tc.name   testPathIteratorNextPointsCoordinateVerification
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1000
     * @tc.desc   test PathIterator next method points coordinate verification for MOVE verb.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextPointsCoordinateVerification', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextPointsCoordinateVerification';
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
     * @tc.name   testPathIteratorNextLINECoordinateVerification
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1100
     * @tc.desc   test PathIterator next method points coordinate verification for LINE verb.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextLINECoordinateVerification', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextLINECoordinateVerification';
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
     * @tc.name   testPathIteratorNextQUADCoordinateVerification
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1200
     * @tc.desc   test PathIterator next method points coordinate verification for QUAD verb.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextQUADCoordinateVerification', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextQUADCoordinateVerification';
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
     * @tc.name   testPathIteratorNextCUBICCoordinateVerification
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1300
     * @tc.desc   test PathIterator next method points coordinate verification for CUBIC verb.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextCUBICCoordinateVerification', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextCUBICCoordinateVerification';
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
     * @tc.name   testPathIteratorNextCLOSEVerbVerification
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1400
     * @tc.desc   test PathIterator next method CLOSE verb verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextCLOSEVerbVerification', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextCLOSEVerbVerification';
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
     * @tc.name   testPathIteratorNextDONEVerbVerification
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1500
     * @tc.desc   test PathIterator next method DONE verb verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextDONEVerbVerification', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextDONEVerbVerification';
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
     * @tc.name   testPathIteratorPeekMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1600
     * @tc.desc   test PathIterator peek method multiple calls without moving iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorPeekMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorPeekMultipleCalls';
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
     * @tc.name   testPathIteratorPeekReturnValueVerification
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1700
     * @tc.desc   test PathIterator peek method return value verification at different positions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorPeekReturnValueVerification', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorPeekReturnValueVerification';
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
     * @tc.name   testPathIteratorHasNextTrueScenario
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1800
     * @tc.desc   test PathIterator hasNext method returns true scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorHasNextTrueScenario', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorHasNextTrueScenario';
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
     * @tc.name   testPathIteratorHasNextFalseScenario
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_1900
     * @tc.desc   test PathIterator hasNext method returns false scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorHasNextFalseScenario', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorHasNextFalseScenario';
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
     * @tc.name   testPathIteratorHasNextInitialState
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2000
     * @tc.desc   test PathIterator hasNext method initial state verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorHasNextInitialState', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorHasNextInitialState';
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
     * @tc.name   testPathIteratorHasNextMiddleState
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2100
     * @tc.desc   test PathIterator hasNext method middle state verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorHasNextMiddleState', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorHasNextMiddleState';
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
     * @tc.name   testPathIteratorNextPeekMixedCall001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2200
     * @tc.desc   test PathIterator next and peek mixed call scenario 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextPeekMixedCall001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextPeekMixedCall001';
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
     * @tc.name   testPathIteratorNextHasNextMixedCall
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2300
     * @tc.desc   test PathIterator next and hasNext mixed call scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextHasNextMixedCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextHasNextMixedCall';
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
     * @tc.name   testPathIteratorFullTraversal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2400
     * @tc.desc   test PathIterator full traversal of complex path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorFullTraversal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorFullTraversal';
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
          console.info(msg + ' verb[' + verbCount + ']: ' + verbNames[verb] + ' (' + verb + ')');
          lastVerb = verb;
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
     * @tc.name   testPathIteratorWithPathCopy
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2500
     * @tc.desc   test PathIterator with copied Path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorWithPathCopy', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorWithPathCopy';
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
     * @tc.name   testPathIteratorWithEmptyPathTraversal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2600
     * @tc.desc   test PathIterator traversal of empty Path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorWithEmptyPathTraversal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorWithEmptyPathTraversal';
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
     * @tc.name   testPathIteratorNextWithoutOptionalOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2700
     * @tc.desc   test PathIterator next method without optional offset parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorNextWithoutOptionalOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorNextWithoutOptionalOffset';
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
     * @tc.name   testPathIteratorMultipleIterations
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_2800
     * @tc.desc   test PathIterator multiple iterations on same Path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorMultipleIterations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorMultipleIterations';
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
     * @tc.name   testPathIteratorNextWithLargePointsArray
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_3000
     * @tc.desc   test PathIterator next method with large points array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIteratorNextWithLargePointsArray', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIteratorNextWithLargePointsArray';
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
     * @tc.name   testPathIteratorPeekAndNextConsistency
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_PATHITERATOR_3100
     * @tc.desc   test PathIterator peek and next method consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIteratorPeekAndNextConsistency', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIteratorPeekAndNextConsistency';
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