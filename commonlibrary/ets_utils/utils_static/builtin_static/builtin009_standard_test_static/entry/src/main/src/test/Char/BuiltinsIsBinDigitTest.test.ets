import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsIsBinDigitTest() {
  describe("builtinsIsBinDigitTest", () => {
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
     * @tc.name    charIsBinDigitTestCharBitSize0100
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_CHAR_BIT_SIZE_0100
     * @tc.desc    Test isBinDigit with CHAR_BIT_SIZE valid range (binary '0' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('charIsBinDigitTestCharBitSize0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validBinary0 = new Char(c'0');
      expect(validBinary0.isBinDigit()).assertTrue();
    });

    /**
     * @tc.name    charIsBinDigitTestMaxCodePoint0200
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_MAX_CODE_POINT_0200
     * @tc.desc    Test isBinDigit with MAX_CODE_POINT valid mapped char (non-binary char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsBinDigitTestMaxCodePoint0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonBinaryChar = new Char(c'\uFFFF');
      expect(nonBinaryChar.isBinDigit()).assertFalse();
    });

    /**
     * @tc.name    charIsBinDigitTestHighSurrogateMin0300
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_HIGH_SURROGATE_MIN_0300
     * @tc.desc    Test isBinDigit with HIGH_SURROGATE_MIN (\uD800)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsBinDigitTestHighSurrogateMin0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogateMinChar.isBinDigit()).assertFalse();
    });

    /**
     * @tc.name    charIsBinDigitTestHighSurrogateMax0400
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_HIGH_SURROGATE_MAX_0400
     * @tc.desc    Test isBinDigit with HIGH_SURROGATE_MAX (\uDBFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsBinDigitTestHighSurrogateMax0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      expect(highSurrogateMaxChar.isBinDigit()).assertFalse();
    });

    /**
     * @tc.name    charIsBinDigitTestLowSurrogateMin0500
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_LOW_SURROGATE_MIN_0500
     * @tc.desc    Test isBinDigit with LOW_SURROGATE_MIN (\uDC00)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsBinDigitTestLowSurrogateMin0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      expect(lowSurrogateMinChar.isBinDigit()).assertFalse();
    });

    /**
     * @tc.name    charIsBinDigitTestLowSurrogateMax0600
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_LOW_SURROGATE_MAX_0600
     * @tc.desc    Test isBinDigit with LOW_SURROGATE_MAX (\uDFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsBinDigitTestLowSurrogateMax0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      expect(lowSurrogateMaxChar.isBinDigit()).assertFalse();
    });

    /**
     * @tc.name    charIsBinDigitTestBmpBorderBelow0700
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_BMP_BORDER_BELOW_0700
     * @tc.desc    Test isBinDigit with BMP_BORDER below (0xFFFE, valid BMP char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsBinDigitTestBmpBorderBelow0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      expect(bmpBelowChar.isBinDigit()).assertFalse();
    });

    /**
     * @tc.name    charIsBinDigitTestBmpBorderAbove0800
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_BMP_BORDER_ABOVE_0800
     * @tc.desc    Test isBinDigit with BMP_BORDER mapped valid char (binary '1')
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('charIsBinDigitTestBmpBorderAbove0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bmpAboveBinary1 = new Char(c'1');
      expect(bmpAboveBinary1.isBinDigit()).assertTrue();
    });

    /**
     * @tc.name    charIsBinDigitTestMinValue0900
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_MIN_VALUE_0900
     * @tc.desc    Test isBinDigit with MIN_VALUE (\u0000)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsBinDigitTestMinValue0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      expect(minValueChar.isBinDigit()).assertFalse();
    });

    /**
     * @tc.name    charIsBinDigitTestMaxValue1000
     * @tc.number  CHAR_IS_BIN_DIGIT_TEST_MAX_VALUE_1000
     * @tc.desc    Test isBinDigit with MAX_VALUE (\uFFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('charIsBinDigitTestMaxValue1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      expect(maxValueChar.isBinDigit()).assertFalse();
    });
  })
}