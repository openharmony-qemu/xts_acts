/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
import libGraphicDrawing from 'libgraphicdrawing.so';

export default function NativeFontTest() {
  describe('NativeFontTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   NativeFontTest_FontMeasureText015
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontMeasureText_015
     * @tc.desc   NativeFontTest_FontMeasureText015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeFontTest_FontMeasureText015', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeFontTest_FontMeasureText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   NativeFontTest_FontMeasureText016
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontMeasureText_016
     * @tc.desc   NativeFontTest_FontMeasureText016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeFontTest_FontMeasureText016', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeFontTest_FontMeasureText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   NativeFontTest_FontMeasureText017
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontMeasureText_017
     * @tc.desc   NativeFontTest_FontMeasureText017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeFontTest_FontMeasureText017', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeFontTest_FontMeasureText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   NativeDrawingRegisterFontTest001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NativeDrawingRegisterFontTest_001
     * @tc.desc   NativeDrawingRegisterFontTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeDrawingRegisterFontTest001', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeDrawingRegisterFontTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   NativeDrawingRegisterFontTest002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NativeDrawingRegisterFontTest_002
     * @tc.desc   NativeDrawingRegisterFontTest002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeDrawingRegisterFontTest002', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeDrawingRegisterFontTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontCollectionTest001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontCollectionTest_001
     * @tc.desc   OH_Drawing_FontCollectionTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontCollectionTest001', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OH_Drawing_FontCollectionTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTest016
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyLargeValueTest_016
     * @tc.desc   OHDrawingTypographyLargeValueTest016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTest016', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTest026
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyLargeValueTest_026
     * @tc.desc   OHDrawingTypographyLargeValueTest026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTest026', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTest027
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyLargeValueTest_027
     * @tc.desc   OHDrawingTypographyLargeValueTest027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTest027', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTest042
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyLargeValueTest_042
     * @tc.desc   OHDrawingTypographyLargeValueTest042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTest042', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTestWithIndent
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyLargeValueTestWithIndent
     * @tc.desc   OHDrawingTypographyLargeValueTestWithIndent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTestWithIndent', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCreateTextTab001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_CreateTextTab_001
     * @tc.desc   OHDrawingCreateTextTab001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCreateTextTab001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCreateTextTab(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCreateTextTab002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_CreateTextTab_002
     * @tc.desc   OHDrawingCreateTextTab002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCreateTextTab002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCreateTextTab(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCreateTextTab003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_CreateTextTab_003
     * @tc.desc   OHDrawingCreateTextTab003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCreateTextTab003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCreateTextTab(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyTest_001
     * @tc.desc   TypographyTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyTest_002
     * @tc.desc   TypographyTest002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyTest_003
     * @tc.desc   TypographyTest003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyTest_004
     * @tc.desc   TypographyTest004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyTest_005
     * @tc.desc   TypographyTest005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest005', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontGetTextPath_001
     * @tc.desc   FontGetTextPath001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontGetTextPath_002
     * @tc.desc   FontGetTextPath002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontGetTextPath_003
     * @tc.desc   FontGetTextPath003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontGetTextPath_004
     * @tc.desc   FontGetTextPath004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FontGetTextPath_005
     * @tc.desc   FontGetTextPath005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath005', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(4);
      expect(result).assertEqual(0);
    })

  })
}

