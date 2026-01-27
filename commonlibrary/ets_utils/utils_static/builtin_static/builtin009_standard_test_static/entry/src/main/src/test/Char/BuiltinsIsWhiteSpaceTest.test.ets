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
     * @tc.name    builtinsToLowerCaseTest0001
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0001
     * @tc.desc    Test isWhiteSpace with CHAR_BIT_SIZE valid range (space ' ' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsToLowerCaseTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validSpace = new Char(c' ');
      expect(validSpace.isWhiteSpace()).assertTrue();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0002
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0002
     * @tc.desc    Test isWhiteSpace with MAX_CODE_POINT valid mapped char (non-whitespace char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonWhitespaceChar = new Char(c'\uFFFF');
      expect(nonWhitespaceChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0003
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0003
     * @tc.desc    Test isWhiteSpace with HIGH_SURROGATE_MIN (\uD800, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogateMinChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0004
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0004
     * @tc.desc    Test isWhiteSpace with HIGH_SURROGATE_MAX (\uDBFF, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      expect(highSurrogateMaxChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0005
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0005
     * @tc.desc    Test isWhiteSpace with LOW_SURROGATE_MIN (\uDC00, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      expect(lowSurrogateMinChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0006
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0006
     * @tc.desc    Test isWhiteSpace with LOW_SURROGATE_MAX (\uDFFF, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      expect(lowSurrogateMaxChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0007
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0007
     * @tc.desc    Test isWhiteSpace with BMP_BORDER below (0xFFFE, valid BMP char, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      expect(bmpBelowChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0008
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0008
     * @tc.desc    Test isWhiteSpace with BMP_BORDER mapped valid char (tab '\t', whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsToLowerCaseTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validTab = new Char(c'\t');
      expect(validTab.isWhiteSpace()).assertTrue();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0009
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0009
     * @tc.desc    Test isWhiteSpace with MIN_VALUE (\u0000, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      expect(minValueChar.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0010
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0010
     * @tc.desc    Test isWhiteSpace with MAX_VALUE (\uFFFF, non-whitespace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      expect(maxValueChar.isWhiteSpace()).assertFalse();
    });
  })
}