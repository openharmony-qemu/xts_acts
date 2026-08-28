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

function takeConcatOne<T extends string>(s: T, ...args: string[]): string {
  return s.concat(...args);
}

function takeConcatTwo<T extends string>(s: T): string {
  return s.concat();
}

export default function StringConcat2Test(): void {
  describe('StringConcat2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0100
     * @tc.name testConcat001
     * @tc.desc Verify concat() on string literal directly concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.concat(' world');
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0200
     * @tc.name testConcat002
     * @tc.desc Verify concat() on new String() instance concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let result: String = s.concat(' world');
      expect(result.toString()).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0300
     * @tc.name testConcat003
     * @tc.desc Verify concat() on empty new String() instance returns the argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('');
      let result: String = s.concat('abc');
      expect(result.toString()).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0400
     * @tc.name testConcat004
     * @tc.desc Verify function-returned string concatenated with + operator produces correct combined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => string = (): string => {
        return 'Ark';
      };
      let result: string = fn() + 'TS';
      expect(result).assertEqual('ArkTS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0500
     * @tc.name testConcat005
     * @tc.desc Verify concat() on const-declared variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = 'Ark';
      let result: string = s.concat('TS');
      expect(result).assertEqual('ArkTS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0600
     * @tc.name testConcat006
     * @tc.desc Verify concat() on let-declared variable with reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      s = s.concat('!');
      expect(s).assertEqual('hello!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0700
     * @tc.name testConcat007
     * @tc.desc Verify concat() with multiple args containing emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.concat('😀', 'world');
      expect(result).assertEqual('hello😀world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0800
     * @tc.name testConcat008
     * @tc.desc Verify concat() with 4-byte Unicode surrogate pair character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a'.concat('𝄞', 'b');
      expect(result).assertEqual('a𝄞b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_0900
     * @tc.name testConcat009
     * @tc.desc Verify concat() with NUL control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a'.concat('\0', 'b');
      expect(result).assertEqual('a\0b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1000
     * @tc.name testConcat010
     * @tc.desc Verify concat() with backspace form-feed vertical-tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a'.concat('\b', '\f', '\v');
      expect(result).assertEqual('a\b\f\v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1100
     * @tc.name testConcat011
     * @tc.desc Verify concat() with non-breaking space characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.concat(' ', 'world');
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1200
     * @tc.name testConcat012
     * @tc.desc Verify concat() with mixed-script characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'Hello'.concat('世界', '123');
      expect(result).assertEqual('Hello世界123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1300
     * @tc.name testConcat013
     * @tc.desc Verify concat() with repeating pattern strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'ab'.concat('ab', 'ab');
      expect(result).assertEqual('ababab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1400
     * @tc.name testConcat014
     * @tc.desc Verify concat() with number 42 converted to string via toString() concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('value:');
      let result: String = s.concat((42).toString());
      expect(result.toString()).assertEqual('value:42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1500
     * @tc.name testConcat015
     * @tc.desc Verify concat() with boolean true converted to string via toString() concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('flag:');
      let result: String = s.concat(true.toString());
      expect(result.toString()).assertEqual('flag:true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1600
     * @tc.name testConcat016
     * @tc.desc Verify concat() with string 'null' argument concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('null:');
      let result: String = s.concat('null');
      expect(result.toString()).assertEqual('null:null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1700
     * @tc.name testConcat017
     * @tc.desc Verify concat() with string 'undefined' argument concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('undefined:');
      let result: String = s.concat('undefined');
      expect(result.toString()).assertEqual('undefined:undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1800
     * @tc.name testConcat018
     * @tc.desc Verify concat() with string 'NaN' argument concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('NaN:');
      let result: String = s.concat('NaN');
      expect(result.toString()).assertEqual('NaN:NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_1900
     * @tc.name testConcat019
     * @tc.desc Verify concat() with string '[object Object]' argument concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('obj:');
      let result: String = s.concat('[object Object]');
      expect(result.toString()).assertEqual('obj:[object Object]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2000
     * @tc.name testConcat020
     * @tc.desc Verify concat() with 10 arguments concatenates all in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.concat('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j');
      expect(result).assertEqual('abcdefghij');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2100
     * @tc.name testConcat021
     * @tc.desc Verify concat() with empty string arguments interspersed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.concat('', 'world', '');
      expect(result).assertEqual('helloworld');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2200
     * @tc.name testConcat022
     * @tc.desc Verify concat() with all empty string arguments returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.concat('', '', '');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2300
     * @tc.name testConcat023
     * @tc.desc Verify chained concat() calls concatenate sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.concat(' ').concat('world').concat('!');
      expect(result).assertEqual('hello world!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2400
     * @tc.name testConcat024
     * @tc.desc Verify multi-level chained concat() with mixed single and multi args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'A'.concat('B').concat('C', 'D');
      expect(result).assertEqual('ABCD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2500
     * @tc.name testConcat025
     * @tc.desc Verify concat() inside generic function with T extends string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = takeConcatOne('hello', ' ', 'world');
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2600
     * @tc.name testConcat026
     * @tc.desc Verify concat() inside generic function with zero extra arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = takeConcatTwo('hello');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2700
     * @tc.name testConcat027
     * @tc.desc Verify concat() inside generic function with multiple arguments on empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = takeConcatOne('', 'a', 'b', 'c');
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2800
     * @tc.name testConcat028
     * @tc.desc Verify concat() return value with content plus length checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello'.concat(' world');
      expect(r).assertEqual('hello world');
      expect(r.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_2900
     * @tc.name testConcat029
     * @tc.desc Verify concat() with zero arguments returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello'.concat();
      expect(r).assertEqual('hello');
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3000
     * @tc.name testConcat030
     * @tc.desc Verify concat() with all empty strings returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = ''.concat('', '');
      expect(r).assertEqual('');
      expect(r.indexOf('x')).assertEqual(-1);
      expect(r.startsWith('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3100
     * @tc.name testConcat031
     * @tc.desc Verify concat() does not mutate the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = 'hello';
      let result: string = original.concat('!');
      expect(original).assertEqual('hello');
      expect(result).assertEqual('hello!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3200
     * @tc.name testConcat032
     * @tc.desc Verify concat() with string argument on new String instance concatenates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let result: String = s.concat('123');
      expect(result.toString()).assertEqual('hello123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3300
     * @tc.name testConcat033
     * @tc.desc Verify concat() vs + operator produce the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello' + ' world';
      let r2: string = 'hello'.concat(' world');
      expect(r1).assertEqual('hello world');
      expect(r2).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3400
     * @tc.name testConcat034
     * @tc.desc Verify concat() with comma vs join() with comma produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.concat(',', 'world');
      let values: String[] = [new String('hello'), new String('world')];
      let r2: String = String.join(values, ',');
      expect(r1).assertEqual('hello,world');
      expect(r2.toString()).assertEqual('hello,world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3500
     * @tc.name testConcat035
     * @tc.desc Verify concat() with multiple args vs repeated + operators produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'a' + 'b' + 'c';
      let r2: string = 'a'.concat('b', 'c');
      expect(r1).assertEqual('abc');
      expect(r2).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3600
     * @tc.name testConcat036
     * @tc.desc Verify concat() vs template literal produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = 'hello';
      let b: string = 'world';
      let tl: string = `${a} ${b}`;
      let ct: string = a.concat(' ', b);
      expect(tl).assertEqual(ct);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3700
     * @tc.name testConcat037
     * @tc.desc Verify strict equality between + operator and concat() results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('hello' + ' world').assertEqual('hello'.concat(' world'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3800
     * @tc.name testConcat038
     * @tc.desc Verify property access combined with concat() produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hi';
      let result: string = s[0] + s.concat(' there');
      expect(result).assertEqual('hhi there');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_3900
     * @tc.name testConcat039
     * @tc.desc Verify concat() driven by .length property with repeat suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let suffix: string = '!';
      let result: string = s.concat(suffix.repeat(s.length - 3));
      expect(result).assertEqual('hello!!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4000
     * @tc.name testConcat040
     * @tc.desc Verify concat with String() factory wrapping number and boolean coerces all arguments to string via explicit conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'start';
      let result: string = s.concat('', String(123), String(true), 'end');
      expect(result).assertEqual('start123trueend');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4100
     * @tc.name testConcat041
     * @tc.desc Verify concat() with JSON.stringify result of Object joins correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let jsonStr: string = JSON.stringify(obj);
      expect(jsonStr).assertEqual('{}');
      let result: string = 'json: '.concat(jsonStr);
      expect(result).assertEqual('json: {}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4200
     * @tc.name testConcat042
     * @tc.desc Verify implicit concatenation with JSON.stringify array result produces correct combined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let jsonStr: string = JSON.stringify(arr);
      expect(jsonStr).assertEqual('[1,2,3]');
      let result: string = 'array: ' + jsonStr;
      expect(result).assertEqual('array: [1,2,3]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4300
     * @tc.name testConcat043
     * @tc.desc Verify concat() with JSON.stringify of number and boolean primitive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numVal: number = 42;
      let boolVal: boolean = true;
      let numJson: string = JSON.stringify(numVal);
      let boolJson: string = JSON.stringify(boolVal);
      expect(numJson).assertEqual('42');
      expect(boolJson).assertEqual('true');
      let result: string = 'num: '.concat(numJson, ' bool: ', boolJson);
      expect(result).assertEqual('num: 42 bool: true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4400
     * @tc.name testConcat044
     * @tc.desc Verify concat() with string assigned via variable reference handles string content correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = 'hello';
      let parsed: string = original;
      let result: string = 'greeting: '.concat(parsed);
      expect(result).assertEqual('greeting: hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4500
     * @tc.name testConcat045
     * @tc.desc Verify String() conversion with Promise object produces its toString representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let promise: Promise<string> = new Promise<string>((resolve: (value: string) => void): void => {});
      let result: string = String(promise);
      expect(result).assertEqual('[object Object]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4600
     * @tc.name testConcat046
     * @tc.desc Verify new String() with Promise wraps its toString representation and concat triggers toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let promise: Promise<number> = new Promise<number>((resolve: (value: number) => void): void => {});
      let strObj: String = new String(promise);
      expect(strObj.toString()).assertEqual('[object Object]');

      let concatResult: string = 'p: '.concat(String(promise));
      expect(concatResult).assertEqual('p: [object Object]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4700
     * @tc.name testConcat047
     * @tc.desc Verify equals safety with Promise-derived string against unrelated content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let promise: Promise<string> = new Promise<string>((resolve: (value: string) => void): void => {});
      let promiseStr: string = String(promise);
      let strObj: String = new String(promiseStr);
      expect(strObj.equals('[object Object]')).assertTrue();
      expect(strObj.equals('something else')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4800
     * @tc.name testConcat048
     * @tc.desc Verify String value survives Promise.then chain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let original: string = 'hello';
      let promise: Promise<string> = new Promise<string>((resolve: (value: string) => void): void => {
        resolve(original);
      });
      let value: string = await promise;
      expect(value).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_4900
     * @tc.name testConcat049
     * @tc.desc Verify new String() wraps Promise-derived value and concat preserves it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let promise: Promise<string> = new Promise<string>((resolve: (value: string) => void): void => {
        resolve('async value');
      });
      let value: string = await promise;
      let strObj: String = new String(value);
      expect(strObj.toString()).assertEqual('async value');
      expect(strObj.concat('!')).assertEqual('async value!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5000
     * @tc.name testConcat050
     * @tc.desc Verify concat with String(Map) produces "k,v" format when Map has single key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, string> = new Map<string, string>();
      m.set('k', 'v');
      let result: string = 'map: '.concat(String(m));
      expect(result).assertEqual('map: k,v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5100
     * @tc.name testConcat051
     * @tc.desc Verify concat with String(Set) produces "Set[item]" when Set contains single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<string> = new Set<string>();
      s.add('item');
      let result: string = 'set: '.concat(String(s));
      expect(result).assertEqual('set: Set[item]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5200
     * @tc.name testConcat052
     * @tc.desc Verify new String(Map) concat with literal string produces "a,1 END"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, string> = new Map<string, string>();
      m.set('a', '1');
      let strObj: String = new String(m);
      let result: String = strObj.concat(' END');
      expect(result.toString()).assertEqual('a,1 END');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5300
     * @tc.name testConcat053
     * @tc.desc Verify new String(Set) chained concat with empty string and "done"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<string> = new Set<string>();
      s.add('x');
      let strObj: String = new String(s);
      let result: String = strObj.concat('').concat('done');
      expect(result.toString()).assertEqual('Set[x]done');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5400
     * @tc.name testConcat054
     * @tc.desc Verify string concatenation with String(WeakMap) using + operator produces "[object WeakMap]" prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wm: WeakMap<Object, string> = new WeakMap<Object, string>();
      let key: Object = new Object();
      wm.set(key, 'weak');
      let result: string = 'wm: ' + String(wm);
      expect(result.startsWith('wm: [object WeakMap]')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5500
     * @tc.name testConcat055
     * @tc.desc Verify concat with String(WeakSet) produces "[object WeakSet]" when WeakSet contains single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws: WeakSet<Object> = new WeakSet<Object>();
      let obj: Object = new Object();
      ws.add(obj);
      let result: string = 'ws: '.concat(String(ws));
      expect(result.includes('[object WeakSet]')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5600
     * @tc.name testConcat056
     * @tc.desc Verify concat on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello';
      let result: string = str.concat(' world');
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5700
     * @tc.name testConcat057
     * @tc.desc Verify concat does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let before: string = str;
      str.concat(' world');
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5800
     * @tc.name testConcat058
     * @tc.desc Verify concat on expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = (true ? 'a' : 'b').concat('c');
      expect(result).assertEqual('ac');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_5900
     * @tc.name testConcat059
     * @tc.desc Verify concat() with Japanese and Cyrillic characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'こんにちは'.concat(' ', 'привет');
      expect(result).assertEqual('こんにちは привет');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_6000
     * @tc.name testConcat060
     * @tc.desc Verify chained concat() with trim and substring produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '  hello'.trim().concat(' world').substring(0, 11);
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT2_6100
     * @tc.name testConcat061
     * @tc.desc Verify concat() on a large string of repeated characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcat061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: string = 'x'.repeat(1000);
      let result: string = large.concat('y');
      expect(result.length).assertEqual(1001);
    });
  });
}