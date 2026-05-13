import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => { resolve(0); }, time);
  });
}

export default function NumericExpressions(): void {
  describe('NumericExpressions', () => {
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
     * @tc.number    SUB_BASEDATE_NUMERIC_EXPRESSIONS_0100
     * @tc.name      testNumericExpressionsNoWidening0001
     * @tc.desc      The postfix and prefix increment and decrement operators evaluate byte and short operands without
     * widening. Same is true also for an assignment operator (considering assignment as a binary operator).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericExpressionsNoWidening0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let y_byte: byte = 1;
      let x_byte_prefix_1 = ++y_byte;
      expect(x_byte_prefix_1 instanceof byte).assertTrue();

      let x_byte_postfix_1 = y_byte++;
      expect(x_byte_postfix_1 instanceof byte).assertTrue();

      let x_byte_prefix_2 = --y_byte;
      expect(x_byte_prefix_2 instanceof byte).assertTrue();

      let x_byte_postfix_2 = y_byte--;
      expect(x_byte_postfix_2 instanceof byte).assertTrue();

      let x_byte_assignment = y_byte;
      expect(x_byte_assignment instanceof byte).assertTrue();

      // ============== short ==============
      let y_short: short = 1;
      let x_short_prefix_1 = ++y_short;
      expect(x_short_prefix_1 instanceof short).assertTrue();

      let x_short_postfix_1 = y_short++;
      expect(x_short_postfix_1 instanceof short).assertTrue();

      let x_short_prefix_2 = --y_short;
      expect(x_short_prefix_2 instanceof short).assertTrue();

      let x_short_postfix_2 = y_short--;
      expect(x_short_postfix_2 instanceof short).assertTrue();

      let x_short_assignment = y_short;
      expect(x_short_assignment instanceof short).assertTrue();

      // ============== int ==============
      let y_int: int = 1;
      let x_int_prefix_1 = ++y_int;
      expect(x_int_prefix_1 instanceof int).assertTrue();

      let x_int_postfix_1 = y_int++;
      expect(x_int_postfix_1 instanceof int).assertTrue();

      let x_int_prefix_2 = --y_int;
      expect(x_int_prefix_2 instanceof int).assertTrue();

      let x_int_postfix_2 = y_int--;
      expect(x_int_postfix_2 instanceof int).assertTrue();

      let x_int_assignment = y_int;
      expect(x_int_assignment instanceof int).assertTrue();

      // ============== long ==============
      let y_long: long = 1;
      let x_long_prefix_1 = ++y_long;
      expect(x_long_prefix_1 instanceof long).assertTrue();

      let x_long_postfix_1 = y_long++;
      expect(x_long_postfix_1 instanceof long).assertTrue();

      let x_long_prefix_2 = --y_long;
      expect(x_long_prefix_2 instanceof long).assertTrue();

      let x_long_postfix_2 = y_long--;
      expect(x_long_postfix_2 instanceof long).assertTrue();

      let x_long_assignment = y_long;
      expect(x_long_assignment instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATE_NUMERIC_EXPRESSIONS_0200
     * @tc.name      testNumericExpressionsWidening0001
     * @tc.desc      Operands of unary and binary numeric expressions are widened to a larger numeric type.
     * The minimum type is int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericExpressionsWidening0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 1
      let s: short = 2
      let i: int = 3
      let l: long = 4

      let x1_1 = b + b
      expect(x1_1 instanceof int).assertTrue()
      let x2_1 = b + s
      expect(x2_1 instanceof int).assertTrue()
      let x3_1 = s + s
      expect(x3_1 instanceof int).assertTrue()
      let x4_1 = b + i
      expect(x4_1 instanceof int).assertTrue()
      let x5_1 = i + l
      expect(x5_1 instanceof long).assertTrue()

      let x1_2 = b - b
      expect(x1_2 instanceof int).assertTrue()
      let x2_2 = b - s
      expect(x2_2 instanceof int).assertTrue()
      let x3_2 = s - s
      expect(x3_2 instanceof int).assertTrue()
      let x4_2 = b - i
      expect(x4_2 instanceof int).assertTrue()
      let x5_2 = i - l
      expect(x5_2 instanceof long).assertTrue()

      let x1_3 = b * b
      expect(x1_3 instanceof int).assertTrue()
      let x2_3 = b * s
      expect(x2_3 instanceof int).assertTrue()
      let x3_3 = s * s
      expect(x3_3 instanceof int).assertTrue()
      let x4_3 = b * i
      expect(x4_3 instanceof int).assertTrue()
      let x5_3 = i * l
      expect(x5_3 instanceof long).assertTrue()

      let x1_4 = b / b
      expect(x1_4 instanceof int).assertTrue()
      let x2_4 = b / s
      expect(x2_4 instanceof int).assertTrue()
      let x3_4 = s / s
      expect(x3_4 instanceof int).assertTrue()
      let x4_4 = b / i
      expect(x4_4 instanceof int).assertTrue()
      let x5_4 = i / l
      expect(x5_4 instanceof long).assertTrue()

      let x1_5 = b % b
      expect(x1_5 instanceof int).assertTrue()
      let x2_5 = b % s
      expect(x2_5 instanceof int).assertTrue()
      let x3_5 = s % s
      expect(x3_5 instanceof int).assertTrue()
      let x4_5 = b % i
      expect(x4_5 instanceof int).assertTrue()
      let x5_5 = i % l
      expect(x5_5 instanceof long).assertTrue()

      let y1_1 = ~b
      expect(y1_1 instanceof int).assertTrue()
      let y2_1 = ~s
      expect(y2_1 instanceof int).assertTrue()
      let y3_1 = ~i
      expect(y3_1 instanceof int).assertTrue()
      let y4_1 = ~l
      expect(y4_1 instanceof long).assertTrue()

      let y1_2 = -b
      expect(y1_2 instanceof int).assertTrue()
      let y2_2 = -s
      expect(y2_2 instanceof int).assertTrue()
      let y3_2 = -i
      expect(y3_2 instanceof int).assertTrue()
      let y4_2 = -l
      expect(y4_2 instanceof long).assertTrue()

      let y1_3 = +b
      expect(y1_3 instanceof int).assertTrue()
      let y2_3 = +s
      expect(y2_3 instanceof int).assertTrue()
      let y3_3 = +i
      expect(y3_3 instanceof int).assertTrue()
      let y4_3 = +l
      expect(y4_3 instanceof long).assertTrue()
    });
  });
}