import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_repeat_test';
export default function StringRepeatTest1() {
  describe('StringRepeatTest1', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
interface CustomIteratorResult {
  value?: string;
  done: boolean;
}
interface CustomStringIterator {
  next(): CustomIteratorResult;
}
    //=================String.prototype.repeat()==================

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0100
     * @tc.name       testStringRepeatTest01Chapter0001
     * @tc.desc       TestOnceReturnOrig
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0001';
      console.log(TAG + 'start');
      'use strict';
      const str = 'abc';
      const result = str.repeat(1);
      expect(result).assertEqual('abc')
      expect(result === str).assertEqual( true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0200
     * @tc.name       testStringRepeatTest01Chapter0002
     * @tc.desc       TestRepeatTwoBasic
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0002';
      console.log(TAG + 'start');
      'use strict';
      const str = 'abc';
      const result = str.repeat(2);
      expect(result).assertEqual('abcabc')
      expect(result.length).assertEqual(6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0300
     * @tc.name       testStringRepeatTest01Chapter0003
     * @tc.desc       TestRepeatOverTwo
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0003';
      console.log(TAG + 'start');
      'use strict';
      const str = 'ab';
      const result = str.repeat(5);
      expect(result).assertEqual('ababababab')
      expect(result.length).assertEqual(10)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0400
     * @tc.name       testStringRepeatTest01Chapter0004
     * @tc.desc       TestZeroReturnEmpty
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0004';
      console.log(TAG + 'start');
      'use strict';
      const str = 'hello';
      const result = str.repeat(0);
      expect(result).assertEqual('')
      expect(result.length).assertEqual( 0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0500
     * @tc.name       testStringRepeatTest01Chapter0005
     * @tc.desc      TestSingleCharRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0005';
      console.log(TAG + 'start');
      'use strict';
      const result = 'a'.repeat(10);
      expect(result).assertEqual('aaaaaaaaaa')
      expect(result.length).assertEqual(10)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0600
     * @tc.name       testStringRepeatTest01Chapter0006
     * @tc.desc      TestSpaceRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0006';
      console.log(TAG + 'start');
      'use strict';
      const result = ' '.repeat(5);
      expect(result).assertEqual( '     ')
      expect(result.length).assertEqual( 5)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0700
     * @tc.name       testStringRepeatTest01Chapter0007
     * @tc.desc      LongStrRepeatFew
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0007';
      console.log(TAG + 'start');
      'use strict';
      const str = 'Hello World! ';
      const result = str.repeat(3);
      expect(result).assertEqual('Hello World! Hello World! Hello World! ')
      expect(result.length).assertEqual( 39)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0800
     * @tc.name       testStringRepeatTest01Chapter0008
     * @tc.desc       CountZeroBoundary
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0008';
      console.log(TAG + 'start');
      'use strict';
      const result = 'test'.repeat(0);
      expect(result).assertEqual('')
      expect(result === '').assertEqual( true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_0900
     * @tc.name       testStringRepeatTest01Chapter0009
     * @tc.desc       CountNegZeroCase
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0009';
      console.log(TAG + 'start');
      'use strict';
      const result = 'test'.repeat(-0);
      expect(result === '').assertEqual(true);
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1000
     * @tc.name       testStringRepeatTest01Chapter0010
     * @tc.desc       MinValidPositive
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0010';
      console.log(TAG + 'start');
      'use strict';
      const result = 'x'.repeat(1);
      expect(result).assertEqual('x')
      expect(result.length).assertEqual(1)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1100
     * @tc.name       testStringRepeatTest01Chapter0011
     * @tc.desc       CountLargeInt
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0011';
      console.log(TAG + 'start');
      'use strict';
      const result = 'a'.repeat(1000);
      expect(result.length).assertEqual(1000)
      expect(result === 'a'.repeat(1000)).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1200
     * @tc.name       testStringRepeatTest01Chapter0012
     * @tc.desc        NegDecimalThrow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0012';
      console.log(TAG + 'start');
      let result: boolean = stringTest.testNegDecimal()
      expect(result).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1300
     * @tc.name       testStringRepeatTest01Chapter0013
     * @tc.desc        NegInfinityThrow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0013';
      console.log(TAG + 'start');
      let result: boolean = stringTest.testCountNegInfinity()
      expect(result).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1400
     * @tc.name       testStringRepeatTest01Chapter0014
     * @tc.desc        PosInfinityThrow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0014';
      console.log(TAG + 'start');
      let result: boolean = stringTest.testCountPosInfinity()
      expect(result).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1500
     * @tc.name       testStringRepeatTest01Chapter0015
     * @tc.desc        PosFloatFloor
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0015';
      console.log(TAG + 'start');
      'use strict';
      const result = 'abc'.repeat(2.9);
      expect(result).assertEqual('abcabc')
      expect(result.length).assertEqual( 6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1600
     * @tc.name       testStringRepeatTest01Chapter0016
     * @tc.desc       PosFloatLessThanOne
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0016';
      console.log(TAG + 'start');
      'use strict';
      const result = 'abc'.repeat(0.999);
      expect(result).assertEqual('')
      expect(result.length).assertEqual(0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1700
     * @tc.name       testStringRepeatTest01Chapter0017
     * @tc.desc      CountFloat3Point5
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatest01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0017';
      console.log(TAG + 'start');
      'use strict';
      const result = 'abc'.repeat(3.5);
      expect(result).assertEqual('abcabcabc')
      expect(result.length).assertEqual(9)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1800
     * @tc.name       testStringRepeatTest01Chapter0018
     * @tc.desc      CountNumberStringConversion
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0018';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountNumberString()
      expect(result[0]).assertEqual('ababab')
      expect(result[1]).assertEqual( 6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_1900
     * @tc.name       testStringRepeatTest01Chapter0019
     * @tc.desc      CountEmptyStringToZero
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0019';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountEmptyString()
      expect(result[0]).assertEqual('')
      expect(result[1]).assertEqual( 0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2000
     * @tc.name       testStringRepeatTest01Chapter0020
     * @tc.desc      CountNonNumberStringToNaN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0020';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountNonNumberString()
      expect(result[0]).assertEqual('')
      expect(result[1]).assertEqual( 0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2100
     * @tc.name       testStringRepeatTest01Chapter0021
     * @tc.desc      CountTrueTo1
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0021';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountTrue()
      expect(result[0]).assertEqual('x')
      expect(result[1]).assertEqual(1)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2200
     * @tc.name       testStringRepeatTest01Chapter0022
     * @tc.desc      CountFalseTo0
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0022';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountFalse()
      expect(result[0]).assertEqual('')
      expect(result[1]).assertEqual(0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2300
     * @tc.name       testStringRepeatTest01Chapter0023
     * @tc.desc      CountNullToZero
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0023';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountNull()
      expect(result[0]).assertEqual('')
      expect(result[1]).assertEqual(0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2400
     * @tc.name       testStringRepeatTest01Chapter0024
     * @tc.desc      CountUndefinedToNaN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0024';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountUndefined()
      expect(result[0]).assertEqual('')
      expect(result[1]).assertEqual(0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2500
     * @tc.name       testStringRepeatTest01Chapter0025
     * @tc.desc      CountObjectToNaN
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0025';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountPlainObject()
      expect(result[0]).assertEqual('')
      expect(result[1]).assertEqual(0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2600
     * @tc.name       testStringRepeatTest01Chapter0026
     * @tc.desc      CountObjectWithValueOf
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0026';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountObjectWithValueOf()
      expect(result[0]).assertEqual('ababab')
      expect(result[1]).assertEqual(6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2700
     * @tc.name       testStringRepeatTest01Chapter0027
     * @tc.desc      CountObjectWithToString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0027';
      console.log(TAG + 'start');
      let result:(string | number)[] = stringTest.testCountObjectWithToString()
      expect(result[0]).assertEqual('xyxy')
      expect(result[1]).assertEqual(4)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2800
     * @tc.name       testStringRepeatTest01Chapter0028
     * @tc.desc      CountArrayConversion
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0028';
      console.log(TAG + 'start');
      let result: (string | number)[] = stringTest.testCountArray()
      expect(result[0]).assertEqual('ababab')
      expect(result[1]).assertEqual ('')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_2900
     * @tc.name       testStringRepeatTest01Chapter0029
     * @tc.desc       CountNegativeRangeError
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0029';
      console.log(TAG + 'start');
      let result: string[] | undefined = stringTest.testCountNegativeNumber()
      expect(result![0]).assertEqual('RangeError')
      expect(result![1]).assertEqual (true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3000
     * @tc.name       testStringRepeatTest01Chapter0030
     * @tc.desc       CountExceedMaxLengthRangeError
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0030';
      console.log(TAG + 'start');
      let result: string[] | undefined = stringTest.testCountExceedMaxStringLength()
      expect(result![0]).assertEqual('RangeError')
      expect(result![1]).assertEqual (true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3100
     * @tc.name       testStringRepeatTest01Chapter0031
     * @tc.desc        CountInfinityRangeError
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0031';
      console.log(TAG + 'start');
      let result: string = stringTest.testCountInfinity()
      expect(result).assertEqual('RangeError')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3200
     * @tc.name       testStringRepeatTest01Chapter0032
     * @tc.desc       ThisValueNull
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0032';
      console.log(TAG + 'start');
      let result: string[] | undefined = stringTest.testThisIsNull()
      expect(result![0]).assertEqual('TypeError')
      expect(result![1]).assertEqual (true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3300
     * @tc.name       testStringRepeatTest01Chapter0033
     * @tc.desc        ThisIsUndefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0033';
      console.log(TAG + 'start');
      let result: string = stringTest.testThisIsUndefined()
      expect(result).assertEqual('TypeError')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3400
     * @tc.name       testStringRepeatTest01Chapter0034
     * @tc.desc       ThisIsSymbol
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0034';
      console.log(TAG + 'start');
      let result: string = stringTest.testThisIsSymbol()
      expect(result).assertEqual('TypeError')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3500
     * @tc.name       testStringRepeatTest01Chapter0035
     * @tc.desc       EmptyStringRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0035';
      console.log(TAG + 'start');
      'use strict';
      const result1 = ''.repeat(5);
      expect(result1).assertEqual('')
      expect(result1.length).assertEqual(0)
      const result2 = ''.repeat(100);
      expect(result2).assertEqual('')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3600
     * @tc.name       testStringRepeatTest01Chapter0036
     * @tc.desc       EmptyStringRepeatZero
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0036';
      console.log(TAG + 'start');
      'use strict';
      const result = ''.repeat(0);
      expect(result).assertEqual('')
      expect(result === '').assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3700
     * @tc.name       testStringRepeatTest01Chapter0037
     * @tc.desc       RepeatNewlineCharacter
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0037';
      console.log(TAG + 'start');
      'use strict';
      const result = '\n'.repeat(3);
      expect(result).assertEqual('\n\n\n')
      expect(result.length).assertEqual(3)
      expect(result === '\n\n\n').assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3800
     * @tc.name       testStringRepeatTest01Chapter0038
     * @tc.desc       RepeatTabCharacter
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0038';
      console.log(TAG + 'start');
      'use strict';
      const result = '\t'.repeat(4);
      expect(result).assertEqual('\t\t\t\t')
      expect(result.length).assertEqual( 4)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_3900
     * @tc.name       testStringRepeatTest01Chapter0039
     * @tc.desc       RepeatCarriageReturn
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0039';
      console.log(TAG + 'start');
      'use strict';
      const result = '\r'.repeat(2);
      expect(result).assertEqual('\r\r')
      expect(result.length).assertEqual(2)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4000
     * @tc.name       testStringRepeatOfTest01Chapter0040
     * @tc.desc       RepeatBackslash
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0040';
      console.log(TAG + 'start');
      'use strict';
      const result = '\\'.repeat(5);
      expect(result).assertEqual( '\\\\\\\\\\')
      expect(result.length).assertEqual(5)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4100
     * @tc.name       testStringRepeatTest01Chapter0041
     * @tc.desc      RepeatStringWithQuotes
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0041';
      console.log(TAG + 'start');
      'use strict';
      const result1 = '"'.repeat(3);
      expect(result1).assertEqual('"""')
      const result2 = "'".repeat(3);
      expect(result2).assertEqual( "'''")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4200
     * @tc.name       testStringRepeatTest01Chapter0042
     * @tc.desc      RepeatZeroWidthCharacter
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0042';
      console.log(TAG + 'start');
      'use strict';
      const result = '\u200B'.repeat(5);
      expect(result.length).assertEqual(5)
      expect(result === '\u200B\u200B\u200B\u200B\u200B').assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4300
     * @tc.name       testStringRepeatTest01Chapter0043
     * @tc.desc       RepeatASCIIControlCharacters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0043';
      console.log(TAG + 'start');
      'use strict';
      const result = '\x00'.repeat(3);
      expect(result.length).assertEqual(3)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4400
     * @tc.name       testStringRepeatTest01Chapter0044
     * @tc.desc       RepeatChineseCharacters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0044';
      console.log(TAG + 'start');
      'use strict';
      const result = '你好'.repeat(3);
      expect(result).assertEqual('你好你好你好')
      expect(result.length).assertEqual(6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4500
     * @tc.name       testStringRepeatTest01Chapter0045
     * @tc.desc       RepeatJapaneseCharacters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0045';
      console.log(TAG + 'start');
      'use strict';
      const result = 'こんにちは'.repeat(2);
      expect(result).assertEqual('こんにちはこんにちは')
      expect(result.length).assertEqual(10)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4600
     * @tc.name       testStringRepeatTest01Chapter0046
     * @tc.desc       RepeatKoreanCharacters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0046';
      console.log(TAG + 'start');
      'use strict';
      const result = '안녕'.repeat(3);
      expect(result).assertEqual('안녕안녕안녕')
      expect(result.length).assertEqual(6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4700
     * @tc.name       testStringRepeatTest01Chapter0047
     * @tc.desc       RepeatGreekLetters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0047';
      console.log(TAG + 'start');
      'use strict';
      const result = 'αβγ'.repeat(2);
      expect(result).assertEqual('αβγαβγ')
      expect(result.length).assertEqual( 6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4800
     * @tc.name       testStringRepeatTest01Chapter0048
     * @tc.desc       RepeatCyrillicCharacters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0048';
      console.log(TAG + 'start');
      'use strict';
      const result = 'привет'.repeat(2);
      expect(result).assertEqual('приветпривет')
      expect(result.length).assertEqual( 12)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_4900
     * @tc.name       testStringRepeatTest01Chapter0049
     * @tc.desc       RepeatEmoji
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0049';
      console.log(TAG + 'start');
      'use strict';
      const result = '😀'.repeat(3);
      expect(result).assertEqual('😀😀😀')
      expect(result.length).assertEqual( 6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5000
     * @tc.name       testStringRepeatTest01Chapter0050
     * @tc.desc       RepeatComplexEmojiWithModifiers
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0050';
      console.log(TAG + 'start');
      'use strict';
      const result = '👨‍👩‍👧‍👦'.repeat(2);
      expect(result).assertEqual("👨‍👩‍👧‍👦👨‍👩‍👧‍👦")
      expect(result.length).assertEqual( 22)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5100
     * @tc.name       testStringRepeatTest01Chapter0051
     * @tc.desc       RepeatSpecialUnicodeCharacters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0051';
      console.log(TAG + 'start');
      'use strict';
      const result = '𝟘𝟙𝟚'.repeat(2);
      expect(result).assertEqual("𝟘𝟙𝟚𝟘𝟙𝟚")
      expect(result.length).assertEqual( 12)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5200
     * @tc.name       testStringRepeatTest01Chapter0052
     * @tc.desc       RepeatSurrogatePairCharacters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0052';
      console.log(TAG + 'start');
      'use strict';
      const result = '\uD83D\uDE00'.repeat(2);
      expect(result).assertEqual('😀😀')
      expect(result.length).assertEqual( 4)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5300
     * @tc.name       testStringRepeatTest01Chapter0053
     * @tc.desc      RepeatMixedBMPAndSurrogatePair
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0053';
      console.log(TAG + 'start');
      'use strict';
      const result = 'a😀b'.repeat(2);
      expect(result).assertEqual('a😀ba😀b')
      expect(result.length).assertEqual(8)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5400
     * @tc.name       testStringRepeatTest01Chapter0054
     * @tc.desc        RepeatWithCustomObjectViaCallApply
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0054';
      console.log(TAG + 'start');
      let result: string = stringTest.testCustomObjectCall()
      expect(result).assertEqual('abcabc')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5500
     * @tc.name       testStringRepeatTest01Chapter0055
     * @tc.desc        TestNumberRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0055';
      console.log(TAG + 'start');
      let result: string = stringTest.testNumberCall()
      expect(result).assertEqual('123123')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5600
     * @tc.name       testStringRepeatTest01Chapter0056
     * @tc.desc       TestBooleanRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0056';
      console.log(TAG + 'start');
      let result: string = stringTest.testBooleanCall()
      expect(result).assertEqual('truetruetrue')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5700
     * @tc.name       testStringRepeatTest01Chapter0057
     * @tc.desc       TestDateRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0057';
      console.log(TAG + 'start');
      let result: (string | boolean)[] = stringTest.testDateCall()
      expect(result![0]).assertEqual('string')
      expect(result![1]).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5800
     * @tc.name       testStringRepeatTest01Chapter0058
     * @tc.desc       TestArrayRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0058';
      console.log(TAG + 'start');
      let result: string = stringTest.testArrayCall()
      expect(result).assertEqual( '1,2,31,2,3')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_5900
     * @tc.name       testStringRepeatTest01Chapter0059
     * @tc.desc       TestStringPrototype
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0059';
      console.log(TAG + 'start');
      let result: string = stringTest.testModifyPrototype()
      expect(result).assertEqual('modified')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6000
     * @tc.name       testStringRepeatTest01Chapter0060
     * @tc.desc       TestDelAddProto
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0060';
      console.log(TAG + 'start');
      let result: boolean | undefined = stringTest.testDelProtoMethod()
      expect(result).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6100
     * @tc.name       testStringRepeatTest01Chapter0061
     * @tc.desc        TestRepeatConcat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0061';
      console.log(TAG + 'start');
      'use strict';
      const result = 'ab'.repeat(2).concat('cd');
      expect(result).assertEqual('ababcd')
      expect(result.length).assertEqual(6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6200
     * @tc.name       testStringRepeatTest01Chapter0062
     * @tc.desc        TestConcatRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0062';
      console.log(TAG + 'start');
      'use strict';
      const result = 'ab'.concat('cd').repeat(2);
      expect(result).assertEqual('abcdabcd')
      expect(result.length).assertEqual(8)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6300
     * @tc.name       testStringRepeatTest01Chapter0063
     * @tc.desc        TestRepeatSlice
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0063';
      console.log(TAG + 'start');
      'use strict';
      const result = 'abc'.repeat(3).slice(2, 7);
      expect(result).assertEqual('cabca')
      expect(result.length).assertEqual(5)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6400
     * @tc.name       testStringRepeatTest01Chapter0064
     * @tc.desc        TestSliceRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0064';
      console.log(TAG + 'start');
      'use strict';
      const result = 'abcde'.slice(1, 3).repeat(3);
      expect(result).assertEqual('bcbcbc')
      expect(result.length).assertEqual(6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6500
     * @tc.name       testStringRepeatTest01Chapter0065
     * @tc.desc        TestRepeatToUpper
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0065';
      console.log(TAG + 'start');
      'use strict';
      const result = 'ab'.repeat(2).toUpperCase();
      expect(result).assertEqual( 'ABAB')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6600
     * @tc.name       testStringRepeatTest01Chapter0066
     * @tc.desc       TestToLowerRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0066';
      console.log(TAG + 'start');
      'use strict';
      const result = 'AB'.toLowerCase().repeat(2);
      expect(result).assertEqual(  'abab')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6700
     * @tc.name       testStringRepeatTest01Chapter0067
     * @tc.desc       TestSpaceRepeatTrim
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0067';
      console.log(TAG + 'start');
      'use strict';
      const result = ' ab '.repeat(2).trim();
      expect(result).assertEqual( 'ab  ab')
      expect(result.length).assertEqual(6)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6800
     * @tc.name       testStringRepeatTest01Chapter0068
     * @tc.desc       TestTrimRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0068';
      console.log(TAG + 'start');
      'use strict';
      const result = ' ab '.trim().repeat(2);
      expect(result).assertEqual('abab')
      expect(result.length).assertEqual(4)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_6900
     * @tc.name       testStringRepeatTest01Chapter0069
     * @tc.desc        TestSplitJoinRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0069';
      console.log(TAG + 'start');
      let result: string= stringTest.testSplitJoinThenRepeat ()
      expect(result).assertEqual( 'abcabc')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7000
     * @tc.name       testStringRepeatTest01Chapter0070
     * @tc.desc       TestRepeatThenReplace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0070';
      console.log(TAG + 'start');
      'use strict';
      const result = 'ab'.repeat(3).replace(/ab/g, 'xy');
      expect(result).assertEqual('xyxyxy')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7100
     * @tc.name       testStringRepeatTest01Chapter0071
     * @tc.desc       TestReplaceThenRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0071';
      console.log(TAG + 'start');
      'use strict';
      const result = 'abc'.replace('b', 'x').repeat(2);
      expect(result).assertEqual('axcaxc')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7200
     * @tc.name       testStringRepeatTest01Chapter0072
     * @tc.desc       TestRepeatThenPadStart
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0072';
      console.log(TAG + 'start');
      'use strict';
      const result = 'ab'.repeat(2).padStart(10, 'x');
      expect(result).assertEqual('xxxxxxabab')
      expect(result.length).assertEqual(10)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7300
     * @tc.name       testStringRepeatTest01Chapter0073
     * @tc.desc       TestPadEndThenRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0073';
      console.log(TAG + 'start');
      'use strict';
      const result = 'ab'.padEnd(4, 'x').repeat(2);
      expect(result).assertEqual( 'abxxabxx')
      expect(result.length).assertEqual(8)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7400
     * @tc.name       testStringRepeatTest01Chapter0074
     * @tc.desc       TestSearchSubstringInRepeatResult
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0074';
      console.log(TAG + 'start');
      'use strict';
      const str = 'ab'.repeat(3);
      expect(str.indexOf('bab')).assertEqual( 1)
      expect(str.indexOf('aba')).assertEqual(0)
      expect(str.indexOf('abc')).assertEqual( -1)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7500
     * @tc.name       testStringRepeatTest01Chapter0075
     * @tc.desc       TestRepeatIncludes
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0075';
      console.log(TAG + 'start');
      'use strict';
      const str = 'abc'.repeat(3);
      expect(str.includes('bca')).assertEqual( true)
      expect(str.includes('cab')).assertEqual(true)
      expect(str.includes('abcd')).assertEqual(false)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7600
     * @tc.name       testStringRepeatTest01Chapter0076
     * @tc.desc       TestRepeatStartsWith
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0076';
      console.log(TAG + 'start');
      'use strict';
      const str = 'abc'.repeat(3);
      expect(str.startsWith('abc')).assertEqual( true)
      expect(str.startsWith('abca')).assertEqual(true)
      expect(str.startsWith('bca')).assertEqual(false)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7700
     * @tc.name       testStringRepeatTest01Chapter0077
     * @tc.desc       TestRepeatEndsWith
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0077';
      console.log(TAG + 'start');
      'use strict';
      const str = 'abc'.repeat(3);
      expect(str.endsWith('abc')).assertEqual( true)
      expect(str.endsWith('cabc')).assertEqual(true)
      expect(str.endsWith('bca')).assertEqual(false)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7800
     * @tc.name       testStringRepeatTest01Chapter0078
     * @tc.desc        TestRepeatCharAt
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0078';
      console.log(TAG + 'start');
      'use strict';
      const str = 'ab'.repeat(3);
      expect(str.charAt(0)).assertEqual( 'a')
      expect(str.charAt(1)).assertEqual('b')
      expect(str.charAt(2)).assertEqual('a')
      expect(str.charAt(5)).assertEqual('b')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_7900
     * @tc.name       testStringRepeatTest01Chapter0079
     * @tc.desc       TestRepeatCharCodeAt
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0079';
      console.log(TAG + 'start');
      'use strict';
      const str = 'AB'.repeat(3);
      expect(str.charCodeAt(0)).assertEqual( 65)
      expect(str.charCodeAt(1)).assertEqual(66)
      expect(str.charCodeAt(2)).assertEqual(65)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8000
     * @tc.name       testStringRepeatTest01Chapter0080
     * @tc.desc        TestThrowOnExceedMaxLength
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0080';
      console.log(TAG + 'start');
      let result:string[]|undefined = stringTest.testTestExceedMaxLength ()
      expect(result![0]).assertEqual(true)
      expect(result![1]).assertEqual("Invalid string length")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8100
     * @tc.name       testStringRepeatTest01Chapter0081
     * @tc.desc        TestLongStrRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0081';
      console.log(TAG + 'start');
      'use strict';
      const longStr = 'a'.repeat(10000);
      const result = longStr.repeat(2);
      expect(result.length).assertEqual(20000)
      expect(result.startsWith('a'.repeat(10000))).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8200
     * @tc.name       testStringRepeatTest01Chapter0082
     * @tc.desc        TestShortStrRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0082';
      console.log(TAG + 'start');
      'use strict';
      const result = 'a'.repeat(100000);
      expect(result.length).assertEqual(100000)
      expect(result === 'a'.repeat(100000)).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8300
     * @tc.name       testStringRepeatTest01Chapter0083
     * @tc.desc        TestRepeatChain
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0083';
      console.log(TAG + 'start');
      'use strict';
      let str = 'a';
      str = str.repeat(10);
      str = str.repeat(10);
      str = str.repeat(10);
      expect(str.length).assertEqual(1000)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8400
     * @tc.name       testStringRepeatTest01Chapter0084
     * @tc.desc        TestStrictModeRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0084';
      console.log(TAG + 'start');
      'use strict';
      const result = 'test'.repeat(3);
      expect(result).assertEqual('testtesttest')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8500
     * @tc.name       testStringRepeatTest01Chapter0085
     * @tc.desc        TestStrictModeThrow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0085';
      console.log(TAG + 'start');
      let result:boolean | undefined = stringTest.testStrictModeThrow()
      expect(result).assertEqual(true)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8600
     * @tc.name       testStringRepeatTest01Chapter0086
     * @tc.desc        TestNonStrictRepeat
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0086';
      console.log(TAG + 'start');
      const result = 'test'.repeat(3);
      expect(result).assertEqual( 'testtesttest')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8700
     * @tc.name       testStringRepeatTest01Chapter0087
     * @tc.desc        TestRepeatSeparator
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0087';
      console.log(TAG + 'start');
      'use strict';
      const separator = '-'.repeat(50);
      expect(separator).assertEqual( "--------------------------------------------------")
      expect(separator.length).assertEqual( 50)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8800
     * @tc.name       testStringRepeatTest01Chapter0088
     * @tc.desc        TestRepeatIndent
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0088';
      console.log(TAG + 'start');
      'use strict';
      const indent = '  '.repeat(4);
      expect(indent + 'indented text').assertEqual( '        indented text')
      expect(indent.length).assertEqual(8)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_8900
     * @tc.name       testStringRepeatTest01Chapter0089
     * @tc.desc       TestRepeatDecor
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0089';
      console.log(TAG + 'start');
      'use strict';
      const pattern = '/*'.repeat(20);
      expect(pattern).assertEqual( "/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*")
      expect(pattern.length).assertEqual( 40)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_9000
     * @tc.name       testStringRepeatTest01Chapter0090
     * @tc.desc       TestRepeatLeadingZero
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0090';
      console.log(TAG + 'start');
      let result: string = stringTest.testTestPadZero ()
      expect(result).assertEqual( '00042')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_9100
     * @tc.name       testStringRepeatTest01Chapter0091
     * @tc.desc       TestRepeatAlign
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0091';
      console.log(TAG + 'start');
      let result: string = stringTest.testTestStrAlign ()
      expect(result).assertEqual( 'hello     |')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_9200
     * @tc.name       testStringRepeatTest01Chapter0092
     * @tc.desc       TestRepeatTestData
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0092';
      console.log(TAG + 'start');
      'use strict';
      const testData = 'test\n'.repeat(100);
      expect(testData.split('\n').length).assertEqual(  101)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_9300
     * @tc.name       testStringRepeatTest01Chapter0093
     * @tc.desc       TestRepeatKey
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0093';
      console.log(TAG + 'start');
      'use strict';
      const key = 'XY'.repeat(16);
      expect(key.length).assertEqual(  32)
      expect(key).assertEqual('XYXYXYXYXYXYXYXYXYXYXYXYXYXYXYXY')
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_9400
     * @tc.name       testStringRepeatTest01Chapter0094
     * @tc.desc       TestRepeatPadLength
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0094';
      console.log(TAG + 'start');
      let result: string = stringTest.testTestPadData ()
      expect(result.length).assertEqual(  10)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGREPEAT_9500
     * @tc.name       testStringRepeatTest01Chapter0095
     * @tc.desc      TestRepeatAsciiArt
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testStringRepeatTest01Chapter0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringRepeatTest01Chapter0095';
      console.log(TAG + 'start');
      'use strict';
      const border = '═'.repeat(20)
      expect('╔' + border + '╗').assertEqual("╔════════════════════╗")
      expect('║' + ' '.repeat(20) + '║').assertEqual("║                    ║")
      expect('╚' + border + '╝').assertEqual("╚════════════════════╝")
      console.log(TAG + 'end');
    })
  })
}
