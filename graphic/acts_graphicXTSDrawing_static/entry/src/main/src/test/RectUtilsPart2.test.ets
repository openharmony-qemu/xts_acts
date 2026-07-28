'use static';
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
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function DrawingTsRectUtilsPart2Test(): void {
  describe('DrawingTsRectUtilsPart2Test', (): void => {
    /**
     * @tc.name   testRectUtilsMakeLtrbBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0100
     * @tc.desc   test makeLtrb with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsMakeLtrbBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsMakeLtrbBoundaryValueStatic';
      try {
        let rect1 = drawing.RectUtils.makeLtrb(0, 0, 0, 0);
        expect(rect1!.left).assertEqual(0);
        expect(rect1!.top).assertEqual(0);
        expect(rect1!.right).assertEqual(0);
        expect(rect1!.bottom).assertEqual(0);
        console.info(msg + ' makeLtrb(0,0,0,0) succeeded');
      } catch (e) {
        console.info(msg + ` makeLtrb errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect2 = drawing.RectUtils.makeLtrb(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        console.info(msg + ' makeLtrb with MAX_VALUE succeeded');
      } catch (e) {
        console.info(msg + ` makeLtrb errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect3 = drawing.RectUtils.makeLtrb(Number.MIN_VALUE, Number.MIN_VALUE, Number.MIN_VALUE, Number.MIN_VALUE);
        console.info(msg + ' makeLtrb with MIN_VALUE succeeded');
      } catch (e) {
        console.info(msg + ` makeLtrb errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect4 = drawing.RectUtils.makeLtrb(-Number.MAX_VALUE, -Number.MAX_VALUE, -Number.MAX_VALUE, -Number.MAX_VALUE);
        console.info(msg + ' makeLtrb with -MAX_VALUE succeeded');
      } catch (e) {
        console.info(msg + ` makeLtrb errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect5 = drawing.RectUtils.makeLtrb(0.5, 0.5, 0.5, 0.5);
        expect(Math.abs(rect5!.left - 0.5) < 0.01).assertTrue();
        expect(Math.abs(rect5!.top - 0.5) < 0.01).assertTrue();
        expect(Math.abs(rect5!.right - 0.5) < 0.01).assertTrue();
        expect(Math.abs(rect5!.bottom - 0.5) < 0.01).assertTrue();
        console.info(msg + ' makeLtrb(0.5,0.5,0.5,0.5) succeeded');
      } catch (e) {
        console.info(msg + ` makeLtrb errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsMakeLtrbReversedRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0200
     * @tc.desc   test makeLtrb with reversed coordinates (left > right or top > bottom).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsMakeLtrbReversedRectStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsMakeLtrbReversedRectStatic';
      try {
        let rect1 = drawing.RectUtils.makeLtrb(100, 100, 10, 10);
        expect(rect1!.left).assertEqual(100);
        expect(rect1!.top).assertEqual(100);
        expect(rect1!.right).assertEqual(10);
        expect(rect1!.bottom).assertEqual(10);
        console.info(msg + ' makeLtrb reversed rect succeeded');
      } catch (e) {
        console.info(msg + ` makeLtrb errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect2 = drawing.RectUtils.makeLtrb(50, 50, 50, 10);
        expect(rect2!.left).assertEqual(50);
        expect(rect2!.top).assertEqual(50);
        expect(rect2!.right).assertEqual(50);
        expect(rect2!.bottom).assertEqual(10);
        console.info(msg + ' makeLtrb with same left and right succeeded');
      } catch (e) {
        console.info(msg + ` makeLtrb errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsGetWidthNegativeWidthStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0300
     * @tc.desc   test getWidth with reversed rect (left > right).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsGetWidthNegativeWidthStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsGetWidthNegativeWidthStatic';
      try {
        let rect = drawing.RectUtils.makeLtrb(100, 50, 10, 50);
        let width = drawing.RectUtils.getWidth(rect!);
        expect(width < 0).assertTrue();
        console.info(msg + ' getWidth with reversed rect succeeded, width=' + width);
      } catch (e) {
        console.info(msg + ` getWidth errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect2 = drawing.RectUtils.makeLtrb(50, 50, 50, 50);
        let width2 = drawing.RectUtils.getWidth(rect2!);
        expect(width2).assertEqual(0);
        console.info(msg + ' getWidth with same left and right succeeded, width=' + width2);
      } catch (e) {
        console.info(msg + ` getWidth errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsGetHeightNegativeHeightStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0400
     * @tc.desc   test getHeight with reversed rect (top > bottom).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsGetHeightNegativeHeightStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsGetHeightNegativeHeightStatic';
      try {
        let rect = drawing.RectUtils.makeLtrb(50, 100, 50, 10);
        let height = drawing.RectUtils.getHeight(rect!);
        expect(height < 0).assertTrue();
        console.info(msg + ' getHeight with reversed rect succeeded, height=' + height);
      } catch (e) {
        console.info(msg + ` getHeight errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect2 = drawing.RectUtils.makeLtrb(50, 50, 50, 50);
        let height2 = drawing.RectUtils.getHeight(rect2!);
        expect(height2).assertEqual(0);
        console.info(msg + ' getHeight with same top and bottom succeeded, height=' + height2);
      } catch (e) {
        console.info(msg + ` getHeight errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsCenterXYPrecisionStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0500
     * @tc.desc   test centerX and centerY precision verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsCenterXYPrecisionStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsCenterXYPrecisionStatic';
      try {
        let rect = drawing.RectUtils.makeLtrb(10.5, 20.5, 30.5, 40.5);
        let centerX = drawing.RectUtils.centerX(rect!);
        let centerY = drawing.RectUtils.centerY(rect!);
        let expectedX = (10.5 + 30.5) / 2;
        let expectedY = (20.5 + 40.5) / 2;
        expect(Math.abs(centerX - expectedX) < 0.01).assertTrue();
        expect(Math.abs(centerY - expectedY) < 0.01).assertTrue();
        console.info(msg + ' centerX and centerY precision succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsContainsPointBoundaryStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0600
     * @tc.desc   test contains point with boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsContainsPointBoundaryStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsContainsPointBoundaryStatic';
      let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        let contains1 = drawing.RectUtils.contains(rect!, 0, 0);
        expect(contains1).assertTrue();
        let contains2 = drawing.RectUtils.contains(rect!, 0, 50);
        expect(contains2).assertTrue();
        let contains3 = drawing.RectUtils.contains(rect!, 50, 0);
        expect(contains3).assertTrue();
        console.info(msg + ' contains left and top boundary succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let contains4 = drawing.RectUtils.contains(rect!, 100, 100);
        expect(contains4).assertFalse();
        let contains5 = drawing.RectUtils.contains(rect!, 100, 50);
        expect(contains5).assertFalse();
        let contains6 = drawing.RectUtils.contains(rect!, 50, 100);
        expect(contains6).assertFalse();
        console.info(msg + ' contains right and bottom boundary succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let contains7 = drawing.RectUtils.contains(rect!, 99.9, 99.9);
        expect(contains7).assertTrue();
        let contains8 = drawing.RectUtils.contains(rect!, 0.1, 0.1);
        expect(contains8).assertTrue();
        console.info(msg + ' contains near boundary succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsContainsRectEqualStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0700
     * @tc.desc   test contains rect with equal rectangles.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsContainsRectEqualStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsContainsRectEqualStatic';
      let rect1 = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      let rect2 = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        let contains = drawing.RectUtils.contains(rect1!, rect2!);
        expect(contains).assertTrue();
        console.info(msg + ' contains equal rectangles succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsContainsRectEmptyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0800
     * @tc.desc   test contains rect with empty rectangles.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsContainsRectEmptyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsContainsRectEmptyStatic';
      let rect1 = drawing.RectUtils.makeEmpty();
      let rect2 = drawing.RectUtils.makeEmpty();
      try {
        let contains1 = drawing.RectUtils.contains(rect1!, rect2!);
        expect(contains1).assertFalse();
        console.info(msg + ' empty rect contains empty rect should be false');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      let rect3 = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        let contains2 = drawing.RectUtils.contains(rect3!, rect1!);
        expect(contains2).assertFalse();
        console.info(msg + ' normal rect contains empty rect should be false');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsInsetZeroValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_0900
     * @tc.desc   test inset with zero values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsInsetZeroValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsInsetZeroValueStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
      try {
        drawing.RectUtils.inset(rect!, 0, 0, 0, 0);
        expect(rect!.left).assertEqual(10);
        expect(rect!.top).assertEqual(20);
        expect(rect!.right).assertEqual(30);
        expect(rect!.bottom).assertEqual(40);
        console.info(msg + ' inset with zero values succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsInsetLargeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1000
     * @tc.desc   test inset with large values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsInsetLargeValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testRectUtilsInsetLargeValueStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
      try {
        drawing.RectUtils.inset(rect!, 10000, 10000, 10000, 10000);
        console.info(msg + ' inset with large values succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsIntersectNoIntersectionStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1100
     * @tc.desc   test intersect with no intersection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsIntersectNoIntersectionStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsIntersectNoIntersectionStatic';
      let rect1 = drawing.RectUtils.makeLtrb(0, 0, 10, 10);
      let rect2 = drawing.RectUtils.makeLtrb(20, 20, 30, 30);
      try {
        let intersect = drawing.RectUtils.intersect(rect1!, rect2!);
        expect(intersect).assertFalse();
        console.info(msg + ' intersect with no intersection succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsIntersectPartialIntersectionStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1200
     * @tc.desc   test intersect with partial intersection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsIntersectPartialIntersectionStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsIntersectPartialIntersectionStatic';
      let rect1 = drawing.RectUtils.makeLtrb(0, 0, 20, 20);
      let rect2 = drawing.RectUtils.makeLtrb(10, 10, 30, 30);
      try {
        let intersect = drawing.RectUtils.intersect(rect1!, rect2!);
        expect(intersect).assertTrue();
        expect(rect1!.left).assertEqual(10);
        expect(rect1!.top).assertEqual(10);
        expect(rect1!.right).assertEqual(20);
        expect(rect1!.bottom).assertEqual(20);
        console.info(msg + ' intersect with partial intersection succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsIsIntersectEdgeCaseStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1300
     * @tc.desc   test isIntersect with edge touching case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsIsIntersectEdgeCaseStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsIsIntersectEdgeCaseStatic';
      try {
        let rect1 = drawing.RectUtils.makeLtrb(0, 0, 10, 10);
        let rect2 = drawing.RectUtils.makeLtrb(10, 10, 20, 20);
        let isIntersect1 = drawing.RectUtils.isIntersect(rect1!, rect2!);
        expect(isIntersect1).assertFalse();
        console.info(msg + ' edge touching should be false');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect3 = drawing.RectUtils.makeLtrb(0, 0, 10, 10);
        let rect4 = drawing.RectUtils.makeLtrb(10, 0, 20, 10);
        let isIntersect2 = drawing.RectUtils.isIntersect(rect3!, rect4!);
        expect(isIntersect2).assertFalse();
        console.info(msg + ' side touching should be false');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsUnionWithEmptyStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1400
     * @tc.desc   test union with empty rect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsUnionWithEmptyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsUnionWithEmptyStatic';
      let rect1 = drawing.RectUtils.makeLtrb(0, 0, 10, 10);
      let rect2 = drawing.RectUtils.makeEmpty();
      try {
        drawing.RectUtils.union(rect1!, rect2!);
        expect(rect1!.left).assertEqual(0);
        expect(rect1!.top).assertEqual(0);
        expect(rect1!.right).assertEqual(10);
        expect(rect1!.bottom).assertEqual(10);
        console.info(msg + ' union with empty rect succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsUnionEmptyWithNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1500
     * @tc.desc   test union empty rect with normal rect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsUnionEmptyWithNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsUnionEmptyWithNormalStatic';
      let rect1 = drawing.RectUtils.makeEmpty();
      let rect2 = drawing.RectUtils.makeLtrb(0, 0, 10, 10);
      try {
        drawing.RectUtils.union(rect1!, rect2!);
        console.info(msg + ' union empty with normal succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsIsEmptyReversedRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1600
     * @tc.desc   test isEmpty with reversed rect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsIsEmptyReversedRectStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsIsEmptyReversedRectStatic';
      try {
        let rect1 = drawing.RectUtils.makeLtrb(100, 100, 10, 10);
        let isEmpty1 = drawing.RectUtils.isEmpty(rect1!);
        expect(isEmpty1).assertTrue();
        console.info(msg + ' reversed rect is empty');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect2 = drawing.RectUtils.makeLtrb(50, 50, 50, 50);
        let isEmpty2 = drawing.RectUtils.isEmpty(rect2!);
        expect(isEmpty2).assertTrue();
        console.info(msg + ' rect with same left and right is empty');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let rect3 = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
        let isEmpty3 = drawing.RectUtils.isEmpty(rect3!);
        expect(isEmpty3).assertTrue();
        console.info(msg + ' rect with same top and bottom is empty');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsOffsetZeroStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1700
     * @tc.desc   test offset with zero dx and dy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsOffsetZeroStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsOffsetZeroStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
      try {
        drawing.RectUtils.offset(rect!, 0, 0);
        expect(rect!.left).assertEqual(10);
        expect(rect!.top).assertEqual(20);
        expect(rect!.right).assertEqual(30);
        expect(rect!.bottom).assertEqual(40);
        console.info(msg + ' offset with zero succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsOffsetNegativeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1800
     * @tc.desc   test offset with negative dx and dy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsOffsetNegativeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsOffsetNegativeStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
      try {
        drawing.RectUtils.offset(rect!, -5, -10);
        expect(rect!.left).assertEqual(5);
        expect(rect!.top).assertEqual(10);
        expect(rect!.right).assertEqual(25);
        expect(rect!.bottom).assertEqual(30);
        console.info(msg + ' offset with negative succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsOffsetToSamePositionStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_1900
     * @tc.desc   test offsetTo same position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsOffsetToSamePositionStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsOffsetToSamePositionStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
      try {
        drawing.RectUtils.offsetTo(rect!, 10, 20);
        expect(rect!.left).assertEqual(10);
        expect(rect!.top).assertEqual(20);
        expect(rect!.right).assertEqual(30);
        expect(rect!.bottom).assertEqual(40);
        console.info(msg + ' offsetTo same position succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsSetRectToSelfStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_2000
     * @tc.desc   test setRect to itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsSetRectToSelfStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsSetRectToSelfStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
      try {
        drawing.RectUtils.setRect(rect!, rect!);
        console.info(msg + ' setRect to self succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsSetLtrbZeroValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_2100
     * @tc.desc   test setLtrb with zero values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsSetLtrbZeroValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsSetLtrbZeroValueStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
      try {
        drawing.RectUtils.setLtrb(rect!, 0, 0, 0, 0);
        expect(rect!.left).assertEqual(0);
        expect(rect!.top).assertEqual(0);
        expect(rect!.right).assertEqual(0);
        expect(rect!.bottom).assertEqual(0);
        console.info(msg + ' setLtrb zero succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsSortNormalRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_2200
     * @tc.desc   test sort with normal rect (left < right and top < bottom).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsSortNormalRectStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsSortNormalRectStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
      try {
        drawing.RectUtils.sort(rect!);
        expect(rect!.left).assertEqual(10);
        expect(rect!.top).assertEqual(20);
        expect(rect!.right).assertEqual(30);
        expect(rect!.bottom).assertEqual(40);
        console.info(msg + ' sort normal rect succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsSortReversedRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_2300
     * @tc.desc   test sort with reversed rect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsSortReversedRectStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsSortReversedRectStatic';
      let rect = drawing.RectUtils.makeLtrb(30, 40, 10, 20);
      try {
        drawing.RectUtils.sort(rect!);
        expect(rect!.left).assertEqual(10);
        expect(rect!.top).assertEqual(20);
        expect(rect!.right).assertEqual(30);
        expect(rect!.bottom).assertEqual(40);
        console.info(msg + ' sort reversed rect succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsIsEqualEmptyRectsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_2400
     * @tc.desc   test isEqual with empty rectangles.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsIsEqualEmptyRectsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsIsEqualEmptyRectsStatic';
      let rect1 = drawing.RectUtils.makeEmpty();
      let rect2 = drawing.RectUtils.makeEmpty();
      try {
        let isEqual = drawing.RectUtils.isEqual(rect1!, rect2!);
        expect(isEqual).assertTrue();
        console.info(msg + ' empty rects are equal');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsCombinedOperationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_2500
     * @tc.desc   test multiple RectUtils operations combined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsCombinedOperationsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsCombinedOperationsStatic';
      try {
        let rect1 = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
        let rect2 = drawing.RectUtils.makeLtrb(50, 50, 150, 150);
        drawing.RectUtils.intersect(rect1!, rect2!);
        expect(drawing.RectUtils.isEmpty(rect1!)).assertFalse();

        let width = drawing.RectUtils.getWidth(rect1!);
        let height = drawing.RectUtils.getHeight(rect1!);
        expect(width > 0).assertTrue();
        expect(height > 0).assertTrue();

        drawing.RectUtils.offset(rect1!, 10, 20);
        let centerX = drawing.RectUtils.centerX(rect1!);
        let centerY = drawing.RectUtils.centerY(rect1!);

        drawing.RectUtils.sort(rect1!);
        console.info(msg + ' combined operations succeeded');
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRectUtilsCopyAndModifyChainStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECTUTILS_STATIC_2600
     * @tc.desc   test copy and modify chain operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsCopyAndModifyChainStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRectUtilsCopyAndModifyChainStatic';
      try {
        let rect1 = drawing.RectUtils.makeLtrb(10, 20, 30, 40);
        let rect2 = drawing.RectUtils.makeCopy(rect1!);
        drawing.RectUtils.inset(rect2!, -5, -5, 5, 5);
        let width1 = drawing.RectUtils.getWidth(rect1!);
        let width2 = drawing.RectUtils.getWidth(rect2!);
        console.info(msg + ' copy and modify chain succeeded, width1=' + width1 + ', width2=' + width2);
        expect(width1).assertEqual(20);
        expect(width2).assertEqual(20);
      } catch (e) {
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}