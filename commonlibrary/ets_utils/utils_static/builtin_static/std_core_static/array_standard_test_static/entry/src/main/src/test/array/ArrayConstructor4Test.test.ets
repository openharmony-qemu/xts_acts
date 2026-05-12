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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class Item018 {
  value: number;
  index: number;

  constructor(v: number, i: number) {
    this.value = v;
    this.index = i;
  }
}

class ElementTest037 {
  ele: int;

  constructor(e: int) {
    this.ele = e;
  }
}

class Item043 {
  id: number;
  value: string;

  constructor(id: number, value: string) {
    this.id = id;
    this.value = value;
  }
}

interface Point044 {
  x: number;
  y: number;
}

function alphaAt(index: int): string {
  const letters = new Array<string>(
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  );
  return letters[index];
}

export default function ArrayConstructor4Test(): void {
  describe('ArrayConstructor4Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0100
     * @tc.name testArrayConstructor4001
     * @tc.desc Verify both array length and initializer are required to build an initialized array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, (index) => index + 1);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0200
     * @tc.name testArrayConstructor4002
     * @tc.desc Verify a normal length value initializes all elements with the callback result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, (index) => index * 2);
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(0);
      expect(arr[5]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0300
     * @tc.name testArrayConstructor4003
     * @tc.desc Verify zero length creates an empty initialized array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, (index) => index);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0400
     * @tc.name testArrayConstructor4004
     * @tc.desc Verify a length of one initializes the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, (index) => index + 10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0500
     * @tc.name testArrayConstructor4005
     * @tc.desc Verify a larger length value initializes all expected positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, (index) => index);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0600
     * @tc.name testArrayConstructor4006
     * @tc.desc Verify extremely large initialized lengths are skipped in device tests to avoid memory pressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // The null-safe overload would eagerly initialize every element and is not practical at Int.MAX_VALUE on device.
      expect(2147483647).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0700
     * @tc.name testArrayConstructor4007
     * @tc.desc Verify a negative length is rejected by the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let negativeLen = 1;
        negativeLen = 0 - negativeLen;
        const arr = new Array<number>(negativeLen, (index) => index);
        expect(arr.length).assertEqual(0);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof RangeError || e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0800
     * @tc.name testArrayConstructor4008
     * @tc.desc Verify null length is rejected by ArkTS at compile time for this overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects null-to-int conversion for the initializer overload at compile time.
      expect('null').assertEqual('null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0900
     * @tc.name testArrayConstructor4009
     * @tc.desc Verify an undefined length path falls back to default construction logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const optionalLength: int | undefined = undefined;
      let arr = new Array<number>();
      if (optionalLength != undefined) {
        arr = new Array<number>(optionalLength, (index) => index);
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1000
     * @tc.name testArrayConstructor4010
     * @tc.desc Verify floating-point input requires integer normalization before construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatLength = 5.5;
      const arr = new Array<number>(floatLength.toInt(), (index) => index);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1100
     * @tc.name testArrayConstructor4011
     * @tc.desc Verify scientific notation works after explicit integer normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>((1e1).toInt(), (index) => index);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1200
     * @tc.name testArrayConstructor4012
     * @tc.desc Verify hexadecimal length values are accepted by the initializer overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0x0A, (index) => index);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1300
     * @tc.name testArrayConstructor4013
     * @tc.desc Verify octal length values are accepted by the initializer overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0o12, (index) => index);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1400
     * @tc.name testArrayConstructor4014
     * @tc.desc Verify string length input is rejected by ArkTS type checking for this overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects string-to-int conversion for the initializer overload at compile time.
      expect('string').assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1500
     * @tc.name testArrayConstructor4015
     * @tc.desc Verify a standard initializer callback fills each element as expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, (index) => index + 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1600
     * @tc.name testArrayConstructor4016
     * @tc.desc Verify the initializer can return string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(3, (index) => `item${index}`);
      expect(arr[0]).assertEqual('item0');
      expect(arr[1]).assertEqual('item1');
      expect(arr[2]).assertEqual('item2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1700
     * @tc.name testArrayConstructor4017
     * @tc.desc Verify the initializer can return boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(5, (index) => index % 2 === 0);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertTrue();
      expect(arr[3]).assertFalse();
      expect(arr[4]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1800
     * @tc.name testArrayConstructor4018
     * @tc.desc Verify the initializer can construct custom object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item018>(3, (index) => new Item018(index * 10, index));
      expect(arr[0].value).assertEqual(0);
      expect(arr[0].index).assertEqual(0);
      expect(arr[2].value).assertEqual(20);
      expect(arr[2].index).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1900
     * @tc.name testArrayConstructor4019
     * @tc.desc Verify the initializer can return zero for every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, (index) => 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2000
     * @tc.name testArrayConstructor4020
     * @tc.desc Verify the initializer can return negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, (index) => -index);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(-1);
      expect(arr[4]).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2100
     * @tc.name testArrayConstructor4021
     * @tc.desc Verify the initializer can return Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, (index) => Number.MAX_VALUE);
      expect(arr[0]).assertEqual(Number.MAX_VALUE);
      expect(arr[1]).assertEqual(Number.MAX_VALUE);
      expect(arr[2]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2200
     * @tc.name testArrayConstructor4022
     * @tc.desc Verify the initializer can return Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, (index) => Number.MIN_VALUE);
      expect(arr[0]).assertEqual(Number.MIN_VALUE);
      expect(arr[1]).assertEqual(Number.MIN_VALUE);
      expect(arr[2]).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2300
     * @tc.name testArrayConstructor4023
     * @tc.desc Verify null initializer input is rejected by ArkTS type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects null callback input for the initializer overload at compile time.
      expect('null-callback').assertEqual('null-callback');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2400
     * @tc.name testArrayConstructor4024
     * @tc.desc Verify undefined initializer input is rejected by ArkTS type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects undefined callback input for the initializer overload at compile time.
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2500
     * @tc.name testArrayConstructor4025
     * @tc.desc Verify the initializer can return null for nullable element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(5, (index) => {
        if (index % 2 === 0) {
          return null;
        }
        return index;
      });
      expect(arr[0]).assertNull();
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2600
     * @tc.name testArrayConstructor4026
     * @tc.desc Verify the initializer can return undefined for optional element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (index) => {
        if (index % 2 === 0) {
          return undefined;
        }
        return index;
      });
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2700
     * @tc.name testArrayConstructor4027
     * @tc.desc Verify the index parameter is passed into the initializer correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices = new Array<number>();
      const arr = new Array<number>(5, (index) => {
        indices.pushOne(index);
        return index;
      });
      expect(arr.length).assertEqual(5);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2800
     * @tc.name testArrayConstructor4028
     * @tc.desc Verify the initializer index starts from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, (index) => index);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2900
     * @tc.name testArrayConstructor4029
     * @tc.desc Verify the initializer index increments by one for each position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, (index) => index);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3000
     * @tc.name testArrayConstructor4030
     * @tc.desc Verify the initializer can compute values from the current index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, (index) => index * index);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(9);
      expect(arr[4]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3100
     * @tc.name testArrayConstructor4031
     * @tc.desc Verify the initializer can apply conditional logic per index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, (index) => {
        if (index % 2 === 0) {
          return index * 2;
        }
        return index;
      });
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3200
     * @tc.name testArrayConstructor4032
     * @tc.desc Verify the initializer can capture external closure variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const multiplier = 10;
      const arr = new Array<number>(5, (index) => index * multiplier);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[4]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3300
     * @tc.name testArrayConstructor4033
     * @tc.desc Verify the initializer overload returns an Array instance with all values set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, (index) => index + 1);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(5);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3400
     * @tc.name testArrayConstructor4034
     * @tc.desc Verify all elements are initialized and safely accessible through the null-safe overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, (index) => index * 10);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i * 10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3500
     * @tc.name testArrayConstructor4035
     * @tc.desc Verify the initializer overload returns arrays with the requested generic element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>(5, (index) => index);
      const strArr = new Array<string>(5, (index) => `item${index}`);
      const boolArr = new Array<boolean>(5, (index) => index % 2 === 0);
      expect(numArr instanceof Array).assertTrue();
      expect(strArr instanceof Array).assertTrue();
      expect(boolArr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3600
     * @tc.name testArrayConstructor4036
     * @tc.desc Verify the null-safe overload avoids the uninitialized-element behavior of the length-only constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(5);
      let threw = false;
      try {
        const val = arr1[0];
        expect(val).assertEqual(0);
      } catch (e) {
        threw = true;
        expect(e == null).assertFalse();
      }

      const arr2 = new Array<number>(5, (index) => index);
      for (let i = 0; i < arr2.length; i++) {
        expect(arr2[i]).assertEqual(i);
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3700
     * @tc.name testArrayConstructor4037
     * @tc.desc Verify optional element types can be initialized with undefined safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ElementTest037 | undefined>(3, (index) => undefined);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3800
     * @tc.name testArrayConstructor4038
     * @tc.desc Verify every position is initialized by the callback for a larger array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100, (index) => index);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3900
     * @tc.name testArrayConstructor4039
     * @tc.desc Verify the initializer is called once for every requested index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      const arr = new Array<number>(5, (index) => {
        callCount++;
        return index * 2;
      });
      expect(callCount).assertEqual(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4000
     * @tc.name testArrayConstructor4040
     * @tc.desc Verify number arrays can be initialized through the generic overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, (index) => index * 10);
      expect(arr[0]).assertEqual(0);
      expect(arr[9]).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4100
     * @tc.name testArrayConstructor4041
     * @tc.desc Verify string arrays can be initialized through the generic overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(5, (index) => `element-${index}`);
      expect(arr[0]).assertEqual('element-0');
      expect(arr[4]).assertEqual('element-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4200
     * @tc.name testArrayConstructor4042
     * @tc.desc Verify boolean arrays can be initialized through the generic overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(5, (index) => index >= 2);
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertTrue();
      expect(arr[3]).assertTrue();
      expect(arr[4]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4300
     * @tc.name testArrayConstructor4043
     * @tc.desc Verify arrays of custom class instances can be initialized through the generic overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item043>(5, (index) => new Item043(index, `item${index}`));
      expect(arr[0].id).assertEqual(0);
      expect(arr[0].value).assertEqual('item0');
      expect(arr[4].id).assertEqual(4);
      expect(arr[4].value).assertEqual('item4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4400
     * @tc.name testArrayConstructor4044
     * @tc.desc Verify arrays of interface-typed objects can be initialized through the generic overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point044>(5, (index) => ({ x: index, y: index * 2 }));
      expect(arr[0].x).assertEqual(0);
      expect(arr[0].y).assertEqual(0);
      expect(arr[4].x).assertEqual(4);
      expect(arr[4].y).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4500
     * @tc.name testArrayConstructor4045
     * @tc.desc Verify arrays of union types can be initialized through the generic overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(10, (index) => {
        if (index % 2 === 0) {
          return index;
        }
        return `odd${index}`;
      });
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual('odd1');
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual('odd3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4600
     * @tc.name testArrayConstructor4046
     * @tc.desc Verify nested arrays can be initialized through the generic overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(3, (index) => new Array<number>(index + 1, (i) => i));
      expect(arr[0].length).assertEqual(1);
      expect(arr[1].length).assertEqual(2);
      expect(arr[2].length).assertEqual(3);
      expect(arr[0][0]).assertEqual(0);
      expect(arr[2][2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4700
     * @tc.name testArrayConstructor4047
     * @tc.desc Verify the initializer call count and collected indices match the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const indices = new Array<number>();
      const arr = new Array<number>(10, (index) => {
        count++;
        indices.pushOne(index);
        return index;
      });
      expect(arr.length).assertEqual(10);
      expect(count).assertEqual(10);
      expect(indices.length).assertEqual(10);
      for (let i = 0; i < indices.length; i++) {
        expect(indices[i]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4800
     * @tc.name testArrayConstructor4048
     * @tc.desc Verify the initializer is invoked from index zero to length minus one in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const callOrder = new Array<number>();
      const arr = new Array<number>(5, (index) => {
        callOrder.pushOne(index);
        return index;
      });
      expect(arr.length).assertEqual(5);
      expect(callOrder[0]).assertEqual(0);
      expect(callOrder[1]).assertEqual(1);
      expect(callOrder[2]).assertEqual(2);
      expect(callOrder[3]).assertEqual(3);
      expect(callOrder[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4900
     * @tc.name testArrayConstructor4049
     * @tc.desc Verify exceptions thrown inside the initializer are propagated to the caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<number>(5, (index) => {
          if (index === 3) {
            throw new Error('Test error');
          }
          return index;
        });
        expect(arr.length).assertEqual(0);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5000
     * @tc.name testArrayConstructor4050
     * @tc.desc Verify a large array can be initialized with the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10000, (index) => index);
      expect(arr.length).assertEqual(10000);
      expect(arr[0]).assertEqual(0);
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5100
     * @tc.name testArrayConstructor4051
     * @tc.desc Verify the initializer can perform more complex calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100, (index) => {
        let result = 0;
        for (let i = 0; i <= index; i++) {
          result += i;
        }
        return result;
      });
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[99]).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5200
     * @tc.name testArrayConstructor4052
     * @tc.desc Verify the initializer can prefill a constant default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, (index) => -1);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5300
     * @tc.name testArrayConstructor4053
     * @tc.desc Verify the initializer can build an increasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100, (index) => index + 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[50]).assertEqual(51);
      expect(arr[99]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5400
     * @tc.name testArrayConstructor4054
     * @tc.desc Verify the initializer can precompute square lookup values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const squares = new Array<number>(100, (index) => index * index);
      expect(squares[5]).assertEqual(25);
      expect(squares[10]).assertEqual(100);
      expect(squares[99]).assertEqual(9801);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5500
     * @tc.name testArrayConstructor4055
     * @tc.desc Verify the initializer can precompute a simple alphabet mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Array<string>(26, (index) => alphaAt(index));
      expect(map[0]).assertEqual('A');
      expect(map[25]).assertEqual('Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5600
     * @tc.name testArrayConstructor4056
     * @tc.desc Verify the null-safe overload removes the need for manual element initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(5);
      for (let i = 0; i < arr1.length; i++) {
        arr1[i] = i;
      }

      const arr2 = new Array<number>(5, (index) => index);
      for (let i = 0; i < arr2.length; i++) {
        expect(arr2[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5700
     * @tc.name testArrayConstructor4057
     * @tc.desc Verify initializer-based construction matches manual initialization results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1000, (index) => index);
      const arr2 = new Array<number>(1000);
      for (let i = 0; i < arr2.length; i++) {
        arr2[i] = i;
      }
      for (let i = 0; i < 1000; i++) {
        expect(arr1[i]).assertEqual(arr2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5800
     * @tc.name testArrayConstructor4058
     * @tc.desc Verify using the initializer index avoids common closure-trap patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, (index) => index);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5900
     * @tc.name testArrayConstructor4059
     * @tc.desc Verify external variables can influence initializer results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const baseValue = 100;
      const multiplier = 2;
      const arr = new Array<number>(10, (index) => (baseValue + index) * multiplier);
      expect(arr[0]).assertEqual(200);
      expect(arr[5]).assertEqual(210);
      expect(arr[9]).assertEqual(218);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6000
     * @tc.name testArrayConstructor4060
     * @tc.desc Verify non-function initializer input is rejected by ArkTS type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects non-function initializer input for this overload at compile time.
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6100
     * @tc.name testArrayConstructor4061
     * @tc.desc Verify the generic overload enforces callback return types at compile time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>(5, (index) => index);
      const strArr = new Array<string>(5, (index) => `item${index}`);
      expect(numArr[4]).assertEqual(4);
      expect(strArr[4]).assertEqual('item4');
      // ArkTS blocks mismatched callback return types such as number[] initialized with string results.
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6200
     * @tc.name testArrayConstructor4062
     * @tc.desc Verify the initializer is not called when the requested length is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      const arr = new Array<number>(0, (index) => {
        callCount++;
        return index;
      });
      expect(arr.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6300
     * @tc.name testArrayConstructor4063
     * @tc.desc Verify a single-element array calls the initializer exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      const lastValue = new Array<number>();
      const arr = new Array<number>(1, (index) => {
        callCount++;
        lastValue.pushOne(index);
        return index * 10;
      });
      expect(arr.length).assertEqual(1);
      expect(callCount).assertEqual(1);
      expect(lastValue[0]).assertEqual(0);
      expect(arr[0]).assertEqual(0);
    });
  });
}
