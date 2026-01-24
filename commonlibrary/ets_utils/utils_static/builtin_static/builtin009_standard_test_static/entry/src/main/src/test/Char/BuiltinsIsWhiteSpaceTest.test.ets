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
     * @tc.name    charIsWhiteSpaceTestCharBitSize0100
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_CHAR_BIT_SIZE_0100
     * @tc.desc    Test isWhiteSpace with CHAR_BIT_SIZE valid range (space ' ' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('charIsWhiteSpaceTestCharBitSize0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validSpace = new Char(c' ');
      expect(validSpace.isWhiteSpace()).assertTrue();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestMaxCodePoint0200
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_MAX_CODE_POINT_0200
     * @tc.desc    Test isWhiteSpace with MAX_CODE_POINT valid mapped char (non-whitespace char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsWhiteSpaceTestMaxCodePoint0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonWhitespaceChar = new Char(c'\uFFFF');
      expect(nonWhitespaceChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestHighSurrogateMin0300
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_HIGH_SURROGATE_MIN_0300
     * @tc.desc    Test isWhiteSpace with HIGH_SURROGATE_MIN (\uD800, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsWhiteSpaceTestHighSurrogateMin0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogateMinChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestHighSurrogateMax0400
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_HIGH_SURROGATE_MAX_0400
     * @tc.desc    Test isWhiteSpace with HIGH_SURROGATE_MAX (\uDBFF, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsWhiteSpaceTestHighSurrogateMax0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      expect(highSurrogateMaxChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestLowSurrogateMin0500
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_LOW_SURROGATE_MIN_0500
     * @tc.desc    Test isWhiteSpace with LOW_SURROGATE_MIN (\uDC00, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsWhiteSpaceTestLowSurrogateMin0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      expect(lowSurrogateMinChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestLowSurrogateMax0600
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_LOW_SURROGATE_MAX_0600
     * @tc.desc    Test isWhiteSpace with LOW_SURROGATE_MAX (\uDFFF, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsWhiteSpaceTestLowSurrogateMax0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      expect(lowSurrogateMaxChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestBmpBorderBelow0700
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_BMP_BORDER_BELOW_0700
     * @tc.desc    Test isWhiteSpace with BMP_BORDER below (0xFFFE, valid BMP char, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsWhiteSpaceTestBmpBorderBelow0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      expect(bmpBelowChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestBmpBorderAbove0800
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_BMP_BORDER_ABOVE_0800
     * @tc.desc    Test isWhiteSpace with BMP_BORDER mapped valid char (tab '\t', whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('charIsWhiteSpaceTestBmpBorderAbove0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validTab = new Char(c'\t');
      expect(validTab.isWhiteSpace()).assertTrue();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestMinValue0900
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_MIN_VALUE_0900
     * @tc.desc    Test isWhiteSpace with MIN_VALUE (\u0000, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsWhiteSpaceTestMinValue0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      expect(minValueChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    charIsWhiteSpaceTestMaxValue1000
     * @tc.number  CHAR_IS_WHITE_SPACE_TEST_MAX_VALUE_1000
     * @tc.desc    Test isWhiteSpace with MAX_VALUE (\uFFFF, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsWhiteSpaceTestMaxValue1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      expect(maxValueChar.isWhiteSpace()).assertFalse();
    });
  })
}