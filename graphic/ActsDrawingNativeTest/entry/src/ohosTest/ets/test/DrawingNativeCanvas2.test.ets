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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libDrawingNative from 'libdrawingnative.so';
import Utils, { Log } from './Utils.test';


export default function DrawingNativeCanvas2Test() {
  describe('DrawingNativeCanvas2Test', () => {
    beforeAll(async () => {
    })

    beforeEach(async () => {
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
     * @tc.name   testCanvasSkewNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2900
     * @tc.desc   test for testCanvasSkewNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasSkew(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSkewNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2901
     * @tc.desc   test for testCanvasSkewNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSkewMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2903
     * @tc.desc   test for testCanvasSkewMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2903', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSkewInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2904
     * @tc.desc   test for testCanvasSkewInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2904', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSkewMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2905
     * @tc.desc   test for testCanvasSkewMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2905', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3000
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3001
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3001', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3002
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3003
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3004
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3004', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3100
     * @tc.desc   test for testCanvasGetLocalClipBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3101
     * @tc.desc   test for testCanvasGetLocalClipBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3102
     * @tc.desc   test for testCanvasGetLocalClipBoundsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3103
     * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3103', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3104
     * @tc.desc   test for testCanvasGetLocalClipBoundsInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3104', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsMultipleCallsBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3105
     * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCallsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3105', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ConcatMatrix/GetTotalMatrix related test cases
    /**
     * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3200
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasConcatMatrixNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3201
     * @tc.desc   test for testCanvasConcatMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetTotalMatrixNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3202
     * @tc.desc   test for testCanvasGetTotalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3202', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3203
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3203', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3204
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3204', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3300
     * @tc.desc   test for testCanvasDrawShadowNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3301
     * @tc.desc   test for testCanvasDrawShadowNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3302
     * @tc.desc   test for testCanvasDrawShadowAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3303
     * @tc.desc   test for testCanvasDrawShadowMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3303', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3304
     * @tc.desc   test for testCanvasDrawShadowInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3304', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 Clear related test cases
    /**
     * @tc.name   testCanvasClearNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3400
     * @tc.desc   test for testCanvasClearNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClear(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3401
     * @tc.desc   test for testCanvasClearNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3402
     * @tc.desc   test for testCanvasClearAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3403
     * @tc.desc   test for testCanvasClearMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3403', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3404
     * @tc.desc   test for testCanvasClearInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3404', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3405
     * @tc.desc   test for testCanvasClearMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3405', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 SetMatrix related test cases
    /**
     * @tc.name   testCanvasSetMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3500
     * @tc.desc   test for testCanvasSetMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSetMatrixNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3501
     * @tc.desc   test for testCanvasSetMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSetMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3502
     * @tc.desc   test for testCanvasSetMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSetMatrixInputDestroyed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3503
     * @tc.desc   test for testCanvasSetMatrixInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ResetMatrix related test cases
    /**
     * @tc.name   testCanvasResetMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3600
     * @tc.desc   test for testCanvasResetMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasResetMatrixNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3601
     * @tc.desc   test for testCanvasResetMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasResetMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3603
     * @tc.desc   test for testCanvasResetMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawImageRectWithSrcNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3700
     * @tc.desc   test for testCanvasDrawImageRectWithSrcNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawImageRectWithSrcNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3701
     * @tc.desc   test for testCanvasDrawImageRectWithSrcNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawImageRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3800
     * @tc.desc   test for testCanvasDrawImageRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawImageRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3801
     * @tc.desc   test for testCanvasDrawImageRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3801', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawVertices related test cases
    /**
     * @tc.name   testCanvasDrawVerticesNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3900
     * @tc.desc   test for testCanvasDrawVerticesNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawVerticesNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3901
     * @tc.desc   test for testCanvasDrawVerticesNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3901', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawVerticesAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3902
     * @tc.desc   test for testCanvasDrawVerticesAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3902', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawVerticesMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3903
     * @tc.desc   test for testCanvasDrawVerticesMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3903', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ReadPixels related test cases
    /**
     * @tc.name   testCanvasReadPixelsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4000
     * @tc.desc   test for testCanvasReadPixelsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4001
     * @tc.desc   test for testCanvasReadPixelsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4001', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsMismatch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4002
     * @tc.desc   test for testCanvasReadPixelsMismatch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4003
     * @tc.desc   test for testCanvasReadPixelsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4004
     * @tc.desc   test for testCanvasReadPixelsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4004', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4005
     * @tc.desc   test for testCanvasReadPixelsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4005', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ReadPixelsToBitmap related test cases
    /**
     * @tc.name   testCanvasReadPixelsToBitmapNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4100
     * @tc.desc   test for testCanvasReadPixelsToBitmapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsToBitmapNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4101
     * @tc.desc   test for testCanvasReadPixelsToBitmapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsToBitmapAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4102
     * @tc.desc   test for testCanvasReadPixelsToBitmapAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4102', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsToBitmapMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4103
     * @tc.desc   test for testCanvasReadPixelsToBitmapMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4103', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawSingleCharacter related test cases
    /**
     * @tc.name   testCanvasDrawSingleCharacter
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4104
     * @tc.desc   test for testCanvasDrawSingleCharacter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4104', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleCharacterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4200
     * @tc.desc   test for testCanvasDrawSingleCharacterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleCharacterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4201
     * @tc.desc   test for testCanvasDrawSingleCharacterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawPoint related test cases
    /**
     * @tc.name   testCanvasDrawPointNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4300
     * @tc.desc   test for testCanvasDrawPointNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4301
     * @tc.desc   test for testCanvasDrawPointNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4302
     * @tc.desc   test for testCanvasDrawPointMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawColor related test cases
    /**
     * @tc.name   testCanvasDrawColorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4400
     * @tc.desc   test for testCanvasDrawColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawColorNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4401
     * @tc.desc   test for testCanvasDrawColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawColorMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4402
     * @tc.desc   test for testCanvasDrawColorMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawColorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4403
     * @tc.desc   test for testCanvasDrawColorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4403', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 IsClipEmpty related test cases
    /**
     * @tc.name   testCanvasIsClipEmptyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4500
     * @tc.desc   test for testCanvasIsClipEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasIsClipEmptyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4501
     * @tc.desc   test for testCanvasIsClipEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasIsClipEmptyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4502
     * @tc.desc   test for testCanvasIsClipEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 GetImageInfo related test cases
    /**
     * @tc.name   testCanvasGetImageInfoNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4600
     * @tc.desc   test for testCanvasGetImageInfoNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetImageInfoNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4601
     * @tc.desc   test for testCanvasGetImageInfoNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetImageInfoMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4602
     * @tc.desc   test for testCanvasGetImageInfoMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ClipRegion related test cases
    /**
     * @tc.name   testCanvasClipRegionNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4700
     * @tc.desc   test for testCanvasClipRegionNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRegionNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4701
     * @tc.desc   test for testCanvasClipRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4701', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRegionMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4702
     * @tc.desc   test for testCanvasClipRegionMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4702', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 QuickRejectPath related test cases
    /**
     * @tc.name   testCanvasQuickRejectPathNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4800
     * @tc.desc   test for testCanvasQuickRejectPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasQuickRejectPathNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4801
     * @tc.desc   test for testCanvasQuickRejectPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4801', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasQuickRejectPathCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4802
     * @tc.desc   test for testCanvasQuickRejectPathCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4802', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 QuickRejectRect related test cases
    /**
     * @tc.name   testCanvasQuickRejectRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4900
     * @tc.desc   test for testCanvasQuickRejectRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasQuickRejectRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4901
     * @tc.desc   test for testCanvasQuickRejectRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4901', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasQuickRejectRectCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4902
     * @tc.desc   test for testCanvasQuickRejectRectCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4902', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawArcWithCenter related test cases
    /**
     * @tc.name   testCanvasDrawArcWithCenterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5000
     * @tc.desc   test for testCanvasDrawArcWithCenterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcWithCenterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5001
     * @tc.desc   test for testCanvasDrawArcWithCenterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5001', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcWithCenterCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5002
     * @tc.desc   test for testCanvasDrawArcWithCenterCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5002', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawNestedRoundRect related test cases
    /**
     * @tc.name   testCanvasDrawNestedRoundRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5100
     * @tc.desc   test for testCanvasDrawNestedRoundRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawNestedRoundRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5101
     * @tc.desc   test for testCanvasDrawNestedRoundRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5101', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawNestedRoundRectCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5102
     * @tc.desc   test for testCanvasDrawNestedRoundRectCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5102', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawPixelMapNine related test cases
    /**
     * @tc.name   testCanvasDrawPixelMapNineNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5200
     * @tc.desc   test for testCanvasDrawPixelMapNineNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapNineNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5201
     * @tc.desc   test for testCanvasDrawPixelMapNineNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5201', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapNineCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5202
     * @tc.desc   test for testCanvasDrawPixelMapNineCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5202', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 CreateWithPixelMap related test cases
    /**
     * @tc.name   testCanvasCreateWithPixelMapNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5300
     * @tc.desc   test for testCanvasCreateWithPixelMapNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5300', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasCreateWithPixelMapNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5301
     * @tc.desc   test for testCanvasCreateWithPixelMapNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasCreateWithPixelMapMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5302
     * @tc.desc   test for testCanvasCreateWithPixelMapMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5302', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawPixelMapRectConstraint related test cases
    /**
     * @tc.name   testCanvasDrawPixelMapRectConstraintNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5400
     * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5400', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectConstraintNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5401
     * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectConstraintAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5402
     * @tc.desc   test for testCanvasDrawPixelMapRectConstraintAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectConstraintMultiCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5403
     * @tc.desc   test for testCanvasDrawPixelMapRectConstraintMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5403', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleChaWithFeaturesNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Canvas_5501
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Canvas_5501', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleChaWithFeaturesAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Canvas_5502
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesAbNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Canvas_5502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleChaWithFeaturesCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Canvas_5503
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Canvas_5503', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5600
     * @tc.desc   test for testCanvasDrawPixelMapMeshNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5601
     * @tc.desc   test for testCanvasDrawPixelMapMeshNull01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5601', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5602
     * @tc.desc   test for testCanvasDrawPixelMapMeshNull02
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5602', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull03
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5603
     * @tc.desc   test for testCanvasDrawPixelMapMeshNull03
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5603', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull04
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5604
     * @tc.desc   test for testCanvasDrawPixelMapMeshNull04
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5604', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshBindAndUnbind
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5605
     * @tc.desc   test for testCanvasDrawPixelMapMeshBindAndUnbind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5605', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshAbnormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5606
     * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5606', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshAbnormal02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5607
     * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal02
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5607', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshAbnormal03
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5608
     * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal03
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5608', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshAbnormal04
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5609
     * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal04
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5609', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5610
     * @tc.desc   test for testCanvasDrawPixelMapMeshMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5610', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(10);
      expect(result).assertEqual(0);
    })
  })
}