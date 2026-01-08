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


export default function ActsNewDrawingNativeTestPart11() {
  describe('ActsNewDrawingNativeTestPart11', () => {
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

    // run error test cases
    /**
     * @tc.name   SUB_Drawing_Canvas_DrawPixelMapRect_0005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1103
     * @tc.desc   test for TestCanvasDrawPixelMapRect4KBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Canvas_DrawPixelMapRect_0005', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Font_GetMetrics_Part2_0001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2500
     * @tc.desc   test for TestFontGetMetricsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_Font_GetMetrics_Part2_0001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetMetricsPart2(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Bitmap_0022
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0600
     * @tc.desc   test for testBitmapBuildMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_Bitmap_0022', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(21);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   SUB_Drawing_Bitmap_0003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0200
     * @tc.desc   test for testBitmapCreateFromPixelsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_Bitmap_0003', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(2);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   SUB_Drawing_Bitmap_0008
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0205
     * @tc.desc   test for testBitmapCreateFromPixelsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_Bitmap_0008', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBitmap(7);
      expect(result).assertEqual(0);
    })
  })
}
