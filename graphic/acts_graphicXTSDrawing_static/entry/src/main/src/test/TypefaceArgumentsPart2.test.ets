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

export default function DrawingTsTypefaceArgumentsPart2Test(): void {
  describe('DrawingTsTypefaceArgumentsPart2Test', (): void => {
    const DEFAULT_FONT_PATH = '/system/fonts/HarmonyOS_Sans.ttf';

    /**
     * @tc.name   testAddVariationBoundaryMaxValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_0300
     * @tc.desc   test addVariation with boundary max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddVariationBoundaryMaxValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testAddVariationBoundaryMaxValueStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 1000);
        console.info(msg + ' addVariation wght 1000 succeeded');
        expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationExtremeMinValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_0400
     * @tc.desc   test addVariation with extreme min value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddVariationExtremeMinValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testAddVariationExtremeMinValueStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', -999999);
        console.info(msg + ' addVariation wght -999999 succeeded');
        expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationExtremeMaxValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_0500
     * @tc.desc   test addVariation with extreme max value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAddVariationExtremeMaxValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testAddVariationExtremeMaxValueStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 999999);
        console.info(msg + ' addVariation wght 999999 succeeded');
        expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationMultipleSameAxisStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_0600
     * @tc.desc   test addVariation with multiple same axis calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddVariationMultipleSameAxisStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testAddVariationMultipleSameAxisStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 100);
        typefaceArguments.addVariation('wght', 200);
        typefaceArguments.addVariation('wght', 300);
        console.info(msg + ' addVariation multiple same axis succeeded');
        expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationMultipleDifferentAxisStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_0700
     * @tc.desc   test addVariation with multiple different axis calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testAddVariationMultipleDifferentAxisStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testAddVariationMultipleDifferentAxisStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 100);
        typefaceArguments.addVariation('wdth', 50);
        typefaceArguments.addVariation('opsz', 12);
        console.info(msg + ' addVariation multiple different axis succeeded');
        expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationWithMakeFromCurrentStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_0800
     * @tc.desc   test addVariation combined with makeFromCurrent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddVariationWithMakeFromCurrentStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testAddVariationWithMakeFromCurrentStatic';
      try {
        let typeface = drawing.Typeface.makeFromFile(DEFAULT_FONT_PATH);
        expect(typeface != null).assertTrue();
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let newTypeface = typeface!.makeFromCurrent(typefaceArguments);
        console.info(msg + ' addVariation with makeFromCurrent succeeded');
        expect(newTypeface != null && newTypeface != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationWithTextBlobStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_1200
     * @tc.desc   test addVariation combined with TextBlob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddVariationWithTextBlobStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testAddVariationWithTextBlobStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        expect(typeface != null && typeface != undefined).assertTrue();
        let font = new drawing.Font();
        font.setTypeface(typeface!);
        let textBlob = drawing.TextBlob.makeFromString('Test', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' addVariation with TextBlob succeeded');
        expect(textBlob != null && textBlob != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testAddVariationSpecialCharactersAxisStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_1300
     * @tc.desc   test addVariation with special characters axis.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAddVariationSpecialCharactersAxisStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testAddVariationSpecialCharactersAxisStatic';
      let typefaceArguments = new drawing.TypefaceArguments();
      try {
        typefaceArguments.addVariation('@#$%', 100);
        console.info(msg + ` addVariation @#$% success`);
      } catch (e) {
        console.info(msg + ` addVariation @#$% errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        typefaceArguments.addVariation('wght!', 100);
        console.info(msg + ` addVariation wght! success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` addVariation wght! errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        typefaceArguments.addVariation('wg\t', 100);
        console.info(msg + ` addVariation wg\t success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` addVariation wg\t errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        typefaceArguments.addVariation('wg\nt', 100);
        console.info(msg + ` addVariation wg\nt success`);
      } catch (e) {
        console.info(msg + ` addVariation wg\nt errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationInvalidAxisLengthStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_1500
     * @tc.desc   test addVariation with invalid axis length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddVariationInvalidAxisLengthStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testAddVariationInvalidAxisLengthStatic';
      let typefaceArguments = new drawing.TypefaceArguments();
      try {
        typefaceArguments.addVariation('wg', 100);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` addVariation wg errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        typefaceArguments.addVariation('wghtt', 100);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` addVariation wghtt errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        typefaceArguments.addVariation('w', 100);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` addVariation w errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    });

    /**
     * @tc.name   testAddVariationFloatValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_1600
     * @tc.desc   test addVariation with float value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testAddVariationFloatValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testAddVariationFloatValueStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 100.5);
        console.info(msg + ' addVariation wght 100.5 succeeded');
        expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments2 = new drawing.TypefaceArguments();
        typefaceArguments2.addVariation('wght', 0.1);
        console.info(msg + ' addVariation wght 0.1 succeeded');
        expect(typefaceArguments2 != null && typefaceArguments2 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments3 = new drawing.TypefaceArguments();
        typefaceArguments3.addVariation('wght', 999.9);
        console.info(msg + ' addVariation wght 999.9 succeeded');
        expect(typefaceArguments3 != null && typefaceArguments3 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationNegativeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_1700
     * @tc.desc   test addVariation with negative value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddVariationNegativeValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testAddVariationNegativeValueStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', -1);
        console.info(msg + ' addVariation wght -1 succeeded');
        expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments2 = new drawing.TypefaceArguments();
        typefaceArguments2.addVariation('wght', -100);
        console.info(msg + ' addVariation wght -100 succeeded');
        expect(typefaceArguments2 != null && typefaceArguments2 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationStabilityTestStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_1800
     * @tc.desc   test addVariation stability with multiple operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddVariationStabilityTestStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testAddVariationStabilityTestStatic';
      try {
        for (let i = 0; i < 100; i++) {
          let typefaceArguments = new drawing.TypefaceArguments();
          expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
          typefaceArguments.addVariation('wght', 100 + i);
          let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
          expect(typeface != null).assertTrue();
        }
        console.info(msg + ' addVariation stability test succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationCombinedWithIsBoldIsItalicStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_1900
     * @tc.desc   test addVariation combined with isBold and isItalic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAddVariationCombinedWithIsBoldIsItalicStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testAddVariationCombinedWithIsBoldIsItalicStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        expect(typeface != null).assertTrue();
        let isBold = typeface!.isBold();
        expect(isBold).assertEqual(false);
        let isItalic = typeface!.isItalic();
        expect(isItalic).assertEqual(false);
        console.info(msg + ' addVariation combined with isBold isItalic succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationCombinedWithGetFamilyNameStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_2000
     * @tc.desc   test addVariation combined with getFamilyName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddVariationCombinedWithGetFamilyNameStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testAddVariationCombinedWithGetFamilyNameStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        expect(typeface != null).assertTrue();
        let familyName = typeface!.getFamilyName();
        expect(familyName!.length > 0).assertTrue();
        expect(familyName!.includes('Harmony') || familyName!.includes('Sans')).assertTrue();
        console.info(msg + ' addVariation combined with getFamilyName succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationAllCommonAxisTagsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_2100
     * @tc.desc   test addVariation with all common axis tags.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testAddVariationAllCommonAxisTagsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, (): void => {
      const msg = 'testAddVariationAllCommonAxisTagsStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        console.info(msg + ' addVariation wght succeeded');
        expect(typefaceArguments != null && typefaceArguments != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments2 = new drawing.TypefaceArguments();
        typefaceArguments2.addVariation('wdth', 100);
        console.info(msg + ' addVariation wdth succeeded');
        expect(typefaceArguments2 != null && typefaceArguments2 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments3 = new drawing.TypefaceArguments();
        typefaceArguments3.addVariation('opsz', 12);
        console.info(msg + ' addVariation opsz succeeded');
        expect(typefaceArguments3 != null && typefaceArguments3 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments4 = new drawing.TypefaceArguments();
        typefaceArguments4.addVariation('slnt', 0);
        console.info(msg + ' addVariation slnt succeeded');
        expect(typefaceArguments4 != null && typefaceArguments4 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments5 = new drawing.TypefaceArguments();
        typefaceArguments5.addVariation('ital', 0);
        console.info(msg + ' addVariation ital succeeded');
        expect(typefaceArguments5 != null && typefaceArguments5 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationValueOutOfRangeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_2200
     * @tc.desc   test addVariation with value out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddVariationValueOutOfRangeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testAddVariationValueOutOfRangeStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', -9999);
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        console.info(msg + ' addVariation wght -9999 succeeded');
        expect(typeface != null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments2 = new drawing.TypefaceArguments();
        typefaceArguments2.addVariation('wght', 9999);
        let typeface2 = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments2);
        console.info(msg + ' addVariation wght 9999 succeeded');
        expect(typeface2 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationMultipleTimesWithSameValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_2800
     * @tc.desc   test addVariation multiple times with same value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddVariationMultipleTimesWithSameValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testAddVariationMultipleTimesWithSameValueStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        for (let i = 0; i < 10; i++) {
          typefaceArguments.addVariation('wght', 400);
        }
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        console.info(msg + ' addVariation multiple times with same value succeeded');
        expect(typeface != null).assertTrue();
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddVariationCombinedWithFontGetSizeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_3000
     * @tc.desc   test addVariation combined with Font getSize.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAddVariationCombinedWithFontGetSizeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testAddVariationCombinedWithFontGetSizeStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('wght', 400);
        let typeface = drawing.Typeface.makeFromFileWithArguments(DEFAULT_FONT_PATH, typefaceArguments);
        expect(typeface != null).assertTrue();
        let font = new drawing.Font();
        font.setTypeface(typeface!);
        font.setSize(30);
        let size = font.getSize();
        console.info(msg + ' addVariation combined with Font getSize succeeded');
        expect(size).assertEqual(30);
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testAddVariationAxisCaseSensitiveStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_TYPEFACEARGUMENTS_STATIC_3100
     * @tc.desc   test addVariation axis case sensitive.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddVariationAxisCaseSensitiveStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testAddVariationAxisCaseSensitiveStatic';
      try {
        let typefaceArguments = new drawing.TypefaceArguments();
        typefaceArguments.addVariation('Wght', 100);
        console.info(msg + ' addVariation  Wght succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
      try {
        let typefaceArguments2 = new drawing.TypefaceArguments();
        typefaceArguments2.addVariation('WGHT', 100);
        console.info(msg + ' addVariation  WGHT succeeded');
      } catch (e) {
        console.info(msg + ` errorCode: ${e.code}, errorMsg: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}