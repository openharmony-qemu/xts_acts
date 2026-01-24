import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsIsLetterTest() {
  describe("builtinsIsLetterTest", () => {
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
     * @tc.name    charIsLetterTestCharBitSize0100
     * @tc.number  CHAR_IS_LETTER_TEST_CHAR_BIT_SIZE_0100
     * @tc.desc    Test isLetter with CHAR_BIT_SIZE valid range (letter 'a' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('charIsLetterTestCharBitSize0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validLetterA = new Char(c'a');
      expect(validLetterA.isLetter()).assertTrue();
    });

    /**
     * @tc.name    charIsLetterTestMaxCodePoint0200
     * @tc.number  CHAR_IS_LETTER_TEST_MAX_CODE_POINT_0200
     * @tc.desc    Test isLetter with MAX_CODE_POINT valid mapped char (non-letter char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsLetterTestMaxCodePoint0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonLetterChar = new Char(c'\uFFFF');
      expect(nonLetterChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    charIsLetterTestHighSurrogateMin0300
     * @tc.number  CHAR_IS_LETTER_TEST_HIGH_SURROGATE_MIN_0300
     * @tc.desc    Test isLetter with HIGH_SURROGATE_MIN (\uD800)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsLetterTestHighSurrogateMin0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogateMinChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    charIsLetterTestHighSurrogateMax0400
     * @tc.number  CHAR_IS_LETTER_TEST_HIGH_SURROGATE_MAX_0400
     * @tc.desc    Test isLetter with HIGH_SURROGATE_MAX (\uDBFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsLetterTestHighSurrogateMax0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      expect(highSurrogateMaxChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    charIsLetterTestLowSurrogateMin0500
     * @tc.number  CHAR_IS_LETTER_TEST_LOW_SURROGATE_MIN_0500
     * @tc.desc    Test isLetter with LOW_SURROGATE_MIN (\uDC00)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsLetterTestLowSurrogateMin0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      expect(lowSurrogateMinChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    charIsLetterTestLowSurrogateMax0600
     * @tc.number  CHAR_IS_LETTER_TEST_LOW_SURROGATE_MAX_0600
     * @tc.desc    Test isLetter with LOW_SURROGATE_MAX (\uDFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsLetterTestLowSurrogateMax0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      expect(lowSurrogateMaxChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    charIsLetterTestBmpBorderBelow0700
     * @tc.number  CHAR_IS_LETTER_TEST_BMP_BORDER_BELOW_0700
     * @tc.desc    Test isLetter with BMP_BORDER below (0xFFFE, valid BMP char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsLetterTestBmpBorderBelow0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      expect(bmpBelowChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    charIsLetterTestBmpBorderAbove0800
     * @tc.number  CHAR_IS_LETTER_TEST_BMP_BORDER_ABOVE_0800
     * @tc.desc    Test isLetter with BMP_BORDER mapped valid char (letter 'A')
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('charIsLetterTestBmpBorderAbove0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bmpAboveLetterA = new Char(c'A');
      expect(bmpAboveLetterA.isLetter()).assertTrue();
    });

    /**
     * @tc.name    charIsLetterTestMinValue0900
     * @tc.number  CHAR_IS_LETTER_TEST_MIN_VALUE_0900
     * @tc.desc    Test isLetter with MIN_VALUE (\u0000)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsLetterTestMinValue0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      expect(minValueChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    charIsLetterTestMaxValue1000
     * @tc.number  CHAR_IS_LETTER_TEST_MAX_VALUE_1000
     * @tc.desc    Test isLetter with MAX_VALUE (\uFFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsLetterTestMaxValue1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      expect(maxValueChar.isLetter()).assertFalse();
    });

  })
}