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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

export default function DrawingTsTypefacePart2Test(): void {
  describe('DrawingTsTypefacePart2Test', (): void => {
    const DEFAULT_FONT_PATH = '/system/fonts/HarmonyOS_Sans.ttf';

    /**
     * @tc.name   testGetFamilyNameNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_0100
     * @tc.desc   test getFamilyName with normal typeface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFamilyNameNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testGetFamilyNameNormalStatic';
      try {
        let font = new drawing.Font();
        let typeface = font.getTypeface();
        expect(typeface != null && typeface != undefined).assertTrue();
        let familyName = typeface!.getFamilyName();
        console.info(msg + ' getFamilyName succeeded, familyName: ' + familyName);
        expect(familyName != null && familyName != undefined).assertTrue();
        expect(familyName!.length > 0).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetFamilyNameFromMakeFromFileStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_0200
     * @tc.desc   test getFamilyName from typeface created by makeFromFile.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFamilyNameFromMakeFromFileStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testGetFamilyNameFromMakeFromFileStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let familyName = typeface!.getFamilyName();
        console.info(msg + ' getFamilyName succeeded, familyName: ' + familyName);
        expect(familyName != null && familyName != undefined).assertTrue();
        expect(familyName!.length > 0).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromFileInvalidPathStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_0600
     * @tc.desc   test makeFromFile with invalid path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromFileInvalidPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testMakeFromFileInvalidPathStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile('/invalid/path/font.ttf');
        console.info(msg + ' makeFromFile invalid path result');
        expect(typeface == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromFileNotExistStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_0700
     * @tc.desc   test makeFromFile with non-existent file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromFileNotExistStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testMakeFromFileNotExistStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile('/system/fonts/NotExistFont.ttf');
        console.info(msg + ' makeFromFile non-existent file result');
        expect(typeface == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromCurrentWithFontStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_1000
     * @tc.desc   test makeFromCurrent combined with Font setTypeface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromCurrentWithFontStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testMakeFromCurrentWithFontStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let newTypeface = typeface!.makeFromCurrent(typefaceArguments);
        expect(newTypeface != null && newTypeface != undefined).assertTrue();
        let font = new drawing.Font();
        font.setTypeface(newTypeface!);
        console.info(msg + ' makeFromCurrent with Font succeeded');
        expect(font != null && font != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromCurrentEmptyArgumentsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_1100
     * @tc.desc   test makeFromCurrent with empty TypefaceArguments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromCurrentEmptyArgumentsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testMakeFromCurrentEmptyArgumentsStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let typefaceArguments = new drawing.TypefaceArguments();
        let newTypeface = typeface!.makeFromCurrent(typefaceArguments);
        console.info(msg + ' makeFromCurrent with empty arguments succeeded');
        expect(newTypeface != null && newTypeface != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromCurrentMultipleVariationsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_1200
     * @tc.desc   test makeFromCurrent with multiple variations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeFromCurrentMultipleVariationsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testMakeFromCurrentMultipleVariationsStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 100);
        typefaceArguments.addVariation('wdth', 50);
        let newTypeface = typeface!.makeFromCurrent(typefaceArguments);
        console.info(msg + ' makeFromCurrent with multiple variations succeeded');
        expect(newTypeface != null && newTypeface != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromFileWithArgumentsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_1300
     * @tc.desc   test makeFromFileWithArguments with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMakeFromFileWithArgumentsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testMakeFromFileWithArgumentsNormalStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        console.info(msg + ' makeFromFileWithArguments succeeded');
        expect(typeface != null && typeface != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromFileWithArgumentsEmptyArgumentsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_1400
     * @tc.desc   test makeFromFileWithArguments with empty TypefaceArguments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMakeFromFileWithArgumentsEmptyArgumentsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testMakeFromFileWithArgumentsEmptyArgumentsStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        console.info(msg + ' makeFromFileWithArguments with empty arguments succeeded');
        expect(typeface != null && typeface != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromFileWithArgumentsInvalidPathStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_1500
     * @tc.desc   test makeFromFileWithArguments with invalid path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testMakeFromFileWithArgumentsInvalidPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testMakeFromFileWithArgumentsInvalidPathStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let typeface = drawing.Typeface.makeFromFileWithArguments('/invalid/path/font.ttf', typefaceArguments);
        console.info(msg + ' makeFromFileWithArguments invalid path result');
        expect(typeface == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testMakeFromFileWithArgumentsEmptyPathStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_1600
     * @tc.desc   test makeFromFileWithArguments with empty path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeFromFileWithArgumentsEmptyPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testMakeFromFileWithArgumentsEmptyPathStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let typeface = drawing.Typeface.makeFromFileWithArguments('', typefaceArguments);
        console.info(msg + ' makeFromFileWithArguments empty path result');
        expect(typeface == null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testIsBoldFromMakeFromFileStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_1900
     * @tc.desc   test isBold from typeface created by makeFromFile.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoldFromMakeFromFileStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testIsBoldFromMakeFromFileStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let isBold = typeface!.isBold();
        console.info(msg + ' isBold succeeded, result: ' + isBold);
        expect(isBold).assertEqual(false);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsItalicFromMakeFromFileStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_2300
     * @tc.desc   test isItalic from typeface created by makeFromFile.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsItalicFromMakeFromFileStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testIsItalicFromMakeFromFileStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let isItalic = typeface!.isItalic();
        console.info(msg + ' isItalic succeeded, result: ' + isItalic);
        expect(isItalic).assertEqual(false);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsItalicFromItalicFileStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_2400
     * @tc.desc   test isItalic from italic font file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsItalicFromItalicFileStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testIsItalicFromItalicFileStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile('/system/fonts/HarmonyOS_Sans_Italic.ttf');
        expect(typeface != null && typeface != undefined).assertTrue();
        let isItalic = typeface!.isItalic();
        console.info(msg + ' isItalic succeeded, result: ' + isItalic);
        expect(isItalic).assertEqual(true);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypefaceCombinedWithTextBlobStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_3800
     * @tc.desc   test Typeface combined with TextBlob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testTypefaceCombinedWithTextBlobStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testTypefaceCombinedWithTextBlobStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let font = new drawing.Font();
        font.setTypeface(typeface!);
        let textBlob = drawing.TextBlob.makeFromString('Hello World', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' Typeface combined with TextBlob succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTypefaceCombinedWithFontStylesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_3900
     * @tc.desc   test Typeface combined with Font styles.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceCombinedWithFontStylesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testTypefaceCombinedWithFontStylesStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let font = new drawing.Font();
        font.setTypeface(typeface!);
        font.setSize(20);
        console.info(msg + ' Typeface combined with Font styles succeeded');
        expect(font.getSize()).assertEqual(20);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTypefaceGetFamilyNameAndCheckStyleStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_4000
     * @tc.desc   test getFamilyName combined with isBold and isItalic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypefaceGetFamilyNameAndCheckStyleStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testTypefaceGetFamilyNameAndCheckStyleStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null && typeface != undefined).assertTrue();
        let familyName = typeface!.getFamilyName();
        expect(familyName!.length > 0).assertTrue();
        expect(familyName!.includes('Harmony') || familyName!.includes('Sans')).assertTrue();
        let isBold = typeface!.isBold();
        expect(isBold).assertEqual(false);
        let isItalic = typeface!.isItalic();
        expect(isItalic).assertEqual(false);
        console.info(msg + ' getFamilyName and check style succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTypefaceVariationMinMaxValuesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_4100
     * @tc.desc   test TypefaceArguments addVariation with min and max values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTypefaceVariationMinMaxValuesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testTypefaceVariationMinMaxValuesStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 0);
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        console.info(msg + ' addVariation min value succeeded');
        expect(typeface != null && typeface != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments2 = new drawing.TypefaceArguments();
        typefaceArguments2.addVariation('wght', 1000);
        let typeface2 = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments2);
        console.info(msg + ' addVariation max value succeeded');
        expect(typeface2 != null && typeface2 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTypefaceStabilityTestStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACE_STATIC_4200
     * @tc.desc   test Typeface stability with multiple operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceStabilityTestStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testTypefaceStabilityTestStatic';
      try {
        for (let i = 0; i < 100; i++) {
          let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
          expect(typeface != null && typeface != undefined).assertTrue();
          let familyName = typeface!.getFamilyName();
          expect(familyName!.length > 0).assertTrue();
          expect(typeof familyName === 'string').assertTrue();
          expect(familyName!.includes('HarmonyOS') || familyName!.includes('Sans')).assertTrue();
          let isBold = typeface!.isBold();
          expect(typeof isBold === 'boolean').assertTrue();
          expect(isBold).assertEqual(false);
          let isItalic = typeface!.isItalic();
          expect(typeof isItalic === 'boolean').assertTrue();
          expect(isItalic).assertEqual(false);
        }
        console.info(msg + ' Typeface stability test succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}