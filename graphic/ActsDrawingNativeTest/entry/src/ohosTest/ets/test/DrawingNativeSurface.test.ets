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


export default function DrawingNativeSurfaceTest() {
  describe('DrawingNativeSurfaceTest', () => {
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
     * @tc.name   testSurfaceCreateFromGpuContextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0100
     * @tc.desc   test for testSurfaceCreateFromGpuContextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateFromGpuContextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0101
     * @tc.desc   test for testSurfaceCreateFromGpuContextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateFromGpuContextBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0102
     * @tc.desc   test for testSurfaceCreateFromGpuContextBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0102', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0200
     * @tc.desc   test for testSurfaceDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceDestroyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0201
     * @tc.desc   test for testSurfaceDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0201', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceGetCanvasNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0300
     * @tc.desc   test for testSurfaceGetCanvasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceGetCanvasNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0301
     * @tc.desc   test for testSurfaceGetCanvasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0301', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceGetCanvasBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0302
     * @tc.desc   test for testSurfaceGetCanvasBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0302', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateOnScreenNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0400
     * @tc.desc   test for testSurfaceCreateOnScreenNormal.window
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateOnScreenNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0401
     * @tc.desc   test for testSurfaceCreateOnScreenNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0401', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateOnScreenMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0402
     * @tc.desc   test for testSurfaceCreateOnScreenMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0402', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0500
     * @tc.desc   test for testSurfaceFlushNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0501
     * @tc.desc   test for testSurfaceFlushNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0501', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0502
     * @tc.desc   test for testSurfaceFlushAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0502', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0503
     * @tc.desc   test for testSurfaceFlushMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0503', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushTiming
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0504
     * @tc.desc   test for testSurfaceFlushTiming.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0504', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(15);
      expect(result).assertEqual(0);
    })
  })
}