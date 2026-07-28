'use static';
/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsRegionPart3Test(): void {
  describe('drawingTsRegionPart3Test', (): void => {
    let pixel: image.PixelMap;
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    });

    /**
     * @tc.name   testRegionOffsetBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0100
     * @tc.desc   test offset with boundary values (dx=0, dy=0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOffsetBoundary001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testRegionOffsetBoundary001Static';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      try {
        region.offset(0, 0);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(100);
          expect(bounds.top).assertEqual(100);
          expect(bounds.right).assertEqual(400);
          expect(bounds.bottom).assertEqual(400);
          console.info(msg + ' offset(0, 0) succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOffsetBoundary002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0200
     * @tc.desc   test offset with negative boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOffsetBoundary002Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testRegionOffsetBoundary002Static';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      try {
        region.offset(-100, -100);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(0);
          expect(bounds.top).assertEqual(0);
          expect(bounds.right).assertEqual(300);
          expect(bounds.bottom).assertEqual(300);
          console.info(msg + ' offset(-100, -100) succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOffsetBoundary003Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0300
     * @tc.desc   test offset with large positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOffsetBoundary003Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testRegionOffsetBoundary003Static';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      try {
        region.offset(1000, 1000);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(1100);
          expect(bounds.top).assertEqual(1100);
          expect(bounds.right).assertEqual(1400);
          expect(bounds.bottom).assertEqual(1400);
          console.info(msg + ' offset(1000, 1000) succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOffsetBoundary004Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0400
     * @tc.desc   test offset on empty region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOffsetBoundary004Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionOffsetBoundary004Static';
      let region = new drawing.Region();
      try {
        region.offset(100, 100);
        let isEmpty = region.isEmpty();
        expect(isEmpty).assertEqual(true);
        console.info(msg + ' offset on empty region succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOffsetBoundary005Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0500
     * @tc.desc   test offset on region created with constructor(left, top, right, bottom)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOffsetBoundary005Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testRegionOffsetBoundary005Static';
      let region = new drawing.Region(200, 200, 600, 600);
      try {
        region.offset(50, 50);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(250);
          expect(bounds.top).assertEqual(250);
          expect(bounds.right).assertEqual(650);
          expect(bounds.bottom).assertEqual(650);
          console.info(msg + ' offset on region created with constructor succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOffsetBoundary006Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0600
     * @tc.desc   test offset on complex region (union operation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionOffsetBoundary006Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const msg = 'testRegionOffsetBoundary006Static';
      let region = new drawing.Region(100, 100, 300, 300);
      let otherRegion = new drawing.Region(350, 350, 450, 450);
      region.op(otherRegion, drawing.RegionOp.UNION);
      try {
        region.offset(100, 100);
        let isComplex = region.isComplex();
        expect(isComplex).assertEqual(true);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(200);
          expect(bounds.top).assertEqual(200);
          expect(bounds.right).assertEqual(550);
          expect(bounds.bottom).assertEqual(550);
          console.info(msg + ' offset on complex region succeeded, isComplex: ' + isComplex);
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickRejectRegionEmpty001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0700
     * @tc.desc   test quickRejectRegion with empty region parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickRejectRegionEmpty001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionQuickRejectRegionEmpty001Static';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      let emptyRegion = new drawing.Region();
      try {
        let result = region.quickRejectRegion(emptyRegion);
        expect(result).assertEqual(true);
        console.info(msg + ' quickRejectRegion with empty region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickRejectRegionEmpty002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0800
     * @tc.desc   test quickRejectRegion when current region is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickRejectRegionEmpty002Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionQuickRejectRegionEmpty002Static';
      let region = new drawing.Region();
      let otherRegion = new drawing.Region(100, 100, 400, 400);
      try {
        let result = region.quickRejectRegion(otherRegion);
        expect(result).assertEqual(true);
        console.info(msg + ' quickRejectRegion when current region is empty succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickRejectRegionComplex001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_0900
     * @tc.desc   test quickRejectRegion with complex region (union operation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionQuickRejectRegionComplex001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionQuickRejectRegionComplex001Static';
      let region = new drawing.Region(100, 100, 300, 300);
      let other1 = new drawing.Region(350, 350, 450, 450);
      region.op(other1, drawing.RegionOp.UNION);
      let testRegion = new drawing.Region(50, 50, 70, 70);
      try {
        let result = region.quickRejectRegion(testRegion);
        expect(result).assertEqual(true);
        console.info(msg + ' quickRejectRegion with complex region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickRejectRegionBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1000
     * @tc.desc   test quickRejectRegion at boundary (touching edge)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionQuickRejectRegionBoundary001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionQuickRejectRegionBoundary001Static';
      let region = new drawing.Region(100, 100, 400, 400);
      let otherRegion = new drawing.Region(400, 400, 500, 500);
      try {
        let result = region.quickRejectRegion(otherRegion);
        expect(result).assertEqual(true);
        console.info(msg + ' quickRejectRegion at boundary succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickRejectRegionBoundary002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1100
     * @tc.desc   test quickRejectRegion at boundary (point intersection)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionQuickRejectRegionBoundary002Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionQuickRejectRegionBoundary002Static';
      let region = new drawing.Region(100, 100, 400, 400);
      let otherRegion = new drawing.Region(400, 400, 400, 400);
      try {
        let result = region.quickRejectRegion(otherRegion);
        expect(result).assertEqual(true);
        console.info(msg + ' quickRejectRegion at point boundary succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickRejectRegionBoundary003Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1200
     * @tc.desc   test quickRejectRegion with very small offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionQuickRejectRegionBoundary003Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const msg = 'testRegionQuickRejectRegionBoundary003Static';
      let region = new drawing.Region(100, 100, 400, 400);
      let otherRegion = new drawing.Region(101, 101, 401, 401);
      try {
        let result = region.quickRejectRegion(otherRegion);
        expect(result).assertEqual(false);
        console.info(msg + ' quickRejectRegion with small offset succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionSetRegionEmpty001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1300
     * @tc.desc   test setRegion with empty region parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetRegionEmpty001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionSetRegionEmpty001Static';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      let emptyRegion = new drawing.Region();
      try {
        region.setRegion(emptyRegion);
        let isEmpty = region.isEmpty();
        expect(isEmpty).assertEqual(true);
        console.info(msg + ' setRegion with empty region succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionSetRegionComplex001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1400
     * @tc.desc   test setRegion with complex region (union operation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionSetRegionComplex001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const msg = 'testRegionSetRegionComplex001Static';
      let region = new drawing.Region();
      let complexRegion = new drawing.Region(100, 100, 300, 300);
      let otherRegion = new drawing.Region(350, 350, 450, 450);
      complexRegion.op(otherRegion, drawing.RegionOp.UNION);
      try {
        region.setRegion(complexRegion);
        let isComplex = region.isComplex();
        console.info(msg + ' isComplex succeeded isComplex: ' + isComplex);
        expect(isComplex).assertEqual(true);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(100);
          expect(bounds.right).assertEqual(450);
          console.info(msg + ' setRegion with complex region succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionSetRegionBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1500
     * @tc.desc   test setRegion with region created by constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetRegionBoundary001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testRegionSetRegionBoundary001Static';
      let region = new drawing.Region();
      let otherRegion = new drawing.Region(200, 200, 600, 600);
      try {
        region.setRegion(otherRegion);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(200);
          expect(bounds.top).assertEqual(200);
          expect(bounds.right).assertEqual(600);
          expect(bounds.bottom).assertEqual(600);
          console.info(msg + ' setRegion with constructor created region succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOpEmpty001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1600
     * @tc.desc   test op with empty region parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOpEmpty001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testRegionOpEmpty001Static';
      let region = new drawing.Region(100, 100, 400, 400);
      let emptyRegion = new drawing.Region();
      try {
        let result = region.op(emptyRegion, drawing.RegionOp.DIFFERENCE);
        expect(result).assertEqual(true);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(100);
          expect(bounds.right).assertEqual(400);
          console.info(msg + ' op DIFFERENCE with empty region succeeded, result: ' + result);
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOpEmpty002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1700
     * @tc.desc   test op INTERSECT with empty region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOpEmpty002Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionOpEmpty002Static';
      let region = new drawing.Region(100, 100, 400, 400);
      let emptyRegion = new drawing.Region();
      try {
        let result = region.op(emptyRegion, drawing.RegionOp.INTERSECT);
        expect(result).assertEqual(false);
        let isEmpty = region.isEmpty();
        expect(isEmpty).assertEqual(true);
        console.info(msg + ' op INTERSECT with empty region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOpNoIntersection001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1800
     * @tc.desc   test op with non-intersecting regions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionOpNoIntersection001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionOpNoIntersection001Static';
      let region = new drawing.Region(100, 100, 200, 200);
      let otherRegion = new drawing.Region(300, 300, 400, 400);
      try {
        let result = region.op(otherRegion, drawing.RegionOp.INTERSECT);
        expect(result).assertEqual(false);
        let isEmpty = region.isEmpty();
        expect(isEmpty).assertEqual(true);
        console.info(msg + ' op INTERSECT with non-intersecting region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOpSameRegion001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_1900
     * @tc.desc   test op with same region (self operation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOpSameRegion001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testRegionOpSameRegion001Static';
      let region = new drawing.Region(100, 100, 400, 400);
      try {
        let result = region.op(region, drawing.RegionOp.UNION);
        expect(result).assertEqual(true);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(100);
          expect(bounds.right).assertEqual(400);
          console.info(msg + ' op UNION with same region succeeded, result: ' + result);
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOpBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2000
     * @tc.desc   test op with touching boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionOpBoundary001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionOpBoundary001Static';
      let region = new drawing.Region(100, 100, 200, 200);
      let otherRegion = new drawing.Region(200, 200, 300, 300);
      try {
        let result = region.op(otherRegion, drawing.RegionOp.UNION);
        console.info(msg + ' op succeeded result: ' + result);
        expect(result).assertEqual(true);
        let isComplex = region.isComplex();
        console.info(msg + ' isComplex succeeded isComplex: ' + isComplex);
        expect(isComplex).assertEqual(true);
        console.info(msg + ' op UNION with touching boundaries succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionIsRectEmpty001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2100
     * @tc.desc   test isRect on empty region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsRectEmpty001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionIsRectEmpty001Static';
      let region = new drawing.Region();
      try {
        let result = region.isRect();
        expect(result).assertEqual(false);
        console.info(msg + ' isRect on empty region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionIsRectBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2200
     * @tc.desc   test isRect on zero-width region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsRectBoundary001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionIsRectBoundary001Static';
      let region = new drawing.Region(100, 100, 100, 200);
      try {
        let result = region.isRect();
        expect(result).assertEqual(false);
        console.info(msg + ' isRect on zero-width region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionIsRectComplex001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2300
     * @tc.desc   test isRect on complex region created by multiple union operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionIsRectComplex001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionIsRectComplex001Static';
      let region = new drawing.Region(100, 100, 200, 200);
      let other1 = new drawing.Region(150, 150, 250, 250);
      region.op(other1, drawing.RegionOp.UNION);
      let other2 = new drawing.Region(200, 200, 300, 300);
      region.op(other2, drawing.RegionOp.UNION);
      try {
        let result = region.isRect();
        expect(result).assertEqual(false);
        console.info(msg + ' isRect on complex region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickContainsEmpty001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2400
     * @tc.desc   test quickContains on empty region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickContainsEmpty001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionQuickContainsEmpty001Static';
      let region = new drawing.Region();
      try {
        let result = region.quickContains(10, 10, 100, 100);
        expect(result).assertEqual(false);
        console.info(msg + ' quickContains on empty region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickContainsBoundary001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2500
     * @tc.desc   test quickContains at exact boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionQuickContainsBoundary001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionQuickContainsBoundary001Static';
      let region = new drawing.Region(100, 100, 400, 400);
      try {
        let result = region.quickContains(100, 100, 400, 400);
        expect(result).assertEqual(true);
        console.info(msg + ' quickContains at exact boundary succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickContainsBoundary002Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2600
     * @tc.desc   test quickContains beyond boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionQuickContainsBoundary002Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionQuickContainsBoundary002Static';
      let region = new drawing.Region(100, 100, 400, 400);
      try {
        let result = region.quickContains(100, 100, 400, 401);
        expect(result).assertEqual(false);
        console.info(msg + ' quickContains beyond boundary succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickContainsZeroRect001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2700
     * @tc.desc   test quickContains with zero-width rectangle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickContainsZeroRect001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionQuickContainsZeroRect001Static';
      let region = new drawing.Region(100, 100, 400, 400);
      try {
        let result = region.quickContains(200, 200, 200, 300);
        expect(result).assertEqual(false);
        console.info(msg + ' quickContains with zero-width rectangle succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionUnionSetRect001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2800
     * @tc.desc   test union operation followed by setRect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionUnionSetRect001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const msg = 'testRegionUnionSetRect001Static';
      let region = new drawing.Region(100, 100, 200, 200);
      let otherRegion = new drawing.Region(300, 300, 400, 400);
      region.op(otherRegion, drawing.RegionOp.UNION);
      try {
        region.setRect(50, 50, 150, 150);
        let isComplex = region.isComplex();
        expect(isComplex).assertEqual(false);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(50);
          expect(bounds.right).assertEqual(150);
          console.info(msg + ' union followed by setRect succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionSetEmptyIsEqual001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_2900
     * @tc.desc   test setEmpty followed by isEqual
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetEmptyIsEqual001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionSetEmptyIsEqual001Static';
      let region = new drawing.Region(100, 100, 400, 400);
      let otherRegion = new drawing.Region(100, 100, 400, 400);
      region.setEmpty();
      try {
        let result = region.isEqual(otherRegion);
        expect(result).assertEqual(false);
        let isEmpty = region.isEmpty();
        expect(isEmpty).assertEqual(true);
        console.info(msg + ' setEmpty followed by isEqual succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOffsetGetBounds001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3000
     * @tc.desc   test offset followed by getBounds verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOffsetGetBounds001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testRegionOffsetGetBounds001Static';
      let region = new drawing.Region(200, 200, 600, 600);
      try {
        region.offset(100, 100);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(300);
          expect(bounds.top).assertEqual(300);
          expect(bounds.right).assertEqual(700);
          expect(bounds.bottom).assertEqual(700);
          console.info(msg + ' offset followed by getBounds succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOffsetIsPointContained001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3100
     * @tc.desc   test offset followed by isPointContained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionOffsetIsPointContained001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionOffsetIsPointContained001Static';
      let region = new drawing.Region(100, 100, 400, 400);
      region.offset(100, 100);
      try {
        let result = region.isPointContained(250, 250);
        expect(result).assertEqual(true);
        result = region.isPointContained(100, 100);
        expect(result).assertEqual(false);
        console.info(msg + ' offset followed by isPointContained succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOpXor001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3200
     * @tc.desc   test XOR operation between two regions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionOpXor001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionOpXor001Static';
      let region = new drawing.Region(100, 100, 300, 300);
      let otherRegion = new drawing.Region(200, 200, 400, 400);
      try {
        let result = region.op(otherRegion, drawing.RegionOp.XOR);
        expect(result).assertEqual(true);
        let isComplex = region.isComplex();
        expect(isComplex).assertEqual(true);
        console.info(msg + ' XOR operation succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionOpReverseDifference001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3300
     * @tc.desc   test REVERSE_DIFFERENCE operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionOpReverseDifference001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const msg = 'testRegionOpReverseDifference001Static';
      let region = new drawing.Region(100, 100, 300, 300);
      let otherRegion = new drawing.Region(200, 200, 400, 400);
      try {
        let result = region.op(otherRegion, drawing.RegionOp.REVERSE_DIFFERENCE);
        expect(result).assertEqual(true);
        let bounds = region.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(200);
          expect(bounds.right).assertEqual(400);
          console.info(msg + ' REVERSE_DIFFERENCE operation succeeded, result: ' + result);
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionConstructorCopy001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3400
     * @tc.desc   test Region copy constructor with complex region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionConstructorCopy001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const msg = 'testRegionConstructorCopy001Static';
      let region = new drawing.Region(100, 100, 300, 300);
      let otherRegion = new drawing.Region(350, 350, 450, 450);
      region.op(otherRegion, drawing.RegionOp.UNION);
      try {
        let copiedRegion = new drawing.Region(region);
        let isComplex = copiedRegion.isComplex();
        console.info(msg + ' isComplex succeeded isComplex: ' + isComplex);
        expect(isComplex).assertEqual(true);
        let bounds = copiedRegion.getBounds();
        if (bounds != undefined) {
          expect(bounds.left).assertEqual(100);
          expect(bounds.right).assertEqual(450);
          console.info(msg + ' copy constructor with complex region succeeded');
        } else {
          console.info(msg + ' getBounds returned undefined');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionGetBoundaryPathComplex001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3500
     * @tc.desc   test getBoundaryPath on complex region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionGetBoundaryPathComplex001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionGetBoundaryPathComplex001Static';
      let region = new drawing.Region(100, 100, 300, 300);
      let otherRegion = new drawing.Region(350, 350, 450, 450);
      region.op(otherRegion, drawing.RegionOp.UNION);
      try {
        let path = region.getBoundaryPath();
        expect(path != null && path != undefined).assertTrue();
        console.info(msg + ' getBoundaryPath on complex region succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionIsRegionContainedComplex001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3600
     * @tc.desc   test isRegionContained on complex region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionIsRegionContainedComplex001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionIsRegionContainedComplex001Static';
      let region = new drawing.Region(100, 100, 300, 300);
      let otherRegion = new drawing.Region(350, 350, 450, 450);
      region.op(otherRegion, drawing.RegionOp.UNION);
      let testRegion = new drawing.Region(150, 150, 250, 250);
      try {
        let result = region.isRegionContained(testRegion);
        expect(result).assertEqual(true);
        console.info(msg + ' isRegionContained on complex region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionQuickRejectComplex001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3700
     * @tc.desc   test quickReject on complex region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionQuickRejectComplex001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionQuickRejectComplex001Static';
      let region = new drawing.Region(100, 100, 300, 300);
      let otherRegion = new drawing.Region(350, 350, 450, 450);
      region.op(otherRegion, drawing.RegionOp.UNION);
      try {
        let result = region.quickReject(50, 50, 70, 70);
        expect(result).assertEqual(true);
        result = region.quickReject(380, 380, 420, 420);
        expect(result).assertEqual(false);
        console.info(msg + ' quickReject on complex region succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionSetPathEmpty001Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_REGION_STATIC_3800
     * @tc.desc   test setPath on empty region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetPathEmpty001Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionSetPathEmpty001Static';
      let region = new drawing.Region();
      let path = new drawing.Path();
      path.arcTo(50, 50, 300, 300, 0, 359);
      let clipRegion = new drawing.Region(0, 0, 200, 200);
      try {
        let result = region.setPath(path, clipRegion);
        expect(result).assertEqual(true);
        let isEmpty = region.isEmpty();
        expect(isEmpty).assertEqual(false);
        console.info(msg + ' setPath on empty region succeeded, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ' failed. Error code: ' + e.code + '. Error message: ' + e.message);
        expect().assertFail();
      }
    });
  });
}
