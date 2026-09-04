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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function takeJoin<T extends string[]>(arr: T, sep: string): string {
  let sa: String[] = arr.map((e: string): String => new String(e));
  return String.join(sa, sep).toString();
}

export default function StringJoin2Test(): void {
  describe('StringJoin2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0100
     * @tc.name testJoin001
     * @tc.desc Verify String.join() static method with comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b'), new String('c')];
      let result: String = String.join(arr, ',');
      expect(result.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0200
     * @tc.name testJoin002
     * @tc.desc Verify String.join() via class name with pipe separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('x'), new String('y')];
      let result: String = String.join(arr, '|');
      expect(result.toString()).assertEqual('x|y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0300
     * @tc.name testJoin003
     * @tc.desc Verify String.join() with hyphen separator on two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b')];
      let result: String = String.join(arr, '-');
      expect(result.toString()).assertEqual('a-b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0400
     * @tc.name testJoin004
     * @tc.desc Verify function-returned array reduced via Array.reduce() produces comma-joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => string[] = (): string[] => {
        return ['1', '2', '3'];
      };
      let result: string = fn().reduce((a: string, b: string): string => a + ',' + b);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0500
     * @tc.name testJoin005
     * @tc.desc Verify String.join() with const-declared array and space separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: String[] = [new String('hello'), new String('world')];
      let result: String = String.join(arr, ' ');
      expect(result.toString()).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0600
     * @tc.name testJoin006
     * @tc.desc Verify String.join() with array containing emoji element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('hello'), new String('😀'), new String('world')];
      let result: String = String.join(arr, '-');
      expect(result.toString()).assertEqual('hello-😀-world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0700
     * @tc.name testJoin007
     * @tc.desc Verify String.join() with 4-byte Unicode surrogate pair element and empty separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('𝄞'), new String('b')];
      let result: String = String.join(arr, '');
      expect(result.toString()).assertEqual('a𝄞b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0800
     * @tc.name testJoin008
     * @tc.desc Verify String.join() with array containing NUL control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('\0'), new String('b')];
      let result: String = String.join(arr, '-');
      expect(result.toString()).assertEqual('a-\0-b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_0900
     * @tc.name testJoin009
     * @tc.desc Verify String.join() with array of control characters and pipe separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('\b'), new String('\f'), new String('\v')];
      let result: String = String.join(arr, '|');
      expect(result.toString()).assertEqual('\b|\f|\v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1000
     * @tc.name testJoin010
     * @tc.desc Verify String.join() with non-breaking space element and comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String(' '), new String('b')];
      let result: String = String.join(arr, ',');
      expect(result.toString()).assertEqual('a, ,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1100
     * @tc.name testJoin011
     * @tc.desc Verify String.join() with mixed-script array and space separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('Hello'), new String('世界'), new String('123')];
      let result: String = String.join(arr, ' ');
      expect(result.toString()).assertEqual('Hello 世界 123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1200
     * @tc.name testJoin012
     * @tc.desc Verify String.join() with repeating pattern elements and hyphen separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('ab'), new String('ab'), new String('ab')];
      let result: String = String.join(arr, '-');
      expect(result.toString()).assertEqual('ab-ab-ab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1300
     * @tc.name testJoin013
     * @tc.desc Verify String.join() with string '123' separator joins correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b')];
      let result: String = String.join(arr, '123');
      expect(result.toString()).assertEqual('a123b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1400
     * @tc.name testJoin014
     * @tc.desc Verify String.join() with empty string separator concatenates elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b')];
      let result: String = String.join(arr, '');
      expect(result.toString()).assertEqual('ab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1500
     * @tc.name testJoin015
     * @tc.desc Verify String.join() with comma separator joins correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b')];
      let result: String = String.join(arr, ',');
      expect(result.toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1600
     * @tc.name testJoin016
     * @tc.desc Verify String.join() with string 'null' separator joins correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b')];
      let result: String = String.join(arr, 'null');
      expect(result.toString()).assertEqual('anullb');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1700
     * @tc.name testJoin017
     * @tc.desc Verify String.join() with string 'true' separator joins correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b')];
      let result: String = String.join(arr, 'true');
      expect(result.toString()).assertEqual('atrueb');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1800
     * @tc.name testJoin018
     * @tc.desc Verify String.join() with array containing empty strings produces separators only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String(''), new String(''), new String('')];
      let result: String = String.join(arr, '-');
      expect(result.toString()).assertEqual('--');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_1900
     * @tc.name testJoin019
     * @tc.desc Verify String.join() with single empty string element ignores separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('')];
      let result: String = String.join(arr, ',');
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2000
     * @tc.name testJoin020
     * @tc.desc Verify String.join() with numeric string elements and plus separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('1'), new String('2'), new String('3')];
      let result: String = String.join(arr, '+');
      expect(result.toString()).assertEqual('1+2+3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2100
     * @tc.name testJoin021
     * @tc.desc Verify String.join() with special whitespace character elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('\n'), new String('\t'), new String('\r')];
      let result: String = String.join(arr, '|');
      expect(result.toString()).assertEqual('\n|\t|\r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2200
     * @tc.name testJoin022
     * @tc.desc Verify String.join() with large array of elements joins correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(new String('x'));
      }
      let result: String = String.join(arr, ',');
      expect(result.getLength()).assertEqual(199);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2300
     * @tc.name testJoin023
     * @tc.desc Verify Array.join instance method vs String.join static produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['a', 'b'];
      let r1: string = arr.join('-');
      let sa: String[] = [new String('a'), new String('b')];
      let r2: String = String.join(sa, '-');
      expect(r1).assertEqual(r2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2400
     * @tc.name testJoin024
     * @tc.desc Verify String.join() inside generic function with T extends string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = takeJoin(['a', 'b'], ',');
      expect(result).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2500
     * @tc.name testJoin025
     * @tc.desc Verify String.join() with empty array and comma separator returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [];
      let result: String = String.join(arr, ',');
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2600
     * @tc.name testJoin026
     * @tc.desc Verify String.join() with single element and hyphen separator ignores separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('only')];
      let result: String = String.join(arr, '-');
      expect(result.toString()).assertEqual('only');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2700
     * @tc.name testJoin027
     * @tc.desc Verify String.join() return value with content plus typeof plus length checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b'), new String('c')];
      let r: String = String.join(arr, '-');
      expect(r.toString()).assertEqual('a-b-c');

      expect(r.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2800
     * @tc.name testJoin028
     * @tc.desc Verify String.join() with empty array returns empty with full dimension checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [];
      let r: String = String.join(arr, '');
      expect(r.toString()).assertEqual('');
      expect(r.getLength()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_2900
     * @tc.name testJoin029
     * @tc.desc Verify String.join() with single element and triple separator ignores separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('hello')];
      let r: String = String.join(arr, '---');
      expect(r.toString()).assertEqual('hello');
      expect(r.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3000
     * @tc.name testJoin030
     * @tc.desc Verify String.join() with empty array and empty separator returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [];
      let result: String = String.join(arr, '');
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3100
     * @tc.name testJoin031
     * @tc.desc Verify join() vs concat() produce equivalent results with space separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('hello'), new String('world')];
      let r1: String = String.join(arr, ' ');
      let r2: string = 'hello'.concat(' ', 'world');
      expect(r1.toString()).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3200
     * @tc.name testJoin032
     * @tc.desc Verify String.join() vs Array.join() produce the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b')];
      let r1: String = String.join(arr, ',');
      let r2: string = (['a', 'b'] as string[]).join(',');
      expect(r1.toString()).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3300
     * @tc.name testJoin033
     * @tc.desc Verify join() after split() changes separator correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let splitArr: string[] = 'a,b,c'.split(',');
      let sa: String[] = splitArr.map((e: string): String => new String(e));
      let result: String = String.join(sa, '-');
      expect(result.toString()).assertEqual('a-b-c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3400
     * @tc.name testJoin034
     * @tc.desc Verify join() vs template literal produce the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b'), new String('c')];
      let r1: String = String.join(arr, ',');
      let r2: string = `${'a'},${'b'},${'c'}`;
      expect(r1.toString()).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3500
     * @tc.name testJoin035
     * @tc.desc Verify + operator concatenation vs join() produce the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'a' + '-' + 'b' + '-' + 'c';
      let arr: String[] = [new String('a'), new String('b'), new String('c')];
      let r2: String = String.join(arr, '-');
      expect(r1).assertEqual(r2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3600
     * @tc.name testJoin036
     * @tc.desc Verify join() result equals expected literal via strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b')];
      expect(String.join(arr, ',').toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3700
     * @tc.name testJoin037
     * @tc.desc Verify join() with separator driven by .length and repeat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: String[] = [new String('a'), new String('b'), new String('c')];
      let sep: string = '-'.repeat(arr.length);
      let result: String = String.join(arr, sep);
      expect(result.toString()).assertEqual('a---b---c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3800
     * @tc.name testJoin038
     * @tc.desc Verify join on const array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      let result: string = String.join(arr, ',');
      expect(result).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_3900
     * @tc.name testJoin039
     * @tc.desc Verify join on String.join static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.join(['x', 'y'], '-');
      expect(result).assertEqual('x-y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN2_4000
     * @tc.name testJoin040
     * @tc.desc Verify join on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJoin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.join([], ',');
      expect(result).assertEqual('');
    });
  });
}