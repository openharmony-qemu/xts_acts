'use static'
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
} from '../../../../hypium/index';
import Utils from '../Util.test';

class PlainObject010 {
  key: string = 'value';
}

class ArrayLike019 {
  first: string = 'a';
  second: string = 'b';
  length: int = 2;
}

class ArgumentsLike020 {
  first: int = 1;
  second: int = 2;
  third: int = 3;
  length: int = 3;
}

class IndexedObject021 {
  first: int = 1;
  second: int = 2;
  third: int = 3;
  length: int = 3;
}

class LengthOnly022 {
  length: int = 2;
}

class Box022 {
  value: number = 0;
}

class DerivedArray022 extends Array<number> {
  constructor() {
    super();
  }
}

class IsArraySideEffectBox {
  toStringCalls: int = 0;

  toString(): string {
    this.toStringCalls++;
    return 'side-effect-box';
  }
}

function sumArray(value: Array<number> | string): number {
  if (!Array.isArray(value)) {
    return -1;
  }
  let numbers = value as Array<number>;
  let total: number = 0;
  for (let i: int = 0; i < numbers.length; i++) {
    total += numbers[i];
  }
  return total;
}

function getLengthGeneric<T>(value: Array<T> | string): number {
  if (Array.isArray(value)) {
    return value.length;
  }
  return -value.length;
}

function processArrayOrString(input: Array<number> | string): number {
  if (Array.isArray(input)) {
    return input.length;
  }
  return -input.length;
}

function isNonEmptyArray(value: Array<number> | string): boolean {
  return value.length > 0;
}

function joinAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  return arr.toString();
}

