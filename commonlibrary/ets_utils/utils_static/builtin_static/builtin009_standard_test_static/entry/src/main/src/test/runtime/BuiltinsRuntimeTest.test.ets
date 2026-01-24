/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';



export default function builtinsRuntimeTest() {
  describe('builtinsRuntimeTest', () => {
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
     * @tc.name    builtinsRuntimeTest0100
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0100
     * @tc.desc    Test sameValue with null and undefined values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValue(null, null)).assertTrue();
      expect(Runtime.sameValue(null, undefined)).assertFalse();
      expect(Runtime.sameValue(undefined, null)).assertFalse();

      expect(Runtime.sameValue(undefined, undefined)).assertTrue();
      expect(Runtime.sameValue(undefined, 0)).assertFalse();
      expect(Runtime.sameValue(undefined, '')).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest0200
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0200
     * @tc.desc    Test sameValue with Number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValue(new Number(0), new Number(0))).assertTrue();
      expect(Runtime.sameValue(new Number(42), new Number(42))).assertTrue();
      expect(Runtime.sameValue(new Number(-42), new Number(-42))).assertTrue();

      expect(Runtime.sameValue(new Number(NaN), new Number(NaN))).assertTrue();

      expect(Runtime.sameValue(new Number(Infinity), new Number(Infinity))).assertTrue();
      expect(Runtime.sameValue(new Number(-Infinity), new Number(-Infinity))).assertTrue();
      expect(Runtime.sameValue(new Number(Infinity), new Number(-Infinity))).assertFalse();

      expect(Runtime.sameValue(new Number(1.5), new Number(1.5))).assertTrue();
      expect(Runtime.sameValue(new Number(1.5), new Number(2.5))).assertFalse();

      expect(Runtime.sameValue(new Number(0), null)).assertFalse();
      expect(Runtime.sameValue(new Number(0), new String('0'))).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest0300
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0300
     * @tc.desc    Test sameValue with String type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValue(new String(''), new String(''))).assertTrue();
      expect(Runtime.sameValue(new String('hello'), new String('hello'))).assertTrue();
      expect(Runtime.sameValue(new String('hello'), new String('world'))).assertFalse();

      expect(Runtime.sameValue(new String('!@#$%'), new String('!@#$%'))).assertTrue();

      const asciiChars = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      expect(Runtime.sameValue(new String(asciiChars), new String(asciiChars))).assertTrue();

      expect(Runtime.sameValue(new String('\n\r\t'), new String('\n\r\t'))).assertTrue();
      expect(Runtime.sameValue(new String('\x41'), new String('A'))).assertTrue();

      expect(Runtime.sameValue(new String('👆'), new String('👆'))).assertTrue();
      expect(Runtime.sameValue(new String('\ud83d\udc46'), new String('👆'))).assertTrue();

      expect(Runtime.sameValue(new String('a'.repeat(10)), new String('a'.repeat(10)))).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0400
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0400
     * @tc.desc    Test sameValue with Float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValue(new Float(0.0), new Float(0.0))).assertTrue();
      expect(Runtime.sameValue(new Float(3.14), new Float(3.14))).assertTrue();
      expect(Runtime.sameValue(new Float(-3.14), new Float(-3.14))).assertTrue();

      expect(Runtime.sameValue(new Float(NaN), new Float(NaN))).assertTrue();
      expect(Runtime.sameValue(new Float(Infinity), new Float(Infinity))).assertTrue();
      expect(Runtime.sameValue(new Float(-Infinity), new Float(-Infinity))).assertTrue();

      expect(Runtime.sameValue(new Float(1.0 / 3.0), new Float(1.0 / 3.0))).assertTrue();
      expect(Runtime.sameValue(new Float(0.1 + 0.2), new Float(0.3))).assertTrue();

      expect(Runtime.sameValue(new Float(Number.MAX_VALUE), new Float(Number.MAX_VALUE))).assertTrue();
      expect(Runtime.sameValue(new Float(Number.MIN_VALUE), new Float(Number.MIN_VALUE))).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0500
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0500
     * @tc.desc    Test sameValue with boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValue(true, true)).assertTrue();
      expect(Runtime.sameValue(false, false)).assertTrue();
      expect(Runtime.sameValue(true, false)).assertFalse();

      expect(Runtime.sameValue(1, true)).assertFalse();
      expect(Runtime.sameValue(0, false)).assertFalse();
      expect(Runtime.sameValue('', false)).assertFalse();
      expect(Runtime.sameValue(null, false)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest0600
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0600
     * @tc.desc    Test sameValue with array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1 = [72, 101, 108, 108, 111];
      const arr2 = [72, 101, 108, 108, 111];
      const arr3 = [87, 111, 114, 108, 100];

      expect(Runtime.sameValue(arr1, arr1)).assertTrue();
      expect(Runtime.sameValue(arr1, arr2)).assertFalse();

      const arrWithZeros = [72, 101, 108, 108, 111, 0, 0, 0];
      expect(Runtime.sameValue(arrWithZeros, arrWithZeros)).assertTrue();

      const arrWithNegatives = [72, 101, 108, -111, 114];
      expect(Runtime.sameValue(arrWithNegatives, arrWithNegatives)).assertTrue();
    });



    /**
     * @tc.name    builtinsRuntimeTest0700
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0700
     * @tc.desc    Test sameValue with TypedArray types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int8Arr1 = new Int8Array([-128, 0, 127]);
      const int8Arr2 = new Int8Array([-128, 0, 127]);
      expect(Runtime.sameValue(int8Arr1, int8Arr1)).assertTrue();
      expect(Runtime.sameValue(int8Arr1, int8Arr2)).assertFalse();

      const uint8Arr1 = new Uint8Array([0, 128, 255]);
      const uint8Arr2 = new Uint8Array([0, 128, 255]);
      expect(Runtime.sameValue(uint8Arr1, uint8Arr1)).assertTrue();

      const float32Arr1 = new Float32Array([1.5, 3.14, -2.5]);
      const float32Arr2 = new Float32Array([1.5, 3.14, -2.5]);
      expect(Runtime.sameValue(float32Arr1, float32Arr1)).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0800
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0800
     * @tc.desc    Test sameValue with edge cases and special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValue(0, false)).assertFalse();
      expect(Runtime.sameValue(1, true)).assertFalse();
      expect(Runtime.sameValue('0', 0)).assertFalse();
      expect(Runtime.sameValue('', false)).assertFalse();

      expect(Runtime.sameValue(null, 0)).assertFalse();
      expect(Runtime.sameValue(undefined, false)).assertFalse();

      expect(Runtime.sameValue(new Number(0), new Number(-0))).assertTrue();

      expect(Runtime.sameValue(new Number(Number.MAX_SAFE_INTEGER),
        new Number(Number.MAX_SAFE_INTEGER))).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0900
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST0900
     * @tc.desc    Test sameValue with function and Symbol types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const func1 = () => { return 42; };
      const func2 = () => { return 42; };
      expect(Runtime.sameValue(func1, func1)).assertTrue();
      expect(Runtime.sameValue(func1, func2)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest1000
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_TEST1000
     * @tc.desc    Test sameValue with Date and RegExp types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-01-01');
      const date3 = new Date('2024-12-31');

      expect(Runtime.sameValue(date1, date1)).assertTrue();
      expect(Runtime.sameValue(date1, date2)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest1100
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1100
     * @tc.desc    Test sameValueZero with null and undefined values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValueZero(null, null)).assertTrue();
      expect(Runtime.sameValueZero(null, undefined)).assertFalse();
      expect(Runtime.sameValueZero(undefined, null)).assertFalse();

      expect(Runtime.sameValueZero(undefined, undefined)).assertTrue();
      expect(Runtime.sameValueZero(undefined, 0)).assertFalse();
      expect(Runtime.sameValueZero(undefined, '')).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest1200
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1200
     * @tc.desc    Test sameValueZero with Number type and NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValueZero(0, 0)).assertTrue();
      expect(Runtime.sameValueZero(42, 42)).assertTrue();
      expect(Runtime.sameValueZero(-42, -42)).assertTrue();
      expect(Runtime.sameValueZero(42, 43)).assertFalse();

      expect(Runtime.sameValueZero(NaN, NaN)).assertTrue();
      expect(Runtime.sameValueZero(NaN, 0)).assertFalse();
      expect(Runtime.sameValueZero(0, NaN)).assertFalse();

      expect(Runtime.sameValueZero(Infinity, Infinity)).assertTrue();
      expect(Runtime.sameValueZero(-Infinity, -Infinity)).assertTrue();
      expect(Runtime.sameValueZero(Infinity, -Infinity)).assertFalse();

      expect(Runtime.sameValueZero(0, -0)).assertTrue();
      expect(Runtime.sameValueZero(-0, 0)).assertTrue();
      expect(Runtime.sameValueZero(-0, -0)).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest1300
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1300
     * @tc.desc    Test sameValueZero with number boundaries and special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValueZero(Number.MAX_VALUE, Number.MAX_VALUE)).assertTrue();
      expect(Runtime.sameValueZero(Number.MIN_VALUE, Number.MIN_VALUE)).assertTrue();
      expect(Runtime.sameValueZero(Number.EPSILON, Number.EPSILON)).assertTrue();

      expect(Runtime.sameValueZero(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER)).assertTrue();

      expect(Runtime.sameValueZero(255, 0xFF)).assertTrue();
      expect(Runtime.sameValueZero(8, 2 ** 3)).assertTrue();
      expect(Runtime.sameValueZero(1000, 1e3)).assertTrue();
      expect(Runtime.sameValueZero(0.025, 2.5e-2)).assertTrue();

      const sum = 0.1 + 0.2;
      console.log('0.1 + 0.2 =', sum, '0.3 =', 0.3);
      console.log('0.1 + 0.2 === 0.3:', sum === 0.3);

      expect(Runtime.sameValueZero(0.1 + 0.2, 0.3)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest1400
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1400
     * @tc.desc    Test sameValueZero with String type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValueZero('', '')).assertTrue();
      expect(Runtime.sameValueZero('hello', 'hello')).assertTrue();
      expect(Runtime.sameValueZero('hello', 'world')).assertFalse();

      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      expect(Runtime.sameValueZero(specialChars, specialChars)).assertTrue();

      const asciiChars: string = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      expect(Runtime.sameValueZero(asciiChars, asciiChars)).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest1500
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1500
     * @tc.desc    Test sameValueZero with String escape sequences and Unicode
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeStr1: string = '\n\r\t\\\'\"\?';
      const escapeStr2: string = '\n\r\t\\\'\"\?';
      expect(Runtime.sameValueZero(escapeStr1, escapeStr2)).assertTrue();

      expect(Runtime.sameValueZero('\x41', 'A')).assertTrue(); // Hex

      expect(Runtime.sameValueZero('👆', '👆')).assertTrue();
      expect(Runtime.sameValueZero('👿', '👿')).assertTrue();
      expect(Runtime.sameValueZero('💯', '💯')).assertTrue();

      expect(Runtime.sameValueZero('0', '0')).assertTrue();
      expect(Runtime.sameValueZero('NaN', 'NaN')).assertTrue();
      expect(Runtime.sameValueZero('', '')).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest1600
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1600
     * @tc.desc    Test sameValueZero with boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValueZero(true, true)).assertTrue();
      expect(Runtime.sameValueZero(false, false)).assertTrue();
      expect(Runtime.sameValueZero(true, false)).assertFalse();

      expect(Runtime.sameValueZero(0, 0)).assertTrue();
      expect(Runtime.sameValueZero(NaN, NaN)).assertTrue();
      expect(Runtime.sameValueZero('', '')).assertTrue();
      expect(Runtime.sameValueZero(null, null)).assertTrue();
      expect(Runtime.sameValueZero(undefined, undefined)).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest1700
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1700
     * @tc.desc    Test sameValueZero with array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [72, 101, 108, 108, 111];
      const arr2: number[] = [72, 101, 108, 108, 111];
      const arr3: number[] = [87, 111, 114, 108, 100];

      expect(Runtime.sameValueZero(arr1, arr1)).assertTrue();
      expect(Runtime.sameValueZero(arr1, arr3)).assertFalse();

      const arrWithZeros: number[] = [72, 101, 108, 108, 111, 0, 0, 0];
      expect(Runtime.sameValueZero(arrWithZeros, arrWithZeros)).assertTrue();

      const arrWithNegatives: number[] = [72, 101, 108, -111, 114];
      expect(Runtime.sameValueZero(arrWithNegatives, arrWithNegatives)).assertTrue();

      const arrWithSpecial: number[] = [72, 101, NaN, Infinity, 108, 111];
      expect(Runtime.sameValueZero(arrWithSpecial, arrWithSpecial)).assertTrue();

      const emptyArr1: number[] = [];
      const emptyArr2: number[] = [];
      expect(Runtime.sameValueZero(emptyArr1, emptyArr2)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest1800
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1800
     * @tc.desc    Test sameValueZero with TypedArray types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int8Arr1 = new Int8Array([-128, 0, 127]);
      const int8Arr2 = new Int8Array([-128, 0, 127]);

      expect(Runtime.sameValueZero(int8Arr1, int8Arr1)).assertTrue();
      expect(Runtime.sameValueZero(int8Arr1, int8Arr2)).assertFalse();

      const uint8Arr1 = new Uint8Array([0, 128, 255]);
      const uint8Arr2 = new Uint8Array([0, 128, 255]);
      expect(Runtime.sameValueZero(uint8Arr1, uint8Arr1)).assertTrue();

      const clampedArr1 = new Uint8ClampedArray([0, 128, 255, 0, 255]);
      const clampedArr2 = new Uint8ClampedArray([0, 128, 255, 0, 255]);
      expect(Runtime.sameValueZero(clampedArr1, clampedArr2)).assertFalse();

      const float32Arr1 = new Float32Array([NaN, Infinity, -Infinity, 1.5]);
      const float32Arr2 = new Float32Array([NaN, Infinity, -Infinity, 1.5]);
      expect(Runtime.sameValueZero(float32Arr1, float32Arr1)).assertTrue();
      expect(Runtime.sameValueZero(float32Arr1, float32Arr2)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest1900
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1900
     * @tc.desc    Test sameValueZero with all TypedArray types and boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int16Arr1 = new Int16Array([-32768, 0, 32767]);
      const int16Arr2 = new Int16Array([-32768, 0, 32767]);
      expect(Runtime.sameValueZero(int16Arr1, int16Arr1)).assertTrue();

      const uint16Arr1 = new Uint16Array([0, 32768, 65535]);
      const uint16Arr2 = new Uint16Array([0, 32768, 65535]);
      expect(Runtime.sameValueZero(uint16Arr1, uint16Arr2)).assertFalse();

      const int32Arr1 = new Int32Array([-2147483648, 0, 2147483647]);
      const int32Arr2 = new Int32Array([-2147483648, 0, 2147483647]);
      expect(Runtime.sameValueZero(int32Arr2, int32Arr2)).assertTrue();

      const uint32Arr1 = new Uint32Array([0, 2147483648, 4294967295]);
      const uint32Arr2 = new Uint32Array([0, 2147483648, 4294967295]);
      expect(Runtime.sameValueZero(uint32Arr1, uint32Arr2)).assertFalse();

      const float64Arr1 = new Float64Array([
        -1.7976931348623157e308,
        Number.MIN_VALUE,
        NaN,
        Infinity,
        1.7976931348623157e308
      ]);
      const float64Arr2 = new Float64Array([
        -1.7976931348623157e308,
        Number.MIN_VALUE,
        NaN,
        Infinity,
        1.7976931348623157e308
      ]);
      expect(Runtime.sameValueZero(float64Arr1, float64Arr2)).assertFalse();
    });


    /**
     * @tc.name    builtinsRuntimeTest2000
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST2000
     * @tc.desc    Test sameValueZero with type coercion and edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.sameValueZero(0, false)).assertFalse();
      expect(Runtime.sameValueZero(1, true)).assertFalse();
      expect(Runtime.sameValueZero('0', 0)).assertFalse();
      expect(Runtime.sameValueZero('', false)).assertFalse();
      expect(Runtime.sameValueZero(null, 0)).assertFalse();
      expect(Runtime.sameValueZero(undefined, 0)).assertFalse();

      expect(Runtime.sameValueZero(+0, -0)).assertTrue();
      expect(Runtime.sameValueZero(-0, +0)).assertTrue();
      expect(Runtime.sameValueZero(-0, -0)).assertTrue();

      expect(Runtime.sameValueZero(NaN, NaN)).assertTrue();
      expect(Runtime.sameValueZero(Number.NaN, NaN)).assertTrue();

    });

    /**
     * @tc.name    builtinsRuntimeTest2100
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST2100
     * @tc.desc    Test sameValueZero with Date and RegExp types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-01-01');
      const date3 = new Date('2024-12-31');

      expect(Runtime.sameValueZero(date1, date1)).assertTrue();
      expect(Runtime.sameValueZero(date2, date2)).assertTrue();
      expect(Runtime.sameValueZero(date1, date3)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest2200
     * @tc.number  BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST2200
     * @tc.desc    Test sameValueZero with large strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_SAME_VALUE_ZERO_TEST2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeString1: string = 'a'.repeat(1000);
      const largeString2: string = 'a'.repeat(1000);
      const largeString3: string = 'b'.repeat(1000);

      expect(Runtime.sameValueZero(largeString1, largeString1)).assertTrue();
      expect(Runtime.sameValueZero(largeString2, largeString2)).assertTrue();
      expect(Runtime.sameValueZero(largeString1, largeString3)).assertFalse();

      const hugeString: string = "test".repeat(250);
      expect(Runtime.sameValueZero(hugeString, hugeString)).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest2300
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2300
     * @tc.desc    Test basic functionality of isLittleEndianPlatform API
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = Runtime.isLittleEndianPlatform();

      expect(typeof result).assertEqual('boolean');

      const result1: boolean = Runtime.isLittleEndianPlatform();
      const result2: boolean = Runtime.isLittleEndianPlatform();
      const result3: boolean = Runtime.isLittleEndianPlatform();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(result3);
    });

    /**
     * @tc.name    builtinsRuntimeTest2400
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2400
     * @tc.desc    Test isLittleEndianPlatform with different data types to verify endianness
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const singleByteArray: Uint8Array = new Uint8Array([0x01]);
      expect(singleByteArray[0]).assertEqual(0x01);

      const uint16Array: Uint16Array = new Uint16Array([0x0102]);
      const uint16Buffer: Uint8Array = new Uint8Array(uint16Array.buffer);

      if (isLittleEndian) {
        expect(uint16Buffer[0]).assertEqual(0x02);
        expect(uint16Buffer[1]).assertEqual(0x01);
      } else {
        expect(uint16Buffer[0]).assertEqual(0x01);
        expect(uint16Buffer[1]).assertEqual(0x02);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest2500
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2500
     * @tc.desc    Test isLittleEndianPlatform with Int32Array boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const int32MinArray: Int32Array = new Int32Array([-2147483648]);
      const int32MinBuffer: Uint8Array = new Uint8Array(int32MinArray.buffer);

      if (isLittleEndian) {
        expect(int32MinBuffer[0]).assertEqual(0x00);
        expect(int32MinBuffer[1]).assertEqual(0x00);
        expect(int32MinBuffer[2]).assertEqual(0x00);
        expect(int32MinBuffer[3]).assertEqual(0x80);
      } else {
        expect(int32MinBuffer[0]).assertEqual(0x80);
        expect(int32MinBuffer[1]).assertEqual(0x00);
        expect(int32MinBuffer[2]).assertEqual(0x00);
        expect(int32MinBuffer[3]).assertEqual(0x00);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest2600
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2600
     * @tc.desc    Test isLittleEndianPlatform with Uint32Array boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const uint32MaxArray: Uint32Array = new Uint32Array([4294967295]);
      const uint32MaxBuffer: Uint8Array = new Uint8Array(uint32MaxArray.buffer);

      if (isLittleEndian) {
        expect(uint32MaxBuffer[0]).assertEqual(0xFF);
        expect(uint32MaxBuffer[1]).assertEqual(0xFF);
        expect(uint32MaxBuffer[2]).assertEqual(0xFF);
        expect(uint32MaxBuffer[3]).assertEqual(0xFF);
      } else {
        expect(uint32MaxBuffer[0]).assertEqual(0xFF);
        expect(uint32MaxBuffer[1]).assertEqual(0xFF);
        expect(uint32MaxBuffer[2]).assertEqual(0xFF);
        expect(uint32MaxBuffer[3]).assertEqual(0xFF);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest2700
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2700
     * @tc.desc    Test isLittleEndianPlatform with Float32Array special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const floatArray: Float32Array = new Float32Array([1.0]);
      const floatBuffer: Uint8Array = new Uint8Array(floatArray.buffer);

      if (isLittleEndian) {
        expect(floatBuffer[0]).assertEqual(0x00);
        expect(floatBuffer[1]).assertEqual(0x00);
        expect(floatBuffer[2]).assertEqual(0x80);
        expect(floatBuffer[3]).assertEqual(0x3F);
      } else {
        expect(floatBuffer[0]).assertEqual(0x3F);
        expect(floatBuffer[1]).assertEqual(0x80);
        expect(floatBuffer[2]).assertEqual(0x00);
        expect(floatBuffer[3]).assertEqual(0x00);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest2800
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2800
     * @tc.desc    Test isLittleEndianPlatform with Float64Array special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const doubleArray: Float64Array = new Float64Array([1.0]);
      const doubleBuffer: Uint8Array = new Uint8Array(doubleArray.buffer);

      if (isLittleEndian) {
        expect(doubleBuffer[0]).assertEqual(0x00);
        expect(doubleBuffer[1]).assertEqual(0x00);
        expect(doubleBuffer[2]).assertEqual(0x00);
        expect(doubleBuffer[3]).assertEqual(0x00);
        expect(doubleBuffer[4]).assertEqual(0x00);
        expect(doubleBuffer[5]).assertEqual(0x00);
        expect(doubleBuffer[6]).assertEqual(0xF0);
        expect(doubleBuffer[7]).assertEqual(0x3F);
      } else {
        expect(doubleBuffer[0]).assertEqual(0x3F);
        expect(doubleBuffer[1]).assertEqual(0xF0);
        expect(doubleBuffer[2]).assertEqual(0x00);
        expect(doubleBuffer[3]).assertEqual(0x00);
        expect(doubleBuffer[4]).assertEqual(0x00);
        expect(doubleBuffer[5]).assertEqual(0x00);
        expect(doubleBuffer[6]).assertEqual(0x00);
        expect(doubleBuffer[7]).assertEqual(0x00);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest2900
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2900
     * @tc.desc    Test isLittleEndianPlatform with ArrayBuffer operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const view32: Uint32Array = new Uint32Array(buffer);
      const view8: Uint8Array = new Uint8Array(buffer);

      view32[0] = 0x01020304;

      if (isLittleEndian) {
        expect(view8[0]).assertEqual(0x04);
        expect(view8[1]).assertEqual(0x03);
        expect(view8[2]).assertEqual(0x02);
        expect(view8[3]).assertEqual(0x01);
      } else {
        expect(view8[0]).assertEqual(0x01);
        expect(view8[1]).assertEqual(0x02);
        expect(view8[2]).assertEqual(0x03);
        expect(view8[3]).assertEqual(0x04);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest3000
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST3000
     * @tc.desc    Test isLittleEndianPlatform with DataView operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const dataView: DataView = new DataView(buffer);

      dataView.setUint16(0, 0x0102, true);
      dataView.setUint16(2, 0x0102, false);

      const littleEndianValue: number = dataView.getUint16(0, true);
      const bigEndianValue: number = dataView.getUint16(2, false);

      expect(littleEndianValue).assertEqual(0x0102);
      expect(bigEndianValue).assertEqual(0x0102);

      const view8: Uint8Array = new Uint8Array(buffer);

      expect(view8[0]).assertEqual(0x02);
      expect(view8[1]).assertEqual(0x01);

      expect(view8[2]).assertEqual(0x01);
      expect(view8[3]).assertEqual(0x02);
    });

    /**
     * @tc.name    builtinsRuntimeTest3100
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST3100
     * @tc.desc    Test isLittleEndianPlatform with multiple data types consistency
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const buffer: ArrayBuffer = new ArrayBuffer(8);

      const uint32View: Uint32Array = new Uint32Array(buffer);
      uint32View[0] = 0xAABBCCDD;

      const uint8View: Uint8Array = new Uint8Array(buffer);

      if (isLittleEndian) {
        expect(uint8View[0]).assertEqual(0xDD);
        expect(uint8View[1]).assertEqual(0xCC);
        expect(uint8View[2]).assertEqual(0xBB);
        expect(uint8View[3]).assertEqual(0xAA);
      } else {
        expect(uint8View[0]).assertEqual(0xAA);
        expect(uint8View[1]).assertEqual(0xBB);
        expect(uint8View[2]).assertEqual(0xCC);
        expect(uint8View[3]).assertEqual(0xDD);
      }

      const int16View: Int16Array = new Int16Array(buffer);
      int16View[0] = 0x1122;

      if (isLittleEndian) {
        expect(uint8View[0]).assertEqual(0x22);
        expect(uint8View[1]).assertEqual(0x11);
      } else {
        expect(uint8View[0]).assertEqual(0x11);
        expect(uint8View[1]).assertEqual(0x22);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest3200
     * @tc.number  BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST3200
     * @tc.desc    Test isLittleEndianPlatform with boundary cases and performance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zeroBuffer: ArrayBuffer = new ArrayBuffer(4);
      const zeroView32: Uint32Array = new Uint32Array(zeroBuffer);
      const zeroView8: Uint8Array = new Uint8Array(zeroBuffer);

      zeroView32[0] = 0;

      expect(zeroView8[0]).assertEqual(0x00);
      expect(zeroView8[1]).assertEqual(0x00);
      expect(zeroView8[2]).assertEqual(0x00);
      expect(zeroView8[3]).assertEqual(0x00);

      const maxUint32: number = 0xFFFFFFFF;
      const maxBuffer: ArrayBuffer = new ArrayBuffer(4);
      const maxView32: Uint32Array = new Uint32Array(maxBuffer);
      const maxView8: Uint8Array = new Uint8Array(maxBuffer);

      maxView32[0] = maxUint32;

      expect(maxView8[0]).assertEqual(0xFF);
      expect(maxView8[1]).assertEqual(0xFF);
      expect(maxView8[2]).assertEqual(0xFF);
      expect(maxView8[3]).assertEqual(0xFF);

      const startTime: number = new Date().getTime();
      for (let i: number = 0; i < 1000; i++) {
        const result: boolean = Runtime.isLittleEndianPlatform();
        expect(typeof result).assertEqual('boolean');
      }
      const endTime: number = new Date().getTime();
      const elapsedTime: number = endTime - startTime;

      expect(elapsedTime < 1000).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest3300
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3300
     * @tc.desc    Test isSameReference with primitive values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Runtime.isSameReference(null, null)).assertTrue();
      expect(Runtime.isSameReference(null, undefined)).assertFalse();

      expect(Runtime.isSameReference(undefined, undefined)).assertTrue();
      expect(Runtime.isSameReference(undefined, null)).assertFalse();

      expect(Runtime.isSameReference(true, true)).assertFalse();
      expect(Runtime.isSameReference(false, false)).assertFalse();
      expect(Runtime.isSameReference(true, false)).assertFalse();

      expect(Runtime.isSameReference(0, 0)).assertFalse();
      expect(Runtime.isSameReference(42, 42)).assertFalse();
      expect(Runtime.isSameReference(NaN, NaN)).assertFalse();
      expect(Runtime.isSameReference(Infinity, Infinity)).assertFalse();
      expect(Runtime.isSameReference(-0, 0)).assertFalse();

      expect(Runtime.isSameReference('', '')).assertTrue();
      expect(Runtime.isSameReference('hello', 'hello')).assertTrue();
      expect(Runtime.isSameReference('hello', 'world')).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest3400
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3400
     * @tc.desc    Test isSameReference with Number objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num1: Number = new Number(42);
      const num2: Number = new Number(42);
      const num3: Number = num1;

      expect(Runtime.isSameReference(num1, num1)).assertFalse();
      expect(Runtime.isSameReference(num1, num3)).assertFalse();
      expect(Runtime.isSameReference(num1, num2)).assertFalse();

      const maxNum1: Number = new Number(Number.MAX_VALUE);
      const maxNum2: Number = new Number(Number.MAX_VALUE);
      expect(Runtime.isSameReference(maxNum1, maxNum1)).assertFalse();
      expect(Runtime.isSameReference(maxNum1, maxNum2)).assertFalse();

      const nan1: Number = new Number(NaN);
      const nan2: Number = new Number(NaN);
      const inf1: Number = new Number(Infinity);
      const inf2: Number = new Number(Infinity);

      expect(Runtime.isSameReference(nan1, nan1)).assertFalse();
      expect(Runtime.isSameReference(nan1, nan2)).assertFalse();
      expect(Runtime.isSameReference(inf1, inf1)).assertFalse();
      expect(Runtime.isSameReference(inf1, inf2)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest3500
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3500
     * @tc.desc    Test isSameReference with String objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str1: String = new String('hello');
      const str2: String = new String('hello');
      const str3: String = str1;

      expect(Runtime.isSameReference(str1, str1)).assertTrue();
      expect(Runtime.isSameReference(str1, str3)).assertTrue();
      expect(Runtime.isSameReference(str1, str2)).assertTrue();

      const emptyStr1: String = new String('');
      const emptyStr2: String = new String('');
      expect(Runtime.isSameReference(emptyStr1, emptyStr1)).assertTrue();
      expect(Runtime.isSameReference(emptyStr1, emptyStr2)).assertTrue();

      const specialStr1: String = new String('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      const specialStr2: String = new String('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(Runtime.isSameReference(specialStr1, specialStr1)).assertTrue();
      expect(Runtime.isSameReference(specialStr1, specialStr2)).assertTrue();

      const emojiStr1: String = new String('👆');
      const emojiStr2: String = new String('👆');
      expect(Runtime.isSameReference(emojiStr1, emojiStr1)).assertTrue();
      expect(Runtime.isSameReference(emojiStr1, emojiStr2)).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest3600
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3600
     * @tc.desc    Test isSameReference with array objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [72, 101, 108, 108, 111];
      const arr2: number[] = [72, 101, 108, 108, 111];
      const arr3: number[] = arr1;

      expect(Runtime.isSameReference(arr1, arr1)).assertTrue();
      expect(Runtime.isSameReference(arr1, arr3)).assertTrue();
      expect(Runtime.isSameReference(arr1, arr2)).assertFalse();

      const zeroArr1: number[] = [72, 101, 108, 108, 111, 0, 0, 0];
      const zeroArr2: number[] = [72, 101, 108, 108, 111, 0, 0, 0];
      expect(Runtime.isSameReference(zeroArr1, zeroArr1)).assertTrue();
      expect(Runtime.isSameReference(zeroArr1, zeroArr2)).assertFalse();

      const negArr1: number[] = [72, 101, 108, -111, 114];
      const negArr2: number[] = [72, 101, 108, -111, 114];
      expect(Runtime.isSameReference(negArr1, negArr1)).assertTrue();
      expect(Runtime.isSameReference(negArr1, negArr2)).assertFalse();

      const emptyArr1: number[] = [];
      const emptyArr2: number[] = [];
      expect(Runtime.isSameReference(emptyArr1, emptyArr1)).assertTrue();
      expect(Runtime.isSameReference(emptyArr1, emptyArr2)).assertFalse();

      const specialArr1: number[] = [72, 101, NaN, Infinity, 108, 111];
      const specialArr2: number[] = [72, 101, NaN, Infinity, 108, 111];
      expect(Runtime.isSameReference(specialArr1, specialArr1)).assertTrue();
      expect(Runtime.isSameReference(specialArr1, specialArr2)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest3700
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3700
     * @tc.desc    Test isSameReference with TypedArray objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int8Arr1: Int8Array = new Int8Array([-128, 0, 127]);
      const int8Arr2: Int8Array = new Int8Array([-128, 0, 127]);
      const int8Arr3: Int8Array = int8Arr1;

      expect(Runtime.isSameReference(int8Arr1, int8Arr1)).assertTrue();
      expect(Runtime.isSameReference(int8Arr1, int8Arr3)).assertTrue();
      expect(Runtime.isSameReference(int8Arr1, int8Arr2)).assertFalse();

      const uint8Arr1: Uint8Array = new Uint8Array([0, 128, 255]);
      const uint8Arr2: Uint8Array = new Uint8Array([0, 128, 255]);
      expect(Runtime.isSameReference(uint8Arr1, uint8Arr1)).assertTrue();
      expect(Runtime.isSameReference(uint8Arr1, uint8Arr2)).assertFalse();

      const float32Arr1: Float32Array = new Float32Array([NaN, Infinity, -Infinity, 1.5]);
      const float32Arr2: Float32Array = new Float32Array([NaN, Infinity, -Infinity, 1.5]);
      expect(Runtime.isSameReference(float32Arr1, float32Arr1)).assertTrue();
      expect(Runtime.isSameReference(float32Arr1, float32Arr2)).assertFalse();

      const float64Arr1: Float64Array = new Float64Array([-1.7976931348623157e308, Number.MIN_VALUE, NaN, Infinity]);
      const float64Arr2: Float64Array = new Float64Array([-1.7976931348623157e308, Number.MIN_VALUE, NaN, Infinity]);
      expect(Runtime.isSameReference(float64Arr1, float64Arr1)).assertTrue();
      expect(Runtime.isSameReference(float64Arr1, float64Arr2)).assertFalse();
    });

    /**
     * @tc.name    builtinsRuntimeTest3800
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3800
     * @tc.desc    Test isSameReference with function references
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const func1: () => number = () => 42;
      const func2: () => number = () => 42;
      const func3: () => number = func1;

      expect(Runtime.isSameReference(func1, func1)).assertTrue();
      expect(Runtime.isSameReference(func1, func3)).assertTrue();
      expect(Runtime.isSameReference(func1, func2)).assertFalse();

      const add1: (a: number, b: number) => number = (a, b) => a + b;
      const add2: (a: number, b: number) => number = (a, b) => a + b;
      expect(Runtime.isSameReference(add1, add1)).assertTrue();
      expect(Runtime.isSameReference(add1, add2)).assertFalse();
    });



    /**
     * @tc.name    builtinsRuntimeTest3900
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3900
     * @tc.desc    Test isSameReference with ArrayBuffer and DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer1: ArrayBuffer = new ArrayBuffer(16);
      const buffer2: ArrayBuffer = new ArrayBuffer(16);
      const buffer3: ArrayBuffer = buffer1;

      expect(Runtime.isSameReference(buffer1, buffer1)).assertTrue();
      expect(Runtime.isSameReference(buffer1, buffer3)).assertTrue();
      expect(Runtime.isSameReference(buffer1, buffer2)).assertFalse();

      const dataView1: DataView = new DataView(buffer1);
      const dataView2: DataView = new DataView(buffer2);
      const dataView3: DataView = dataView1;

      expect(Runtime.isSameReference(dataView1, dataView1)).assertTrue();
      expect(Runtime.isSameReference(dataView1, dataView3)).assertTrue();
      expect(Runtime.isSameReference(dataView1, dataView2)).assertFalse();

      const uint8View1: Uint8Array = new Uint8Array(buffer1);
      const uint8View2: Uint8Array = new Uint8Array(buffer1, 0, 8);
      expect(Runtime.isSameReference(uint8View1, uint8View1)).assertTrue();
      expect(Runtime.isSameReference(uint8View1, uint8View2)).assertFalse();
    });



    /**
     * @tc.name    builtinsRuntimeTest4000
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST4000
     * @tc.desc    Test isSameReference with Promise objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
        const promise1: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve('done'), 100);
        });

        const promise2: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve('done'), 100);
        });

        const promise3 = promise1;

        expect(Runtime.isSameReference(promise1, promise1)).assertTrue();
        expect(Runtime.isSameReference(promise1, promise3)).assertTrue();
        expect(Runtime.isSameReference(promise1, promise2)).assertFalse();
      });

    /**
     * @tc.name    builtinsRuntimeTest4100
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST4100
     * @tc.desc    Test isSameReference with edge cases and mixed types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: number = 42;
      const str: string = '42';
      const bool: boolean = true;
      const arr: number[] = [42];

      expect(Runtime.isSameReference(num, str)).assertFalse();
      expect(Runtime.isSameReference(num, bool)).assertFalse();
      expect(Runtime.isSameReference(num, arr)).assertFalse();
      expect(Runtime.isSameReference(str, arr)).assertFalse();

      const numObj1: Number = new Number(42);
      const numObj2: Number = new Number(42);
      const numPrim: number = 42;

      expect(Runtime.isSameReference(numObj1, numObj2)).assertFalse();
      expect(Runtime.isSameReference(numObj1, numPrim)).assertFalse();

      const strObj1: String = new String('hello');
      const strObj2: String = new String('hello');
      const strPrim: string = 'hello';

      expect(Runtime.isSameReference(strObj1, strObj2)).assertTrue();
      expect(Runtime.isSameReference(strObj1, strPrim)).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest4200
     * @tc.number  BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST4200
     * @tc.desc    Test isSameReference performance and consistency
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_IS_SAME_REFERENCE_TEST4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeObj1: Record<string, number> = {};
      const largeObj2: Record<string, number> = {};

      for (let i: number = 0; i < 1000; i++) {
        largeObj1[`prop${i}`] = i;
        largeObj2[`prop${i}`] = i;
      }

      const largeObj3: Record<string, number> = largeObj1;

      expect(Runtime.isSameReference(largeObj1, largeObj1)).assertTrue();
      expect(Runtime.isSameReference(largeObj1, largeObj3)).assertTrue();
      expect(Runtime.isSameReference(largeObj1, largeObj2)).assertFalse();

      const results: boolean[] = [];
      for (const result of results) {
        expect(result).assertTrue();
      }

    });

    /**
     * @tc.name    builtinsRuntimeTest4300
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST4300
     * @tc.desc    Test __narrowAny with null and undefined values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nullResult: (object | null | undefined) = __narrowAny(null);
      expect(nullResult === null).assertTrue();

      const undefinedResult: (object | null | undefined) = __narrowAny(undefined);
      expect(undefinedResult === undefined).assertTrue();

      const nullToObject: object | null = __narrowAny<object | null>(null);
      expect(nullToObject === null).assertTrue();

      const undefinedToObject: object | undefined = __narrowAny<object | undefined>(undefined);
      expect(undefinedToObject === undefined).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest4400
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST4400
     * @tc.desc    Test __narrowAny with primitive types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberValue: number = 42;
      const numberResult: (object | null | undefined) = __narrowAny(numberValue);
      expect(typeof numberResult).assertEqual('number');
      expect(numberResult as number).assertEqual(42);

      const stringValue: string = 'hello';
      const stringResult: (object | null | undefined) = __narrowAny(stringValue);
      expect(typeof stringResult).assertEqual('string');
      expect(stringResult as string).assertEqual('hello');

      const booleanValue: boolean = true;
      const booleanResult: (object | null | undefined) = __narrowAny(booleanValue);
      expect(typeof booleanResult).assertEqual('boolean');
      expect(booleanResult as boolean).assertTrue();

      const nanResult: (object | null | undefined) = __narrowAny(NaN);
      expect(typeof nanResult).assertEqual('number');
      expect(isNaN(nanResult as number)).assertTrue();

      const infinityResult: (object | null | undefined) = __narrowAny(Infinity);
      expect(typeof infinityResult).assertEqual('number');
      expect((infinityResult as number) === Infinity).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest4500
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST4500
     * @tc.desc    Test __narrowAny with number boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxValueResult: (object | null | undefined) = __narrowAny(Number.MAX_VALUE);
      expect(typeof maxValueResult).assertEqual('number');
      expect((maxValueResult as number) === Number.MAX_VALUE).assertTrue();

      const minValueResult: (object | null | undefined) = __narrowAny(Number.MIN_VALUE);
      expect(typeof minValueResult).assertEqual('number');
      expect((minValueResult as number) === Number.MIN_VALUE).assertTrue();

      const maxSafeIntResult: (object | null | undefined) = __narrowAny(Number.MAX_SAFE_INTEGER);
      expect(typeof maxSafeIntResult).assertEqual('number');
      expect((maxSafeIntResult as number) === Number.MAX_SAFE_INTEGER).assertTrue();

      const epsilonResult: (object | null | undefined) = __narrowAny(Number.EPSILON);
      expect(typeof epsilonResult).assertEqual('number');
      expect((epsilonResult as number) === Number.EPSILON).assertTrue();

      const expResult: (object | null | undefined) = __narrowAny(2 ** 3);
      expect(typeof expResult).assertEqual('number');
      expect((expResult as number) === 8).assertTrue();

      const sciResult: (object | null | undefined) = __narrowAny(1e3);
      expect(typeof sciResult).assertEqual('number');
      expect((sciResult as number) === 1000).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest4600
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST4600
     * @tc.desc    Test __narrowAny with string types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emptyStringResult: (object | null | undefined) = __narrowAny('');
      expect(typeof emptyStringResult).assertEqual('string');
      expect((emptyStringResult as string) === '').assertTrue();

      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const specialResult: (object | null | undefined) = __narrowAny(specialChars);
      expect(typeof specialResult).assertEqual('string');
      expect((specialResult as string) === specialChars).assertTrue();

      const asciiChars: string = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      const asciiResult: (object | null | undefined) = __narrowAny(asciiChars);
      expect(typeof asciiResult).assertEqual('string');
      expect((asciiResult as string) === asciiChars).assertTrue();

      const escapeStr: string = '\n\r\t\\\'\"\?';
      const escapeResult: (object | null | undefined) = __narrowAny(escapeStr);
      expect(typeof escapeResult).assertEqual('string');
      expect((escapeResult as string) === escapeStr).assertTrue();

      const emojiResult: (object | null | undefined) = __narrowAny('👆');
      expect(typeof emojiResult).assertEqual('string');
      expect((emojiResult as string) === '👆').assertTrue();

      const zeroStringResult: (object | null | undefined) = __narrowAny('0');
      expect(typeof zeroStringResult).assertEqual('string');
      expect((zeroStringResult as string) === '0').assertTrue();

      const nanStringResult: (object | null | undefined) = __narrowAny('NaN');
      expect(typeof nanStringResult).assertEqual('string');
      expect((nanStringResult as string) === 'NaN').assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest4700
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST4700
     * @tc.desc    Test __narrowAny with array types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const normalArray: number[] = [72, 101, 108, 108, 111];
      const arrayResult: (object | null | undefined) = __narrowAny(normalArray);
      expect(Array.isArray(arrayResult)).assertTrue();
      expect((arrayResult as number[]).length).assertEqual(5);
      expect((arrayResult as number[])[0]).assertEqual(72);

      const zeroArray: number[] = [72, 101, 108, 108, 111, 0, 0, 0];
      const zeroArrayResult: (object | null | undefined) = __narrowAny(zeroArray);
      expect(Array.isArray(zeroArrayResult)).assertTrue();
      expect((zeroArrayResult as number[]).length).assertEqual(8);

      const negativeArray: number[] = [72, 101, 108, -111, 114];
      const negativeArrayResult: (object | null | undefined) = __narrowAny(negativeArray);
      expect(Array.isArray(negativeArrayResult)).assertTrue();
      expect((negativeArrayResult as number[])[3]).assertEqual(-111);

      const specialArray: number[] = [72, 101, NaN, Infinity, 108, 111];
      const specialArrayResult: (object | null | undefined) = __narrowAny(specialArray);
      expect(Array.isArray(specialArrayResult)).assertTrue();
      expect(isNaN((specialArrayResult as number[])[2])).assertTrue();
      expect((specialArrayResult as number[])[3] === Infinity).assertTrue();

      const emptyArray: number[] = [];
      const emptyArrayResult: (object | null | undefined) = __narrowAny(emptyArray);
      expect(Array.isArray(emptyArrayResult)).assertTrue();
      expect((emptyArrayResult as number[]).length).assertEqual(0);

      const typedArray: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const typedArrayResult: (object | null | undefined) = __narrowAny(typedArray);
      expect(typedArrayResult instanceof Uint8Array).assertTrue();
      expect((typedArrayResult as Uint8Array).length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsRuntimeTest4800
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST4800
     * @tc.desc    Test __narrowAny with TypedArray types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int8Array: Int8Array = new Int8Array([-128, 0, 127]);
      const int8Result: (object | null | undefined) = __narrowAny(int8Array);
      expect(int8Result instanceof Int8Array).assertTrue();
      expect((int8Result as Int8Array)[0]).assertEqual(-128);
      expect((int8Result as Int8Array)[2]).assertEqual(127);

      const uint8Array: Uint8Array = new Uint8Array([0, 128, 255]);
      const uint8Result: (object | null | undefined) = __narrowAny(uint8Array);
      expect(uint8Result instanceof Uint8Array).assertTrue();
      expect((uint8Result as Uint8Array)[0]).assertEqual(0);
      expect((uint8Result as Uint8Array)[2]).assertEqual(255);

      const clampedArray: Uint8ClampedArray = new Uint8ClampedArray([0, 128, 255, -1, 256]);
      const clampedResult: (object | null | undefined) = __narrowAny(clampedArray);
      expect(clampedResult instanceof Uint8ClampedArray).assertTrue();
      expect((clampedResult as Uint8ClampedArray)[3]).assertEqual(0);
      expect((clampedResult as Uint8ClampedArray)[4]).assertEqual(255);

      const int32Array: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      const int32Result: (object | null | undefined) = __narrowAny(int32Array);
      expect(int32Result instanceof Int32Array).assertTrue();
      expect((int32Result as Int32Array)[0]).assertEqual(-2147483648);
      expect((int32Result as Int32Array)[2]).assertEqual(2147483647);

      const float32Array: Float32Array = new Float32Array([NaN, Infinity, -Infinity, 1.5]);
      const float32Result: (object | null | undefined) = __narrowAny(float32Array);
      expect(float32Result instanceof Float32Array).assertTrue();
      expect(isNaN((float32Result as Float32Array)[0])).assertTrue();
      expect((float32Result as Float32Array)[1] === Infinity).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest4900
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST4900
     * @tc.desc    Test __narrowAny with complex object types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const bufferResult: (object | null | undefined) = __narrowAny(buffer);
      expect(bufferResult instanceof ArrayBuffer).assertTrue();
      expect((bufferResult as ArrayBuffer).byteLength).assertEqual(16);

      const dataView: DataView = new DataView(new ArrayBuffer(16));
      const dataViewResult: (object | null | undefined) = __narrowAny(dataView);
      expect(dataViewResult instanceof DataView).assertTrue();

      const date: Date = new Date('2024-01-01');
      const dateResult: (object | null | undefined) = __narrowAny(date);
      expect(dateResult instanceof Date).assertTrue();

      const regex: RegExp = new RegExp('abc', 'gi');
      const regexResult: (object | null | undefined) = __narrowAny(regex);
      expect(regexResult instanceof RegExp).assertTrue();

      const map: Map<string, string | object> = new Map<string, string | object>([
        ['key1', 'value1'],
      ]);
      const mapResult: (object | null | undefined) = __narrowAny(map);
      expect(mapResult instanceof Map).assertTrue();

      const set: Set<number> = new Set<number>([1, 2, 3, 2, 1]);
      const setResult: (object | null | undefined) = __narrowAny(set);
      expect(setResult instanceof Set).assertTrue();

      if (setResult instanceof Set) {
        expect(setResult.size).assertEqual(3);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest5000
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST5000
     * @tc.desc    Test __narrowAny with type narrowing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringValue: string = 'test';

      const narrowedString: string = __narrowAny<string>(stringValue);
      expect(typeof narrowedString).assertEqual('string');
      expect(narrowedString).assertEqual('test');

      const numberValue: number = 42;
      const narrowedNumber: number = __narrowAny<number>(numberValue);
      expect(typeof narrowedNumber).assertEqual('number');
      expect(narrowedNumber).assertEqual(42);

      const booleanValue: boolean = true;
      const narrowedBoolean: boolean = __narrowAny<boolean>(booleanValue);
      expect(typeof narrowedBoolean).assertEqual('boolean');
      expect(narrowedBoolean).assertTrue();

      const arrayValue: number[] = [1, 2, 3];
      const narrowedArray: number[] = __narrowAny<number[]>(arrayValue);
      expect(Array.isArray(narrowedArray)).assertTrue();
      expect(narrowedArray.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsRuntimeTest5100
     * @tc.number  BUILTINS_RUNTIME_NARROW_ANY_TEST5100
     * @tc.desc    Test __narrowAny with edge cases and performance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BUILTINS_RUNTIME_NARROW_ANY_TEST5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const funcValue: () => void = () => {};
      const funcResult: (object | null | undefined) = __narrowAny(funcValue);
      expect(typeof funcResult).assertEqual('function');

      const largeString: string = 'a'.repeat(1000);
      const largeStringResult: (object | null | undefined) = __narrowAny(largeString);
      expect(typeof largeStringResult).assertEqual('string');
      expect((largeStringResult as string).length).assertEqual(1000);

      const largeArray: number[] = [];
      for (let i = 0; i < 1000; i++) {
        largeArray.push(i);
      }
      const largeArrayResult: (object | null | undefined) = __narrowAny(largeArray);
      expect(Array.isArray(largeArrayResult)).assertTrue();
      expect((largeArrayResult as number[]).length).assertEqual(1000);

      const largeObj: Record<string, number> = {};
      for (let i = 0; i < 100; i++) {
        largeObj[`key${i}`] = i;
      }
      const largeObjResult: (object | null | undefined) = __narrowAny(largeObj);
      expect(typeof largeObjResult).assertEqual('object');
      expect(Object.keys(largeObjResult as Record<string, number>).length).assertEqual(6);

      const startTime: number = Date.now();
      const testValues: (object | null | undefined | number | string | boolean)[] = [null, undefined, 0, 'test', true, {}];

      for (let i = 0; i < 1000; i++) {
        for (let j = 0; j < testValues.length; j++) {
          const value = testValues[j];
          const result: (object | null | undefined) = __narrowAny(value);
          expect(result !== undefined || result === undefined).assertTrue();
        }
      }

      const endTime: number = Date.now();
      const elapsedTime: number = endTime - startTime;
      expect(elapsedTime < 1000).assertFalse();
    });

  })
}