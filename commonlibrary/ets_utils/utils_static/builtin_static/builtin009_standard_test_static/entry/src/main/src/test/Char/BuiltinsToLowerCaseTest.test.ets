import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsToLowerCaseTest() {
  describe("builtinsToLowerCaseTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    charToLowerCaseTestCharBitSize0100
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_CHAR_BIT_SIZE_0100
     * @tc.desc    Test toLowerCase with CHAR_BIT_SIZE valid range (uppercase 'A' to 'a' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('charToLowerCaseTestCharBitSize0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const uppercaseA = new Char(c'A');
      const lowercaseA = uppercaseA.toLowerCase();
      expect(lowercaseA).assertEqual(new Char(c'a'));
    });

    /**
     * @tc.name    charToLowerCaseTestMaxCodePoint0200
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_MAX_CODE_POINT_0200
     * @tc.desc    Test toLowerCase with MAX_CODE_POINT valid mapped char (non-letter char, no change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charToLowerCaseTestMaxCodePoint0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonLetterChar = new Char(c'\uFFFF');
      const convertedChar = nonLetterChar.toLowerCase();
      expect(convertedChar).assertEqual(nonLetterChar);
    });

    /**
     * @tc.name    charToLowerCaseTestHighSurrogateMin0300
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_HIGH_SURROGATE_MIN_0300
     * @tc.desc    Test toLowerCase with HIGH_SURROGATE_MIN (\uD800, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charToLowerCaseTestHighSurrogateMin0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      const convertedChar = highSurrogateMinChar.toLowerCase();
      expect(convertedChar).assertEqual(highSurrogateMinChar);
    });

    /**
     * @tc.name    charToLowerCaseTestHighSurrogateMax0400
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_HIGH_SURROGATE_MAX_0400
     * @tc.desc    Test toLowerCase with HIGH_SURROGATE_MAX (\uDBFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charToLowerCaseTestHighSurrogateMax0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      const convertedChar = highSurrogateMaxChar.toLowerCase();
      expect(convertedChar).assertEqual(highSurrogateMaxChar);
    });

    /**
     * @tc.name    charToLowerCaseTestLowSurrogateMin0500
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_LOW_SURROGATE_MIN_0500
     * @tc.desc    Test toLowerCase with LOW_SURROGATE_MIN (\uDC00, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charToLowerCaseTestLowSurrogateMin0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      const convertedChar = lowSurrogateMinChar.toLowerCase();
      expect(convertedChar).assertEqual(lowSurrogateMinChar);
    });

    /**
     * @tc.name    charToLowerCaseTestLowSurrogateMax0600
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_LOW_SURROGATE_MAX_0600
     * @tc.desc    Test toLowerCase with LOW_SURROGATE_MAX (\uDFFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charToLowerCaseTestLowSurrogateMax0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      const convertedChar = lowSurrogateMaxChar.toLowerCase();
      expect(convertedChar).assertEqual(lowSurrogateMaxChar);
    });

    /**
     * @tc.name    charToLowerCaseTestBmpBorderBelow0700
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_BMP_BORDER_BELOW_0700
     * @tc.desc    Test toLowerCase with BMP_BORDER below (0xFFFE, valid BMP char, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charToLowerCaseTestBmpBorderBelow0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      const convertedChar = bmpBelowChar.toLowerCase();
      expect(convertedChar).assertEqual(bmpBelowChar);
    });

    /**
     * @tc.name    charToLowerCaseTestBmpBorderAbove0800
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_BMP_BORDER_ABOVE_0800
     * @tc.desc    Test toLowerCase with BMP_BORDER mapped valid char (uppercase 'Z' to 'z')
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('charToLowerCaseTestBmpBorderAbove0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const uppercaseZ = new Char(c'Z');
      const lowercaseZ = uppercaseZ.toLowerCase();
      expect(lowercaseZ).assertEqual(new Char(c'z'));
    });

    /**
     * @tc.name    charToLowerCaseTestMinValue0900
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_MIN_VALUE_0900
     * @tc.desc    Test toLowerCase with MIN_VALUE (\u0000, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charToLowerCaseTestMinValue0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      const convertedChar = minValueChar.toLowerCase();
      expect(convertedChar).assertEqual(minValueChar);
    });

    /**
     * @tc.name    charToLowerCaseTestMaxValue1000
     * @tc.number  CHAR_TO_LOWER_CASE_TEST_MAX_VALUE_1000
     * @tc.desc    Test toLowerCase with MAX_VALUE (\uFFFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charToLowerCaseTestMaxValue1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      const convertedChar = maxValueChar.toLowerCase();
      expect(convertedChar).assertEqual(maxValueChar);
    });
  })
}