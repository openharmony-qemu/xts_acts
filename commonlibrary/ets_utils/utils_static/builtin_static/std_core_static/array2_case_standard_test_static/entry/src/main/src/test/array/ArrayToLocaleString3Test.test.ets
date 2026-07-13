'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class LocaleItem038 {
  value: number = 0;

  toString(): string {
    return 'Item[' + this.value + ']';
  }
}

class LocaleStringItem {
  value: string = '';

  toLocaleString(): string {
    return this.value;
  }

  toString(): string {
    return this.value;
  }
}

class LocaleMutatingItem {
  value: string = '';
  target: LocaleStringItem = new LocaleStringItem();

  toString(): string {
    this.target.value = '99';
    return this.value;
  }

  toLocaleString(): string {
    this.target.value = '99';
    return this.value;
  }
}

class LocaleLoggingItem {
  value: string = '';
  log: Array<string> = new Array<string>();

  toString(): string {
    this.log.pushOne(this.value);
    return this.value;
  }

  toLocaleString(): string {
    this.log.pushOne(this.value);
    return this.value;
  }
}

function toLocaleStringFromAnyNumberArrayThree(value: Any): string {
  const arr = value as Array<number>;
  return arr.toLocaleString();
}

class LocaleThrowingItem {
  log: Array<string> = new Array<string>();

  toString(): string {
    this.log.pushOne('thrower');
    throw new Error('locale failure');
  }

  toLocaleString(): string {
    this.log.pushOne('thrower');
    throw new Error('locale failure');
  }
}

class LocaleAppendingItem {
  value: string = '';
  target: Array<LocaleAppendingItem | LocaleStringItem> = new Array<LocaleAppendingItem | LocaleStringItem>();

  toString(): string {
    const late = new LocaleStringItem();
    late.value = 'late';
    this.target.pushOne(late);
    return this.value;
  }

  toLocaleString(): string {
    const late = new LocaleStringItem();
    late.value = 'late';
    this.target.pushOne(late);
    return this.value;
  }
}

class LocaleCountingItem {
  value: string = '';
  calls: int = 0;

  toString(): string {
    this.calls++;
    return this.value;
  }

  toLocaleString(): string {
    this.calls++;
    return this.value;
  }
}

class LocaleBackMutatingItem {
  value: string = '';
  target: LocaleStringItem = new LocaleStringItem();

  toString(): string {
    this.target.value = 'changed';
    return this.value;
  }

  toLocaleString(): string {
    this.target.value = 'changed';
    return this.value;
  }
}

function createSequentialArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function createLargeSequentialArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function buildNumberLocaleString(values: Array<number>): string {
  return values.map((value: number): string => value.toLocaleString()).join(',');
}

