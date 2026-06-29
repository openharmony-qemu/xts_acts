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

class ToStringItem028 {
  value: number = 0;

  toString(): string {
    return 'Item[' + this.value + ']';
  }
}

class ToStringSimpleItem029 {
  value: number = 0;
}

let toStringOrderTrace064 = '';

class ToStringOrderItem061 {
  label: string = '';

  toString(): string {
    toStringOrderTrace064 += this.label;
    return this.label;
  }
}

class ToStringCommaItem061 {
  text: string = '';

  toString(): string {
    return this.text;
  }
}

enum ToStringColor061 {
  Red,
  Green,
  Blue
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function toStringFromAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  return arr.toString();
}

function processText(text: string): number {
  return text.length;
}

export default function ArrayToStringTest(): void {
  describe('ArrayToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0010
     * @tc.name testArrayToString001
     * @tc.desc Verify toString accepts no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0020
     * @tc.name testArrayToString002
     * @tc.desc Verify toString must be called without passing parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      const result = arr.toString();
      expect(result).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0030
     * @tc.name testArrayToString003
     * @tc.desc Verify toString returns a string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0040
     * @tc.name testArrayToString004
     * @tc.desc Verify toString uses comma as the default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.toString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0050
     * @tc.name testArrayToString005
     * @tc.desc Verify empty arrays return an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0060
     * @tc.name testArrayToString006
     * @tc.desc Verify single-element arrays return the element text only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(42);
      const result = arr.toString();
      expect(result).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0070
     * @tc.name testArrayToString007
     * @tc.desc Verify two-element arrays are joined by one comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.toString();
      expect(result).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0080
     * @tc.name testArrayToString008
     * @tc.desc Verify large arrays can be converted to a non-empty comma-joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(1000);
      const result = arr.toString();
      expect(result.indexOf('0,1,2,3,4')).assertEqual(0);
      const suffix = '995,996,997,998,999';
      expect(result.lastIndexOf(suffix)).assertEqual(result.length - suffix.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0090
     * @tc.name testArrayToString009
     * @tc.desc Verify number arrays convert to comma-separated number text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toString();
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0100
     * @tc.name testArrayToString010
     * @tc.desc Verify string arrays convert to comma-separated text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world');
      const result = arr.toString();
      expect(result).assertEqual('hello,world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0110
     * @tc.name testArrayToString011
     * @tc.desc Verify boolean arrays convert to comma-separated boolean text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.toString();
      expect(result).assertEqual('true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0120
     * @tc.name testArrayToString012
     * @tc.desc Verify union-typed arrays convert each element before joining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(1, 'two', true);
      const result = arr.toString();
      expect(result).assertEqual('1,two,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0130
     * @tc.name testArrayToString013
     * @tc.desc Verify null elements follow join-style empty-field behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>();
      arr.pushOne(1);
      arr.pushOne(null);
      arr.pushOne(3);
      const result = arr.toString();
      expect(result).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0140
     * @tc.name testArrayToString014
     * @tc.desc Verify undefined elements follow join-style empty-field behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>();
      arr.pushOne(1);
      arr.pushOne(undefined);
      arr.pushOne(3);
      const result = arr.toString();
      expect(result).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0150
     * @tc.name testArrayToString015
     * @tc.desc Verify zero values are converted without being dropped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 0);
      const result = arr.toString();
      expect(result).assertEqual('0,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0160
     * @tc.name testArrayToString016
     * @tc.desc Verify empty-string elements create adjacent separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'c');
      const result = arr.toString();
      expect(result).assertEqual('a,,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0170
     * @tc.name testArrayToString017
     * @tc.desc Verify negative numbers convert with their sign preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1, -2, -3);
      const result = arr.toString();
      expect(result).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0180
     * @tc.name testArrayToString018
     * @tc.desc Verify floating-point numbers keep their decimal representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.5, 2.5, 3.14);
      const result = arr.toString();
      expect(result).assertEqual('1.5,2.5,3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0190
     * @tc.name testArrayToString019
     * @tc.desc Verify nested arrays contribute their own comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number>(1, 2);
      const arr = new Array<number | Object>(0, nested, 3);
      const result = arr.toString();
      expect(result).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0200
     * @tc.name testArrayToString020
     * @tc.desc Verify multi-level nested arrays flatten through recursive toString calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(3);
      const middle = new Array<number | Object>(2, inner);
      const arr = new Array<number | Object>(1, middle, 4);
      const result = arr.toString();
      expect(result).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0210
     * @tc.name testArrayToString021
     * @tc.desc Verify empty nested arrays still produce an empty field in the output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Array<number>();
      const arr = new Array<number | Object>(1, empty, 3);
      const result = arr.toString();
      expect(result).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0220
     * @tc.name testArrayToString022
     * @tc.desc Verify toString returns the same value as join with no separator argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const toStringResult = arr.toString();
      const joinResult = arr.join();
      expect(toStringResult).assertEqual(joinResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0230
     * @tc.name testArrayToString023
     * @tc.desc Verify toString returns the same value as join with a comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const toStringResult = arr.toString();
      const joinResult = arr.join(',');
      expect(toStringResult).assertEqual(joinResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0240
     * @tc.name testArrayToString024
     * @tc.desc Verify toString always uses commas while join can use custom separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const ts = arr.toString();
      const joined = arr.join('-');
      expect(ts).assertEqual('1,2,3');
      expect(joined).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0250
     * @tc.name testArrayToString025
     * @tc.desc Verify toString does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      arr.toString();
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0260
     * @tc.name testArrayToString026
     * @tc.desc Verify repeated toString calls return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result1 = arr.toString();
      const result2 = arr.toString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0270
     * @tc.name testArrayToString027
     * @tc.desc Verify array objects use each element custom toString implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ToStringItem028();
      item.value = 42;
      const arr = new Array<ToStringItem028>(item);
      const result = arr.toString();
      expect(result).assertEqual('Item[42]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0280
     * @tc.name testArrayToString028
     * @tc.desc Verify objects without a custom override still produce a non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ToStringSimpleItem029();
      item.value = 1;
      const arr = new Array<ToStringSimpleItem029>(item);
      const result = arr.toString();
      expect(typeof result).assertEqual('string');
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0290
     * @tc.name testArrayToString029
     * @tc.desc Verify toString can be used for array log output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const output = arr.toString();
      console.info(output);
      expect(output).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0300
     * @tc.name testArrayToString030
     * @tc.desc Verify toString can serialize a simple string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const serialized = arr.toString();
      expect(serialized).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0310
     * @tc.name testArrayToString031
     * @tc.desc Verify toString can be embedded in display text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<number>(10, 20, 30);
      const display = 'Values: ' + values.toString();
      expect(display).assertEqual('Values: 10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0320
     * @tc.name testArrayToString032
     * @tc.desc Verify array contents can be compared through their toString results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const arr2 = new Array<number>(1, 2, 3);
      expect(arr1.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0330
     * @tc.name testArrayToString033
     * @tc.desc Verify string methods can be chained after toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.toString().toUpperCase();
      expect(result).assertEqual('A,B,C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0340
     * @tc.name testArrayToString034
     * @tc.desc Verify a toString result can be passed as a function argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const len = processText(arr.toString());
      expect(len).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0350
     * @tc.name testArrayToString035
     * @tc.desc Verify array-method chains can end with toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((v: number): boolean => v > 2).toString();
      expect(filtered).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0360
     * @tc.name testArrayToString036
     * @tc.desc Verify element strings that contain commas are preserved as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a,b', 'c');
      const result = arr.toString();
      expect(result).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0370
     * @tc.name testArrayToString037
     * @tc.desc Verify escape characters are kept in the joined string output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a\nb', 'c\t');
      const result = arr.toString();
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('\n') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0380
     * @tc.name testArrayToString038
     * @tc.desc Verify different generic array instances still return string results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const arr2 = new Array<string>('a', 'b');
      expect(typeof arr1.toString()).assertEqual('string');
      expect(typeof arr2.toString()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0390
     * @tc.name testArrayToString039
     * @tc.desc Verify the return type can be stored in a string variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result: string = arr.toString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0400
     * @tc.name testArrayToString040
     * @tc.desc Verify large arrays can be converted to a non-empty string repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(10000);
      const result = arr.toString();
      expect(result.indexOf('0,1,2,3,4')).assertEqual(0);
      const suffix = '9995,9996,9997,9998,9999';
      expect(result.lastIndexOf(suffix)).assertEqual(result.length - suffix.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0410
     * @tc.name testArrayToString041
     * @tc.desc Verify repeated toString calls remain stable in a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let result = '';
      for (let i: int = 0; i < 1000; i++) {
        result = arr.toString();
      }
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0420
     * @tc.name testArrayToString042
     * @tc.desc Verify slice results can be converted by toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.slice(0, 3).toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0430
     * @tc.name testArrayToString043
     * @tc.desc Verify mapped arrays can be converted by toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.map((v: number): number => v * 2).toString();
      expect(result).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0440
     * @tc.name testArrayToString044
     * @tc.desc Verify filtered arrays can be converted by toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => v % 2 === 0).toString();
      expect(result).assertEqual('2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0450
     * @tc.name testArrayToString045
     * @tc.desc Verify empty-array toString results have zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.toString()).assertEqual('');
      expect(arr.toString().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0460
     * @tc.name testArrayToString046
     * @tc.desc Verify one-element arrays preserve the single element text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(999);
      expect(arr.toString()).assertEqual('999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0470
     * @tc.name testArrayToString047
     * @tc.desc Verify two-element arrays produce two comma-separated fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      expect(arr.toString()).assertEqual('1,2');
      expect(arr.toString().split(',').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0480
     * @tc.name testArrayToString048
     * @tc.desc Verify explicit undefined middle values follow join-style empty-field behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toString();
      expect(result).assertEqual('1,,3');
      expect(result).assertEqual(arr.join());
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0490
     * @tc.name testArrayToString049
     * @tc.desc Verify an explicit undefined tail value leaves a trailing empty field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      arr[0] = 1;
      const result = arr.toString();
      expect(result).assertEqual('1,');
      expect(result).assertEqual(arr.join(','));
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0500
     * @tc.name testArrayToString050
     * @tc.desc Verify an explicit undefined head value leaves a leading empty field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      arr[1] = 2;
      const result = arr.toString();
      expect(result).assertEqual(',2');
      expect(result).assertEqual(arr.join());
      expect(arr.indexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0510
     * @tc.name testArrayToString051
     * @tc.desc Verify arrays filled with explicit undefined serialize as separators only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      const result = arr.toString();
      expect(result).assertEqual(',,');
      expect(result).assertEqual(arr.join(','));
      expect(arr.indexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0520
     * @tc.name testArrayToString052
     * @tc.desc Verify direct and generated explicit undefined values serialize the same way
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const explicit = new Array<number | undefined>(1, undefined, 3);
      const sparse = new Array<number | undefined>(3, (_index) => undefined);
      sparse[0] = 1;
      sparse[2] = 3;
      expect(explicit.toString()).assertEqual('1,,3');
      expect(sparse.toString()).assertEqual(explicit.toString());
      expect(explicit.indexOf(undefined)).assertEqual(1);
      expect(sparse.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0530
     * @tc.name testArrayToString053
     * @tc.desc Verify toString ignores join custom separators and always uses comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      expect(arr.toString()).assertEqual('1,2');
      expect(arr.join('-')).assertEqual('1-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0540
     * @tc.name testArrayToString054
     * @tc.desc Verify plus string concatenation can embed explicit toString output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.toString() + '';
      expect(result).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0550
     * @tc.name testArrayToString055
     * @tc.desc Verify template strings can embed explicit toString output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = `${arr.toString()}`;
      expect(result).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0560
     * @tc.name testArrayToString056
     * @tc.desc Verify parseInt can consume single-element array toString output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      const result = Number.parseInt(arr.toString());
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0570
     * @tc.name testArrayToString057
     * @tc.desc Verify parseFloat can consume single floating-point array text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.5);
      const result = Number.parseFloat(arr.toString());
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0580
     * @tc.name testArrayToString058
     * @tc.desc Verify multi-element numeric text cannot be parsed as one number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = Number.parseFloat(arr.toString());
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0590
     * @tc.name testArrayToString059
     * @tc.desc Verify regex construction can use array toString text as the pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const reg = new RegExp(arr.toString());
      expect(reg.test('1,2')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0600
     * @tc.name testArrayToString060
     * @tc.desc Verify toString renders explicit undefined source elements as empty fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toString();
      expect(result).assertEqual('1,,3');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0610
     * @tc.name testArrayToString061
     * @tc.desc Verify toString serializes NaN and Infinity numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, Infinity, -Infinity);
      expect(arr.toString()).assertEqual('NaN,Infinity,-Infinity');
      expect(Number.isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0620
     * @tc.name testArrayToString062
     * @tc.desc Verify toString serializes negative zero as zero while preserving the value sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 0);
      expect(arr.toString()).assertEqual('0,0');
      expect(1.0 / arr[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0630
     * @tc.name testArrayToString063
     * @tc.desc Verify toString serializes char arrays as their character text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c',', c'Z');
      expect(arr.toString()).assertEqual('A,,,Z');
      expect(arr[1]).assertEqual(c',');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0640
     * @tc.name testArrayToString064
     * @tc.desc Verify toString serializes enum arrays using enum numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ToStringColor061>(ToStringColor061.Red, ToStringColor061.Blue);
      expect(arr.toString()).assertEqual('0,2');
      expect(arr[1]).assertEqual(ToStringColor061.Blue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0650
     * @tc.name testArrayToString065
     * @tc.desc Verify toString calls object toString methods from left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      toStringOrderTrace064 = '';
      const first = new ToStringOrderItem061();
      first.label = 'A';
      const second = new ToStringOrderItem061();
      second.label = 'B';
      const third = new ToStringOrderItem061();
      third.label = 'C';
      const arr = new Array<ToStringOrderItem061>(first, second, third);
      expect(arr.toString()).assertEqual('A,B,C');
      expect(toStringOrderTrace064).assertEqual('ABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0660
     * @tc.name testArrayToString066
     * @tc.desc Verify object toString results containing commas are not escaped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ToStringCommaItem061();
      item.text = 'x,y';
      const arr = new Array<ToStringCommaItem061 | string>(item, 'z');
      expect(arr.toString()).assertEqual('x,y,z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0670
     * @tc.name testArrayToString067
     * @tc.desc Verify comma-like string elements create indistinguishable comma fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('left,right', 'tail');
      const fields = arr.toString().split(',');
      expect(arr.toString()).assertEqual('left,right,tail');
      expect(fields.length).assertEqual(3);
      expect(fields[1]).assertEqual('right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0680
     * @tc.name testArrayToString068
     * @tc.desc Verify null and undefined produce empty fields around concrete values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(null, 1, undefined, 2);
      expect(arr.toString()).assertEqual(',1,,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0690
     * @tc.name testArrayToString069
     * @tc.desc Verify nested arrays contribute inner commas to the outer comma stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<string>('inner', 'comma');
      const arr = new Array<string | Object>('head', nested, 'tail');
      expect(arr.toString()).assertEqual('head,inner,comma,tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0700
     * @tc.name testArrayToString070
     * @tc.desc Verify explicit undefined values become empty fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[0] = 1;
      arr[3] = 4;
      expect(arr.toString()).assertEqual('1,,,4');
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0710
     * @tc.name testArrayToString071
     * @tc.desc Verify separate dense arrays with undefined share the same toString text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sparse = new Array<number | undefined>(2, (_index) => undefined);
      sparse[1] = 2;
      const explicit = new Array<number | undefined>(undefined, 2);
      expect(sparse.toString()).assertEqual(',2');
      expect(explicit.toString()).assertEqual(',2');
      expect(sparse.lastIndexOf(undefined)).assertEqual(0);
      expect(explicit.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0720
     * @tc.name testArrayToString072
     * @tc.desc Verify toString uses the current order after reverse without changing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      expect(arr.toString()).assertEqual('3,2,1');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0730
     * @tc.name testArrayToString073
     * @tc.desc Verify toString on a sorted copy leaves the source order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(3, 1, 2);
      const arr = source.toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(arr.toString()).assertEqual('1,2,3');
      expect(source.toString()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0740
     * @tc.name testArrayToString074
     * @tc.desc Verify toString on a toSpliced copy includes inserted comma-bearing text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<string>('a', 'd');
      const arr = source.toSpliced(1, 0, 'b,c');
      expect(arr.toString()).assertEqual('a,b,c,d');
      expect(source.toString()).assertEqual('a,d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0750
     * @tc.name testArrayToString075
     * @tc.desc Verify toString on a with copy reflects the replacement only in the copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 99);
      expect(arr.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0760
     * @tc.name testArrayToString076
     * @tc.desc Verify toString reflects mutations made by object element conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToStringCommaItem061();
      first.text = 'old';
      const arr = new Array<ToStringCommaItem061>(first);
      expect(arr.toString()).assertEqual('old');
      first.text = 'new';
      expect(arr.toString()).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0770
     * @tc.name testArrayToString077
     * @tc.desc Verify toString uses comma positions after push adds nullish values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(1);
      arr.push(null, undefined, 4);
      expect(arr.toString()).assertEqual('1,,,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0780
     * @tc.name testArrayToString078
     * @tc.desc Verify toString after unshift preserves argument order with comma text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('tail');
      arr.unshift('a,b', 'c');
      expect(arr.toString()).assertEqual('a,b,c,tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0790
     * @tc.name testArrayToString079
     * @tc.desc Verify toString after pop no longer observes the removed object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const kept = new ToStringCommaItem061();
      kept.text = 'keep';
      const removed = new ToStringCommaItem061();
      removed.text = 'remove';
      const arr = new Array<ToStringCommaItem061>(kept, removed);
      arr.pop();
      removed.text = 'changed';
      expect(arr.toString()).assertEqual('keep');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0800
     * @tc.name testArrayToString080
     * @tc.desc Verify toString after shift serializes the new head first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('drop,me', 'stay', 'tail');
      arr.shift();
      expect(arr.toString()).assertEqual('stay,tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0810
     * @tc.name testArrayToString081
     * @tc.desc Verify toString after reverse still delegates to object toString in new order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      toStringOrderTrace064 = '';
      const first = new ToStringOrderItem061();
      first.label = 'A';
      const second = new ToStringOrderItem061();
      second.label = 'B';
      const arr = new Array<ToStringOrderItem061>(first, second);
      arr.reverse();
      expect(arr.toString()).assertEqual('B,A');
      expect(toStringOrderTrace064).assertEqual('BA');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0820
     * @tc.name testArrayToString082
     * @tc.desc Verify toString after sort serializes special numbers in sorted positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Infinity, -Infinity, 0);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(arr.toString()).assertEqual('-Infinity,0,Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0830
     * @tc.name testArrayToString083
     * @tc.desc Verify toString after splice replacement includes inserted object comma text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ToStringCommaItem061();
      item.text = 'x,y';
      const arr = new Array<string | ToStringCommaItem061>('a', 'old', 'z');
      arr.splice(1, 1, item);
      expect(arr.toString()).assertEqual('a,x,y,z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0840
     * @tc.name testArrayToString084
     * @tc.desc Verify toString after length truncation ignores stale removed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c,d');
      arr.length = 2;
      expect(arr.toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0850
     * @tc.name testArrayToString085
     * @tc.desc Verify toString after shrinkTo ignores truncated sparse and concrete tail slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[0] = 5;
      arr[2] = 7;
      arr[3] = 8;
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('5,');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0860
     * @tc.name testArrayToString086
     * @tc.desc Verify toString serializes Array.of values with comma-bearing strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<string>('x,y', 'z');
      expect(arr.toString()).assertEqual('x,y,z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0870
     * @tc.name testArrayToString087
     * @tc.desc Verify toString serializes Array.from Set values in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Set<number>(new Array<number>(2, 1, 2, 3)));
      expect(arr.toString()).assertEqual('2,1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0880
     * @tc.name testArrayToString088
     * @tc.desc Verify a self-referential empty array serializes as an empty field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Object>();
      arr.pushOne(arr);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0890
     * @tc.name testArrayToString089
     * @tc.desc Verify self references after ordinary values become trailing empty fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Object>(1);
      arr.pushOne(arr);
      expect(arr.toString()).assertEqual('1,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0900
     * @tc.name testArrayToString090
     * @tc.desc Verify nested cyclic references are guarded during recursive toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Object>(1);
      const nested = new Array<Object>(2, arr);
      arr.pushOne(nested);
      expect(arr.toString()).assertEqual('1,2,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0910
     * @tc.name testArrayToString091
     * @tc.desc Verify two nested arrays flatten through comma delegation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Array<number>(1, 2);
      const second = new Array<number>(3, 4);
      const arr = new Array<Object>(first, second);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0920
     * @tc.name testArrayToString092
     * @tc.desc Verify deeply nested single-element arrays collapse to one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(1);
      const middle = new Array<Object>(inner);
      const arr = new Array<Object>(middle);
      expect(arr.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0930
     * @tc.name testArrayToString093
     * @tc.desc Verify nested arrays with explicit undefined keep empty fields when flattened
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number | undefined>(3, (_index) => undefined);
      nested[0] = 1;
      nested[2] = 3;
      const arr = new Array<Object>(nested);
      expect(arr.toString()).assertEqual('1,,3');
      expect(nested.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0940
     * @tc.name testArrayToString094
     * @tc.desc Verify nested empty arrays produce empty fields between neighbors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number>();
      const arr = new Array<Object>(1, nested, 3);
      expect(arr.toString()).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0950
     * @tc.name testArrayToString095
     * @tc.desc Verify boolean and nullish values share join-style comma positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean | null | undefined>(true, null, undefined, false);
      expect(arr.toString()).assertEqual('true,,,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0960
     * @tc.name testArrayToString096
     * @tc.desc Verify string split can consume toString comma-separated output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const fields = arr.toString().split(',');
      expect(fields.length).assertEqual(3);
      expect(fields[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0970
     * @tc.name testArrayToString097
     * @tc.desc Verify Set based arrays serialize unique insertion order values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Set<number>(new Array<number>(2, 1, 2)));
      expect(arr.toString()).assertEqual('2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0980
     * @tc.name testArrayToString098
     * @tc.desc Verify toString output remains stable after the source is copied first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const copied = arr.slice();
      arr.pushOne(4);
      expect(copied.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_0990
     * @tc.name testArrayToString099
     * @tc.desc Verify toString works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(toStringFromAnyNumberArray(anyValue)).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_STRING_1000
     * @tc.name testArrayToString100
     * @tc.desc Verify toString supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToString100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      expect(anyArr.toString()).assertEqual('1,two,true');
    });

  });
}