export default function ArrayIsArrayTest(): void {
  describe('ArrayIsArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0010
     * @tc.name testArrayIsArray001
     * @tc.desc Verify isArray accepts a single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0020
     * @tc.name testArrayIsArray002
     * @tc.desc Verify explicit undefined input returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: undefined = undefined;
      let result = Array.isArray(input);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0030
     * @tc.name testArrayIsArray003
     * @tc.desc Verify array literals return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberArr = new Array<number>(1, 2, 3);
      let stringArr = new Array<string>('a', 'b', 'c');
      let result1 = Array.isArray(numberArr);
      let result2 = Array.isArray(stringArr);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0040
     * @tc.name testArrayIsArray004
     * @tc.desc Verify empty arrays return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArr = new Array<number>();
      let result = Array.isArray(emptyArr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0050
     * @tc.name testArrayIsArray005
     * @tc.desc Verify numbers return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Array.isArray(123);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0060
     * @tc.name testArrayIsArray006
     * @tc.desc Verify strings return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Array.isArray('hello');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0070
     * @tc.name testArrayIsArray007
     * @tc.desc Verify booleans return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = Array.isArray(true);
      let result2 = Array.isArray(false);
      expect(result1).assertFalse();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0080
     * @tc.name testArrayIsArray008
     * @tc.desc Verify null returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Array.isArray(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0090
     * @tc.name testArrayIsArray009
     * @tc.desc Verify undefined returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Array.isArray(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0100
     * @tc.name testArrayIsArray010
     * @tc.desc Verify plain objects return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plainObject = new PlainObject010();
      let result = Array.isArray(plainObject);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0110
     * @tc.name testArrayIsArray011
     * @tc.desc Verify functions return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = (): void => {
      };
      let result = Array.isArray(fn);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0120
     * @tc.name testArrayIsArray012
     * @tc.desc Verify bigint values return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Array.isArray(123n);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0130
     * @tc.name testArrayIsArray013
     * @tc.desc Verify ordinary string values return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uniqueValue = 'symbol_like_value';
      let result = Array.isArray(uniqueValue);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0140
     * @tc.name testArrayIsArray014
     * @tc.desc Verify the return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sample = new Array<number>(1, 2, 3);
      let result = Array.isArray(sample);
      expect(typeof result).assertEqual('boolean');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0150
     * @tc.name testArrayIsArray015
     * @tc.desc Verify arrays containing null elements return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>(null, 1, null);
      let result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0160
     * @tc.name testArrayIsArray016
     * @tc.desc Verify arrays containing undefined elements return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(undefined, 1, undefined);
      let result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0170
     * @tc.name testArrayIsArray017
     * @tc.desc Verify mixed type arrays return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string | boolean>(1, 'string', true);
      let result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0180
     * @tc.name testArrayIsArray018
     * @tc.desc Verify multidimensional arrays return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new Array<number>(1, 2);
      let second = new Array<number>(3, 4);
      let matrix = new Array<Array<number>>(first, second);
      let result = Array.isArray(matrix);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0190
     * @tc.name testArrayIsArray019
     * @tc.desc Verify array like objects return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new ArrayLike019();
      let result = Array.isArray(arrayLike);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0200
     * @tc.name testArrayIsArray020
     * @tc.desc Verify arguments like objects return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let argumentsLike = new ArgumentsLike020();
      let result = Array.isArray(argumentsLike);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0210
     * @tc.name testArrayIsArray021
     * @tc.desc Verify indexed non-array objects return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let indexedObject = new IndexedObject021();
      let result = Array.isArray(indexedObject);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0220
     * @tc.name testArrayIsArray022
     * @tc.desc Verify Array subclass instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myArr = new DerivedArray022();
      myArr.pushOne(1);
      myArr.pushOne(2);
      myArr.pushOne(3);
      let result = Array.isArray(myArr);
      expect(result).assertTrue();
      expect(myArr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0230
     * @tc.name testArrayIsArray023
     * @tc.desc Verify Array.isArray returns true for nested child arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested = new Array<Array<number>>(
        new Array<number>(1, 2),
        new Array<number>(3, 4)
      );
      let result = Array.isArray(nested[1]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0240
     * @tc.name testArrayIsArray024
     * @tc.desc Verify Array.isArray returns true for arrays produced by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.from<number>(new Array<number>(1, 2, 3));
      let result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0250
     * @tc.name testArrayIsArray025
     * @tc.desc Verify isArray can be used as a type guard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayValue: Array<number> | string = new Array<number>(1, 2, 3);
      let stringValue: Array<number> | string = 'hello';
      expect(processArrayOrString(arrayValue)).assertEqual(3);
      expect(processArrayOrString(stringValue)).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0260
     * @tc.name testArrayIsArray026
     * @tc.desc Verify array values can be indexed safely inside the guarded block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Array<number> | string = new Array<number>(10, 20);
      let first: number = 0;
      if (Array.isArray(value)) {
        let arrayValue = value as Array<number>;
        first = arrayValue[0];
      }
      expect(first).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0270
     * @tc.name testArrayIsArray027
     * @tc.desc Verify isArray distinguishes arrays from other union members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = new Array<Array<number> | string>(
        new Array<number>(1, 2),
        'text',
        new Array<number>(3, 4, 5)
      );
      let arraySlotCount = 0;
      let stringSlotCount = 0;
      for (let i: int = 0; i < values.length; i++) {
        let value = values[i];
        if (Array.isArray(value)) {
          let arrayValue = value as Array<number>;
          arraySlotCount += arrayValue.length;
        } else {
          stringSlotCount += value.length;
        }
      }
      expect(arraySlotCount).assertEqual(5);
      expect(stringSlotCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0280
     * @tc.name testArrayIsArray028
     * @tc.desc Verify isArray is more reliable than simple instanceof checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0290
     * @tc.name testArrayIsArray029
     * @tc.desc Verify Array.isArray still returns true after an array created from Array.from is mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.from<number>(new Array<number>(1, 2, 3));
      arr.pop();
      let result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0300
     * @tc.name testArrayIsArray030
     * @tc.desc Verify null and undefined both return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Array.isArray(null)).assertFalse();
      expect(Array.isArray(undefined)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0310
     * @tc.name testArrayIsArray031
     * @tc.desc Verify arrays created by the constructor return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>();
      let arr2 = Array.create<number>(1, 10);
      let arr3 = new Array<number>(1, 2, 3);
      expect(Array.isArray(arr1)).assertTrue();
      expect(Array.isArray(arr2)).assertTrue();
      expect(Array.isArray(arr3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0320
     * @tc.name testArrayIsArray032
     * @tc.desc Verify destructured variables are not arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let first = arr[0];
      let second = arr[1];
      expect(Array.isArray(first)).assertFalse();
      expect(Array.isArray(second)).assertFalse();
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0330
     * @tc.name testArrayIsArray033
     * @tc.desc Verify repeated isArray checks behave like constant time operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let count = 0;
      for (let i: int = 0; i < 10000; i++) {
        if (Array.isArray(arr)) {
          count++;
        }
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0340
     * @tc.name testArrayIsArray034
     * @tc.desc Verify typeof arrays returns object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(typeof arr).assertEqual('object');
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0350
     * @tc.name testArrayIsArray035
     * @tc.desc Verify special numeric values are not recognized as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Array.isArray(Double.NaN)).assertFalse();
      expect(Array.isArray(Double.POSITIVE_INFINITY)).assertFalse();
      expect(Array.isArray(-Double.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0360
     * @tc.name testArrayIsArray036
     * @tc.desc Verify function parameters can be validated with isArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numbers: Array<number> | string = new Array<number>(1, 2, 3);
      let text: Array<number> | string = '1,2,3';
      expect(sumArray(numbers)).assertEqual(6);
      expect(sumArray(text)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0370
     * @tc.name testArrayIsArray037
     * @tc.desc Verify arrays stored in nullable union variables can be validated as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parsed: Array<number> | null = new Array<number>(1, 2, 3);
      let result = Array.isArray(parsed);
      expect(result).assertTrue();
      if (Array.isArray(parsed)) {
        let data = parsed as Array<number>;
        expect(data.length).assertEqual(3);
        expect(data[0]).assertEqual(1);
        expect(data[2]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0380
     * @tc.name testArrayIsArray038
     * @tc.desc Verify arrays can be validated inside generic functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getLengthGeneric<number>(new Array<number>(1, 2, 3))).assertEqual(3);
      expect(getLengthGeneric<number>('hello')).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0390
     * @tc.name testArrayIsArray039
     * @tc.desc Verify Array.isArray distinguishes arrays from plain objects without prototype reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let plain = new PlainObject010();
      let arrayResult = Array.isArray(arr);
      let plainResult = Array.isArray(plain);
      expect(arrayResult).assertTrue();
      expect(plainResult).assertFalse();
      expect(typeof plain).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0400
     * @tc.name testArrayIsArray040
     * @tc.desc Verify zero length arrays created with the constructor return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 0);
      expect(arr.length).assertEqual(1);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0410
     * @tc.name testArrayIsArray041
     * @tc.desc Verify large arrays return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 10000);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0420
     * @tc.name testArrayIsArray042
     * @tc.desc Verify sparse arrays return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[1] = 2;
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr.indexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0430
     * @tc.name testArrayIsArray043
     * @tc.desc Verify non empty array checks require an additional length condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Array.isArray(new Array<number>())).assertTrue();
      expect(isNonEmptyArray(new Array<number>())).assertFalse();
      expect(isNonEmptyArray(Array.create<number>(1, 1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0440
     * @tc.name testArrayIsArray044
     * @tc.desc Verify ReadonlyArray values also return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyArray<number> = [1, 2, 3];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0450
     * @tc.name testArrayIsArray045
     * @tc.desc Verify FixedArray values are not reported as resizable arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      expect(Array.isArray(source)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0460
     * @tc.name testArrayIsArray046
     * @tc.desc Verify Array.isArray stays true for arrays expanded with explicit undefined slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2);
      arr.extendTo(5, undefined);
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(5);
      expect(arr.lastIndexOf(undefined)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0470
     * @tc.name testArrayIsArray047
     * @tc.desc Verify Array.isArray stays true after copyWithin reorders existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.copyWithin(1, 2, 4);
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.toString()).assertEqual('1,3,4,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0480
     * @tc.name testArrayIsArray048
     * @tc.desc Verify Array.isArray stays true after fill replaces a range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(9, 1, 3);
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.toString()).assertEqual('1,9,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0490
     * @tc.name testArrayIsArray049
     * @tc.desc Verify Array.isArray does not invoke custom toString on non-array objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new IsArraySideEffectBox();
      expect(Array.isArray(box)).assertFalse();
      expect(box.toStringCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0500
     * @tc.name testArrayIsArray050
     * @tc.desc Verify Promise objects are not reported as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise = Promise.resolve(1);
      expect(Array.isArray(promise)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0510
     * @tc.name testArrayIsArray051
     * @tc.desc Verify Error objects are not reported as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Error('array-check');
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0520
     * @tc.name testArrayIsArray052
     * @tc.desc Verify Date objects are not reported as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Date();
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0530
     * @tc.name testArrayIsArray053
     * @tc.desc Verify RegExp objects are not reported as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new RegExp('array');
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0540
     * @tc.name testArrayIsArray054
     * @tc.desc Verify entries iterators are not reported as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iterator = new Array<number>(1, 2).entries();
      expect(Array.isArray(iterator)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0550
     * @tc.name testArrayIsArray055
     * @tc.desc Verify keys iterators are not reported as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iterator = new Array<string>('a', 'b').keys();
      expect(Array.isArray(iterator)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0560
     * @tc.name testArrayIsArray056
     * @tc.desc Verify arrays rebuilt while consuming iterator entries are reported as arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries = new Array<string>('a', 'b').entries();
      const rebuilt = new Array<string>();
      for (const entry of entries) {
        rebuilt.pushOne(entry[1]);
      }
      expect(Array.isArray(rebuilt)).assertTrue();
      expect(rebuilt.length).assertEqual(2);
      expect(rebuilt.toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0570
     * @tc.name testArrayIsArray057
     * @tc.desc Verify Array.isArray remains true after duplicate removal through Set conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Set<number>(new Array<number>(1, 1, 2, 3)));
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0580
     * @tc.name testArrayIsArray058
     * @tc.desc Verify Array.isArray remains true for readonly arrays after reading through a helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ['left', 'right'];
      expect(Array.isArray(arr)).assertTrue();
      expect(arr[0]).assertEqual('left');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0590
     * @tc.name testArrayIsArray059
     * @tc.desc Verify a nullable union value keeps the array brand after narrowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Array<number> | null = new Array<number>(8, 13);
      expect(Array.isArray(value)).assertTrue();
      if (Array.isArray(value)) {
        const arr = value as Array<number>;
        expect(arr.toString()).assertEqual('8,13');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0600
     * @tc.name testArrayIsArray060
     * @tc.desc Verify Array.isArray returns true for a filtered numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).filter((value: number): boolean => value % 2 === 0);
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.toString()).assertEqual('2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0610
     * @tc.name testArrayIsArray061
     * @tc.desc Verify Array.isArray returns true for a constructor-created number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0620
     * @tc.name testArrayIsArray062
     * @tc.desc Verify Array.isArray returns true for a constructor-created string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0630
     * @tc.name testArrayIsArray063
     * @tc.desc Verify Array.isArray returns true for a constructor-created boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0640
     * @tc.name testArrayIsArray064
     * @tc.desc Verify Array.isArray returns true for arrays returned by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).slice(1);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0650
     * @tc.name testArrayIsArray065
     * @tc.desc Verify Array.isArray returns true for arrays returned by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).map((value: number): number => value * 2);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0660
     * @tc.name testArrayIsArray066
     * @tc.desc Verify Array.isArray returns true for arrays returned by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).filter((value: number): boolean => value % 2 === 0);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0670
     * @tc.name testArrayIsArray067
     * @tc.desc Verify Array.isArray returns true for arrays returned by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0680
     * @tc.name testArrayIsArray068
     * @tc.desc Verify Array.isArray returns true for arrays returned by toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0690
     * @tc.name testArrayIsArray069
     * @tc.desc Verify Array.isArray returns true for arrays returned by toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0700
     * @tc.name testArrayIsArray070
     * @tc.desc Verify Array.isArray returns true for arrays returned by toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 20);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0710
     * @tc.name testArrayIsArray071
     * @tc.desc Verify Array.isArray returns true for arrays returned by with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 99);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0720
     * @tc.name testArrayIsArray072
     * @tc.desc Verify Array.isArray returns true for arrays returned by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(7, 8, 9);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0730
     * @tc.name testArrayIsArray073
     * @tc.desc Verify Array.isArray returns true for arrays returned by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Set<number>(new Array<number>(1, 2, 3)));
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0740
     * @tc.name testArrayIsArray074
     * @tc.desc Verify Array.isArray returns false for plain objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new LengthOnly022();
      expect(Array.isArray(obj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0750
     * @tc.name testArrayIsArray075
     * @tc.desc Verify Array.isArray returns false for strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = 'abc';
      expect(Array.isArray(text)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0760
     * @tc.name testArrayIsArray076
     * @tc.desc Verify Array.isArray returns false for numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 100;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0770
     * @tc.name testArrayIsArray077
     * @tc.desc Verify Array.isArray returns false for booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = true;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0780
     * @tc.name testArrayIsArray078
     * @tc.desc Verify Array.isArray returns false for null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = null;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0790
     * @tc.name testArrayIsArray079
     * @tc.desc Verify Array.isArray returns false for undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = undefined;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0800
     * @tc.name testArrayIsArray080
     * @tc.desc Verify Array.isArray returns false for Set objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Set<number>(new Array<number>(1, 2));
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0810
     * @tc.name testArrayIsArray081
     * @tc.desc Verify Array.isArray returns false for Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Map<number, number>(Array.create<[number, number]>(1, [1, 2]));
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0820
     * @tc.name testArrayIsArray082
     * @tc.desc Verify Array.isArray returns false for array iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Array<number>(1, 2, 3).values();
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0830
     * @tc.name testArrayIsArray083
     * @tc.desc Verify Array.isArray returns false for custom class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Box022();
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0840
     * @tc.name testArrayIsArray084
     * @tc.desc Verify Array.isArray remains true after push mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0850
     * @tc.name testArrayIsArray085
     * @tc.desc Verify Array.isArray remains true after pop mutations on string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'green', 'blue');
      const removed = arr.pop();
      expect(Array.isArray(arr)).assertTrue();
      expect(removed).assertEqual('blue');
      expect(arr.toString()).assertEqual('red,green');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0860
     * @tc.name testArrayIsArray086
     * @tc.desc Verify Array.isArray remains true after length truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 2;
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0870
     * @tc.name testArrayIsArray087
     * @tc.desc Verify Array.isArray remains true after reverse mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0880
     * @tc.name testArrayIsArray088
     * @tc.desc Verify Array.isArray remains true after sort mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0890
     * @tc.name testArrayIsArray089
     * @tc.desc Verify Array.isArray remains true after shift mutations on boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const removed = arr.shift();
      expect(Array.isArray(arr)).assertTrue();
      expect(removed).assertTrue();
      expect(arr.toString()).assertEqual('false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0900
     * @tc.name testArrayIsArray090
     * @tc.desc Verify Array.isArray remains true after unshift mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.unshift(1);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0910
     * @tc.name testArrayIsArray091
     * @tc.desc Verify Array.isArray remains true after shrinkTo mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0920
     * @tc.name testArrayIsArray092
     * @tc.desc Verify Array.isArray remains true after splice mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 99);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0930
     * @tc.name testArrayIsArray093
     * @tc.desc Verify Array.isArray returns true for bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0940
     * @tc.name testArrayIsArray094
     * @tc.desc Verify Array.isArray returns true for union-typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, '2', 3);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0950
     * @tc.name testArrayIsArray095
     * @tc.desc Verify Array.isArray returns true for nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(Array.create<number>(1, 1), Array.create<number>(1, 2));
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0960
     * @tc.name testArrayIsArray096
     * @tc.desc Verify Array.isArray returns true for arrays rebuilt after clearing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(9);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0970
     * @tc.name testArrayIsArray097
     * @tc.desc Verify Array.isArray returns true for arrays created from string iterables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<string>('abc');
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0980
     * @tc.name testArrayIsArray098
     * @tc.desc Verify Array.isArray returns true for arrays created from fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const arr = Array.from<int>(source);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_0990
     * @tc.name testArrayIsArray099
     * @tc.desc Verify Array.isArray returns true for empty array literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1000
     * @tc.name testArrayIsArray100
     * @tc.desc Verify Array.isArray returns true for arrays declared with T[] syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2, 3];
      expect(Array.isArray(arr)).assertTrue();
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1010
     * @tc.name testArrayIsArray101
     * @tc.desc Verify Array.isArray returns false for tuple values declared with tuple syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair: [int, string] = [1, 'tuple'];
      expect(Array.isArray(pair)).assertFalse();
      expect(pair[0]).assertEqual(1);
      expect(pair[1]).assertEqual('tuple');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1020
     * @tc.name testArrayIsArray102
     * @tc.desc Verify Array.isArray returns false for single-element tuple values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tupleValue: [int] = [7];
      expect(Array.isArray(tupleValue)).assertFalse();
      expect(tupleValue[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1030
     * @tc.name testArrayIsArray103
     * @tc.desc Verify Array.isArray stays true after consecutive copyWithin calls on the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.copyWithin(1, 3).copyWithin(0, 2, 4);
      expect(result === arr).assertTrue();
      expect(Array.isArray(result)).assertTrue();
      expect(result.toString()).assertEqual('5,4,5,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1040
     * @tc.name testArrayIsArray104
     * @tc.desc Verify Array.isArray stays true after consecutive fill calls on the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.fill(9, 1, 3).fill(7, 0, 1);
      expect(result === arr).assertTrue();
      expect(Array.isArray(result)).assertTrue();
      expect(result.toString()).assertEqual('7,9,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1050
     * @tc.name testArrayIsArray105
     * @tc.desc Verify Array.isArray stays true for arrays returned by consecutive filter calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2, 3, 4, 5, 6)
        .filter((value: number): boolean => value > 2)
        .filter((value: number): boolean => value % 2 === 0);
      expect(Array.isArray(result)).assertTrue();
      expect(result.toString()).assertEqual('4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1060
     * @tc.name testArrayIsArray106
     * @tc.desc Verify Array.isArray stays true for arrays returned by consecutive concat calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2)
        .concat(Array.create<number>(1, 3))
        .concat(new Array<number>(4, 5));
      expect(Array.isArray(result)).assertTrue();
      expect(result.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1070
     * @tc.name testArrayIsArray107
     * @tc.desc Verify Array.isArray works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(Array.isArray(anyValue)).assertTrue();
      expect(joinAnyNumberArray(anyValue)).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_IS_ARRAY_1080
     * @tc.name testArrayIsArray108
     * @tc.desc Verify Array.isArray returns true for arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIsArray108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      expect(Array.isArray(anyArr)).assertTrue();
      expect(anyArr.length).assertEqual(3);
      expect(anyArr.toString()).assertEqual('1,two,true');
    });

  });
}