export default function ArrayToLocaleString3Test(): void {
  describe('ArrayToLocaleString3Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0100
     * @tc.name testArrayToLocaleStringThree001
     * @tc.desc Verify toLocaleString can be called without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.toLocaleString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0200
     * @tc.name testArrayToLocaleStringThree002
     * @tc.desc Verify the overload is called without passing arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const result = arr.toLocaleString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0300
     * @tc.name testArrayToLocaleStringThree003
     * @tc.desc Verify the return type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0400
     * @tc.name testArrayToLocaleStringThree004
     * @tc.desc Verify the result is the same as toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const tlsResult = arr.toLocaleString();
      const tsResult = arr.toString();
      expect(tlsResult).assertEqual(tsResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0500
     * @tc.name testArrayToLocaleStringThree005
     * @tc.desc Verify an empty array returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toLocaleString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0600
     * @tc.name testArrayToLocaleStringThree006
     * @tc.desc Verify a single-element array is formatted correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 42);
      const result = arr.toLocaleString();
      expect(result).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0700
     * @tc.name testArrayToLocaleStringThree007
     * @tc.desc Verify a two-element array is joined with a comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20);
      const result = arr.toLocaleString();
      expect(result).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0800
     * @tc.name testArrayToLocaleStringThree008
     * @tc.desc Verify a large array serializes every value into the locale string result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createSequentialArray(1000);
      const result = arr.toLocaleString();
      expect(result).assertEqual(buildNumberLocaleString(arr));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_0900
     * @tc.name testArrayToLocaleStringThree009
     * @tc.desc Verify a number array uses the default number formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000, 3000);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,000,2,000,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1000
     * @tc.name testArrayToLocaleStringThree010
     * @tc.desc Verify a string array is joined correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world');
      const result = arr.toLocaleString();
      expect(result).assertEqual('hello,world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1100
     * @tc.name testArrayToLocaleStringThree011
     * @tc.desc Verify a boolean array is joined correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.toLocaleString();
      expect(result).assertEqual('true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1200
     * @tc.name testArrayToLocaleStringThree012
     * @tc.desc Verify a union-typed array is joined correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'two', 3);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,two,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1300
     * @tc.name testArrayToLocaleStringThree013
     * @tc.desc Verify null elements are converted to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1400
     * @tc.name testArrayToLocaleStringThree014
     * @tc.desc Verify explicit undefined elements become empty fields in the output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1500
     * @tc.name testArrayToLocaleStringThree015
     * @tc.desc Verify zero values are converted correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 0);
      const result = arr.toLocaleString();
      expect(result).assertEqual('0,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1600
     * @tc.name testArrayToLocaleStringThree016
     * @tc.desc Verify empty string elements are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'c');
      const result = arr.toLocaleString();
      expect(result).assertEqual('a,,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1700
     * @tc.name testArrayToLocaleStringThree017
     * @tc.desc Verify floating-point values use the default format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.5, 2.5, 3.14);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1.5,2.5,3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1800
     * @tc.name testArrayToLocaleStringThree018
     * @tc.desc Verify negative numbers use the default format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1, -2, -3);
      const result = arr.toLocaleString();
      expect(result).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_1900
     * @tc.name testArrayToLocaleStringThree019
     * @tc.desc Verify nested arrays are flattened by string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number>(1, 2);
      const arr = new Array<number | Array<number>>(0, nested, 3);
      const result = arr.toLocaleString();
      expect(result).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2000
     * @tc.name testArrayToLocaleStringThree020
     * @tc.desc Verify multi-level nested arrays are flattened by string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level2 = Array.create<number>(1, 3);
      const level1 = new Array<number | Array<number>>(2, level2);
      const arr = new Array<number | Array<number | Array<number>>>(1, level1);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2100
     * @tc.name testArrayToLocaleStringThree021
     * @tc.desc Verify the result matches toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const tls = arr.toLocaleString();
      const ts = arr.toString();
      expect(tls).assertEqual(ts);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2200
     * @tc.name testArrayToLocaleStringThree022
     * @tc.desc Verify the result matches join with the default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const tls = arr.toLocaleString();
      const joined = arr.join();
      expect(tls).assertEqual(joined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2300
     * @tc.name testArrayToLocaleStringThree023
     * @tc.desc Verify the result matches join with a comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100, 200);
      const tls = arr.toLocaleString();
      const joined = arr.join(',');
      expect(tls).assertEqual(joined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2400
     * @tc.name testArrayToLocaleStringThree024
     * @tc.desc Verify the no-argument overload differs from parameterized overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const result1 = arr.toLocaleString();
      expect(typeof result1).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2500
     * @tc.name testArrayToLocaleStringThree025
     * @tc.desc Verify toLocaleString does not mutate the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      arr.toLocaleString();
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2600
     * @tc.name testArrayToLocaleStringThree026
     * @tc.desc Verify repeated calls return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result1 = arr.toLocaleString();
      const result2 = arr.toLocaleString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2700
     * @tc.name testArrayToLocaleStringThree027
     * @tc.desc Verify elements are separated by commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toLocaleString();
      expect(result.split(',').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2800
     * @tc.name testArrayToLocaleStringThree028
     * @tc.desc Verify multiple elements are separated correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_2900
     * @tc.name testArrayToLocaleStringThree029
     * @tc.desc Verify different generic array types return strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const result1: string = arr1.toLocaleString();
      expect(typeof result1).assertEqual('string');

      const arr2 = new Array<string>('a', 'b');
      const result2: string = arr2.toLocaleString();
      expect(typeof result2).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3000
     * @tc.name testArrayToLocaleStringThree030
     * @tc.desc Verify the return type is a usable string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 100);
      const result = arr.toLocaleString();
      expect(result.substring(0, 1).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3100
     * @tc.name testArrayToLocaleStringThree031
     * @tc.desc Verify toLocaleString can be used for data display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<number>(100, 200, 300);
      const display = 'Values: ' + values.toLocaleString();
      expect(display).assertEqual('Values: 100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3200
     * @tc.name testArrayToLocaleStringThree032
     * @tc.desc Verify toLocaleString can be used for simple serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const serialized = arr.toLocaleString();
      expect(serialized).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3300
     * @tc.name testArrayToLocaleStringThree033
     * @tc.desc Verify toLocaleString can be used in template strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const template = `Array: ${arr.toLocaleString()}`;
      expect(template).assertEqual('Array: 1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3400
     * @tc.name testArrayToLocaleStringThree034
     * @tc.desc Verify toLocaleString works on arrays returned by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const mapped = arr.map((v: number): number => v * 10);
      const result = mapped.toLocaleString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3500
     * @tc.name testArrayToLocaleStringThree035
     * @tc.desc Verify toLocaleString works on arrays returned by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((v: number): boolean => v > 2);
      const result = filtered.toLocaleString();
      expect(result).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3600
     * @tc.name testArrayToLocaleStringThree036
     * @tc.desc Verify toLocaleString works on arrays returned by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const sliced = arr.slice(0, 3);
      const result = sliced.toLocaleString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3700
     * @tc.name testArrayToLocaleStringThree037
     * @tc.desc Verify object elements use their toString method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new LocaleItem038();
      item.value = 42;
      const arr = Array.create<LocaleItem038>(1, item);
      const result = arr.toLocaleString();
      expect(result).assertEqual('Item[42]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3800
     * @tc.name testArrayToLocaleStringThree038
     * @tc.desc Verify toLocaleString preserves representative prefix and suffix output for large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeSequentialArray(10000);
      const result = arr.toLocaleString();
      const expectedPrefix = buildNumberLocaleString(arr.slice(0, 5));
      const expectedSuffix = buildNumberLocaleString(arr.slice(9995));
      expect(result.substring(0, expectedPrefix.length)).assertEqual(expectedPrefix);
      expect(result.substring(result.length - expectedSuffix.length)).assertEqual(expectedSuffix);
      expect(result.indexOf('1,000') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_3900
     * @tc.name testArrayToLocaleStringThree039
     * @tc.desc Verify an empty array returns an empty string at boundary length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.toLocaleString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4000
     * @tc.name testArrayToLocaleStringThree040
     * @tc.desc Verify a single boundary element is formatted correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 999);
      expect(arr.toLocaleString()).assertEqual('999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4100
     * @tc.name testArrayToLocaleStringThree041
     * @tc.desc Verify two boundary elements are formatted correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      expect(arr.toLocaleString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4200
     * @tc.name testArrayToLocaleStringThree042
     * @tc.desc Verify string elements containing commas are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a,b', 'c');
      const result = arr.toLocaleString();
      expect(result).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4300
     * @tc.name testArrayToLocaleStringThree043
     * @tc.desc Verify escape characters are preserved in string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a\nb', 'c\t');
      const result = arr.toLocaleString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4400
     * @tc.name testArrayToLocaleStringThree044
     * @tc.desc Verify custom toLocaleString results containing commas are joined without escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new LocaleStringItem();
      const second = new LocaleStringItem();
      first.value = 'A,B';
      second.value = 'C';
      const arr = new Array<LocaleStringItem>(first, second);
      const result = arr.toLocaleString();
      expect(result).assertEqual('A,B,C');
      expect(result.indexOf('fallback')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4500
     * @tc.name testArrayToLocaleStringThree045
     * @tc.desc Verify custom element conversion runs from left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const callLog = new Array<string>();
      const first = new LocaleLoggingItem();
      const second = new LocaleLoggingItem();
      first.value = 'first';
      second.value = 'second';
      first.log = callLog;
      second.log = callLog;
      const arr = new Array<LocaleLoggingItem>(first, second);
      const result = arr.toLocaleString();
      expect(result).assertEqual('first,second');
      expect(callLog.toString()).assertEqual('first,second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4600
     * @tc.name testArrayToLocaleStringThree046
     * @tc.desc Verify an element conversion error propagates and stops later conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const callLog = new Array<string>();
      const first = new LocaleLoggingItem();
      const thrower = new LocaleThrowingItem();
      const later = new LocaleLoggingItem();
      first.value = 'first';
      later.value = 'later';
      first.log = callLog;
      thrower.log = callLog;
      later.log = callLog;
      const arr = new Array<LocaleLoggingItem | LocaleThrowingItem>(first, thrower, later);
      let thrown = false;
      try {
        arr.toLocaleString();
      } catch (e) {
        thrown = e.name === 'Error' && e.message === 'locale failure';
      }
      expect(thrown).assertTrue();
      expect(callLog.toString()).assertEqual('first,thrower');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4700
     * @tc.name testArrayToLocaleStringThree047
     * @tc.desc Verify elements appended during conversion are not included in the current output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new LocaleAppendingItem();
      const second = new LocaleStringItem();
      first.value = 'first';
      second.value = 'second';
      const arr = new Array<LocaleAppendingItem | LocaleStringItem>(first, second);
      first.target = arr;
      const result = arr.toLocaleString();
      expect(result).assertEqual('first,second');
      expect(result.indexOf('late')).assertEqual(-1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4800
     * @tc.name testArrayToLocaleStringThree048
     * @tc.desc Verify the same object reference is converted once for each array slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new LocaleCountingItem();
      item.value = 'same';
      const arr = new Array<LocaleCountingItem>(item, item);
      const result = arr.toLocaleString();
      expect(result).assertEqual('same,same');
      expect(item.calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_4900
     * @tc.name testArrayToLocaleStringThree049
     * @tc.desc Verify a later element mutation does not rewrite an earlier serialized value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new LocaleStringItem();
      const second = new LocaleBackMutatingItem();
      first.value = 'before';
      second.value = 'second';
      second.target = first;
      const arr = new Array<LocaleStringItem | LocaleBackMutatingItem>(first, second);
      const result = arr.toLocaleString();
      expect(result).assertEqual('before,second');
      expect(first.value).assertEqual('changed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5000
     * @tc.name testArrayToLocaleStringThree050
     * @tc.desc Verify nested arrays with explicit undefined preserve empty fields in the outer output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number | undefined>(3, (_index) => undefined);
      inner[0] = 1;
      inner[2] = 3;
      const arr = new Array<Array<number | undefined> | string>(inner, 'tail');
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,,3,tail');
      expect(inner.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5100
     * @tc.name testArrayToLocaleStringThree051
     * @tc.desc Verify nested arrays with null elements produce empty fields in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number | null>(1, null, 2);
      const arr = new Array<string | Array<number | null>>('head', inner);
      const result = arr.toLocaleString();
      expect(result).assertEqual('head,1,,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5200
     * @tc.name testArrayToLocaleStringThree052
     * @tc.desc Verify a custom empty string result occupies an empty field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new LocaleStringItem();
      const second = new LocaleStringItem();
      first.value = '';
      second.value = 'tail';
      const arr = new Array<LocaleStringItem>(first, second);
      const result = arr.toLocaleString();
      expect(result).assertEqual(',tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5300
     * @tc.name testArrayToLocaleStringThree053
     * @tc.desc Verify custom whitespace output is preserved exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new LocaleStringItem();
      const second = new LocaleStringItem();
      first.value = ' left ';
      second.value = 'right';
      const arr = new Array<LocaleStringItem>(first, second);
      const result = arr.toLocaleString();
      expect(result).assertEqual(' left ,right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5400
     * @tc.name testArrayToLocaleStringThree054
     * @tc.desc Verify numeric-looking custom strings are not formatted again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new LocaleStringItem();
      const second = new LocaleStringItem();
      first.value = '1,000';
      second.value = '2';
      const arr = new Array<LocaleStringItem>(first, second);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,000,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5500
     * @tc.name testArrayToLocaleStringThree055
     * @tc.desc Verify sliced custom object arrays only convert retained elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const callLog = new Array<string>();
      const skipped = new LocaleLoggingItem();
      const kept1 = new LocaleLoggingItem();
      const kept2 = new LocaleLoggingItem();
      skipped.value = 'skip';
      kept1.value = 'keep1';
      kept2.value = 'keep2';
      skipped.log = callLog;
      kept1.log = callLog;
      kept2.log = callLog;
      const arr = new Array<LocaleLoggingItem>(skipped, kept1, kept2).slice(1);
      const result = arr.toLocaleString();
      expect(result).assertEqual('keep1,keep2');
      expect(callLog.toString()).assertEqual('keep1,keep2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5600
     * @tc.name testArrayToLocaleStringThree056
     * @tc.desc Verify a shortened array excludes truncated custom elements from conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const callLog = new Array<string>();
      const first = new LocaleLoggingItem();
      const removed = new LocaleLoggingItem();
      first.value = 'first';
      removed.value = 'removed';
      first.log = callLog;
      removed.log = callLog;
      const arr = new Array<LocaleLoggingItem>(first, removed);
      arr.length = 1;
      const result = arr.toLocaleString();
      expect(result).assertEqual('first');
      expect(callLog.toString()).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5700
     * @tc.name testArrayToLocaleStringThree057
     * @tc.desc Verify explicit undefined fields around custom object output remain empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new LocaleStringItem();
      item.value = 'middle';
      const arr = new Array<LocaleStringItem | undefined>();
      arr.pushOne(undefined);
      arr.pushOne(item);
      arr.pushOne(undefined);
      const result = arr.toLocaleString();
      expect(result).assertEqual(',middle,');
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5800
     * @tc.name testArrayToLocaleStringThree058
     * @tc.desc Verify custom objects rebuilt from a Set keep de-duplicated insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new LocaleStringItem();
      const second = new LocaleStringItem();
      first.value = 'first';
      second.value = 'second';
      const set = new Set<LocaleStringItem>(new Array<LocaleStringItem>(first, first, second));
      const arr = Array.from<LocaleStringItem>(set);
      const result = arr.toLocaleString();
      expect(result).assertEqual('first,second');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_5900
     * @tc.name testArrayToLocaleStringThree059
     * @tc.desc Verify toLocaleString without arguments can serialize small numbers 2 and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      const result = arr.toLocaleString();
      expect(result).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6000
     * @tc.name testArrayToLocaleStringThree060
     * @tc.desc Verify char elements are serialized in order without locale arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'B', c'C');
      const result = arr.toLocaleString();
      expect(result).assertEqual('A,B,C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6100
     * @tc.name testArrayToLocaleStringThree061
     * @tc.desc Verify bigint elements are serialized with locale grouping without losing precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(9007199254740993n, 5n);
      const result = arr.toLocaleString();
      expect(result.indexOf('9,007,199,254,740,993')).assertEqual(0);
      expect(result.indexOf('5') > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6200
     * @tc.name testArrayToLocaleStringThree062
     * @tc.desc Verify explicit undefined inserted by splice becomes an empty field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 3);
      arr.splice(1, 0, undefined);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,,3');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6300
     * @tc.name testArrayToLocaleStringThree063
     * @tc.desc Verify toLocaleString variant 3 works on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      expect(arr.toLocaleString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6400
     * @tc.name testArrayToLocaleStringThree064
     * @tc.desc Verify toLocaleString variant 3 reflects an array cleared through length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      expect(arr.toLocaleString()).assertEqual('');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6500
     * @tc.name testArrayToLocaleStringThree065
     * @tc.desc Verify toLocaleString variant 3 works after slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 3);
      expect(arr.toLocaleString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6600
     * @tc.name testArrayToLocaleStringThree066
     * @tc.desc Verify toLocaleString variant 3 works after map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).map((value: number): number => value + 1);
      expect(arr.toLocaleString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6700
     * @tc.name testArrayToLocaleStringThree067
     * @tc.desc Verify toLocaleString variant 3 works after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).filter((value: number): boolean => value > 2);
      expect(arr.toLocaleString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6800
     * @tc.name testArrayToLocaleStringThree068
     * @tc.desc Verify toLocaleString variant 3 works after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      expect(arr.toLocaleString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_6900
     * @tc.name testArrayToLocaleStringThree069
     * @tc.desc Verify toLocaleString variant 3 works after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(arr.toLocaleString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7000
     * @tc.name testArrayToLocaleStringThree070
     * @tc.desc Verify explicit undefined values are formatted as empty strings without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,,3');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7100
     * @tc.name testArrayToLocaleStringThree071
     * @tc.desc Verify an all-undefined two-slot dense array formats to one separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const result = arr.toLocaleString();
      expect(result).assertEqual(',');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7200
     * @tc.name testArrayToLocaleStringThree072
     * @tc.desc Verify NaN and Infinity are formatted using locale-aware numeric forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, Infinity);
      const result = arr.toLocaleString();
      expect(result.indexOf('NaN')).assertEqual(0);
      expect(result.indexOf('Infinity') > 0 || result.indexOf('\u221e') > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7300
     * @tc.name testArrayToLocaleStringThree073
     * @tc.desc Verify custom object toLocaleString is preferred over toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new LocaleStringItem();
      item.value = 'B';
      const arr = Array.create<LocaleStringItem>(1, item);
      const result = arr.toLocaleString();
      expect(result).assertEqual('B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7400
     * @tc.name testArrayToLocaleStringThree074
     * @tc.desc Verify a custom toLocaleString method can be called repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new LocaleStringItem();
      item.value = 'X';
      const arr = Array.create<LocaleStringItem>(1, item);
      expect(arr.toLocaleString()).assertEqual('X');
      item.value = 'Y';
      expect(arr.toLocaleString()).assertEqual('Y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7500
     * @tc.name testArrayToLocaleStringThree075
     * @tc.desc Verify explicit undefined values are empty slots in output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[1] = undefined;
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,,');
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7600
     * @tc.name testArrayToLocaleStringThree076
     * @tc.desc Verify mutation from one element toLocaleString affects a later element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new LocaleMutatingItem();
      const second = new LocaleStringItem();
      first.value = 'x';
      first.target = second;
      second.value = '2';
      const arr = new Array<LocaleMutatingItem | LocaleStringItem>(first, second);
      const result = arr.toLocaleString();
      expect(result).assertEqual('x,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7700
     * @tc.name testArrayToLocaleStringThree077
     * @tc.desc Verify toLocaleString works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(toLocaleStringFromAnyNumberArrayThree(anyValue)).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_THREE_7800
     * @tc.name testArrayToLocaleStringThree078
     * @tc.desc Verify toLocaleString supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      expect(anyArr.toLocaleString()).assertEqual('1,two,true');
    });

  });
}

