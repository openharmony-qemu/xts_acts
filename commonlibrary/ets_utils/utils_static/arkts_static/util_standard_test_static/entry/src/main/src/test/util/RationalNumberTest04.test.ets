'use static'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../../../hypium';
import { util } from '@kit.ArkTS';

async function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
    setTimeout(() => {
      resolve(undefined as void)
    }, count)
  })
}

interface RationalTestCase {
  n: int;
  d: int;
}

interface RationalTestCaseDesc {
  n: int;
  d: int;
  desc: string;
}

export default function RationalNumber04Test(): void {
  describe('RationalNumber04Test', () => {
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
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    const positiveRational: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
    const consistencyRational: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 4);


    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0100
     * @tc.name      testRationalNumberIsNaN04_0001
     * @tc.desc      [Consistency] Verify isZero/isNaN logic consistency on normal objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberIsNaN04_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberIsNaN04_0001";
      console.log(TAG + " start");
      try {
        let zeroObj = util.RationalNumber.parseRationalNumber(0, 1);

        expect(zeroObj.isZero()).assertTrue();
        expect(zeroObj.isNaN()).assertFalse();
        expect(zeroObj.isFinite()).assertTrue();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0200
     * @tc.name      testRationalNumberIsFinite04_0002
     * @tc.desc      [Finite-Normal] Verify isFinite returns true for standard integers, negatives, and zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberIsFinite04_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberIsFinite04_0002";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(1, 1);
        expect(r1.isFinite()).assertTrue();

        let r2 = util.RationalNumber.parseRationalNumber(-100, 2);
        expect(r2.isFinite()).assertTrue();

        let r3 = util.RationalNumber.parseRationalNumber(5, -1);
        expect(r3.isFinite()).assertTrue();

        let r4 = util.RationalNumber.parseRationalNumber(0, 5);
        expect(r4.isFinite()).assertTrue();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0300
     * @tc.name      testRationalNumberIsFinite04_0003
     * @tc.desc      [Finite-Boundary] Verify isFinite returns true for JS numeric boundaries (Safe Integer, Min Value).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberIsFinite04_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberIsFinite04_0003";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(Number.MAX_SAFE_INTEGER.toLong(), 1);
        expect(r1.isFinite()).assertTrue();

        let r2 = util.RationalNumber.parseRationalNumber(Number.MIN_SAFE_INTEGER.toLong(), 1);
        expect(r2.isFinite()).assertTrue();

        let r3 = util.RationalNumber.parseRationalNumber(Number.EPSILON.toLong(), 1);
        expect(r3.isFinite()).assertTrue();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0400
     * @tc.name      testRationalNumberIsFinite04_0004
     * @tc.desc      [Finite-Safe] Verify isFinite returns TRUE for Standard and MaxSafeInteger values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberIsFinite04_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberIsFinite04_0004";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(1, 2);
        expect(r1.isFinite()).assertTrue();

        let r2 = util.RationalNumber.parseRationalNumber(-5, 1);
        expect(r2.isFinite()).assertTrue();

        let r3 = util.RationalNumber.parseRationalNumber(Number.MAX_SAFE_INTEGER.toLong(), 1);
        expect(r3.isFinite()).assertTrue();

        let r4 = util.RationalNumber.parseRationalNumber(0, 100);
        expect(r4.isFinite()).assertTrue();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0500
     * @tc.name      testRationalNumberIsFinite04_0005
     * @tc.desc      [DivisionByZero] Verify isFinite returns false when denominator is zero (resulting in Infinity).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberIsFinite04_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberIsFinite04_0005";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(1, 0);
        expect(r1.isFinite()).assertFalse();

        let r2 = util.RationalNumber.parseRationalNumber(-100, 0);
        expect(r2.isFinite()).assertFalse();

        let r3 = util.RationalNumber.parseRationalNumber(5, 0);
        expect(r3.isFinite()).assertFalse();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0600
     * @tc.name      testRationalNumberIsFinite04_0006
     * @tc.desc      [Finite-Safe] Verify isFinite returns TRUE for MinSafeInteger (Replaces NaN test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberIsFinite04_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberIsFinite04_0006";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.parseRationalNumber(Number.MIN_SAFE_INTEGER.toLong(), 1);
        expect(r1.isFinite()).assertTrue();

        let r2 = util.RationalNumber.parseRationalNumber(1, Number.MIN_SAFE_INTEGER.toLong());
        expect(r2.isFinite()).assertTrue();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0700
     * @tc.name      testRationalNumberIsFinite04_0007
     * @tc.desc      [String-Safe] Verify isFinite works for strictly formatted strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberIsFinite04_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberIsFinite04_0007";
      console.log(TAG + " start");
      try {
        let r1 = util.RationalNumber.createRationalFromString("-50/100");
        expect(r1.isFinite()).assertTrue();

        let r2 = util.RationalNumber.createRationalFromString("12345/1");
        expect(r2.isFinite()).assertTrue();

        let r3 = util.RationalNumber.createRationalFromString("0/10");
        expect(r3.isFinite()).assertTrue();

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0800
     * @tc.name      testRationalNumberIsFinite04_0008
     * @tc.desc      [Consistency-Safe] Verify logic consistency on valid objects only.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRationalNumberIsFinite04_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberIsFinite04_0008";
      console.log(TAG + " start");
      try {
        let obj = util.RationalNumber.parseRationalNumber(10, 2); 
        expect(obj.isFinite()).assertTrue();
        expect(obj.isNaN()).assertFalse();

        expect(obj.valueOf()).assertEqual(5);

        console.log(TAG + " passed");
      } catch (e) {
        console.error(TAG + ` failed: ${e}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_0900
     * @tc.name      testRationalNumberToString04_0009
     * @tc.desc      Verify toString method basic functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = positiveRational.toString();
      expect(result.length > 0).assertTrue();
      const resultType: string = typeof result;
      expect(resultType).assertEqual('string');
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1000
     * @tc.name      testRationalNumberToString04_0010
     * @tc.desc      Verify toString with positive, negative, zero, and integer rational numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: RationalTestCase[] = [
        { n: 1, d: 3 },
        { n: 2, d: 3 },
        { n: 3, d: 4 },
        { n: 5, d: 6 }
      ];

      testCases.forEach((testCase: RationalTestCase): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(testCase.n, testCase.d);
        const result: string = rational.toString();
        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1100
     * @tc.name      testRationalNumberToString04_0011
     * @tc.desc      Verify toString consistency across multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1: string = consistencyRational.toString();
      const result2: string = consistencyRational.toString();
      const result3: string = consistencyRational.toString();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1200
     * @tc.name      testRationalNumberToString04_0012
     * @tc.desc      Verify toString with negative numerator scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: RationalTestCaseDesc[] = [
        { n: -3, d: 4, desc: "negative numerator" },
        { n: 3, d: -4, desc: "negative denominator" },
        { n: -3, d: -4, desc: "both negative" }
      ];

      testCases.forEach((testCase: RationalTestCaseDesc): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(testCase.n, testCase.d);
        const result: string = rational.toString();
        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1300
     * @tc.name      testRationalNumberToString04_0013
     * @tc.desc      Verify toString with various denominator values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const denominators: int[] = [2, 3, 4, 5, 6, 7, 8, 9, 10];

      denominators.forEach((denominator: int): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, denominator);
        const result: string = rational.toString();
        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1400
     * @tc.name      testRationalNumberToString04_0014
     * @tc.desc      Verify toString integration with compareTo method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rational1: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      const rational2: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);

      const stringResult: string = rational1.toString();
      expect(stringResult.length > 0).assertTrue();
      const stringResultType: string = typeof stringResult;
      expect(stringResultType).assertEqual('string');

      const compareResult: number = rational1.compare(rational2);
      expect(compareResult).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1500
     * @tc.name      testRationalNumberToString04_0015
     * @tc.desc      Verify toString with edge case rational numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const edgeCases: RationalTestCaseDesc[] = [
        { n: 1, d: 1, desc: "unity" },
        { n: -1, d: 1, desc: "negative unity" },
        { n: 0, d: 5, desc: "zero with non-1 denominator" },
        { n: 100, d: 1, desc: "large integer" }
      ];

      edgeCases.forEach((testCase: RationalTestCaseDesc): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(testCase.n, testCase.d);
        const result: string = rational.toString();
        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1600
     * @tc.name      testRationalNumberToString04_0016
     * @tc.desc      Verify multiple consecutive toString calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(7, 8);
      const results: string[] = [];

      for (let i: int = 0; i < 5; i++) {
        const result: string = rational.toString();
        results.push(result);
        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');
      }

      for (let i: int = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(results[0]);
      }
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1700
     * @tc.name      testRationalNumberToString04_0017
     * @tc.desc      Verify toString returns non-empty string for basic cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: RationalTestCase[] = [
        { n: 1, d: 2 },
        { n: -1, d: 2 },
        { n: 0, d: 1 },
        { n: 5, d: 1 }
      ];

      testCases.forEach((testCase: RationalTestCase): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(testCase.n, testCase.d);
        const result: string = rational.toString();
        expect(result.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1800
     * @tc.name      testRationalNumberToString04_0018
     * @tc.desc      Verify toString with large rational numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: RationalTestCase[] = [
        { n: 999999, d: 1000000 },
        { n: 1000000, d: 999999 },
        { n: 1000000000, d: 1 },
        { n: 1, d: 1000000000 }
      ];

      testCases.forEach((testCase: RationalTestCase): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(testCase.n, testCase.d);
        const result: string = rational.toString();
        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_1900
     * @tc.name      testRationalNumberToString04_0019
     * @tc.desc      Verify toString with reciprocal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rational1: util.RationalNumber = util.RationalNumber.parseRationalNumber(2, 3);
      const rational2: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 2);

      const result1: string = rational1.toString();
      const result2: string = rational2.toString();

      expect(result1.length > 0).assertTrue();
      expect(result2.length > 0).assertTrue();


      const areEqual: boolean = (result1 === result2);
      expect(!areEqual).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2000
     * @tc.name      testRationalNumberToString04_0020
     * @tc.desc      Verify toString with simplified fractions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: RationalTestCaseDesc[] = [
        { n: 2, d: 4, desc: "simplifiable 1" },
        { n: 4, d: 2, desc: "simplifiable 2" },
        { n: 10, d: 20, desc: "simplifiable 3" },
        { n: 6, d: 8, desc: "simplifiable 4" }
      ];

      testCases.forEach((testCase: RationalTestCaseDesc): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(testCase.n, testCase.d);
        const result: string = rational.toString();
        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2100
     * @tc.name      testRationalNumberToString04_0021
     * @tc.desc      Verify toString with very small fractions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: RationalTestCase[] = [
        { n: 1, d: 1000 },
        { n: 1, d: 10000 },
        { n: 1, d: 100000 },
        { n: 1, d: 1000000 }
      ];

      testCases.forEach((testCase: RationalTestCase): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(testCase.n, testCase.d);
        const result: string = rational.toString();
        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2200
     * @tc.name      testRationalNumberToString04_0022
     * @tc.desc      Verify toString method preserves rational number state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const originalRational: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 5);

      const result1: string = originalRational.toString();
      const result2: string = originalRational.toString();

      const comparisonRational: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 5);
      const comparisonResult: number = originalRational.compare(comparisonRational);

      expect(result1).assertEqual(result2);
      expect(comparisonResult).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2300
     * @tc.name      testRationalNumberToString04_0023
     * @tc.desc      Comprehensive toString test with mixed scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToString04_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixedCases: RationalTestCaseDesc[] = [
        { n: 1, d: 2, desc: "basic fraction" },
        { n: -3, d: 7, desc: "negative prime fraction" },
        { n: 0, d: 11, desc: "zero with prime denominator" },
        { n: 22, d: 7, desc: "pi approximation" },
        { n: 355, d: 113, desc: "better pi approximation" }
      ];

      const results: string[] = [];
      mixedCases.forEach((testCase: RationalTestCaseDesc): void => {
        const rational: util.RationalNumber = util.RationalNumber.parseRationalNumber(testCase.n, testCase.d);
        const result: string = rational.toString();

        expect(result.length > 0).assertTrue();
        const resultType: string = typeof result;
        expect(resultType).assertEqual('string');


        const isDuplicate: boolean = results.some((prevResult: string): boolean => prevResult === result);
        expect(!isDuplicate).assertTrue();

        results.push(result);
      });
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2400
     * @tc.name      testRationalNumberCompareTo04_0024
     * @tc.desc      Verify equivalence: standard equality, unsimplified fractions, and sign normalization
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0024";
      console.log(TAG + " start");

      // Standard equality
      const num1 = util.RationalNumber.parseRationalNumber(1, 2);
      const num2 = util.RationalNumber.parseRationalNumber(1, 2);
      expect(num1.compare(num2)).assertEqual(0);

      // Unsimplified equality (1/2 == 2/4 == 50/100)
      const num3 = util.RationalNumber.parseRationalNumber(2, 4);
      const num4 = util.RationalNumber.parseRationalNumber(50, 100);
      expect(num1.compare(num3)).assertEqual(0);
      expect(num3.compare(num4)).assertEqual(0);

      // Double negative equality (-1/-2 == 1/2)
      const num5 = util.RationalNumber.parseRationalNumber(-1, -2);
      expect(num1.compare(num5)).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2500
     * @tc.name      testRationalNumberCompareTo04_0025
     * @tc.desc      Verify basic positive inequalities (Greater Than logic)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0025";
      console.log(TAG + " start");

      // Standard proper fraction
      const num1 = util.RationalNumber.parseRationalNumber(3, 4);
      const num2 = util.RationalNumber.parseRationalNumber(1, 2); // 2/4
      expect(num1.compare(num2) > 0).assertTrue();

      // Improper fraction vs Proper fraction (5/4 > 3/4)
      const num3 = util.RationalNumber.parseRationalNumber(5, 4);
      expect(num3.compare(num1) > 0).assertTrue();

      // Whole number vs Fraction (1 > 0.9)
      const num4 = util.RationalNumber.parseRationalNumber(1, 1);
      const num5 = util.RationalNumber.parseRationalNumber(9, 10);
      expect(num4.compare(num5) > 0).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2600
     * @tc.name      testRationalNumberCompareTo04_0026
     * @tc.desc      Verify basic positive inequalities (Less Than logic)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0026";
      console.log(TAG + " start");

      // Standard check
      const num1 = util.RationalNumber.parseRationalNumber(1, 4);
      const num2 = util.RationalNumber.parseRationalNumber(1, 2);
      expect(num1.compare(num2) < 0).assertTrue();

      // Comparing against 1
      const num3 = util.RationalNumber.parseRationalNumber(99, 100);
      const num4 = util.RationalNumber.parseRationalNumber(1, 1);
      expect(num3.compare(num4) < 0).assertTrue();

      const num5 = util.RationalNumber.parseRationalNumber(10, 21);
      const num6 = util.RationalNumber.parseRationalNumber(1, 2); // 10.5/21
      expect(num5.compare(num6) < 0).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2700
     * @tc.name      testRationalNumberCompareTo04_0027
     * @tc.desc      Verify Negative Equality (Manual Normalization)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0027";
      console.log(TAG + " start");

      const num1 = util.RationalNumber.parseRationalNumber(-1, 2);
      const num2 = util.RationalNumber.parseRationalNumber(-2, 4);

      expect(num1.compare(num2)).assertEqual(0);

      const num3 = util.RationalNumber.parseRationalNumber(-1, -2);
      const num4 = util.RationalNumber.parseRationalNumber(1, 2);
      expect(num3.compare(num4)).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2800
     * @tc.name      testRationalNumberCompareTo04_0028
     * @tc.desc      Verify Integer and Whole Number comparisons
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0028";
      console.log(TAG + " start");

      // 3/1 vs 2/1
      const int3 = util.RationalNumber.parseRationalNumber(3, 1);
      const int2 = util.RationalNumber.parseRationalNumber(2, 1);
      expect(int3.compare(int2) > 0).assertTrue();

      // 4/2 (Integer 2) vs 2/1 (Integer 2)
      const improper2 = util.RationalNumber.parseRationalNumber(4, 2);
      expect(improper2.compare(int2)).assertEqual(0);

      // 5/2 (2.5) vs 2/1 (2)
      const floatVal = util.RationalNumber.parseRationalNumber(5, 2);
      expect(floatVal.compare(int2) > 0).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_2900
     * @tc.name      testRationalNumberCompareTo04_0029
     * @tc.desc      Verify fixed component variations (Same Numerator OR Same Denominator)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0029";
      console.log(TAG + " start");

      // Same Numerator: 1/2 > 1/3
      const sameNum1 = util.RationalNumber.parseRationalNumber(1, 2);
      const sameNum2 = util.RationalNumber.parseRationalNumber(1, 3);
      expect(sameNum1.compare(sameNum2) > 0).assertTrue();

      // Same Numerator Negative: -1/2 < -1/3
      const negSameNum1 = util.RationalNumber.parseRationalNumber(-1, 2);
      const negSameNum2 = util.RationalNumber.parseRationalNumber(-1, 3);
      expect(negSameNum1.compare(negSameNum2) < 0).assertTrue();

      // Same Denominator: 2/3 > 1/3
      const sameDen1 = util.RationalNumber.parseRationalNumber(2, 3);
      const sameDen2 = util.RationalNumber.parseRationalNumber(1, 3);
      expect(sameDen1.compare(sameDen2) > 0).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_3000
     * @tc.name      testRationalNumberCompareTo04_0030
     * @tc.desc      Verify comparison of Close Proximity / Precision (1/3 vs 0.33)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0030";
      console.log(TAG + " start");
      
      const oneThird = util.RationalNumber.parseRationalNumber(1, 3);
      const approx = util.RationalNumber.parseRationalNumber(33, 100);
      expect(oneThird.compare(approx) > 0).assertTrue();
      
      const r1 = util.RationalNumber.parseRationalNumber(100, 101);
      const r2 = util.RationalNumber.parseRationalNumber(101, 102);
      expect(r2.compare(r1) > 0).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_3100
     * @tc.name      testRationalNumberCompareTo04_0031
     * @tc.desc      Verify reciprocals comparisons
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0031";
      console.log(TAG + " start");

      // 2/3 < 3/2
      const num1 = util.RationalNumber.parseRationalNumber(2, 3);
      const num2 = util.RationalNumber.parseRationalNumber(3, 2);
      expect(num1.compare(num2) < 0).assertTrue();

      // 1/5 vs 5/1
      const small = util.RationalNumber.parseRationalNumber(1, 5);
      const large = util.RationalNumber.parseRationalNumber(5, 1);
      expect(small.compare(large) < 0).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_3200
     * @tc.name      testRationalNumberCompareTo04_0032
     * @tc.desc      Verify comparison symmetry (A > B implies B < A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0032";
      console.log(TAG + " start");

      const num1 = util.RationalNumber.parseRationalNumber(4, 7);
      const num2 = util.RationalNumber.parseRationalNumber(5, 7);

      // If num1 < num2
      expect(num1.compare(num2) < 0).assertTrue();
      // Then num2 > num1
      expect(num2.compare(num1) > 0).assertTrue();

      // If equal, symmetry holds (0 == 0)
      const num3 = util.RationalNumber.parseRationalNumber(8, 14); // 4/7
      expect(num1.compare(num3)).assertEqual(0);
      expect(num3.compare(num1)).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_3300
     * @tc.name      testRationalNumberCompareTo04_0033
     * @tc.desc      Verify Large Number boundaries (Safety check)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0033";
      console.log(TAG + " start");

      const num1 = util.RationalNumber.parseRationalNumber(999999, 1000000);
      const num2 = util.RationalNumber.parseRationalNumber(999998, 1000000);
      expect(num1.compare(num2) > 0).assertTrue();

      const big1 = util.RationalNumber.parseRationalNumber(Number.MAX_SAFE_INTEGER.toLong(), 1);
      const big2 = util.RationalNumber.parseRationalNumber((Number.MAX_SAFE_INTEGER - 1).toLong(), 1);
      expect(big1.compare(big2) > 0).assertTrue();

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_3400
     * @tc.name      testRationalNumberCompareTo04_0034
     * @tc.desc      Verify comparison to self (Reflexivity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0034";
      console.log(TAG + " start");

      const num1 = util.RationalNumber.parseRationalNumber(123, 456);
      expect(num1.compare(num1)).assertEqual(0);

      const num2 = util.RationalNumber.parseRationalNumber(-5, 9);
      expect(num2.compare(num2)).assertEqual(0);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_RATIONALNUMBER04_3500
     * @tc.name      testRationalNumberCompareTo04_0035
     * @tc.desc      Verify Transitivity (If A < B and B < C, then A < C)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberCompareTo04_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testRationalNumberCompareTo04_0035";
      console.log(TAG + " start");

      const num1 = util.RationalNumber.parseRationalNumber(1, 4);
      const num2 = util.RationalNumber.parseRationalNumber(1, 2);
      const num3 = util.RationalNumber.parseRationalNumber(3, 4);

      expect(num1.compare(num2) < 0).assertTrue();
      expect(num2.compare(num3) < 0).assertTrue();

      expect(num1.compare(num3) < 0).assertTrue();

      expect(num3.compare(num2) > 0).assertTrue();
      expect(num2.compare(num1) > 0).assertTrue();
      expect(num3.compare(num1) > 0).assertTrue();

      console.log(TAG + " end");
    });

  });
}