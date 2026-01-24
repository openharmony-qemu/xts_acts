import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsIsHexDigitTest() {
  describe("builtinsIsHexDigitTest", () => {
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
     * @tc.name: charIsHexDigitTestCharBitSize0100
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_CHAR_BIT_SIZE_0100
     * @tc.desc: Test isHexDigit with CHAR_BIT_SIZE valid range (hex '0' in 16-bit range)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('charIsHexDigitTestCharBitSize0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validHex0 = new Char(c'0');
      expect(validHex0.isHexDigit()).assertTrue();
    });

    /**
     * @tc.name: charIsHexDigitTestMaxCodePoint0200
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_MAX_CODE_POINT_0200
     * @tc.desc: Test isHexDigit with MAX_CODE_POINT valid mapped char (non-hex char)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('charIsHexDigitTestMaxCodePoint0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonHexChar = new Char(c'\uFFFF');
      expect(nonHexChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name: charIsHexDigitTestHighSurrogateMin0300
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_HIGH_SURROGATE_MIN_0300
     * @tc.desc: Test isHexDigit with HIGH_SURROGATE_MIN (\uD800)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('charIsHexDigitTestHighSurrogateMin0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogateMinChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name: charIsHexDigitTestHighSurrogateMax0400
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_HIGH_SURROGATE_MAX_0400
     * @tc.desc: Test isHexDigit with HIGH_SURROGATE_MAX (\uDBFF)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('charIsHexDigitTestHighSurrogateMax0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      expect(highSurrogateMaxChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name: charIsHexDigitTestLowSurrogateMin0500
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_LOW_SURROGATE_MIN_0500
     * @tc.desc: Test isHexDigit with LOW_SURROGATE_MIN (\uDC00)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('charIsHexDigitTestLowSurrogateMin0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      expect(lowSurrogateMinChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name: charIsHexDigitTestLowSurrogateMax0600
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_LOW_SURROGATE_MAX_0600
     * @tc.desc: Test isHexDigit with LOW_SURROGATE_MAX (\uDFFF)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('charIsHexDigitTestLowSurrogateMax0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      expect(lowSurrogateMaxChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name: charIsHexDigitTestBmpBorderBelow0700
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_BMP_BORDER_BELOW_0700
     * @tc.desc: Test isHexDigit with BMP_BORDER below (0xFFFE, valid BMP char)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('charIsHexDigitTestBmpBorderBelow0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      expect(bmpBelowChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name: charIsHexDigitTestBmpBorderAbove0800
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_BMP_BORDER_ABOVE_0800
     * @tc.desc: Test isHexDigit with BMP_BORDER mapped valid char (hex 'f')
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('charIsHexDigitTestBmpBorderAbove0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bmpAboveHexF = new Char(c'f');
      expect(bmpAboveHexF.isHexDigit()).assertTrue();
    });

    /**
     * @tc.name: charIsHexDigitTestMinValue0900
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_MIN_VALUE_0900
     * @tc.desc: Test isHexDigit with MIN_VALUE (\u0000)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('charIsHexDigitTestMinValue0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      expect(minValueChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name: charIsHexDigitTestMaxValue1000
     * @tc.number: CHAR_IS_HEX_DIGIT_TEST_MAX_VALUE_1000
     * @tc.desc: Test isHexDigit with MAX_VALUE (\uFFFF)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('charIsHexDigitTestMaxValue1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      expect(maxValueChar.isHexDigit()).assertFalse();
    });

  })
}