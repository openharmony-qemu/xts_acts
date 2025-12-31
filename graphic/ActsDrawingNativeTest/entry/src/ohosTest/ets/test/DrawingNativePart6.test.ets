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


export default function ActsNewDrawingNativeTestPart6() {
  describe('ActsNewDrawingNativeTestPart6', () => {
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

    // Image related test cases
    /**
     * @tc.name   testImageCreateDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0100
     * @tc.desc   test for TestImageCreateDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImage(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageCreateDestroyNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0200
     * @tc.desc   test for TestImageCreateDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageCreateDestroyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0300
     * @tc.desc   test for TestImageCreateDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageBuildFromBitmapNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0400
     * @tc.desc   test for TestImageBuildFromBitmapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImage(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageBuildFromBitmapNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0500
     * @tc.desc   test for TestImageBuildFromBitmapNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageBuildFromBitmapMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0600
     * @tc.desc   test for TestImageBuildFromBitmapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageBuildFromBitmapMultipleCallsBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0700
     * @tc.desc   test for TestImageBuildFromBitmapMultipleCallsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetWidthHeightNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0800
     * @tc.desc   test for TestImageGetWidthHeightNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImage(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetWidthHeightNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0900
     * @tc.desc   test for TestImageGetWidthHeightNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetWidthHeightMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1000
     * @tc.desc   test for TestImageGetWidthHeightMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetWidthHeightMultipleCallsBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1100
     * @tc.desc   test for TestImageGetWidthHeightMultipleCallsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1200
     * @tc.desc   test for TestImageGetImageInfoNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImage(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1300
     * @tc.desc   test for TestImageGetImageInfoNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1400
     * @tc.desc   test for TestImageGetImageInfoMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1500
     * @tc.desc   test for TestImageGetImageInfoAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1600
     * @tc.desc   test for TestImageGetImageInfoMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoBoundary
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1700
     * @tc.desc   test for TestImageGetImageInfoBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_1700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(16);
      expect(result).assertEqual(0);
    })

    // MaskFilter related test cases
    /**
     * @tc.name   testMaskFilterCreateBlurDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0100
     * @tc.desc   test for TestMaskFilterCreateBlurDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMaskFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMaskFilterCreateBlurDestroyNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0200
     * @tc.desc   test for TestMaskFilterCreateBlurDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMaskFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMaskFilterCreateBlurDestroyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0300
     * @tc.desc   test for TestMaskFilterCreateBlurDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMaskFilter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMaskFilterCreateBlurDestroyAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0400
     * @tc.desc   test for TestMaskFilterCreateBlurDestroyAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMaskFilter(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMaskFilterCreateBlurDestroyMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0500
     * @tc.desc   test for TestMaskFilterCreateBlurDestroyMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMaskFilter(4);
      expect(result).assertEqual(0);
    })

    // Matrix Create related test cases
    /**
     * @tc.name   testMatrixCreateDestroyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0100
     * @tc.desc   test for TestMatrixCreateDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateDestroyNULL
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0200
     * @tc.desc   test for TestMatrixCreateDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateDestroyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0300
     * @tc.desc   test for TestMatrixCreateDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0400
     * @tc.desc   test for TestMatrixCreateRotationNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0500
     * @tc.desc   test for TestMatrixCreateRotationNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0600
     * @tc.desc   test for TestMatrixCreateRotationAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0700
     * @tc.desc   test for TestMatrixCreateRotationMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0800
     * @tc.desc   test for TestMatrixCreateRotationMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0900
     * @tc.desc   test for TestMatrixCreateTranslationNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01000
     * @tc.desc   test for TestMatrixCreateTranslationNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01100
     * @tc.desc   test for TestMatrixCreateTranslationAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01200
     * @tc.desc   test for TestMatrixCreateTranslationMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01300
     * @tc.desc   test for TestMatrixCreateTranslationMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02900
     * @tc.desc   test for TestMatrixCreateScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixCreate(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03000
     * @tc.desc   test for TestMatrixCreateScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03100
     * @tc.desc   test for TestMatrixCreateScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_003200
     * @tc.desc   test for TestMatrixCreateScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_003200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03300
     * @tc.desc   test for TestMatrixCreateScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(17);
      expect(result).assertEqual(0);
    })

    // Matrix Transform related test cases
    /**
     * @tc.name   testMatrixMatrixSetGetMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01400
     * @tc.desc   test for TestMatrixMatrixSetGetMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01500
     * @tc.desc   test for TestMatrixMatrixSetGetMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01600
     * @tc.desc   test for TestMatrixMatrixSetGetMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01700
     * @tc.desc   test for TestMatrixMatrixSetGetMatrixMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01800
     * @tc.desc   test for TestMatrixMatrixSetGetMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01900
     * @tc.desc   test for TestMatrixTranslateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_01900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02000
     * @tc.desc   test for TestMatrixTranslateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02100
     * @tc.desc   test for TestMatrixTranslateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02200
     * @tc.desc   test for TestMatrixTranslateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02300
     * @tc.desc   test for TestMatrixTranslateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02400
     * @tc.desc   test for TestMatrixRotateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02500
     * @tc.desc   test for TestMatrixRotateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02600
     * @tc.desc   test for TestMatrixRotateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02700
     * @tc.desc   test for TestMatrixRotateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02800
     * @tc.desc   test for TestMatrixRotateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_02800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03400
     * @tc.desc   test for TestMatrixScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03500
     * @tc.desc   test for TestMatrixScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03600
     * @tc.desc   test for TestMatrixScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03700
     * @tc.desc   test for TestMatrixScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03800
     * @tc.desc   test for TestMatrixScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetRectToRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03900
     * @tc.desc   test for TestMatrixSetRectToRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_03900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetRectToRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04000
     * @tc.desc   test for TestMatrixSetRectToRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetRectToRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04100
     * @tc.desc   test for TestMatrixSetRectToRectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(22);
      expect(result).assertEqual(0);
    })

    // Matrix Operation related test cases
    /**
     * @tc.name   testMatrixPreRotateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04200
     * @tc.desc   test for TestMatrixPreRotateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreRotateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_4300
     * @tc.desc   test for TestMatrixPreRotateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_4300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreRotateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04400
     * @tc.desc   test for TestMatrixPreRotateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreRotateMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04500
     * @tc.desc   test for TestMatrixPreRotateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreRotateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04600
     * @tc.desc   test for TestMatrixPreRotateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04700
     * @tc.desc   test for TestMatrixPreScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04800
     * @tc.desc   test for TestMatrixPreScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04900
     * @tc.desc   test for TestMatrixPreScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_04900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05000
     * @tc.desc   test for TestMatrixPreScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05100
     * @tc.desc   test for TestMatrixPreScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05200
     * @tc.desc   test for TestMatrixPreTranslateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixOperation(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05300
     * @tc.desc   test for TestMatrixPreTranslateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05400
     * @tc.desc   test for TestMatrixPreTranslateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05500
     * @tc.desc   test for TestMatrixPreTranslateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05600
     * @tc.desc   test for TestMatrixPreTranslateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05700
     * @tc.desc   test for TestMatrixPostRotateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixOperation(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05800
     * @tc.desc   test for TestMatrixPostRotateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05900
     * @tc.desc   test for TestMatrixPostRotateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_05900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06000
     * @tc.desc   test for TestMatrixPostRotateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06100
     * @tc.desc   test for TestMatrixPostRotateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(19);
      expect(result).assertEqual(0);
    })

    // Matrix Part2 Transform related test cases
    /**
     * @tc.name   testMatrixPostScaleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06200
     * @tc.desc   test for TestMatrixPostScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostScaleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06300
     * @tc.desc   test for TestMatrixPostScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostScaleAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06400
     * @tc.desc   test for TestMatrixPostScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostScaleMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06500
     * @tc.desc   test for TestMatrixPostScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostScaleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06600
     * @tc.desc   test for TestMatrixPostScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06700
     * @tc.desc   test for TestMatrixPostTranslateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06800
     * @tc.desc   test for TestMatrixPostTranslateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06900
     * @tc.desc   test for TestMatrixPostTranslateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateMaximum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07000
     * @tc.desc   test for TestMatrixPostTranslateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07100
     * @tc.desc   test for TestMatrixPostTranslateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixResetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07200
     * @tc.desc   test for TestMatrixResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixResetNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07300
     * @tc.desc   test for TestMatrixResetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixResetMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07400
     * @tc.desc   test for TestMatrixResetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixConcatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07500
     * @tc.desc   test for TestMatrixConcatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixConcatNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07600
     * @tc.desc   test for TestMatrixConcatNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixConcatMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07700
     * @tc.desc   test for TestMatrixConcatMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixInvertNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07900
     * @tc.desc   test for TestMatrixInvertNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixInvertMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08000
     * @tc.desc   test for TestMatrixInvertMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixInvertNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07800
     * @tc.desc   test for TestMatrixInvertNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(16);
      expect(result).assertEqual(0);
    })

    // Matrix Part2 Map/Query related test cases
    /**
     * @tc.name   testMatrixSetPolyToPolyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08100
     * @tc.desc   test for TestMatrixSetPolyToPolyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08200
     * @tc.desc   test for TestMatrixSetPolyToPolyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08300
     * @tc.desc   test for TestMatrixSetPolyToPolyAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08400
     * @tc.desc   test for TestMatrixSetPolyToPolyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapPointsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08500
     * @tc.desc   test for TestMatrixMapPointsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapPointsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08600
     * @tc.desc   test for TestMatrixMapPointsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapPointsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08700
     * @tc.desc   test for TestMatrixMapPointsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapPointsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08800
     * @tc.desc   test for TestMatrixMapPointsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08900
     * @tc.desc   test for TestMatrixMapRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09000
     * @tc.desc   test for TestMatrixMapRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09100
     * @tc.desc   test for TestMatrixMapRectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsEqualNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09200
     * @tc.desc   test for TestMatrixIsEqualNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsEqualNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09300
     * @tc.desc   test for TestMatrixIsEqualNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsEqualMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09400
     * @tc.desc   test for TestMatrixIsEqualMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsIdentityNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09500
     * @tc.desc   test for TestMatrixIsIdentityNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsIdentityNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09600
     * @tc.desc   test for TestMatrixIsIdentityNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsIdentityMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09700
     * @tc.desc   test for TestMatrixIsIdentityMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(16);
      expect(result).assertEqual(0);
    })

  })
}
