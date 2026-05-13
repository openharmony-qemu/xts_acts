import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => { resolve(0); }, time);
  });
}

export default function UnaryOverflow(): void {
  describe('UnaryOverflow', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_UNARY_OVERFLOW_0100
     * @tc.name      testUnaryOverflow0001
     * @tc.desc      Testing overflow for unary operator with byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryOverflow_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 127;
      let result = ++x;
      expect(result).assertEqual(-128)
      expect(x).assertEqual(-128)
      expect(result instanceof byte).assertTrue()
    })

    /**
     * @tc.number    SUB_BASEDATE_UNARY_OVERFLOW_0200
     * @tc.name      testUnaryOverflow0002
     * @tc.desc      Testing overflow for unary operator with short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryOverflow_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: short = 32767;
      let result = ++x;
      expect(result).assertEqual(-32768)
      expect(x).assertEqual(-32768)
      expect(result instanceof short).assertTrue()
    })

    /**
     * @tc.number    SUB_BASEDATE_UNARY_OVERFLOW_0300
     * @tc.name      testUnaryOverflow0003
     * @tc.desc      Testing overflow for unary operator with byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryOverflow_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 127;
      let result = x++;
      expect(result).assertEqual(127)
      expect(x).assertEqual(-128)
      expect(result instanceof byte).assertTrue()
    })

    /**
     * @tc.number    SUB_BASEDATE_UNARY_OVERFLOW_0400
     * @tc.name      testUnaryOverflow0004
     * @tc.desc      Testing overflow for unary operator with short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryOverflow_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: short = 32767;
      let result = x++;
      expect(result).assertEqual(32767)
      expect(x).assertEqual(-32768)
      expect(result instanceof short).assertTrue()
    })

    /**
     * @tc.number    SUB_BASEDATE_UNARY_OVERFLOW_0500
     * @tc.name      testUnaryOverflow0005
     * @tc.desc      Testing overflow for unary operator with int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryOverflow_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = -2147483648;
      let result = -x;
      expect(result).assertEqual(-2147483648)
      expect(result instanceof int).assertTrue()
    })
  })
}