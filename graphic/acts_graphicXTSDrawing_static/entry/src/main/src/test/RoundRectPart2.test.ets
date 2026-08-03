'use static';
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

export default function DrawingTsRoundRectPart2Test(): void {
  describe('DrawingTsRoundRectPart2Test', () => {
    /**
     * @tc.name   testRoundRectConstructorBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_0100
     * @tc.desc   test constructor with boundary values (extreme values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectConstructorBoundary001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRoundRectConstructorBoundary001Static';

      try {
        let rect: common2D.Rect = { left: Number.MAX_SAFE_INTEGER, top: 0, right: Number.MAX_SAFE_INTEGER, bottom: 100 };
        let roundRect = new drawing.RoundRect(rect, 50, 50);
        console.info(msg + ' constructor with MAX_SAFE_INTEGER succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        let rect: common2D.Rect = { left: Number.MIN_SAFE_INTEGER, top: 0, right: 100, bottom: 100 };
        let roundRect = new drawing.RoundRect(rect, 50, 50);
        console.info(msg + ' constructor with MIN_SAFE_INTEGER succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        let rect: common2D.Rect = { left: 0, top: 0, right: 100, bottom: 100 };
        let roundRect = new drawing.RoundRect(rect, Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER);
        console.info(msg + ' constructor with extreme radii succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        let rect: common2D.Rect = { left: 0, top: 0, right: 100, bottom: 100 };
        let roundRect = new drawing.RoundRect(rect, Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER);
        console.info(msg + ' constructor with MIN radii succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        let rect: common2D.Rect = { left: 0.0001, top: 0.0001, right: 0.0002, bottom: 0.0002 };
        let roundRect = new drawing.RoundRect(rect, 0.0001, 0.0001);
        console.info(msg + ' constructor with very small values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectSetCornerAllEnums001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_0200
     * @tc.desc   test setCorner with all CornerPos enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectSetCornerAllEnums001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRoundRectSetCornerAllEnums001Static';
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
      let roundRect = new drawing.RoundRect(rect, 50, 50);

      try {
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 100, 100);
        let point = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point!.x).assertEqual(100);
        expect(point!.y).assertEqual(100);
        console.info(msg + ' TOP_LEFT_POS succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' TOP_LEFT_POS failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 150, 150);
        let point = roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point!.x).assertEqual(150);
        expect(point!.y).assertEqual(150);
        console.info(msg + ' TOP_RIGHT_POS succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' TOP_RIGHT_POS failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 200, 200);
        let point = roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(point!.x).assertEqual(200);
        expect(point!.y).assertEqual(200);
        console.info(msg + ' BOTTOM_RIGHT_POS succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' BOTTOM_RIGHT_POS failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 250, 250);
        let point = roundRect.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(point!.x).assertEqual(250);
        expect(point!.y).assertEqual(250);
        console.info(msg + ' BOTTOM_LEFT_POS succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' BOTTOM_LEFT_POS failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectSetCornerBoundary002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_0300
     * @tc.desc   test setCorner with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRoundRectSetCornerBoundary002Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRoundRectSetCornerBoundary002Static';
      let rect: common2D.Rect = { left: 0, top: 0, right: 500, bottom: 500 };
      let roundRect = new drawing.RoundRect(rect, 50, 50);

      try {
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, Number.MAX_SAFE_INTEGER, 100);
        console.info(msg + ' MAX_SAFE_INTEGER x succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' MAX_SAFE_INTEGER x failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 100, Number.MAX_SAFE_INTEGER);
        console.info(msg + ' MAX_SAFE_INTEGER y succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' MAX_SAFE_INTEGER y failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 0, 0);
        let point = roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(point!.x).assertEqual(0);
        expect(point!.y).assertEqual(0);
        console.info(msg + ' zero values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' zero values failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 0.0001, 0.0001);
        let point = roundRect.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(Math.abs(point!.x - 0.0001) < 0.001).assertTrue();
        expect(Math.abs(point!.y - 0.0001) < 0.001).assertTrue();
        console.info(msg + ' very small values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' very small values failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectOffsetBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_0400
     * @tc.desc   test offset with boundary values and verify position change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectOffsetBoundary001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRoundRectOffsetBoundary001Static';
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
      let roundRect = new drawing.RoundRect(rect, 50, 50);

      try {
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 100, 100);
        let point1 = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point1!.x).assertEqual(100);
        expect(point1!.y).assertEqual(100);

        roundRect.offset(50, 50);
        let point2 = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point2!.x).assertEqual(100);
        expect(point2!.y).assertEqual(100);
        console.info(msg + ' offset(50, 50) succeeded, corner unchanged');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' offset(50, 50) failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      let roundRect2 = new drawing.RoundRect(rect, 50, 50);
      try {
        roundRect2.offset(Number.MAX_SAFE_INTEGER, 100);
        console.info(msg + ' MAX_SAFE_INTEGER dx succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' MAX_SAFE_INTEGER dx failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      let roundRect3 = new drawing.RoundRect(rect, 50, 50);
      try {
        roundRect3.offset(-Number.MAX_SAFE_INTEGER, 100);
        console.info(msg + ' negative MAX_SAFE_INTEGER dx succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' negative MAX_SAFE_INTEGER dx failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      let roundRect4 = new drawing.RoundRect(rect, 50, 50);
      try {
        roundRect4.offset(0.0001, 0.0001);
        console.info(msg + ' very small offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' very small offset failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectCopyConstructor001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_0500
     * @tc.desc   test copy constructor and verify all properties are copied correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectCopyConstructor001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRoundRectCopyConstructor001Static';
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
      let roundRect1 = new drawing.RoundRect(rect, 50, 50);
      let roundRect2: drawing.RoundRect;

      roundRect1.setCorner(drawing.CornerPos.TOP_LEFT_POS, 10, 15);
      roundRect1.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 20, 25);
      roundRect1.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 30, 35);
      roundRect1.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 40, 45);

      roundRect2 = new drawing.RoundRect(roundRect1);
      try {

        let point1 = roundRect2.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point1!.x).assertEqual(10);
        expect(point1!.y).assertEqual(15);

        let point2 = roundRect2.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point2!.x).assertEqual(20);
        expect(point2!.y).assertEqual(25);

        let point3 = roundRect2.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(point3!.x).assertEqual(30);
        expect(point3!.y).assertEqual(35);

        let point4 = roundRect2.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(point4!.x).assertEqual(40);
        expect(point4!.y).assertEqual(45);

        console.info(msg + ' copy constructor verified all corners succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' copy constructor failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        roundRect1.setCorner(drawing.CornerPos.TOP_LEFT_POS, 100, 100);
        let point = roundRect2.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point!.x).assertEqual(10);
        expect(point!.y).assertEqual(15);
        console.info(msg + ' verify copy is independent succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' verify copy independence failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectCombinedOperations001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_0600
     * @tc.desc   test combined operations: constructor, setCorner, offset, getCorner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRoundRectCombinedOperations001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRoundRectCombinedOperations001Static';

      try {
        let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
        let roundRect = new drawing.RoundRect(rect, 50, 50);

        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 30, 30);
        let point1 = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point1!.x).assertEqual(30);
        expect(point1!.y).assertEqual(30);

        roundRect.offset(100, 100);
        let point2 = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point2!.x).assertEqual(30);
        expect(point2!.y).assertEqual(30);

        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 40, 40);
        let point3 = roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point3!.x).assertEqual(40);
        expect(point3!.y).assertEqual(40);

        console.info(msg + ' combined operations succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' combined operations failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectConstructorInvalidRect001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_0800
     * @tc.desc   test constructor with invalid rect values (left > right, top > bottom)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRoundRectConstructorInvalidRect001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRoundRectConstructorInvalidRect001Static';

      try {
        let rect: common2D.Rect = { left: 500, top: 300, right: 100, bottom: 100 };
        let roundRect = new drawing.RoundRect(rect, 50, 50);
        console.info(msg + ' inverted rect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' inverted rect failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        let rect: common2D.Rect = { left: 100, top: 100, right: 100, bottom: 100 };
        let roundRect = new drawing.RoundRect(rect, 50, 50);
        console.info(msg + ' zero-size rect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' zero-size rect failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectOffsetMultipleTimes001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_0900
     * @tc.desc   test offset called multiple times consecutively
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRoundRectOffsetMultipleTimes001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRoundRectOffsetMultipleTimes001Static';
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
      let roundRect = new drawing.RoundRect(rect, 50, 50);

      try {
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 100, 100);

        roundRect.offset(50, 50);
        roundRect.offset(50, 50);
        roundRect.offset(50, 50);

        let point = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point!.x).assertEqual(100);
        expect(point!.y).assertEqual(100);

        console.info(msg + ' multiple offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' multiple offset failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectSetCornerAfterOffset001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_1000
     * @tc.desc   test setCorner after offset and verify corner values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRoundRectSetCornerAfterOffset001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRoundRectSetCornerAfterOffset001Static';
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
      let roundRect = new drawing.RoundRect(rect, 50, 50);

      try {
        roundRect.offset(100, 100);

        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 200, 200);
        let point = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point!.x).assertEqual(200);
        expect(point!.y).assertEqual(200);

        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 300, 300);
        let point2 = roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point2!.x).assertEqual(300);
        expect(point2!.y).assertEqual(300);

        console.info(msg + ' setCorner after offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' setCorner after offset failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectConstructorWithNegativeRadii001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_1100
     * @tc.desc   test constructor with negative radii and verify behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRoundRectConstructorWithNegativeRadii001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRoundRectConstructorWithNegativeRadii001Static';

      try {
        let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
        let roundRect = new drawing.RoundRect(rect, -50, 50);
        console.info(msg + ' negative xRadii succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' negative xRadii failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
        let roundRect = new drawing.RoundRect(rect, 50, -50);
        console.info(msg + ' negative yRadii succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' negative yRadii failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      try {
        let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
        let roundRect = new drawing.RoundRect(rect, -50, -50);
        console.info(msg + ' both negative radii succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' both negative radii failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectCopyConstructorWithModified001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_1300
     * @tc.desc   test copy constructor after modifying original and verify copy is independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRoundRectCopyConstructorWithModified001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRoundRectCopyConstructorWithModified001Static';
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
      let roundRect1 = new drawing.RoundRect(rect, 50, 50);

      roundRect1.setCorner(drawing.CornerPos.TOP_LEFT_POS, 100, 100);

      try {
        let roundRect2 = new drawing.RoundRect(roundRect1);
        let point1 = roundRect2.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point1!.x).assertEqual(100);
        expect(point1!.y).assertEqual(100);

        roundRect1.setCorner(drawing.CornerPos.TOP_LEFT_POS, 200, 200);

        let point2 = roundRect2.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point2!.x).assertEqual(100);
        expect(point2!.y).assertEqual(100);

        let point3 = roundRect1.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point3!.x).assertEqual(200);
        expect(point3!.y).assertEqual(200);

        console.info(msg + ' copy is independent from original succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' copy independence test failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectSetCornerAllPositions001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_1400
     * @tc.desc   test setCorner for all four positions and verify each corner independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectSetCornerAllPositions001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRoundRectSetCornerAllPositions001Static';
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
      let roundRect = new drawing.RoundRect(rect, 50, 50);

      try {
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 10, 10);
        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 20, 20);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 30, 30);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 40, 40);

        let topLeft = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(topLeft!.x).assertEqual(10);
        expect(topLeft!.y).assertEqual(10);

        let topRight = roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(topRight!.x).assertEqual(20);
        expect(topRight!.y).assertEqual(20);

        let bottomRight = roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(bottomRight!.x).assertEqual(30);
        expect(bottomRight!.y).assertEqual(30);

        let bottomLeft = roundRect.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(bottomLeft!.x).assertEqual(40);
        expect(bottomLeft!.y).assertEqual(40);

        console.info(msg + ' all four corners set and verified succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' all corners test failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectOffsetNegativeValues001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_ROUNDRECT_STATIC_1500
     * @tc.desc   test offset with negative values and verify behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRoundRectOffsetNegativeValues001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRoundRectOffsetNegativeValues001Static';
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 300 };
      let roundRect = new drawing.RoundRect(rect, 50, 50);

      try {
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 100, 100);

        roundRect.offset(-50, -50);
        let point = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point!.x).assertEqual(100);
        expect(point!.y).assertEqual(100);

        console.info(msg + ' negative offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' negative offset failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }

      let roundRect2 = new drawing.RoundRect(rect, 50, 50);
      try {
        roundRect2.offset(-1000, -1000);
        console.info(msg + ' large negative offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' large negative offset failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });
  });
}